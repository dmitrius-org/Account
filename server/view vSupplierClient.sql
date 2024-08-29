
if OBJECT_ID('vSupplierClient') is not null
    drop view vSupplierClient
/*
  vSupplierClient - 
*/
go
create view vSupplierClient
as
select sc.SupplierClientID
      ,sc.Discount
      ,sc.DiscountDate
      ,s.Name SupplierName
      ,c.Name ClientName
  from tSupplierClient sc (nolock)
 inner join tKontragents s (nolock)
         on s.KontragentID = sc.SupplierID

 inner join tKontragents c (nolock)
         on c.KontragentID = sc.ClientID

go
grant all on vSupplierClient to public
go


select *
  from vSupplierClient
 where 1=1