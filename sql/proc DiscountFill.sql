if OBJECT_ID('DiscountFill') is not null
    drop proc DiscountFill
/*
  DiscountFill -  
  @Mode
  0 - to pContacts
  1 - to tContacts

  @ObjectTypeID
  1 - Клиент
  2 - Покупатель
  3 - Поставщик
*/
go
create proc DiscountFill
              @ObjectTypeID      int 
             ,@ObjectID          numeric(15, 0) 
             ,@Mode              int
as
  declare @r int = 0

  select @Mode = isnull(@Mode, 0)

  DECLARE @ID TABLE (ID numeric(18,0));

  if @Mode = 0
  begin
    delete pDiscounts from pDiscounts (rowlock) where Spid = @@Spid

    insert pDiscounts
          (
           Spid
          ,DiscountID    
          ,ObjectTypeID 
          ,ObjectID     
          ,Discount        
          ,DiscountDate         
          ,Comment      
          ,InDateTime   
          ,UpDateTime
          ,InUserID
          ,UpUserID
          )
    select @@Spid   
          ,DiscountID    
          ,ObjectTypeID 
          ,ObjectID     
          ,Discount        
          ,DiscountDate         
          ,Comment      
          ,InDateTime  
          ,UpDateTime
          ,InUserID
          ,UpUserID 
      from tDiscounts (nolock)
     where ObjectTypeID = @ObjectTypeID
       and ObjectID     = @ObjectID

  end
  else
  begin
    delete tDiscounts
      from tDiscounts t (rowlock)
     where t.ObjectTypeID = @ObjectTypeID
       and t.ObjectID     = @ObjectID
       and not exists (select 1
                         from pDiscounts p (nolock)
                        where p.Spid         = @@Spid
                          and p.ObjectTypeID = t.ObjectTypeID
                          and p.ObjectID     = t.ObjectID
                          and p.DiscountID    = t.DiscountID)

    insert tDiscounts
          (
           ObjectTypeID 
          ,ObjectID     
          ,Discount        
          ,DiscountDate         
          ,Comment      
          ,InDateTime   
          ,UpDateTime
          ,InUserID
          ,UpUserID    
          )
    select     
           ObjectTypeID 
          ,@ObjectID     
          ,Discount        
          ,DiscountDate         
          ,Comment  
          ,GetDate() 
          ,GetDate()   
          ,dbo.GetUserID()  
          ,dbo.GetUserID() 
      from pDiscounts (nolock)
     where Spid         = @@Spid
       and ObjectTypeID = @ObjectTypeID
       --and ObjectID     = @ObjectID
      and isnull(DiscountID, 0) = 0


    Update t
       set t.Discount   = p.Discount
          ,t.DiscountDate    = p.DiscountDate
          ,t.Comment = p.Comment
          ,t.UpDateTime = GetDate()
          ,UpUserID = dbo.GetUserID() 
      from pDiscounts p (nolock)
     inner join tDiscounts t (updlock)
             on t.DiscountID = p.DiscountID
     where p.Spid         = @@Spid
       and p.ObjectTypeID = @ObjectTypeID
       and p.ObjectID     = @ObjectID

  end
  
exit_:
return @r
go
grant exec on DiscountFill to public
go
