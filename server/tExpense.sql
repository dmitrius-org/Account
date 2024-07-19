if OBJECT_ID('tExpenseGroups') is null
/*begin
  ALTER TABLE tExpenseGroups SET ( SYSTEM_VERSIONING = OFF )
  drop table tExpenseGroups
  DROP TABLE hExpenseGroups
end */
/* **********************************************************
tExpenseGroups - Группы расходов
********************************************************** */
begin
	create table tExpenseGroups
	(
	 ExpenseGroupID    numeric(15, 0)  identity  --
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

    ,CONSTRAINT PK_tExpenseGroups_ExpenseGroupID PRIMARY KEY NONCLUSTERED (ExpenseGroupID)
	)
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.hExpenseGroups));

	create index ao1 on tExpenseGroups(ExpenseGroupID);

	grant select on tExpenseGroups to public;
end
go


if OBJECT_ID('tExpenseItems') is null
/*begin
  ALTER TABLE tExpenseItems SET ( SYSTEM_VERSIONING = OFF )
  drop table tExpenseItems
  DROP TABLE hExpenseItems
end */
/* **********************************************************
tExpenseItems - Статьи расходов
********************************************************** */
begin
	create table tExpenseItems
	(
	 ExpenseItemID     numeric(15, 0)  identity    --
    ,ExpenseGroupID    numeric(15, 0) 
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

    ,CONSTRAINT PK_tExpenseItems_ExpenseItemID PRIMARY KEY NONCLUSTERED (ExpenseItemID)
	)
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.hExpenseItems));

	create index ao1 on tExpenseItems(ExpenseItemID);

	grant select on tExpenseItems to public;
end
go