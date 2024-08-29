insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 81,  81,  'Поставщик-клиент',                'TMainForm.actSupplierClient',                 0,  0


insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 157, 157, 'Просмотреть',  'TSupplierClientT.actShow', 81, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 158, 158, 'Добавить',  'TSupplierClientT.actAdd', 81, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 159, 159, 'Изменить',  'TSupplierClientT.actEdit', 81, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 160, 160, 'Удалить',  'TSupplierClientT.actDelete', 81, 1
insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 161, 161, 'Обновить',  'TSupplierClientT.actRefresh', 81, 1



insert tMenu (MenuID, N, Caption, Name, Type, ParentID) select 82,  86,  'Audit',                'TMainForm.actAudit',                 0,  0


insert tmenu (MenuID,N,Caption,Name,ParentID,Type) select 162, 162, 'Обновить',  'TAuditT.actRefresh', 82, 1
