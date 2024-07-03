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