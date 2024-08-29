if OBJECT_ID('tAudit') is null
--drop table tAudit
/* **********************************************************
tAudit - Аудит действий пользователя
********************************************************** */
begin
	create table tAudit
	(
	 AuditID           numeric(18, 0) identity  --
	,ObjectTypeID      numeric(18, 0)   -- тип объекта 
	,ObjectID          numeric(18, 0)   -- ИД объекта по которому ведется аудит
	,Action            varchar(30)
	,Comment           varchar(1024)
    ,Flag              int
	,UserID            numeric(18, 0)   -- 
	,HostInfoID        nvarchar(256) null
	,InDateTime        DateTime      default getdate()   -- 
	)

	create index ao1 on tAudit(UserID, ObjectID)

	create index ao2 on tAudit(ObjectTypeID, ObjectID)

	grant select on tAudit to public
end
go


