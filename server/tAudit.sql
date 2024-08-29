if OBJECT_ID('tAudit') is null
--drop table tAudit
/* **********************************************************
tAudit - ����� �������� ������������
********************************************************** */
begin
	create table tAudit
	(
	 AuditID           numeric(18, 0) identity  --
	,ObjectTypeID      numeric(18, 0)   -- ��� ������� 
	,ObjectID          numeric(18, 0)   -- �� ������� �� �������� ������� �����
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


