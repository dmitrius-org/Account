if OBJECT_ID('DocumentRequestAdd') is not null
    drop proc DocumentRequestAdd
/*
  DocumentRequestAdd - добавление 
*/
go
create proc DocumentRequestAdd
              @DocumentRequestID	numeric(15, 0) out
             ,@PayDate              datetime
             ,@AccountNumber	    varchar(256)
             ,@SupplierID	        numeric(15, 0)
             ,@BuyerID	            numeric(15, 0)
             ,@Comment	            varchar(256)  = null
             ,@Phone	            varchar(256)
             ,@Mail	                varchar(256)
             ,@AccountID            numeric(15, 0) = null


as
  declare @r                 int = 0

  DECLARE @ID TABLE (ID numeric(15,0));
     
  BEGIN TRY 
      Begin tran        

		insert into tDocumentRequest
		      (
               PayDate
              ,AccountNumber
              ,SupplierID
              ,BuyerID
              ,AccountID
              ,Comment
              ,Phone
              ,Mail       
              ,InUserID
              ,UpUserID        
              )
		OUTPUT INSERTED.DocumentRequestID INTO @ID
		select 
               @PayDate        
              ,@AccountNumber
              ,@SupplierID	  
              ,@BuyerID	
              ,@AccountID
              ,@Comment	      
              ,@Phone	      
              ,@Mail	                   
              ,dbo.GetUserID()
              ,dbo.GetUserID()

		Select @DocumentRequestID = ID from @ID

        exec CommentFill
                @ObjectTypeID = 4
               ,@ObjectID     = @DocumentRequestID
               ,@Mode         = 1

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
grant exec on DocumentRequestAdd to public
go

if OBJECT_ID('DocumentRequestEdit') is not null
    drop proc DocumentRequestEdit
/*
  DocumentRequestEdit - Изменение 
*/
go
create proc DocumentRequestEdit
              @DocumentRequestID	numeric(15, 0) 
             ,@PayDate              datetime
             ,@AccountNumber	    varchar(256)
             ,@SupplierID	        numeric(15, 0)
             ,@BuyerID	            numeric(15, 0)
             ,@Comment	            varchar(256)   = null
             ,@Phone	            varchar(256)
             ,@Mail	                varchar(256)
             ,@AccountID            numeric(15, 0) = null

as
  declare @r                 int = 0

  BEGIN TRY 

	Update tDocumentRequest
	   set PayDate       = @PayDate          
          ,AccountNumber = @AccountNumber	
          ,SupplierID	 = @SupplierID	    
          ,BuyerID	     = @BuyerID	          
          ,Comment	     = @Comment	          
          ,Phone	     = @Phone	        
          ,Mail	         = @Mail	              
          ,AccountID     = @AccountID    
          ,UpUserID      = dbo.GetUserID()
          ,UpDatetime    = GetDate()
	 where DocumentRequestID  = @DocumentRequestID  
     
    exec CommentFill
          @ObjectTypeID = 4
         ,@ObjectID     = @DocumentRequestID
         ,@Mode         = 1

  END TRY  
  BEGIN CATCH  

      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on DocumentRequestEdit to public
go


if OBJECT_ID('DocumentRequestDelete') is not null
    drop proc DocumentRequestDelete
/*
  DocumentRequestDelete - Удаление 
*/
go
create proc DocumentRequestDelete
              @DocumentRequestID	numeric(15, 0)   
as
  declare @r int = 0

  BEGIN TRY 
		delete tDocumentRequest
          from tDocumentRequest (rowlock)
		 where DocumentRequestID=@DocumentRequestID

        delete tComments
          from tComments (rowlock)
		 where ObjectID     = @DocumentRequestID
           and ObjectTypeID = 4
            
  END TRY  
  BEGIN CATCH  
   
      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on DocumentRequestDelete to public
