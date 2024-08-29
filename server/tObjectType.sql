if OBJECT_ID('tObjectType') is not null
  drop table tObjectType
/* **********************************************************
tObjectType - типы объектов системы. TObjectType
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
values (1,	'Клиент'),
       (2,  'Покупатель'),
       (3,  'Поставщик'),
       (4,  'Поставщик-клиент'),
       (5,  'Счета'),
       (6,  'Касса'),
       (7,  'Кредит'),
       (8,  'Запрос документов'),
       (9,  'Поручения')       ,
       (10,  'Статьи расходов'),
       (11,  'Группы расходов')



      
