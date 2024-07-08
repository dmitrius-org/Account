if OBJECT_ID('tDiscounts') is null
--  drop table tDiscounts
/* **********************************************************
tDiscounts - Таблица 
********************************************************** */
begin
	create table tDiscounts
	(
	 DiscountID        numeric(15, 0)  identity  --
	,ObjectTypeID      int 
    ,ObjectID          numeric(15, 0) 
	,Discount          float
    ,DiscountDate      datetime  
    ,Comment           varchar(256)  
	,InDateTime        DateTime default getdate()   -- 
    ,UpDateTime        DateTime default getdate()  
    ,InUserID          numeric(15, 0)
    ,UpUserID          numeric(15, 0) 
	);

	create index ao1 on tDiscounts(DiscountID);

    create index ao2 on tDiscounts(ObjectTypeID, ObjectID);

	grant select on tDiscounts to public;
end
go


if OBJECT_ID('pDiscounts') is not null
  drop table pDiscounts
/* **********************************************************
pDiscounts - Таблица 
********************************************************** */
go
create table pDiscounts
(
    Spid              numeric(15, 0) 
   ,DiscountID        numeric(15, 0)    
   ,ObjectTypeID      int 
   ,ObjectID          numeric(15, 0) 
   ,Discount          float
   ,DiscountDate      datetime 
   ,Comment           varchar(256)  
   ,InDateTime        DateTime default getdate()    
   ,UpDateTime        DateTime default getdate()  
   ,InUserID          numeric(15, 0)
   ,UpUserID          numeric(15, 0) 
);

create index ao1 on pDiscounts(Spid, DiscountID);

create index ao2 on pDiscounts(Spid, ObjectTypeID, ObjectID);

grant select on pDiscounts to public;

go
