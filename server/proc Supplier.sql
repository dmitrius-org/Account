if OBJECT_ID('SupplierInsert') is not null
    drop proc SupplierInsert
/*
  SupplierInsert - добавление 
*/
go
create proc SupplierInsert
              @SupplierID   numeric(15,0) output --  
             ,@Name    	    varchar(256)
             ,@FullName	    varchar(512)  = null
             ,@Inn	        varchar(11)   = null
             ,@Program	    varchar(512)  = null
             ,@PostAddress	varchar(512)  = null
             ,@LegalAddress	varchar(512)  = null
             ,@Edo	        varchar(256)  = null
             ,@EdoID	    varchar(2256) = null
             ,@IsImport	    bit           = null

as
  declare @r                 int = 0
         ,@KontragentTypeID  numeric(15,0)

  select @KontragentTypeID  = 3

  DECLARE @ID TABLE (ID numeric(18,0));

  if exists (select 1 
               from tKontragents u (nolock)
              where u.Name             = @Name
                and u.KontragentTypeID = @KontragentTypeID)
  begin
    set @r =  160--  'Поставщик с заданным наименование существует!'
    goto exit_
  end

  if exists (select 1 
               from tKontragents u (nolock)
              where u.INN              = @Inn
                and u.KontragentTypeID = @KontragentTypeID)
  begin
    set @r =  161--  ''Поставщик с заданным ИНН существует!'
    goto exit_
  end

    
  BEGIN TRY 
      Begin tran        

		insert into tKontragents
		      (KontragentTypeID 
              ,Name    	    
              ,FullName	    
              ,Inn	        
              ,Program	    
              ,PostAddress	
              ,LegalAddress	
              ,Edo	        
              ,EdoID	    
              ,IsImport	    
              ,UserID)
		OUTPUT INSERTED.KontragentID INTO @ID
		select @KontragentTypeID
              ,@Name    	    
              ,@FullName	    
              ,@Inn	        
              ,@Program	    
              ,@PostAddress	
              ,@LegalAddress	
              ,@Edo	        
              ,@EdoID	    
              ,@IsImport	    
              ,dbo.GetUserID()

		Select @SupplierID = ID from @ID
        
        exec ContactFill
                @ObjectTypeID = @KontragentTypeID
               ,@ObjectID     = @SupplierID
               ,@Mode         = 1
       
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
grant exec on SupplierInsert to public
go

if OBJECT_ID('SupplierEdit') is not null
    drop proc SupplierEdit
/*
  SupplierEdit - Изменение 
*/
go
create proc SupplierEdit
              @SupplierID   numeric(15,0)  --  
             ,@Name    	    varchar(256)
             ,@FullName	    varchar(512)  = null
             ,@Inn	        varchar(11)   = null
             ,@Program	    varchar(512)  = null
             ,@PostAddress	varchar(512)  = null
             ,@LegalAddress	varchar(512)  = null
             ,@Edo	        varchar(256)  = null
             ,@EdoID	    varchar(2256) = null
             ,@IsImport	    bit           = null

as
  declare @r                 int = 0
         ,@KontragentTypeID  numeric(15,0)

  select @KontragentTypeID  = 3

  if exists (select 1 
               from tKontragents u (nolock)
              where u.Name             = @Name
                and u.KontragentTypeID = @KontragentTypeID
                and u.KontragentID    <> @SupplierID)
  begin
    set @r =  160--  'Поставщик с заданным наименование существует!'
    goto exit_
  end


  if exists (select 1 
               from tKontragents u (nolock)
              where u.INN              = @Inn
                and u.KontragentTypeID = @KontragentTypeID
                and u.KontragentID    <> @SupplierID)
  begin
    set @r =  161--  ''Поставщик с заданным ИНН существует!'
    goto exit_
  end

  BEGIN TRY 

		Update tKontragents
		   set Name    	    = @Name    	    
              ,FullName	    = @FullName	    
              ,Inn	        = @Inn	        
              ,Program	    = @Program	    
              ,PostAddress	= @PostAddress	
              ,LegalAddress	= @LegalAddress	
              ,Edo	        = @Edo	        
              ,EdoID	    = @EdoID	    
		 where KontragentID  = @SupplierID

        exec ContactFill
                @ObjectTypeID = @KontragentTypeID
               ,@ObjectID     = @SupplierID
               ,@Mode         = 1

  END TRY  
  BEGIN CATCH  
      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on SupplierEdit to public
go


if OBJECT_ID('SupplierDelete') is not null
    drop proc SupplierDelete
/*
  SupplierDelete - Удаление 
*/
go
create proc SupplierDelete
              @SupplierID            numeric(15,0) --    
as
  declare @r int = 0
         ,@KontragentTypeID  numeric(15,0)

  select @KontragentTypeID  = 3

  if exists (select 1 
               from tAccounts u (nolock)
              where u.SupplierID = @SupplierID)
  begin
      set @r = 162--  'Ошибка! Поставщик используется в справочнике "Счета"'
      goto exit_
  end

  BEGIN TRY 
		delete 
          from tKontragents
		 where KontragentID=@SupplierID

         delete tContacts 
           from tContacts (rowlock) 
          where ObjectTypeID = @KontragentTypeID 
            and ObjectID     = @SupplierID


         delete tDiscounts 
           from tDiscounts (rowlock) 
          where ObjectTypeID = @KontragentTypeID 
            and ObjectID     = @SupplierID
            
  END TRY  
  BEGIN CATCH  
   
      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on SupplierDelete to public
go