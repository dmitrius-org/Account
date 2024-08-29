if OBJECT_ID('TaskInsert') is not null
    drop proc TaskInsert
/*
  TaskInsert - добавление 
*/
go
create proc TaskInsert
              @TaskID            numeric(15,0) output --  
             ,@Comment	         varchar(512)  -- 
             ,@DueDate           dateTime
             ,@CreateDate        dateTime
             ,@ManagerID         numeric(15, 0)
             ,@TaskStatusID      numeric(15, 0) 
as
  declare @r int = 0

  DECLARE @ID TABLE (ID numeric(18,0));

  --if exists (select 1 
  --             from tTasks u (nolock)
  --            where 11)
  --begin
  --  set @r =  0
  --  goto exit_
  --end

  BEGIN TRY 
      Begin tran

		insert into tTasks
		      (Comment, DueDate, CreateDate, ManagerID, TaskStatusID, 
               InUserID  
              ,UpUserID)
		OUTPUT INSERTED.TaskID INTO @ID
		select @Comment
              ,@DueDate     
              ,@CreateDate  
              ,@ManagerID   
              ,@TaskStatusID
              ,dbo.GetUserID()
              ,dbo.GetUserID()

		Select @TaskID = ID from @ID
        
       declare @AuditID numeric(18, 2)
       exec AuditInsert     
              @AuditID      = @AuditID out  
             ,@ObjectID     = @TaskID               
             ,@ObjectTypeID = 9 
             ,@Action       = 'add'  
             ,@Comment      = 'Добавление' 
      
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
grant exec on TaskInsert to public
go

if OBJECT_ID('TaskEdit') is not null
    drop proc TaskEdit
/*
  TaskEdit - Изменение 
*/
go
create proc TaskEdit
              @TaskID            numeric(15,0) --  
             ,@Comment	         varchar(512)  -- 
             ,@DueDate           dateTime
             ,@CreateDate        dateTime
             ,@ManagerID         numeric(15, 0)
             ,@TaskStatusID      numeric(15, 0) 
as
  declare @r int = 0

  BEGIN TRY 
		Update tTasks
		   set Comment      = @Comment    
              ,DueDate      = @DueDate     
              ,CreateDate   = @CreateDate  
              ,ManagerID    = @ManagerID   
              ,TaskStatusID = @TaskStatusID
              ,UpUserID     = dbo.GetUserID()
              ,UpDatetime   = GetDate()
		 where TaskID=@TaskID

       declare @AuditID numeric(18, 2)
       exec AuditInsert     
              @AuditID      = @AuditID out  
             ,@ObjectID     = @TaskID               
             ,@ObjectTypeID = 9 
             ,@Action       = 'edit'  
             ,@Comment      = 'Изменение' 
  END TRY  
  BEGIN CATCH  
      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on TaskEdit to public
go


if OBJECT_ID('TaskDelete') is not null
    drop proc TaskDelete
/*
  TaskDelete - Удаление 
*/
go
create proc TaskDelete
              @TaskID            numeric(15,0) --    
as
  declare @r int = 0

  BEGIN TRY 
		delete 
          from tTasks
		 where TaskID=@TaskID

    declare @AuditID numeric(18, 2)
    exec AuditInsert     
            @AuditID      = @AuditID out  
            ,@ObjectID     = @TaskID               
            ,@ObjectTypeID = 9 
            ,@Action       = 'delete'  
            ,@Comment      = 'Удаление' 
  END TRY  
  BEGIN CATCH  
   
      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on TaskDelete to public
go