go
if OBJECT_ID('tKassa') is not null
  drop table tKassa
/* **********************************************************
tKassa -
********************************************************** */
begin
	create table tKassa
	(
	 KassaID     numeric(15, 0)   --
	,Name        varchar(32)  
    ,Brief       varchar(32)  
	);

	create unique index ao1 on tKassa(KassaID);

	grant select on tKassa to public;
end
go
insert tKassa (KassaID, Name, Brief)
select 1, 'Касса 1', '1'      union all
select 2, 'Касса 2', '2' 
go
if OBJECT_ID('tOperationType') is not null
  drop table tOperationType
/* **********************************************************
tOperationType - типы операции
********************************************************** */
begin
	create table tOperationType
	(
	 OperationTypeID     numeric(15, 0)   --
	,Name                varchar(32)   
    ,Brief               varchar(10)  
	);

	create unique index ao1 on tOperationType(OperationTypeID);

	grant select on tOperationType to public;
end
go

insert tOperationType (OperationTypeID, Name)
select 1, 'Клиенты'      union all
select 2, 'Покупатели'   union all
select 3, 'Кредиты'      union all
select 4, 'Возвраты'     union all
select 5, 'Пр. Расходы'  union all
select 6, 'В Кассу 1'    union all
select 7, 'В Кассу 2'    union all
select 8, 'Из Кассы 1'   union all
select 9, 'Из Кассы 2' 
go

if OBJECT_ID('tTranType') is not null
  drop table tTranType
/* **********************************************************
tTranType - типы операции
********************************************************** */
begin
	create table tTranType
	(
	 TranTypeID          numeric(15, 0)   --
	,Name                varchar(32)   
    ,Brief               varchar(10)  
	);

	create unique index ao1 on tTranType(TranTypeID);

	grant select on tTranType to public;
end
go

insert tTranType (TranTypeID, Brief, Name)
select 1, 'П',  'Приход'           union all
select 2, 'Р',  'Расход'           union all
select 3, 'ЗР', 'Заявка на расход'   
go
if OBJECT_ID('tOperation') is not null
  drop table tOperation
/* **********************************************************
tOperation -
********************************************************** */
begin
	create table tOperation
	(
	 OperationID         numeric(15, 0),
     OperationTypeID     numeric(15, 0), 
     KassaID             numeric(15, 0), 
     TranTypeID          numeric(15, 0),
	 LinkOperTypeID      numeric(15, 0), --Связанная операция, при заполнении данного поля при выполнении операции автоматически формируется связанная операция
     LinkObject          int             --1 - Клиенты; 2 - Прочие расходы; 4 - Поставщик; 8 - Покупатели; 16 - Кредиты
	);

	create unique index ao1 on tOperation(OperationID);

	grant select on tOperation to public;
end

insert tOperation (OperationID, KassaID, OperationTypeID, TranTypeID, LinkOperTypeID, LinkObject)

          select  1, 1, 1, 1,  0, 5   --  Клиенты	  Касса 1	Приход		        5
union all select  2, 1, 3, 1,  0, 16  --  Кредиты	  Касса 1	Приход		        16
union all select  3, 1, 9, 1, 14, 0   --  Из Кассы 2  Касса 1	Приход	В Кассу 1	
union all select  4, 2, 1, 1,  0, 5   --  Клиенты	  Касса 2	Приход		        5
union all select  5, 2, 8, 1, 10, 0   --  Из Кассы 1  Касса 2	Приход	в Кассу 2	
union all select  6, 1, 2, 2,  0, 8   --  Покупатели  Касса 1	Расход		        8
union all select  7, 1, 5, 2,  0, 2   --  Пр. Расходы Касса 1	Расход		        2
union all select  8, 1, 4, 2,  0, 0   --  Возвраты	  Касса 1	Расход		        
union all select  9, 1, 3, 2,  0, 16  --  Кредиты	  Касса 1	Расход		        16
union all select 10, 1, 7, 2,  5, 0   --  в Кассу 2	  Касса 1	Расход	Из Кассы 1	
union all select 11, 2, 2, 2,  0, 8   --  Покупатели  Касса 2	Расход		        8
union all select 12, 2, 5, 2,  0, 2   --  Пр. Расходы Касса 2	Расход		        2
union all select 13, 2, 4, 2,  0, 0   --  Возвраты	  Касса 2	Расход		
union all select 14, 2, 6, 2,  3, 0   --  В Кассу 1	  Касса 2	Расход	Из Кассы 2	
union all select 15, 1, 2, 3,  0, 8   --  Покупатели  Касса 1	Заявка на расход	8
union all select 16, 2, 2, 3,  0, 8   --  Покупатели  Касса 2	Заявка на расход	8

go
if OBJECT_ID('tTransaction') is null
/*begin
  ALTER TABLE tTransaction SET ( SYSTEM_VERSIONING = OFF )
  drop table tTransaction
  DROP TABLE hTransaction
end */
/* **********************************************************
tTransaction - 
********************************************************** */
begin
	create table tTransaction
	(
	 TransactionID      numeric(15, 0)  identity
    ,TranTypeID         numeric(15, 0)
    ,OperationID        numeric(15, 0)
	,OperDate           datetime 
    ,ExpenseItemID      numeric(15, 0)
    ,CreditID           numeric(15, 0)
    ,Amount             money
    ,Comment            varchar(256)
    ,KassaID            numeric(15, 0)   
    ,KontragentID       numeric(15, 0) 
    ,Discount           money
    ,ParentID           numeric(15, 0) 

     --
    ,InUserID          numeric(15, 0)
	,InDateTime        DateTime default getdate()   -- 

    ,UpUserID          numeric(15, 0) 
    ,UpDateTime        DateTime default getdate()  
     
     --
    ,[ValidFrom] DATETIME2 GENERATED ALWAYS AS ROW START
    ,[ValidTo] DATETIME2 GENERATED ALWAYS AS ROW END

    ,PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)

    ,CONSTRAINT PK_tTransaction_TransactionID PRIMARY KEY NONCLUSTERED (TransactionID)
	)
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.hTransaction));


	create index ao1 on tTransaction(TransactionID, TranTypeID);

    create index ao2 on tTransaction(KassaID) include(TranTypeID, Amount);

	grant select on tTransaction to public;
end
go