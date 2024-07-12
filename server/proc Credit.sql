if OBJECT_ID('CreditTypeInsert') is not null
    drop proc CreditTypeInsert
/*
  CreditTypeInsert - добавление 
*/
go
create proc CreditTypeInsert
              @CreditTypeID         numeric(15,0) output --  
             ,@Name	                varchar(256)  -- 

as
  declare @r int = 0

  DECLARE @ID TABLE (ID numeric(18,0));

  if exists (select 1 
               from tCreditTypes u (nolock)
              where u.Name = @Name)
  begin
    set @r =  100--'ид кредита существует!'
    goto exit_
  end

  BEGIN TRY 
      Begin tran

		insert into tCreditTypes
		      (Name, UserID)
		OUTPUT INSERTED.CreditTypeID INTO @ID
		select @Name
              ,dbo.GetUserID()

		Select @CreditTypeID = ID from @ID	
        
		--if @r <> 0
		--begin 
		--  RAISERROR (15600, 16, 1, @r);
		--end

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
grant exec on CreditTypeInsert to public
go

if OBJECT_ID('CreditTypeEdit') is not null
    drop proc CreditTypeEdit
/*
  CreditTypeEdit - Изменение 
*/
go
create proc CreditTypeEdit
              @CreditTypeID         numeric(15,0)   
             ,@Name	                varchar(256)  
as
  declare @r int = 0

  if exists (select 1 
               from tCreditTypes u (nolock)
              where u.Name = @Name
                and u.CreditTypeID <> @CreditTypeID)
  begin
    set @r =  100--'ид кредита существует!'
    goto exit_
  end

  BEGIN TRY 
      --Begin tran

		Update tCreditTypes
		   set Name = @Name
		 where CreditTypeID=@CreditTypeID

      --commit tran
  END TRY  
  BEGIN CATCH  
      --if @@TRANCOUNT > 0
      --  rollback tran
 
      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on CreditTypeEdit to public
go


if OBJECT_ID('CreditTypeDelete') is not null
    drop proc CreditTypeDelete
/*
  CreditTypeDelete - Удаление 
*/
go
create proc CreditTypeDelete
              @CreditTypeID         numeric(15,0)   
as
  declare @r int = 0

  --if exists (select 1 
  --             from tCreditTypes u (nolock)
  --            where u.Name = @Name
  --              and u.CreditTypeID <> @CreditTypeID)
  --begin
  --  set @r =  100--'ид кредита существует!'
  --  goto exit_
  --end

  BEGIN TRY 
      --Begin tran

		delete 
          from tCreditTypes
		 where CreditTypeID=@CreditTypeID

      --commit tran
  END TRY  
  BEGIN CATCH  
      --if @@TRANCOUNT > 0
      --  rollback tran
    
      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on CreditTypeDelete to public
go

if OBJECT_ID('CreditInsert') is not null
    drop proc CreditInsert
/*
  CreditInsert - добавление 
*/
go
create proc CreditInsert
              @CreditID	    numeric(15, 0) out
             ,@CreditTypeID	numeric(15, 0)
             ,@CreditDate	datetime
             ,@Amount	    float
             ,@Prc	        float
             ,@PayAmount	float
             ,@CloseDate	datetime
             ,@Comment	    varchar(1024)

as
  declare @r int = 0

  DECLARE @ID TABLE (ID numeric(18,0));

  --if exists (select 1 
  --             from tCreditTypes u (nolock)
  --            where u.Name = @Name)
  --begin
  --  set @r =  100--'ид кредита существует!'
  --  goto exit_
  --end

  BEGIN TRY 
      Begin tran

		insert into tCredits
		      (
               CreditTypeID
              ,CreditDate
              ,Amount
              ,Prc
              ,PayAmount
              ,CloseDate
              ,Comment
              ,UserID
              )
		OUTPUT INSERTED.CreditID INTO @ID
		select @CreditTypeID
              ,@CreditDate	
              ,@Amount	   
              ,@Prc	       
              ,nullif(@PayAmount, '19000101') 	
              ,nullif(@CloseDate, '19000101') 	
              ,@Comment	   
              ,dbo.GetUserID()

		Select @CreditID = ID from @ID	
        
		--if @r <> 0
		--begin 
		--  RAISERROR (15600, 16, 1, @r);
		--end

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
grant exec on CreditInsert to public
go

if OBJECT_ID('CreditEdit') is not null
    drop proc CreditEdit
/*
  CreditEdit - Изменение 
*/
go
create proc CreditEdit
              @CreditID	    numeric(15, 0) out
             ,@CreditTypeID	numeric(15, 0)
             ,@CreditDate	datetime
             ,@Amount	    float
             ,@Prc	        float
             ,@PayAmount	float
             ,@CloseDate	datetime
             ,@Comment	    varchar(1024)
as
  declare @r int = 0

  BEGIN TRY 
      --Begin tran

		Update tCredits
           set CreditTypeID= @CreditTypeID
              ,CreditDate  = @CreditDate	
              ,Amount      = @Amount	   
              ,Prc         = @Prc	       
              ,PayAmount   = nullif(@PayAmount, '19000101') 	
              ,CloseDate   = nullif(@CloseDate, '19000101') 	
              ,Comment     = @Comment	   
		 where CreditID=@CreditID

      --commit tran
  END TRY  
  BEGIN CATCH  
      --if @@TRANCOUNT > 0
      --  rollback tran
 
      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on CreditEdit to public
go


if OBJECT_ID('CreditDelete') is not null
    drop proc CreditDelete
/*
  CreditDelete - Удаление 
*/
go
create proc CreditDelete
              @CreditID       numeric(15,0)   
as
  declare @r int = 0

  if exists (select 1 
               from tTransaction t (nolock)
              where t.CreditID = @CreditID)
  begin
    set @r = 200-- 'Удаление запрещено! По кредиту имеются платежи.'
    goto exit_
  end

  BEGIN TRY 
      --Begin tran

		delete 
          from tCredits
		 where CreditID=@CreditID

      --commit tran
  END TRY  
  BEGIN CATCH  
      --if @@TRANCOUNT > 0
      --  rollback tran
    
      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on CreditDelete to public
go