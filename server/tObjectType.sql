if OBJECT_ID('tObjectType') is not null
  drop table tObjectType
/* **********************************************************
tObjectType - ���� �������� �������. TObjectType
********************************************************** */
begin
	create table tObjectType
	(
	 ObjectTypeID     numeric(18, 0)  --
	,Brief            nvarchar(512)   -- 
	,Name             nvarchar(512)
	,Flag             int 
						
	);
	
	create unique index ao1 on tObjectType(ObjectTypeID);
	
	create unique index ao2 on tObjectType(Brief);
	
	grant select on tObjectType to public;
end
go


insert tObjectType
       (ObjectTypeID, Brief)
values (1,	'������'),
       (2,  '����������'),
       (3,  '���������'),
       (4,  '���������-������'),
       (5,  '�����'),
       (6,  '�����'),
       (7,  '������'),
       (8,  '������ ����������'),
       (9,  '���������')       ,
       (10,  '������ ��������'),
       (11,  '������ ��������')



      
