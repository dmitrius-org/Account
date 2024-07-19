if OBJECT_ID('vUsers') is not null
    drop view vUsers
go
/* **********************************************************						
vUsers - получение списка пользователей
********************************************************** */

create view vUsers

as

--SET DATEFIRST 1;

select u.UserID      
      ,u.Brief       
      ,u.Name	     
      ,cast(isnull(IS_SRVROLEMEMBER('sysadmin', u.Brief), 0) as bit) isAdmin	 
      ,u.isBlock isBlock
      ,nullif(u.DateBlock, '18991230') DateBlock    
      ,u.inDatetime  
      ,u.upDatetime 
      ,u.UpUserID
  from tUser u (nolock)
 -- inner join  is_disabled from sys.server_principals
go
grant all on vUsers to public
go

if OBJECT_ID('vGrant') is not null
    drop view vGrant
go
/* 						
vGrant - права
 */

create view vGrant
as
--
select u.GrantID           
      ,u.ObjectID 
      ,u.ParentID
      ,u.MenuID         
      ,u.N
      ,u.Caption	           
      ,u.Value
      ,u.Type
      ,m.Name
      ,u.IsGroup
      ,u.Groups
      ,u.GroupValue
	  ,m.Icon

  from pGrant u with (nolock index=ao1)
 inner join tMenu m with (nolock index=ao1)
         on m.MenuID = u.MenuID

 where u.spid = @@Spid

go
grant all on vGrant to public
go


if OBJECT_ID('UserInsert') is not null
    drop proc UserInsert
/*
  UserInsert - добавление пользователя
*/
go
create proc UserInsert
              @UserID          numeric(18,0) output --  
             ,@Brief           nvarchar(512)  --
             ,@Name	           nvarchar(512)  -- 
             --,@isAdmin	       bit      null
             ,@isBlock	       bit      = null
             ,@DateBlock       datetime = null
             ,@Password        nvarchar(512)
as
  declare @r int = 0
  
  select @isBlock   = isnull(@isBlock, 0)
        ,@DateBlock = nullif(@DateBlock, '18991230')

  if @isBlock=1
    select @DateBlock=getdate()

  DECLARE @ID TABLE (ID numeric(18,0));

  if exists (select 1 
               from tUser u (nolock)
              where u.Brief = @Brief)
  begin
    set @r = 1 -- Пользователь с заданным логином существует
    goto exit_
  end

  if IS_SRVROLEMEMBER('sysadmin') is null
  begin
    set @r = 2 -- Пользователь должен иметь права [sysadmin]
    goto exit_
  end


  BEGIN TRY 
    delete tRetMessage from tRetMessage (rowlock) where spid=@@spid
    Begin tran
 
    exec('CREATE LOGIN ' + @Brief + ' WITH PASSWORD = '''+ @Password + '''')  
    exec('CREATE USER ' + @Brief + ' FOR LOGIN ' +  @Brief)  

    if @isBlock=1 -- статус пользователя
    begin
      exec('ALTER LOGIN ' + @Brief + ' DISABLE')  
    end

    insert into tUser
          (
           Brief
          ,Name
          ,isBlock
          ,DateBlock
          ,Login
          )
    OUTPUT INSERTED.UserID INTO @ID
    select @Brief     
          ,@Name	     
          ,@isBlock	 
          ,@DateBlock 
          ,@Brief
    commit tran
  END TRY  
  BEGIN CATCH  
    if @@TRANCOUNT > 0
      rollback tran
    
    set @r = -1
    insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

    goto exit_     
  END CATCH  

   Select @UserID = ID from @ID

 exit_:
 return @r

grant exec on UserInsert to public
go

drop proc if exists UserUpdate
/*
  UserUpdate - Изменение сведений о пользователе

  @isBlock:
  ENABLE | DISABLE — включает или отключает это имя входа. Отключение входа не влияет на поведение имен входа, которые уже подключены. 
  (Чтобы завершить существующие подключения, используйте инструкцию KILL.) 
  Отключенные имена входа сохраняют свои разрешения и все еще могут быть олицетворены.
*/
go
create proc UserUpdate
              @UserID          numeric(18,0)  --  
             ,@Brief           nvarchar(512)  --
             ,@Name	           nvarchar(512)  -- 
             ,@isBlock	       bit      =null
             ,@DateBlock       datetime =null
as
  declare @r int = 0
  
  select @isBlock   = isnull(@isBlock, 0)
        ,@DateBlock = isnull(nullif(@DateBlock, '18991230'), GetDate()) --nullif(u.DateBlock, '18991230')

  if exists (select 1 
               from tUser u (nolock)
              where u.Brief  = @Brief
                and u.UserID <> @UserID)
  begin
    set @r = 1 -- Пользователь с заданным логином существует
    goto exit_
  end

  BEGIN TRY 
    delete tRetMessage from tRetMessage (rowlock) where spid=@@spid
    Begin tran
      --declare @oldBrief nvarchar(512)

      --select @oldBrief = u.Brief
      --  from tUser u (nolock)
      -- where u.UserID = @UserID

      -- меняем имя пользователя в базе данных
      --if @oldBrief <> @Brief
      --if IS_SRVROLEMEMBER('sysadmin') is null -- для изменения логина пользователь должен иметь права [sysadmin] 
      --begin
      --  set @r = 2 --
      --  goto exit_
      --end
      --else
      --   exec('ALTER USER ' + @oldBrief + ' WITH NAME = ' + @Brief)  

      --if @oldBrief <> @Brief
      if exists (SELECT is_disabled from sys.server_principals WHERE name = @Brief and is_disabled = 1) or @isBlock = 1
          if IS_SRVROLEMEMBER('sysadmin') is null -- для изменения логина пользователь должен иметь права [sysadmin] 
          begin
              set @r = 2 --
              goto exit_
          end
          else
          begin
              if @isBlock=1
              begin
                  exec('ALTER LOGIN ' + @Brief + ' DISABLE')  
              end
              else
              begin
                  exec('ALTER LOGIN ' + @Brief + ' ENABLE')  
              end
          end
         
      Update u
         set u.Brief    = @Brief
            ,u.Name     = @Name
            ,u.isBlock  = @isBlock
            ,u.DateBlock= case  
                            when @isBlock = 0 
                            then null
                            else @DateBlock
                           end
            ,u.upDatetime = getdate()
            ,u.UpUserID   = dbo.GetUserID()
        from tUser u (updlock)
       where u.UserID = @UserID

    commit tran
  END TRY  
  BEGIN CATCH  
    if @@TRANCOUNT > 0
      rollback tran
    
    set @r = -1
    insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

    goto exit_     
  END CATCH 

 exit_:
 return @r
go
grant exec on UserUpdate to public
go

if OBJECT_ID('UserDeleteCheck') is not null
    drop proc UserDeleteCheck
/*
  UserDeleteCheck - проверка возможности удаления пользователя
*/
go
create proc UserDeleteCheck
              @UserID          numeric(18,0)  --  
as
  declare @r int = 0

  --if exists (select 1 
  --             from tUser u (nolock)
  --            where u.UserID  = @UserID
  --              )
  --begin
  --  set @r = 11 -- Удаление запрещено, пользователь входит в группу прав!
  --  goto exit_
  --end


  if exists (select 1 
               from tKontragents (nolock)
              where InUserID = @UserID)
  begin
    set @r = 250 -- 'Удаление запрещено, пользователь используется в справочнике контрагентов!'
    goto exit_
  end
  

 exit_:
 return @r
go
grant exec on UserDeleteCheck to public
go


if OBJECT_ID('UserDelete') is not null
    drop proc UserDelete
/*
  UserDelete - удаление пользователя
*/
go
create proc UserDelete
              @UserID          numeric(18,0)  --  
as
  declare @r int = 0

  --DECLARE @ID TABLE (ID numeric(18,0));
  -- проверка на возможность удаления
  exec @r = UserDeleteCheck @UserID = @UserID
  if @r > 0
  begin
    goto exit_
  end

  if IS_SRVROLEMEMBER('sysadmin') is null
  begin
    set @r = 2 -- Пользователь должен иметь права [sysadmin]
    goto exit_
  end


  BEGIN TRY 
    delete tRetMessage from tRetMessage (rowlock) where spid=@@spid
    Begin tran

    declare @Brief nvarchar(512)
           ,@Login nvarchar(512) 

    select @Brief = Brief 
          ,@Login = Login
      from tUser (nolock)
     where UserID=@UserID


    -- Check database user
    IF USER_ID(@Brief) IS NOT NULL
      exec('Drop USER ' + @Brief)
     
    IF SUSER_ID(@Login) IS NOT NULL
      exec('Drop LOGIN ' + @Login)  
    
    delete tUser
      from tUser u (rowlock)
     where u.UserID = @UserID
    
    commit tran
  END TRY  
  BEGIN CATCH  
    if @@TRANCOUNT > 0
      rollback tran
 
    set @r = -1
    insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

    goto exit_     
  END CATCH 


 exit_:
 return @r
go
grant exec on UserDelete to public
go


drop proc if exists GrantSelect
/*
  GrantSelect - права пользователя или группы
  @ObjectID   -- ид объекта
  @ObjectType -- тп объекта
              -- 0 - пользователь
              -- 1 - группа
  результат возвращается pGrant
*/
go
create proc GrantSelect
              @ObjectID          numeric(18,0)
             ,@ObjectType        int
as
  set nocount on

  declare @r int = 0

  -- Права на интерфейс
  Delete pGrant from pGrant (rowlock) where spid = @@spid

  insert pGrant
        (Spid              
        ,GrantID           
        ,ObjectID            
        ,MenuID         
        ,ParentID
        ,N
        ,Caption	           
        ,Value
        ,Type
        )
  select @@Spid
        ,g.GrantID
        ,@ObjectID
        ,m.MenuID
        ,m.ParentID
        ,m.N
        ,m.Caption
        ,cast((case 
                when g.MenuID is not null then 1
                else 0
               end) as bit) Value
        ,m.Type
    from tMenu m (nolock)
    left join tGrant g (nolock)
           on g.ObjectType = @ObjectType 
          and g.ObjectID   = @ObjectID
          and g.MenuID     = m.MenuID
   order by m.n

  --if @ObjectType = 0 
  --  Update p
  --     set p.GroupValue = isnull(cast((case 
  --                                   when g.MenuID is not null then 1
  --                                   else 0
  --                                end) as bit), p.Value)
  --       ,p.IsGroup = case 
  --                      when g.MenuID is not null then 1
  --                      else 0
  --                    end
  --       ,p.Groups = g.Groups
  --   from pGrant p
  --   cross apply ( select top 1 m.MenuID,
  --                        STRING_AGG(gr.Brief, ', ') Groups 
  --                   from tUserReliation ur (nolock)
  --                  inner join tGroups gr (nolock)
  --                          on gr.GroupID = ur.GroupID     
  --                  inner join tGrant g (nolock)
  --                          on g.ObjectType = 1 -- группа
  --                         and g.ObjectID   = gr.GroupID
  --                        -- 
  --                  inner join tMenu m (nolock)
  --                          on m.MenuID = g.MenuID 
  --                         and m.MenuID = p.MenuID
  --                   where ur.LinkType = 2
  --                     and ur.UserID   = @ObjectID
  --                  group by m.MenuID
  --               ) as g 
  --   where p.Spid = @@Spid


  ---- права на объекты учета
  --delete p
  --  from pGrantObject p (rowlock)
  -- where p.Spid=@@SPID

  --insert pGrantObject
  --      (Spid
  --      ,GrantObjectID
  --      ,ObjectID
  --      ,ObjectType
  --      ,LinkID
  --      ,LinkType
  --      )
  --select @@Spid
  --      ,t.GrantObjectID
  --      ,t.ObjectID
  --      ,t.ObjectType
  --      ,t.LinkID
  --      ,t.LinkType
  --  from tGrantObject t (nolock)
  -- where t.ObjectID   = @ObjectID
  --   and t.ObjectType = @ObjectType


 exit_:
 return @r
go
grant exec on GrantSelect to public
go





drop proc if exists GrantSave
/* **********************************************************
  GrantSave - сохранение прав пользователя/группы

  @ObjectID   -- ид объекта
  @ObjectType -- тп объекта
              -- 0 - пользователь
              -- 1 - группа

  на вход подается таблица pGrant
********************************************************** */
go
create proc GrantSave
              @ObjectID          numeric(18,0)  
             ,@ObjectType        int
as
  set nocount on

  declare @r int = 0
  
  delete t
    from tGrant t (rowlock)
   inner join pGrant p (nolock)
           on p.Spid     = @@spid
          and p.ObjectID = t.ObjectID
          and p.Value    = 0
   where t.ObjectType = @ObjectType
     and t.ObjectID   = @ObjectID

  -- сохранение прав на интерфейс
  insert tGrant
        (
         ObjectID
        ,MenuID  
        ,ObjectType
        )
  select p.ObjectID
        ,p.MenuID   
        ,@ObjectType
    from pGrant p with (nolock index=ao1)
   where p.Spid       = @@spid
     and p.ObjectID   = @ObjectID
     and p.Value      = 1
     and not exists (select 1
                       from tGrant g with (nolock index=ao1)
                      where g.ObjectType = @ObjectType
                        and g.ObjectID   = @ObjectID
                        and g.MenuID     = p.MenuID
                     )


  ---- сохранение прав на объекты учета
  --delete tGrantObject 
  --  from tGrantObject (rowlock)
  -- where ObjectID   = @ObjectID
  --   and ObjectType = @ObjectType

  --insert tGrantObject
  --      (
  --       ObjectID
  --      ,ObjectType
  --      ,LinkID
  --      ,LinkType
  --      )
  --select p.ObjectID
  --      ,p.ObjectType
  --      ,p.LinkID
  --      ,p.LinkType
  --  from pGrantObject p (nolock)
  -- where p.Spid=@@SPID

  --delete p
  --  from pGrantObject p (rowlock)
  -- where p.Spid=@@SPID

 exit_:
 return @r
go
grant exec on GrantSave to public
go
