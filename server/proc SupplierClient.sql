if OBJECT_ID('SupplierClientInsert') is not null
    drop proc SupplierClientInsert
/*
  proc SupplierClientInsert - добавление 
*/
go
create proc SupplierClientInsert
              @SupplierClientID  numeric(15,0) output --  
             ,@ClientID          numeric(15,0)   
             ,@SupplierID	     numeric(15,0)
             ,@Discount          Float
	         ,@DiscountDate      DateTime  
as
  declare @r int = 0

  DECLARE @ID TABLE (ID numeric(18,0));

  if exists (select 1 
               from tSupplierClient u (nolock)
              where u.ClientID   = @ClientID
                and u.SupplierID = @SupplierID)
  begin
    set @r =  400 --   'Связсь поставщика и клиента существует!'
    goto exit_
  end

  BEGIN TRY 
      Begin tran        

		insert into tSupplierClient
		      (SupplierID, ClientID, Discount, DiscountDate, InUserID, UpUserID)
		OUTPUT INSERTED.SupplierClientID INTO @ID
		select @SupplierID
              ,@ClientID   
              ,@Discount  
              ,@DiscountDate   
              ,dbo.GetUserID()
              ,dbo.GetUserID()

		Select @SupplierClientID = ID from @ID

        insert tDiscounts(ObjectTypeID, ObjectID, Discount, DiscountDate)
        select 4, @SupplierClientID, @Discount, @DiscountDate

       declare @AuditID numeric(18, 2)
              ,@Comment  varchar(255)

       select @Comment = 'Добавление связи поставщика с покупателем, ИД:' + cast(@SupplierClientID as varchar(18))
       
       exec AuditInsert     
              @AuditID      = @AuditID out  
             ,@ObjectID     = @SupplierClientID               
             ,@ObjectTypeID = 4 
             ,@Action       = 'add'  
             ,@Comment      = @Comment

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
grant exec on SupplierClientInsert to public
go

if OBJECT_ID('SupplierClientEdit') is not null
    drop proc SupplierClientEdit
/*
  SupplierClientEdit - Изменение 
*/
go
create proc SupplierClientEdit
              @SupplierClientID  numeric(15,0)  --  
             ,@ClientID          numeric(15,0)   
             ,@SupplierID	     numeric(15,0)
             ,@Discount          Float
	         ,@DiscountDate      DateTime  
as
  declare @r int = 0


  if exists (select 1 
               from tSupplierClient u (nolock)
              where u.ClientID   = @ClientID
                and u.SupplierID = @SupplierID
                and u.SupplierClientID <> @SupplierClientID)
  begin
    set @r =  400 --   'Связсь поставщика и клиента существует!'
    goto exit_
  end

  BEGIN TRY 

        insert tDiscounts(ObjectTypeID, ObjectID, Discount, DiscountDate)
        select 4, @SupplierClientID, @Discount, @DiscountDate


		Update tSupplierClient
		   set ClientID      = @ClientID
              ,SupplierID    = @SupplierID
              ,Discount      = @Discount     
              ,DiscountDate  = @DiscountDate  
              ,UpUserID      = dbo.GetUserID()
              ,UpDatetime    = GetDate()
		 where SupplierClientID  = @SupplierClientID

       declare @AuditID numeric(18, 2)
              ,@Comment  varchar(255)

       select @Comment = 'Изменение связи поставщика с покупателем, ИД:' + cast(@SupplierClientID as varchar(18))

       exec AuditInsert     
              @AuditID      = @AuditID out  
             ,@ObjectID     = @SupplierClientID               
             ,@ObjectTypeID = 4 
             ,@Action       = 'edit'  
             ,@Comment      = @Comment

  END TRY  
  BEGIN CATCH  
      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on SupplierClientEdit to public
go


if OBJECT_ID('SupplierClientDelete') is not null
    drop proc SupplierClientDelete
/*
  SupplierClientDelete - Удаление 
*/
go
create proc SupplierClientDelete
              @SupplierClientID            numeric(15,0) --    
as
  declare @r int = 0

  BEGIN TRY 
	delete 
      from tSupplierClient
     where SupplierClientID=@SupplierClientID

    delete tDiscounts 
      from tDiscounts (rowlock) 
     where ObjectTypeID = 4 
       and ObjectID     = @SupplierClientID

    declare @AuditID numeric(18, 2)
              ,@Comment  varchar(255)

       select @Comment = 'Удаление связи поставщика с покупателем, ИД:' + cast(@SupplierClientID as varchar(18))

    exec AuditInsert     
            @AuditID      = @AuditID out  
            ,@ObjectID     = @SupplierClientID               
            ,@ObjectTypeID = 4 
            ,@Action       = 'delete'  
            ,@Comment      = @Comment
            
  END TRY  
  BEGIN CATCH  
   
      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on SupplierClientDelete to public
go