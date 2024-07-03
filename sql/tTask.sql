if OBJECT_ID('tTaskStatus') is not null
  drop table tTaskStatus
/* **********************************************************
tTaskStatus -
********************************************************** */
begin
	create table tTaskStatus
	(
	 TaskStatusID      numeric(15, 0)   --
	,Name              varchar(32)   
	,InDateTime        DateTime default getdate()   -- 
    ,UserID            numeric(15, 0) 
	);

	create unique index ao1 on tTaskStatus(TaskStatusID);

	grant select on tTaskStatus to public;
end
go

insert tTaskStatus (TaskStatusID, Name)
select 1, 'в работе'          union all
select 2, 'выполнено'         union all
select 3, 'не начато' 

if OBJECT_ID('tTasks') is null
--  drop table tTasks
/* **********************************************************
tTasks - 
********************************************************** */
begin
	create table tTasks
	(
	 TaskID            numeric(15, 0)  identity  --
	,Comment           varchar(512)   
	,DueDate           DateTime        --Дата выполнения
    ,CreateDate        DateTime
    ,ManagerID         numeric(15, 0)
    ,TaskStatusID      numeric(15, 0) 
	,InDateTime        DateTime default getdate()   -- 
    ,UserID            numeric(15, 0) 
	);

	create index ao1 on tTasks(TaskID);

	grant select on tTasks to public;
end
go