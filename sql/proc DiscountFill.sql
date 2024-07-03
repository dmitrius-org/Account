if OBJECT_ID('ClientInsert') is not null
    drop proc ClientInsert
/*
  ClientInsert - добавление 
*/
go
create proc ClientInsert
              @ClientID          numeric(15,0) output --  
             ,@Name              varchar(256)  -- 
             ,@Discount          Float
	         ,@DiscountDate      DateTime  
as
  declare @r int = 0

  DECLARE @ID TABLE (ID numeric(18,0));

  if exists (select 1 
               from tKontragents u (nolock)
              where u.Name             = @Name
                and u.KontragentTypeID = 1)
  begin
    set @r =  120 --  'Клиент с заданным наименование существует!'
    goto exit_
  end

  BEGIN TRY 
      Begin tran

		insert into tKontragents
		      (KontragentTypeID, Name, Discount, DiscountDate, UserID)
		OUTPUT INSERTED.KontragentTypeID INTO @ID
		select 1
              ,@Name     
              ,@Discount  
              ,@DiscountDate   
              ,dbo.GetUserID()

		Select @ClientID = ID from @ID	
      
      commit tran
  END TRY  
  BEGIN CATCH  
      if @@TRANCOUNT > 0
        rollback tran
 
 goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on ClientInsert to public
go

if OBJECT_ID('ClientEdit') is not null
    drop proc ClientEdit
/*
  ClientEdit - Изменение 
*/
go
create proc ClientEdit
              @ClientID          numeric(15,0) --  
             ,@Name              varchar(256)  -- 
             ,@Discount          Float
	         ,@DiscountDate      DateTime  
as
  declare @r int = 0

  if exists (select 1 
               from tKontragents u (nolock)
              where u.Name             = @Name
                and u.KontragentTypeID = 1
                and u.KontragentID    <> @ClientID)
  begin
    set @r =  120 --  'Клиент с заданным наименование существует!'
    goto exit_
  end

  BEGIN TRY 
		Update tKontragents
		   set Name          = @Name    
              ,Discount      = @Discount     
              ,DiscountDate = @DiscountDate  
		 where KontragentID=@ClientID
  END TRY  
  BEGIN CATCH  
      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on ClientEdit to public
go


if OBJECT_ID('ClientDelete') is not null
    drop proc ClientDelete
/*
  ClientDelete - Удаление 
*/
go
create proc ClientDelete
              @ClientID            numeric(15,0) --    
as
  declare @r int = 0

  BEGIN TRY 
		delete 
          from tKontragents
		 where KontragentID=@ClientID
  END TRY  
  BEGIN CATCH  
   
      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on ClientDelete to public
go