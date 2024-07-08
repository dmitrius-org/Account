if OBJECT_ID('BuyerInsert') is not null
    drop proc BuyerInsert
/*
  BuyerInsert - добавление 
*/
go
create proc BuyerInsert
              @BuyerID      numeric(15,0) output --  
             ,@Name    	    varchar(256)
             ,@FullName	    varchar(512)  = null
             ,@Inn	        varchar(11)   = null
             ,@Program	    varchar(512)  = null
             ,@PostAddress	varchar(512)  = null
             ,@LegalAddress	varchar(512)  = null
             ,@Edo	        varchar(256)  = null
             ,@EdoID	    varchar(2256) = null
             ,@IsImport	    bit           = null
             ,@Discount	    float         = null
             ,@DiscountDate	datetime      = null
             ,@PartnerID	numeric       = null
             ,@IsPartner	bit           = null
as
  declare @r                 int = 0
         ,@KontragentTypeID  numeric(15,0)

  select @KontragentTypeID  = 2

  if @IsPartner =1
  begin
    select @Inn          = null
          ,@PostAddress	 = null
          ,@LegalAddress = null
          ,@Edo	         = null
          ,@EdoID	     = null
          ,@IsImport	 = null   
          ,@Discount	 = null   
          ,@DiscountDate = null
          ,@PartnerID	 = null
  end

  DECLARE @ID TABLE (ID numeric(18,0));

  if exists (select 1 
               from tKontragents u (nolock)
              where u.Name             = @Name
                and u.KontragentTypeID = @KontragentTypeID
                and u.PartnerID        = @PartnerID)
  begin
    if @IsPartner > 0
       set @r =  141 -- 141,   'Партнер с заданным наименование существует!'
    else
       set @r =  140 -- 140,   'Покупатель с заданным наименование существует!'
    goto exit_
  end

  if @IsPartner = 0 and exists (select 1 
                                 from tKontragents u (nolock)
                                where u.INN              = @Inn
                                  and u.KontragentTypeID = @KontragentTypeID) 
  begin
    set @r =  142--  'Покупатель с заданным ИНН существует!'
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
              ,Discount	    
              ,DiscountDate	
              ,PartnerID	
              ,IsPartner	
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
              ,@Discount	    
              ,@DiscountDate	
              ,@PartnerID	
              ,@IsPartner 
              ,dbo.GetUserID()

		Select @BuyerID = ID from @ID

        insert tDiscounts(ObjectTypeID, ObjectID, Discount, DiscountDate)
        select @KontragentTypeID, @BuyerID, @Discount, @DiscountDate
        
        exec ContactFill
                @ObjectTypeID = @KontragentTypeID
               ,@ObjectID     = @BuyerID
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
grant exec on BuyerInsert to public
go

if OBJECT_ID('BuyerEdit') is not null
    drop proc BuyerEdit
/*
  BuyerEdit - Изменение 
*/
go
create proc BuyerEdit
              @BuyerID      numeric(15,0)  --  
             ,@Name    	    varchar(256)
             ,@FullName	    varchar(512)  = null
             ,@Inn	        varchar(11)   = null
             ,@Program	    varchar(512)  = null
             ,@PostAddress	varchar(512)  = null
             ,@LegalAddress	varchar(512)  = null
             ,@Edo	        varchar(256)  = null
             ,@EdoID	    varchar(2256) = null
             ,@IsImport	    bit           = null
             ,@Discount	    float         = null
             ,@DiscountDate	datetime      = null
             ,@PartnerID	numeric       = null
             ,@IsPartner	bit           = null
as
  declare @r                 int = 0
         ,@KontragentTypeID  numeric(15,0)

  select @KontragentTypeID  = 2

  if @IsPartner =1
  begin
    select @Inn          = null
          ,@PostAddress	 = null
          ,@LegalAddress = null
          ,@Edo	         = null
          ,@EdoID	     = null
          ,@IsImport	 = null   
          ,@Discount	 = null   
          ,@DiscountDate = null
          ,@PartnerID	 = null
  end

  if exists (select 1 
               from tKontragents u (nolock)
              where u.Name             = @Name
                and u.KontragentTypeID = @KontragentTypeID
                and u.KontragentID    <> @BuyerID
                and u.IsPartner       = @IsPartner)
  begin
    if @IsPartner > 0
       set @r =  141 -- 141,   'Партнер с заданным наименование существует!'
    else
       set @r =  140 -- 140,   'Покупатель с заданным наименование существует!'
    goto exit_
  end

  if @IsPartner = 0 and exists (select 1 
                                 from tKontragents u (nolock)
                                where u.INN              = @Inn
                                  and u.KontragentTypeID = @KontragentTypeID
                                  and u.KontragentID    <> @BuyerID) 
  begin
    set @r =  142--  'Покупатель с заданным ИНН существует!'
    goto exit_
  end

  BEGIN TRY 

        if exists (select 1 
                     from tKontragents u (nolock)
                    where u.KontragentID     = @BuyerID
                      and u.KontragentTypeID = @KontragentTypeID
                      and (u.discount <> @Discount or u.DiscountDate <> @DiscountDate))
        begin
            insert tDiscounts(ObjectTypeID, ObjectID, Discount, DiscountDate)
            select @KontragentTypeID, @BuyerID, @Discount, @DiscountDate
        end  

		Update tKontragents
		   set 
               Name    	    = @Name    	    
              ,FullName	    = @FullName	    
              ,Inn	        = @Inn	        
              ,Program	    = @Program	    
              ,PostAddress	= @PostAddress	
              ,LegalAddress	= @LegalAddress	
              ,Edo	        = @Edo	        
              ,EdoID	    = @EdoID	    
              ,IsImport	    = @IsImport	    
              ,Discount	    = @Discount	    
              ,DiscountDate	= @DiscountDate	
              ,PartnerID	= @PartnerID	
              ,IsPartner	= @IsPartner	
		 where KontragentID  = @BuyerID

        exec ContactFill
                @ObjectTypeID = @KontragentTypeID
               ,@ObjectID     = @BuyerID
               ,@Mode         = 1

  END TRY  
  BEGIN CATCH  
      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on BuyerEdit to public
go


if OBJECT_ID('BuyerDelete') is not null
    drop proc BuyerDelete
/*
  BuyerDelete - Удаление 
*/
go
create proc BuyerDelete
              @BuyerID            numeric(15,0) --    
as
  declare @r int = 0
         ,@KontragentTypeID  numeric(15,0)

  select @KontragentTypeID  = 2

  BEGIN TRY 
		delete 
          from tKontragents
		 where KontragentID=@BuyerID

         delete tContacts 
           from tContacts (rowlock) 
          where ObjectTypeID = @KontragentTypeID 
            and ObjectID     = @BuyerID


         delete tDiscounts 
           from tDiscounts (rowlock) 
          where ObjectTypeID = @KontragentTypeID 
            and ObjectID     = @BuyerID
            
  END TRY  
  BEGIN CATCH  
   
      set @r = -1
      insert tRetMessage(RetCode, Message) select @r,  ERROR_MESSAGE()  

      goto exit_     
  END CATCH  

exit_:
return @r
go
grant exec on BuyerDelete to public
go