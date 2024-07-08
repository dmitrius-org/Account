if OBJECT_ID('ContactFill') is not null
    drop proc ContactFill
/*
  ContactFill - добавление 
  @Mode
  0 - to pContacts
  1 - to tContacts

  @ObjectTypeID
  1 - Клиент
  2 - Покупатель
  3 - Поставщик
*/
go
create proc ContactFill
              @ObjectTypeID      int 
             ,@ObjectID          numeric(15, 0) 
             ,@Mode              int
as
  declare @r int = 0

  select @Mode = isnull(@Mode, 0)

  DECLARE @ID TABLE (ID numeric(18,0));

  if @Mode = 0
  begin
    delete pContacts from pContacts (rowlock) where Spid = @@Spid

    insert pContacts
          (
           Spid
          ,ContactID    
          ,ObjectTypeID 
          ,ObjectID     
          ,Phone        
          ,Mail         
          ,Comment      
          ,InDateTime   
          ,UpDateTime
          ,InUserID
          ,UpUserID  
          )
    select @@Spid   
          ,ContactID    
          ,ObjectTypeID 
          ,ObjectID     
          ,Phone        
          ,Mail         
          ,Comment      
          ,InDateTime   
          ,UpDateTime
          ,InUserID
          ,UpUserID 
      from tContacts (nolock)
     where ObjectTypeID = @ObjectTypeID
       and ObjectID     = @ObjectID

  end
  else
  begin
    delete tContacts
      from tContacts t (rowlock)
     where t.ObjectTypeID = @ObjectTypeID
       and t.ObjectID     = @ObjectID
       and not exists (select 1
                         from pContacts p (nolock)
                        where p.Spid         = @@Spid
                          and p.ObjectTypeID = t.ObjectTypeID
                          and p.ObjectID     = t.ObjectID
                          and p.ContactID    = t.ContactID)

    insert tContacts
          (
           ObjectTypeID 
          ,ObjectID     
          ,Phone        
          ,Mail         
          ,Comment      
          ,InDateTime   
          ,UpDateTime
          ,InUserID
          ,UpUserID      
          )
    select     
           ObjectTypeID 
          ,@ObjectID     
          ,Phone        
          ,Mail         
          ,Comment      
          ,GetDate()   
          ,GetDate() 
          ,dbo.GetUserID()   
          ,dbo.GetUserID()
      from pContacts (nolock)
     where Spid         = @@Spid
       and ObjectTypeID = @ObjectTypeID
       --and ObjectID     = @ObjectID
      and isnull(ContactID, 0) = 0


    Update t
       set t.Phone   = p.Phone
          ,t.Mail    = p.Mail
          ,t.Comment = p.Comment
          ,t.UpDateTime = GetDate()
          ,t.UpUserID = dbo.GetUserID()
      from pContacts p (nolock)
     inner join tContacts t (updlock)
             on t.ContactID = p.ContactID
     where p.Spid         = @@Spid
       and p.ObjectTypeID = @ObjectTypeID
       and p.ObjectID     = @ObjectID

  end
  
exit_:
return @r
go
grant exec on ContactFill to public
go
