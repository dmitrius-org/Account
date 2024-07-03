if OBJECT_ID('tExpenseGroups') is null
--  drop table tExpenseGroups
/* **********************************************************
tExpenseGroups - Группы расходов
********************************************************** */
begin
	create table tExpenseGroups
	(
	 ExpenseGroupID    numeric(15, 0)  identity  --
	,Name              varchar(256)   
	,isActive          bit   
	,InDateTime        DateTime default getdate()   -- 
    ,UserID            numeric(15, 0) 
	);

	create index ao1 on tExpenseGroups(ExpenseGroupID);

	grant select on tExpenseGroups to public;
end
go


if OBJECT_ID('tExpenseItems') is null
--  drop table tExpenseItems
/* **********************************************************
tExpenseItems - Статьи расходов
********************************************************** */
begin
	create table tExpenseItems
	(
	 ExpenseItemID     numeric(15, 0)  identity  --
    ,ExpenseGroupID    numeric(15, 0) 
	,Name              varchar(256)   
	,isActive          bit   
	,InDateTime        DateTime default getdate()   -- 
    ,UserID            numeric(15, 0) 
	);

	create index ao1 on tExpenseItems(ExpenseItemID);

	grant select on tExpenseItems to public;
end
go