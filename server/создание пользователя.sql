insert tUser (Brief, Name, Login)
select 'Admin', 'Admin', 'sa'

insert tUser (Brief,Name, Login) select 'admin','������������� �������', 'admin'

-- ���������� ������
CREATE LOGIN admin WITH PASSWORD = '123456'
-- ���������� ������������
CREATE USER admin FOR LOGIN admin
-- ���������� ���� � ������
EXEC master..sp_addsrvrolemember @loginame = N'admin', @rolename = N'sysadmin'

go


delete from tMenu

insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 1,  1,   '����� 1',                      'TMainForm.actKassa',               0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 2,  2,   '����� 2',                      'TMainForm.actKassa',               0,  0

insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 3, 3, '�����������',  'TTransactionT.actShow', 1, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 4, 4, '������',  'TTransactionT.actAddDebet',  1, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 5, 5, '������',  'TTransactionT.actAdd',       1, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 6, 6, '��������',  'TTransactionT.actEdit',    1, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 7, 7, '�������',  'TTransactionT.actDelete',   1, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 8, 8, '��������',  'TTransactionT.actRefresh', 1, 1



insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 9, 3, '�����������',  'TTransactionT.actShow',  2, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 10, 4, '������',  'TTransactionT.actAddDebet',  2, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 11, 5, '������',  'TTransactionT.actAdd',       2, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 12, 6, '��������',  'TTransactionT.actEdit',    2, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 13, 7, '�������',  'TTransactionT.actDelete',   2, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 14, 8, '��������',  'TTransactionT.actRefresh', 2, 1

insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 20,  20,  '�����',                       'TMainForm.actAccount',              0,  0

insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 30,  30,  '������ ����������',           'TMainForm.actDocumentRequest',      0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 40,  40,  '�������',                     'TMainForm.actCredit',               0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 50,  50,  '���� ��������',               'TCreditTypesT',                     0,  40
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 51,  51,  '������� �� �������',          'TCreditPaymentT',                   0,  40
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 55,  55,  '�������',                     'TMainForm.actProfit',               0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 60,  60,  '�����',                       'TMainForm.actDebs',                 0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 62,  62,  '����������',                  'TMainForm.actStatistic',            0,  0                                                                                                                                    
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 65,  65,  '�����������',                 'TMainForm.actKontragent',           0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 70,  70,  '������ ��������',             'TMainForm.actExpenseItems',         0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 75,  75,  '������ ��������',             'TExpenseGroupsT',                   0,  70
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 80,  80,  '���������',                   'TMainForm.actTask',                 0,  0
insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 85,  85,  '������������',                'TMainForm.actUser',                 0,  0

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
