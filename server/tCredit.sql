if OBJECT_ID('tCredits') is null
--  drop table tCredits
/* **********************************************************
tCredits - Таблица кредиты
********************************************************** */
begin
	create table tCredits
	(
	 CreditID          numeric(15, 0)  identity  --
	,CreditTypeID      numeric(15, 0)   
	,CreditDate        DateTime   
	,Amount            float 
	,Prc               float 
	,PayAmount         float      
	,CloseDate         DateTime
	,Comment           varchar(1024)  
	,InDateTime        DateTime default getdate()   -- 
    ,UserID            numeric(15, 0) 
	);

	create index ao1 on tCredits(CreditID);

	grant select on tCredits to public;
end
go


if OBJECT_ID('tCreditTypes') is null
--  drop table tCreditTypes
/* **********************************************************
tCreditTypes - Таблица типы кредитов
********************************************************** */
begin
	create table tCreditTypes
	(
	 CreditTypeID      numeric(15, 0)  identity  --
	,Name              varchar(256)   
	,isActive          bit   
	,InDateTime        DateTime default getdate()   -- 
    ,UserID            numeric(15, 0) 
	);

	create index ao1 on tCreditTypes(CreditTypeID);

	grant select on tCreditTypes to public;
end
go