insert tUser (Brief, Name, Login)
select 'Admin', 'Admin', 'sa'

insert tUser (Brief,Name, Login) select 'admin','Администратор системы', 'admin'

-- добавление логина
CREATE LOGIN admin WITH PASSWORD = '123456'
-- добавление пользователя
CREATE USER admin FOR LOGIN admin
-- добавление роли к логину
EXEC master..sp_addsrvrolemember @loginame = N'admin', @rolename = N'sysadmin'

go


delete from tMenu

insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 1,  1,   'Касса 1',                      'TMainForm.actKassa',               0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 2,  2,   'Касса 2',                      'TMainForm.actKassa',               0,  0

insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 3, 3, 'Просмотреть',  'TTransactionT.actShow', 1, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 4, 4, 'Приход',  'TTransactionT.actAddDebet',  1, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 5, 5, 'Расход',  'TTransactionT.actAdd',       1, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 6, 6, 'Изменить',  'TTransactionT.actEdit',    1, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 7, 7, 'Удалить',  'TTransactionT.actDelete',   1, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 8, 8, 'Обновить',  'TTransactionT.actRefresh', 1, 1



insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 9, 3, 'Просмотреть',  'TTransactionT.actShow',  2, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 10, 4, 'Приход',  'TTransactionT.actAddDebet',  2, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 11, 5, 'Расход',  'TTransactionT.actAdd',       2, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 12, 6, 'Изменить',  'TTransactionT.actEdit',    2, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 13, 7, 'Удалить',  'TTransactionT.actDelete',   2, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 14, 8, 'Обновить',  'TTransactionT.actRefresh', 2, 1

insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 20,  20,  'Счета',                       'TMainForm.actAccount',              0,  0

insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 30,  30,  'Запрос документов',           'TMainForm.actDocumentRequest',      0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 40,  40,  'Кредиты',                     'TMainForm.actCredit',               0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 50,  50,  'Виды кредитов',               'TCreditTypesT',                     0,  40
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 51,  51,  'Выплаты по кредиту',          'TCreditPaymentT',                   0,  40
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 55,  55,  'Прибыль',                     'TMainForm.actProfit',               0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 60,  60,  'Долги',                       'TMainForm.actDebs',                 0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 62,  62,  'Статистика',                  'TMainForm.actStatistic',            0,  0                                                                                                                                    
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 65,  65,  'Контрагенты',                 'TMainForm.actKontragent',           0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 70,  70,  'Статьи расходов',             'TMainForm.actExpenseItems',         0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 75,  75,  'Группы расходов',             'TExpenseGroupsT',                   0,  70
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 80,  80,  'Поручения',                   'TMainForm.actTask',                 0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 85,  85,  'Пользователи',                'TMainForm.actUser',                 0,  0

go

delete tGrant 
insert tGrant
      (ObjectID
      ,ObjectType
      ,MenuID)
select u.UserID
      ,0
      ,m.MenuID
  from tUser u (nolock)
 inner join tMenu m (nolock)
         on 1=1
 where u.Brief='Admin'


 select *
  from tUser u (nolock)
 inner join tMenu m (nolock)
         on MenuID = 10
inner join tMenu mm on mm.ParentID = m.MenuID







 /*
select 'insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select ' 
     + cast(MenuID as varchar) + ', ' + cast(N as varchar) + ', ''' + Caption + ''', ' + ' ''' + Name + ''', ' + cast(ParentID as varchar) + ', ' + cast(Type as varchar) 
from tmenu
where ParentID=82
order by N 
*/
