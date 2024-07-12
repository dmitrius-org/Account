if OBJECT_ID('CommentFill') is not null
    drop proc CommentFill
/*
  CommentFill - добавление 
  @Mode
  0 - to pContacts
  1 - to tContacts

  @ObjectTypeID
  1 - Клиент
  2 - Покупатель
  3 - Поставщик
*/
go
create proc CommentFill
              @ObjectTypeID      int 
             ,@ObjectID          numeric(15, 0) 
             ,@Mode              int
as
  declare @r int = 0

  select @Mode = isnull(@Mode, 0)

  DECLARE @ID TABLE (ID numeric(18,0));

  if @Mode = 0
  begin
    delete pComments from pComments (rowlock) where Spid = @@Spid

    insert pComments
          (
           Spid
          ,CommentID    
          ,ObjectTypeID 
          ,ObjectID          
          ,Comment      
          ,InDateTime   
          ,UpDateTime
          ,InUserID
          ,UpUserID  
          )
    select @@Spid   
          ,CommentID    
          ,ObjectTypeID 
          ,ObjectID           
          ,Comment      
          ,InDateTime   
          ,UpDateTime
          ,InUserID
          ,UpUserID 
      from tComments (nolock)
     where ObjectTypeID = @ObjectTypeID
       and ObjectID     = @ObjectID

  end
  else
  begin
    delete tComments
      from tComments t (rowlock)
     where t.ObjectTypeID = @ObjectTypeID
       and t.ObjectID     = @ObjectID
       and not exists (select 1
                         from pComments p (nolock)
                        where p.Spid         = @@Spid
                          and p.ObjectTypeID = t.ObjectTypeID
                          and p.ObjectID     = t.ObjectID
                          and p.CommentID    = t.CommentID)

    insert tComments
          (
           ObjectTypeID 
          ,ObjectID              
          ,Comment      
          ,InDateTime   
          ,UpDateTime
          ,InUserID
          ,UpUserID      
          )
    select     
           ObjectTypeID 
          ,@ObjectID            
          ,Comment      
          ,GetDate()   
          ,GetDate() 
          ,dbo.GetUserID()   
          ,dbo.GetUserID()
      from pComments (nolock)
     where Spid         = @@Spid
       and ObjectTypeID = @ObjectTypeID
       --and ObjectID     = @ObjectID
      and isnull(CommentID, 0) = 0


    Update t
       set t.Comment    = p.Comment
          ,t.UpDateTime = GetDate()
          ,t.UpUserID   = dbo.GetUserID()
      from pComments p (nolock)
     inner join tComments t (updlock)
             on t.CommentID = p.CommentID
     where p.Spid         = @@Spid
       and p.ObjectTypeID = @ObjectTypeID
       and p.ObjectID     = @ObjectID

  end
  
exit_:
return @r
go
grant exec on CommentFill to public
go
