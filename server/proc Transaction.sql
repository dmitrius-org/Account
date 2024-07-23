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
             ,@CreditID           numeric(15, 0) = null
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
              ,CreditID       
              ,Amount        
              ,Comment       
              ,KassaID       
              ,KontragentID  
              ,Discount      
              ,ParentID        
              ,InUserID  
              ,UpUserID
              )
		OUTPUT INSERTED.TransactionID INTO @ID
		select 
               @TranTypeID     
              ,@OperationID    
              ,@OperDate       
              ,@ExpenseItemID  
              ,@CreditID        
              ,@Amount         
              ,@Comment        
              ,@KassaID        
              ,@KontragentID   
              ,@Discount       
              ,@ParentID         
              ,dbo.GetUserID()
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
                  ,CreditID       
                  ,Amount        
                  ,Comment       
                  ,KassaID       
                  ,KontragentID  
                  ,Discount      
                  ,ParentID        
                  ,InUserID   
                  ,UpUserID
                  )
		    OUTPUT INSERTED.TransactionID INTO @ID
		    select 
                   @TranTypeID     
                  ,@OperationID    
                  ,@OperDate       
                  ,@ExpenseItemID  
                  ,@CreditID        
                  ,@Amount         
                  ,@Comment        
                  ,@KassaID        
                  ,@KontragentID   
                  ,@Discount       
                  ,@TransactionID         
                  ,dbo.GetUserID()
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
             ,@CreditID           numeric(15, 0) = null
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
	   set  TranTypeID    = @TranTypeID      
           ,OperationID   = @OperationID     
           ,OperDate      = @OperDate        
           ,ExpenseItemID = @ExpenseItemID   
           ,CreditID      = @CreditID         
           ,Amount        = @Amount          
           ,Comment       = @Comment         
           --,KassaID       = @KassaID         
           ,KontragentID  = @KontragentID    
           ,Discount      = @Discount        
           ,ParentID      = @ParentID  
           ,UpUserID      = dbo.GetUserID()
           ,UpDatetime    = GetDate()
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

  SELECT k.[KassaID]
        ,k.[Name]
    FROM [tKassa] k (nolock)
  inner join tGrant g (nolock)
          on g.ObjectType = 0
         and g.ObjectID   = dbo.GetUserID()
         and g.MenuID     = k.KassaID


exit_:
return @r
go
grant exec on UserKassaList to public
go



if OBJECT_ID('vTransaction') is not null
    drop view vTransaction
/*
  vTransaction - 
*/
go
create view vTransaction
as
Select t.TransactionID 
      ,t.TranTypeID 
      ,tt.Brief       as TranType
      ,ot.Name        as OperationName
      ,t.OperDate
      ,k.Name         as KontragentName
      ,iif(t.TranTypeID = 1, t.Amount, 0) as Debet
      ,iif(t.TranTypeID in (2, 3), t.Amount, 0) as Credit
      ,ks.Name        as Kassa
      ,(Select sum(IIf(t2.TranTypeID=1, 1, -1) * t2.Amount )          
          from tTransaction t2 (nolock)         
         where t2.InDateTime <= t.InDateTime 
        ) AS balance

      ,t.KassaID



    FROM 
   --- права  
        [tKassa] ka (nolock)
  inner join tGrant g (nolock)
          on g.ObjectType = 0
         and g.ObjectID   = dbo.GetUserID()
         and g.MenuID     = ka.KassaID

  inner join tMenu n (nolock)
          on n.ParentID = ka.KassaID
  inner join tGrant r (nolock)
          on r.ObjectType = 0
         and r.ObjectID   = dbo.GetUserID()
         and r.MenuID     = n.MenuID
  --- права

   
 inner join tTransaction t (nolock)
         on t.KassaID = ka.KassaID
 inner join tTranType tt (nolock)
         on tt.TranTypeID = t.TranTypeID
         
 Inner join tKassa ks (nolock)
         on ks.KassaID = t.KassaID
                  
 left join tKontragents k (nolock)
         on k.KontragentID = t.KontragentID

  left join tOperation o (nolock)
         on o.OperationID = t.OperationID
  left join tOperationType ot (nolock)
         on ot.OperationTypeID = o.OperationTypeID

go
grant all on vTransaction to public
go