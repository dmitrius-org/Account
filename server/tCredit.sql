if OBJECT_ID('tCredits') is null
/*begin
  ALTER TABLE tCredits SET ( SYSTEM_VERSIONING = OFF )
  drop table tCredits
  DROP TABLE hCredits
end */
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
     --
    ,InUserID          numeric(15, 0)
	,InDateTime        DateTime default getdate()   -- 

    ,UpUserID          numeric(15, 0) 
    ,UpDateTime        DateTime default getdate()  
     --
    ,[ValidFrom] DATETIME2 GENERATED ALWAYS AS ROW START
    ,[ValidTo] DATETIME2 GENERATED ALWAYS AS ROW END

    ,PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)

    ,CONSTRAINT PK_tCreditsn_CreditTypeID PRIMARY KEY NONCLUSTERED (CreditTypeID)
	)
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.hCredits));

	create index ao1 on tCredits(CreditID);

	grant select on tCredits to public;
end
go


if OBJECT_ID('tCreditTypes') is null
/*begin
  ALTER TABLE tCreditTypes SET ( SYSTEM_VERSIONING = OFF )
  drop table tCreditTypes
  DROP TABLE hCreditTypes
end */
/* **********************************************************
tCreditTypes - Таблица типы кредитов
********************************************************** */
begin
	create table tCreditTypes
	(
	 CreditTypeID      numeric(15, 0)  identity  --
	,Name              varchar(256)   
	,isActive          bit   
     --
    ,InUserID          numeric(15, 0)
	,InDateTime        DateTime default getdate()   -- 

    ,UpUserID          numeric(15, 0) 
    ,UpDateTime        DateTime default getdate()  
     --
    ,[ValidFrom] DATETIME2 GENERATED ALWAYS AS ROW START
    ,[ValidTo] DATETIME2 GENERATED ALWAYS AS ROW END

    ,PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)

    ,CONSTRAINT PK_tCreditTypes_CreditTypeID PRIMARY KEY NONCLUSTERED (CreditTypeID)
	)
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.hCreditTypes));

	create index ao1 on tCreditTypes(CreditTypeID);

	grant select on tCreditTypes to public;
end
go