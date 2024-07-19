if OBJECT_ID('tComments') is null
--  drop table tComments
/* **********************************************************
tComments - 
********************************************************** */
begin
	create table tComments
	(
	 CommentID         numeric(15, 0)  identity  --
    ,Comment           varchar(256) 
	,ObjectID          numeric(15, 0)
    ,ObjectTypeID      numeric(15, 0) 
     --
    ,InUserID          numeric(15, 0)
	,InDateTime        DateTime default getdate()   -- 

    ,UpUserID          numeric(15, 0) 
    ,UpDateTime        DateTime default getdate()  
	);

	create index ao1 on tComments(CommentID);

	grant select on tComments to public;
end
go

if OBJECT_ID('pComments') is not null
  drop table pComments
/* **********************************************************
pComments - Таблица 
********************************************************** */
begin
	create table pComments
	(
     ID                numeric(15, 0)  identity  --
    ,CommentID         numeric(15, 0) 
    ,Spid              numeric(15, 0) 
    ,Comment           varchar(256) 
	,ObjectID          numeric(15, 0)
    ,ObjectTypeID      numeric(15, 0) 

     --
    ,InUserID          numeric(15, 0)
	,InDateTime        DateTime default getdate()   -- 

    ,UpUserID          numeric(15, 0) 
    ,UpDateTime        DateTime default getdate()  
	);

	create index ao1 on pComments(Spid, CommentID);

    create index ao2 on pComments(Spid, ObjectTypeID, ObjectID);

	grant select on pComments to public;
end
go
