if OBJECT_ID('tSupplierClient') is not null
  drop table tSupplierClient
/* **********************************************************
tSupplierClient -
********************************************************** */
begin
	create table tSupplierClient
	(
	 SupplierClientID     numeric(15, 0) identity
	,SupplierID           numeric(15, 0)
    ,ClientID             numeric(15, 0)
    ,Discount             money
    ,DiscountDate         DateTime2
    ,InUserID             numeric(15, 0)
	,InDateTime           DateTime default getdate()   -- 

    ,UpUserID            numeric(15, 0) 
    ,UpDateTime          DateTime default getdate()  
	);

	create unique index ao1 on tSupplierClient(SupplierClientID);

	grant select on tSupplierClient to public;
end
