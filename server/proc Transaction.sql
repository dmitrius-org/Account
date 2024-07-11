if OBJECT_ID('TransactionAdd') is not null
    drop proc TransactionAdd
/*
  TransactionAdd - добавление 
*/
go
create proc TransactionAdd
              @TransactionID      numeric(15,0) output -- 
             ,@TranTypeID         numeric(15, 0)
             ,@OperationID        numeric(15, 0)
	         ,@OperDate           datetime 
             ,@ExpenseItemID      numeric(15, 0) = null
             ,@CreditD            numeric(15, 0) = null
             ,@Amount             money
             ,@Comment            varchar(256)
             ,@KassaID            numeric(15, 0)   
             ,@KontragentID       numeric(15, 0) = null 
             ,@Discount           money = null
             ,@ParentID           numeric(15, 0) = null


as
  declare @r                 int = 0
         ,@TransactionID2    numeric(15,0)
         ,@LinkOperTypeID    numeric(15, 0) = 0
        



  DECLARE @ID TABLE (ID numeric(15,0));

  if @Discount is null and @KontragentID > 0
    Select @Discount = isnull(Discount, 0)
      from tKontragents (nolock)
     where KontragentID = @KontragentID
     
  BEGIN TRY 
      Begin tran        

		insert into tTransaction
		      (
               TranTypeID    
              ,OperationID   
              ,OperDate      
              ,ExpenseItemID 
              ,CreditD       
              ,Amount        
              ,Comment       
              ,KassaID       
              ,KontragentID  
              ,Discount      
              ,ParentID        
              ,UserID        
              )
		OUTPUT INSERTED.TransactionID INTO @ID
		select 
               @TranTypeID     
              ,@OperationID    
              ,@OperDate       
              ,@ExpenseItemID  
              ,@CreditD        
              ,@Amount         
              ,@Comment        
              ,@KassaID        
              ,@KontragentID   
              ,@Discount       
              ,@ParentID         
              ,dbo.GetUserID()

		Select @TransactionID = ID from @ID

       ---
        set @LinkOperTypeID = 0
        select @TranTypeID     = o2.TranTypeID
              ,@OperationID    = o2.OperationID
              ,@KassaID        = o2.KassaID
              ,@LinkOperTypeID = o.LinkOperTypeID
          from tOperation o (nolock)
          join tOperation o2 (nolock) 
                 on o2.OperationID = o.LinkOperTypeID
         where o.OperationID = @OperationID

        if isnull(@LinkOperTypeID, 0) > 0
        begin

		    insert into tTransaction
		          (
                   TranTypeID    
                  ,OperationID   
                  ,OperDate      
                  ,ExpenseItemID 
                  ,CreditD       
                  ,Amount        
                  ,Comment       
                  ,KassaID       
                  ,KontragentID  
                  ,Discount      
                  ,ParentID        
                  ,UserID        
                  )
		    OUTPUT INSERTED.TransactionID INTO @ID
		    select 
                   @TranTypeID     
                  ,@OperationID    
                  ,@OperDate       
                  ,@ExpenseItemID  
                  ,@CreditD        
                  ,@Amount         
                  ,@Comment        
                  ,@KassaID        
                  ,@KontragentID   
                  ,@Discount       
                  ,@TransactionID         
                  ,dbo.GetUserID()

         if @r = 0 goto next_

        end

        next_:
                     
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
grant exec on TransactionAdd to public
go

if OBJECT_ID('TransactionEdit') is not null
    drop proc TransactionEdit
/*
  TransactionEdit - Изменение 
*/
go
create proc TransactionEdit
              @TransactionID      numeric(15,0)  -- 
             ,@TranTypeID         numeric(15, 0)
             ,@OperationID        numeric(15, 0)
	         ,@OperDate           datetime 
             ,@ExpenseItemID      numeric(15, 0) = null
             ,@CreditD            numeric(15, 0) = null
             ,@Amount             money
             ,@Comment            varchar(256)
            --,@KassaID            numeric(15, 0)   
             ,@KontragentID       numeric(15, 0) = null 
             ,@Discount           money = null
             ,@ParentID           numeric(15, 0) = null

as
  declare @r                 int = 0

  if @Discount is null and @KontragentID > 0
    Select @Discount = isnull(Discount, 0)
      from tKontragents (nolock)
     where KontragentID = @KontragentID


  BEGIN TRY 

	Update tTransaction
	   set  TranTypeID      = @TranTypeID      
           ,OperationID     = @OperationID     
           ,OperDate        = @OperDate        
           ,ExpenseItemID   = @ExpenseItemID   
           ,CreditD         = @CreditD         
           ,Amount          = @Amount          
           ,Comment         = @Comment         
           --,KassaID         = @KassaID         
           ,KontragentID    = @KontragentID    
           ,Discount        = @Discount        
           ,ParentID        = @ParentID             
	  where TransactionID  = @TransactionID       

  END TRY  
  BEGIN CATCH  

      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on TransactionEdit to public
go


if OBJECT_ID('TransactionDelete') is not null
    drop proc TransactionDelete
/*
  TransactionDelete - Удаление 
*/
go
create proc TransactionDelete
              @TransactionID            numeric(15,0) --    
as
  declare @r int = 0

  BEGIN TRY 
		delete 
          from tTransaction
		 where TransactionID=@TransactionID
            
  END TRY  
  BEGIN CATCH  
   
      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on TransactionDelete to public

go
if OBJECT_ID('CurrentCashBalance') is not null
    drop proc CurrentCashBalance
/*
  CurrentCashBalance - текщий остаток по кассе 
*/
go
create proc CurrentCashBalance
              @KassaID            numeric(15,0) --    
as
  declare @r int = 0

  SELECT sum(IIf(TranTypeID=1,1,-1)*Amount) AS balance, KassaID
    FROM tTransaction (nolock)
   where KassaID = @KassaID
   GROUP BY KassaID;


exit_:
return @r
go
grant exec on CurrentCashBalance to public
go


if OBJECT_ID('UserKassaList') is not null
    drop proc UserKassaList
/*
  UserKassaList - 
*/
go
create proc UserKassaList
as
  declare @r int = 0

  SELECT [KassaID]
        ,[Name]
    FROM [tKassa] (nolock)


exit_:
return @r
go
grant exec on UserKassaList to public
go