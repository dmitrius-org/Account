if OBJECT_ID('vTurnoverClient') is not null
    drop view  vTurnoverClient
/*
   vTurnoverClient -  
*/
go
create view vTurnoverClient
as
-- данные по счетам
SELECT a.AccountDate AS OperDate, 
       isnull(c.Name,'') AS ClientName, 
       '' AS SupplierName, 
       IIf(a.IsRefund = 1,1,-1) AS D,
       a.AccountAmount AS Amount, 
       a.ClientDiscount AS Discount, 
       a.ClientID, 
       0 AS PartnerID, 
       DATEADD(millisecond, DATEDIFF(millisecond, '00:00:00.000', cast(a.InDateTime as time)), CAST(a.AccountDate AS datetime2)) N,
       'Account' AS source
  FROM tAccounts AS a  (nolock)
 INNER JOIN tKontragents as c  (nolock)
         ON a.ClientID = c.KontragentID

 UNION ALL 

-- данные по кассе
SELECT t.OperDate as OperDate,
       isnull(c.Name, '') as ClientName , 
       '' as SupplierName,
       IIf(t.TranTypeID=1, 1, -1) AS D,
       t.Amount , 
       t.Discount,     
       c.KontragentID as ClientID,
       0 as PartnerID,
       DATEADD(millisecond, DATEDIFF(millisecond, '00:00:00.000', cast(t.InDateTime as time)), CAST(t.OperDate AS datetime2)) N,
      'Kassa' as source 
  FROM tTransaction AS t (nolock)
 inner join tOperation o (nolock)
         on o.OperationID = t.OperationID 
 inner JOIN tOperationType ot (nolock)
         ON ot.OperationTypeID = o.OperationTypeID 
        and ot.Name='Клиенты'
 inner JOIN tKontragents as c  (nolock) 
         ON t.KontragentID = c.KontragentID

go
grant all on  vTurnoverClient to public
go

select * from  vTurnoverClient