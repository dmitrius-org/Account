if OBJECT_ID('tKontragentType') is not null
  drop table tKontragentType
/* **********************************************************
tKontragentType -
********************************************************** */
begin
	create table tKontragentType
	(
	 KontragentTypeID  numeric(15, 0)   --
	,Name              varchar(32)   
	,InDateTime        DateTime default getdate()   -- 
    ,UserID            numeric(15, 0) 
	);

	create unique index ao1 on tKontragentType(KontragentTypeID);

	grant select on tKontragentType to public;
end
go

insert tKontragentType (KontragentTypeID, Name)
select 1, 'Клиент'          union all
select 2, 'Покупатель'      union all
select 3, 'Поставщик' 

if OBJECT_ID('tKontragents') is null
--  drop table tKontragents
/* **********************************************************
tKontragents - 
********************************************************** */
begin
	create table tKontragents
	(
	 KontragentID      numeric(15, 0)  identity  --
    ,KontragentTypeID  numeric(15, 0)
	,Name              varchar(256)  
    ,FullName          varchar(512) 
    ,Inn               varchar(11) 
    ,Program           varchar(512)
    ,PostAddress       varchar(512)   -- Почтовый адрес
    ,LegalAddress      varchar(512)   -- Юр. Адрес
    ,Edo               varchar(256)
    ,EdoID             varchar(256)
    ,IsImport          bit
    ,Discount          Float
	,DiscountDate      DateTime        
    ,PartnerID         numeric(15, 0)
    ,IsPartner         bit
    ,Debts             float
	,InDateTime        DateTime default getdate()   -- 
    ,UserID            numeric(15, 0) 
	);

	create index ao1 on tKontragents(KontragentID);

	grant select on tKontragents to public;
end
go