if OBJECT_ID('AccountInsert') is not null
    drop proc AccountInsert
/*
  AccountInsert - добавление 
*/
go
create proc AccountInsert
              @AccountID         numeric(15,0) output --  
             ,@PaymentDate       datetime
             ,@PaymentAmount     int
             ,@AccountNumber     varchar(256)  
             ,@AccountDate       datetime
             ,@AccountAmount     int
             ,@BuyerID           numeric(15, 0) 
             ,@BuyerDiscount     money   
             ,@SupplierID        numeric(15, 0) 
             ,@ClientID          numeric(15, 0) 
             ,@ClientDiscount    money
             ,@ParentID          numeric(15, 0) 
             ,@IsRefund          bit
             ,@AccountStatusID   numeric(15, 0) 
             ,@Comment           varchar(256)
             ,@Phone             varchar(256)
             ,@Mail              varchar(256)
             ,@PayNumber         varchar(256)
             ,@PayDate           datetime


as
  declare @r                 int = 0

  DECLARE @ID TABLE (ID numeric(18,0));

  if exists (select 1 
               from tAccounts a (nolock)
              where a.SupplierID    = @SupplierID
                and a.AccountNumber = @AccountNumber)
  begin
    set @r =  181 --   'Ошибка! Счет заданным номером существует.'
    goto exit_
  end
    
  BEGIN TRY 
      Begin tran        

		insert into tAccounts
		      (PaymentDate     
              ,PaymentAmount   
              ,AccountNumber   
              ,AccountDate     
              ,AccountAmount   
              ,BuyerID         
              ,BuyerDiscount   
              ,SupplierID      
              ,ClientID        
              ,ClientDiscount  
              ,ParentID        
              ,IsRefund        
              ,AccountStatusID 
              ,Comment         
              ,Phone           
              ,Mail            
              ,PayNumber       
              ,PayDate             
              ,InUserID  
              ,UpUserID
              )
		OUTPUT INSERTED.AccountID INTO @ID
		select nullif(@PaymentDate, '19000101')       
              ,@PaymentAmount   
              ,@AccountNumber   
              ,nullif(@AccountDate  , '19000101')    
              ,@AccountAmount 
              ,@BuyerID         
              ,@BuyerDiscount   
              ,@SupplierID      
              ,@ClientID        
              ,@ClientDiscount  
              ,@ParentID        
              ,@IsRefund        
              ,@AccountStatusID 
              ,@Comment         
              ,@Phone           
              ,@Mail            
              ,@PayNumber       
              ,nullif(@PayDate, '19000101')    	    
              ,dbo.GetUserID()
              ,dbo.GetUserID()

		Select @AccountID = ID from @ID

        if isnull(@SupplierID, 0) > 0
        begin
          if isnull(@Phone, '') <> '' and
             not exists (select 1
                           from tContacts (nolock)
                          where ObjectTypeID = 3
                            and ObjectID     = @SupplierID
                            and Phone        = @Phone)
            insert tContacts (ObjectTypeID, ObjectID, Phone, InUserID, UpUserID)
            select 3, @SupplierID, @Phone, dbo.GetUserID(), dbo.GetUserID()
        end
                     
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
grant exec on AccountInsert to public
go

if OBJECT_ID('AccountEdit') is not null
    drop proc AccountEdit
/*
  AccountEdit - Изменение 
*/
go
create proc AccountEdit
              @AccountID         numeric(15,0)  --  
             ,@PaymentDate       datetime
             ,@PaymentAmount     int
             ,@AccountNumber     varchar(256)  
             ,@AccountDate       datetime
             ,@AccountAmount     int
             ,@BuyerID           numeric(15, 0) 
             ,@BuyerDiscount     money   
             ,@SupplierID        numeric(15, 0) 
             ,@ClientID          numeric(15, 0) 
             ,@ClientDiscount    money
             ,@ParentID          numeric(15, 0) = null
             ,@IsRefund          bit            = null
             ,@AccountStatusID   numeric(15, 0) 
             ,@Comment           varchar(256)
             ,@Phone             varchar(256)
             ,@Mail              varchar(256)
             ,@PayNumber         varchar(256)
             ,@PayDate           datetime

as
  declare @r                 int = 0

  if exists (select 1 
               from tAccounts a (nolock)
              where a.SupplierID    = @SupplierID
                and a.AccountNumber = @AccountNumber
                and a.AccountID     <> @AccountID)
  begin
    set @r =  181 --   'Ошибка! Счет заданным номером существует.'
    goto exit_
  end


  BEGIN TRY 

	Update tAccounts
	   set    
           PaymentDate     =  nullif(@PaymentDate  , '19000101')      
          ,PaymentAmount   = @PaymentAmount  
          ,AccountNumber   = @AccountNumber  
          ,AccountDate     = nullif(@AccountDate  , '19000101')     
          ,AccountAmount   = @AccountAmount  
          ,BuyerID         = @BuyerID        
          ,BuyerDiscount   = @BuyerDiscount  
          ,SupplierID      = @SupplierID     
          ,ClientID        = @ClientID       
          ,ClientDiscount  = @ClientDiscount 
          ,ParentID        = @ParentID       
          ,IsRefund        = isnull(@IsRefund, IsRefund)      
          ,AccountStatusID = @AccountStatusID
          ,Comment         = @Comment        
          ,Phone           = @Phone          
          ,Mail            = @Mail           
          ,PayNumber       = @PayNumber      
          ,PayDate         = nullif(@PayDate  , '19000101')    
          ,UpUserID        = dbo.GetUserID()
          ,UpDatetime      = GetDate()
	 where AccountID  = @AccountID
    

    if isnull(@SupplierID, 0) > 0
    begin
        if isnull(@Phone, '') <> '' and
            not exists (select 1
                        from tContacts (nolock)
                        where ObjectTypeID = 3
                        and ObjectID     = @SupplierID
                        and Phone        = @Phone)
        insert tContacts (ObjectTypeID, ObjectID, Phone, InUserID, UpUserID)
        select 3, @SupplierID, @Phone, dbo.GetUserID(), dbo.GetUserID()
    end
         



  END TRY  
  BEGIN CATCH  
      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on AccountEdit to public
go


if OBJECT_ID('AccountDelete') is not null
    drop proc AccountDelete
/*
  AccountDelete - Удаление 
*/
go
create proc AccountDelete
              @AccountID            numeric(15,0) --    
as
  declare @r int = 0

  BEGIN TRY 
		delete 
          from tAccounts
		 where AccountID=@AccountID
            
  END TRY  
  BEGIN CATCH  
   
      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on AccountDelete to public
go