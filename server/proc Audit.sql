if OBJECT_ID('vAudit') is not null
    drop view vAudit
/*
  vAudit -  
*/
go
create view vAudit
as

SELECT op.Brief ObjectType 
      ,a.ObjectTypeID
      ,a.Action
      ,a.ObjectID
      --,case
      --   when a.ObjectTypeID in (1, 2, 3)  then k.Name
      --   when a.ObjectTypeID = 4  then 'ИД объекта' + convert(varchar, a.ObjectID)
      --   when a.ObjectTypeID = 10 then ei.Name
      --   when a.ObjectTypeID = 11 then eg.Name
      -- end ObjectName
      ,a.Comment
      ,u.Brief UserBrief
      ,u.Name  UserName
      ,a.InDateTime
  FROM tAudit a (nolock) 
 inner join tObjectType op (nolock)
         on op.ObjectTypeID = a.ObjectTypeID
 inner join tUser u (nolock)
         on u.UserID = a.UserID

  --left join tKontragents k (nolock)
  --       on k.KontragentID = a.ObjectID and  a.ObjectTypeID in (1, 2, 3) 

  --left join tExpenseItems ei (nolock)
  --       on ei.ExpenseItemID = a.ObjectID and  a.ObjectTypeID = 10
  --left join tExpenseGroups eg (nolock)
  --       on ei.ExpenseGroupID = a.ObjectID and  a.ObjectTypeID = 11
  --left join tSupplierClient sc (nolock)
  --       on sc.SupplierClientID = a.ObjectID and  a.ObjectTypeID in (4) 

go
grant all on vAudit to public
go

select * from vAudit


if OBJECT_ID('AuditInsert') is not null
    drop proc AuditInsert
/*
  AuditInsert - 
*/
go
create proc AuditInsert
              @AuditID          numeric(18, 0) Output  --             
             ,@ObjectID         numeric(18, 0)   -- ИД объекта по которому ведется аудит

             ,@ObjectTypeID     numeric(18, 0)   -- тип объекта 
             ,@Action           varchar(30) 
             ,@Comment          varchar(1024)    -- Комментарий
             ,@UserID           numeric(18, 0) = null  -- 
             ,@HostInfoID       nvarchar(256)  = null
as
  set nocount on

  declare @r int = 0
  DECLARE @ID TABLE (ID numeric(18,0));

  select @UserID     = isnull(nullif(@UserID, 0), dbo.getUserID())
        ,@HostInfoID = nullif(@HostInfoID, '')

 BEGIN TRY 
    delete tRetMessage from tRetMessage (rowlock) where spid=@@spid
    --Begin tran
    insert into tAudit
          (           
           ObjectID         
          ,ObjectTypeID     
          ,Action         
          ,Comment
          ,UserID
          ,HostInfoID)
    OUTPUT INSERTED.AuditID INTO @ID
    select      
           @ObjectID	     
          ,@ObjectTypeID	 
          ,@Action 
          ,@Comment
          ,@UserID
          ,@HostInfoID
    --commit tran
  END TRY  
  BEGIN CATCH  
    --if @@TRANCOUNT > 0
    --  rollback tran
    
    set @r = -1
    insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

    goto exit_     
  END CATCH  

Select @AuditID = ID from @ID

exit_:
return @r
go
grant exec on AuditInsert to public
go
