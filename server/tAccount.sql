if OBJECT_ID('tAccountStatus') is not null
  drop table tAccountStatus
/* **********************************************************
tAccountStatus -
********************************************************** */
begin
	create table tAccountStatus
	(
	 AccountStatusID   numeric(15, 0)   --
	,Name              varchar(32)   
	);

	create unique index ao1 on tAccountStatus(AccountStatusID);

	grant select on tAccountStatus to public;
end
go

insert tAccountStatus (AccountStatusID, Name)
select 1, 'Оплачен'           union all
select 2, 'Оплачен частично'  union all
select 3, 'Не оплачен'      --  union all
--select 4, 'Отменен' 

if OBJECT_ID('tAccounts') is null
/*begin
  ALTER TABLE tAccounts SET ( SYSTEM_VERSIONING = OFF )
  drop table tAccounts
  DROP TABLE hAccounts
end */
/* **********************************************************
tAccounts - 
********************************************************** */
begin
	create table tAccounts
	(
	 AccountID         numeric(15, 0)  identity  --
    ,PaymentDate       datetime
    ,PaymentAmount     int
	,AccountNumber     varchar(256)  
    ,AccountDate       datetime
    ,AccountAmount     int
    ,BuyerID           numeric(15, 0) 
    ,BuyerDiscount     money   
    ,SupplierID        numeric(15, 0) 
    ,ClientID          numeric(15, 0) 
    ,ClientDiscount    money
    ,ParentID          numeric(15, 0) 
    ,IsRefund          bit
	,AccountStatusID   numeric(15, 0)       
    ,Comment           varchar(256)
    ,Phone             varchar(256)
    ,Mail              varchar(256)
    ,PayNumber         varchar(256)
    ,PayDate           datetime

     --
    ,InUserID          numeric(15, 0)
	,InDateTime        DateTime default getdate()   -- 

    ,UpUserID          numeric(15, 0) 
    ,UpDateTime        DateTime default getdate()  
     --
    ,[ValidFrom] DATETIME2 GENERATED ALWAYS AS ROW START
    ,[ValidTo] DATETIME2 GENERATED ALWAYS AS ROW END

    ,PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)

    ,CONSTRAINT PK_tAccounts_AccountID PRIMARY KEY NONCLUSTERED (AccountID)
	)
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.hAccounts));

	create index ao1 on tAccounts(AccountID);

	grant select on tAccounts to public;
end
go