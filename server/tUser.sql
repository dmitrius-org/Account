if OBJECT_ID('tUser') is null
-- drop table tUser
/* **********************************************************
tUser - пользователи
********************************************************** */
begin
	create table tUser
	(
	 UserID            numeric(18,0)  identity --  
	,Brief             nvarchar(512)  not null --
	,Name              nvarchar(512)  null  -- 
	,isBlock           bit            default 0  --
	,DateBlock         datetime       null
	,Login             nvarchar(512) 
     --
    ,InUserID          numeric(15, 0)
	,InDateTime        DateTime default getdate()   -- 

    ,UpUserID          numeric(15, 0) 
    ,UpDateTime        DateTime default getdate()  
     --
    ,[ValidFrom] DATETIME2 GENERATED ALWAYS AS ROW START
    ,[ValidTo] DATETIME2 GENERATED ALWAYS AS ROW END

    ,PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)

    ,CONSTRAINT PK_tUser_UserID PRIMARY KEY NONCLUSTERED (UserID)
	)
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.hUser));
	
	create unique index ao1 on tUser(UserID) include (Brief, Name);
	
	create unique index ao2 on tUser(Brief);
	
	grant all on tUser to public;
end
go


if OBJECT_ID('tMenu') is null
--drop table tMenu
/* **********************************************************
tMenu - структура меню
********************************************************** */
begin
	create table tMenu
	(
	 MenuID            numeric(18, 0)  --  
	,N                 int
	,Caption           nvarchar(512)   -- 
	,Name	           nvarchar(512)   --
	,ParentID          numeric(18, 0)
	,Icon	           nvarchar(512)   --
	,Type              int
	,inDatetime        datetime default GetDate()      --
	)
	
	create unique index ao1 on tMenu(MenuID)
	
	create index ao2 on tMenu(Name)
	
	grant all on tMenu to public
end
go


if OBJECT_ID('tGrant') is null
--drop table tGrant
/* **********************************************************
tGrant - Права 
********************************************************** */
begin
	create table tGrant
	(
	 GrantID           numeric(18, 0) identity  --
	,ObjectID          numeric(18, 0)   -- 
	,MenuID            numeric(18, 0)   -- 
	,ObjectType        int -- 0 -- пользователь
						   -- 1 -- группа
	);

	create unique index ao1 on tGrant(ObjectType, ObjectID, MenuID);

	grant all on tGrant to public;
end
go

drop table if exists pGrant
go
/* **********************************************************
pGrant - Временная таблица прав
********************************************************** */
create table pGrant
(
 Spid              numeric(18, 0) 
,GrantID           numeric(18, 0)   --
,ObjectID          numeric(18, 0)   -- 
,ParentID          numeric(18, 0)   -- 
,MenuID            numeric(18, 0)   --
,N                 int
,Caption           nvarchar(512)    -- 
,Type              int
,Value             bit              -- Индивидуальное право объекта
,GroupValue        bit              -- Право группы/роли
,IsGroup           bit              -- Входит в группу  
,Groups            nvarchar(512)    -- Наименовния групп
)
go
create unique index ao1 on pGrant(Spid, ObjectID, MenuID)
go
create index ao2 on pGrant(GrantID)
go
grant all on pGrant to public
go




