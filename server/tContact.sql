if OBJECT_ID('tContacts') is null
--  drop table tContacts
/* **********************************************************
tContacts - Таблица 
********************************************************** */
begin
	create table tContacts
	(
	 ContactID         numeric(15, 0)  identity  --
	,ObjectTypeID      int 
    ,ObjectID          numeric(15, 0) 
	,Phone             varchar(256)  
    ,Mail              varchar(256)  
    ,Comment           varchar(256)  
	,InDateTime        DateTime default getdate()   -- 
    ,UpDateTime        DateTime default getdate()  
    ,InUserID          numeric(15, 0)
    ,UpUserID          numeric(15, 0) 
	);

	create index ao1 on tContacts(ContactID);

    create index ao2 on tContacts(ObjectTypeID, ObjectID);

	grant select on tContacts to public;
end
go


if OBJECT_ID('pContacts') is not null
  drop table pContacts
/* **********************************************************
pContacts - Таблица 
********************************************************** */
begin
	create table pContacts
	(
     ID         numeric(15, 0)  identity  --
    ,Spid              numeric(15, 0) 
	,ContactID         numeric(15, 0)    
	,ObjectTypeID      int 
    ,ObjectID          numeric(15, 0) 
	,Phone             varchar(256)  
    ,Mail              varchar(256)  
    ,Comment           varchar(256)  
	,InDateTime        DateTime default getdate()  
    ,UpDateTime        DateTime default getdate()  
    ,InUserID          numeric(15, 0)
    ,UpUserID          numeric(15, 0) 
	);

	create index ao1 on pContacts(Spid, ContactID);

    create index ao2 on pContacts(Spid, ObjectTypeID, ObjectID);

	grant select on tContacts to public;
end
go
