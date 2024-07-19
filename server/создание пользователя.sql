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
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 10,  10,  'Счета',                       'TMainForm.actAccount',              0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 20,  20,  'Касса',                       'TMainForm.actKassa',                0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 30,  30,  'Запрос документов',           'TMainForm.actDocumentRequest',      0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 40,  40,  'Кредиты',                     'TMainForm.actCredit',               0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 50,  50,  'Виды кредитов',               'TCreditTypesT',                     0,  40
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 51,  51,  'Выплаты по кредиту',          'TCreditPaymentT',                   0,  40
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 55,  55,  'Прибыль',                     'TMainForm.actProfit',               0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 60,  60,  'Долги',                       'TMainForm.actDebs',                 0,  0
                                                                                                                                    
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 65,  65,  'Контрагенты',                 'TMainForm.actKontragent',           0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 70,  70,  'Статьи расходов',             'TMainForm.actExpenseItems',         0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 75,  75,  'Группы расходов',             '.TExpenseGroupsT',                  0,  70
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
--where ParentID=30
order by N 
*/
