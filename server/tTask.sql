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
     --
    ,InUserID          numeric(15, 0)
	,InDateTime        DateTime default getdate()   -- 

    ,UpUserID          numeric(15, 0) 
    ,UpDateTime        DateTime default getdate()  
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
/*begin
  ALTER TABLE tTasks SET ( SYSTEM_VERSIONING = OFF )
  drop table tTasks
  DROP TABLE hTasks
end */
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
     --
    ,InUserID          numeric(15, 0)
	,InDateTime        DateTime default getdate()   -- 

    ,UpUserID          numeric(15, 0) 
    ,UpDateTime        DateTime default getdate()  
     --
    ,[ValidFrom] DATETIME2 GENERATED ALWAYS AS ROW START
    ,[ValidTo] DATETIME2 GENERATED ALWAYS AS ROW END

    ,PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)

    ,CONSTRAINT PK_tTasks_TaskID PRIMARY KEY NONCLUSTERED (TaskID)
	)
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.hTasks));

	create index ao1 on tTasks(TaskID);

	grant select on tTasks to public;
end
go