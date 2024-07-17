if OBJECT_ID('vTurnoverBuyer') is not null
    drop view vTurnoverBuyer
/*
  vTurnoverBuyer -  
*/
go
create view vTurnoverBuyer
as
-- данные по счетам
SELECT a.AccountDate as OperDate, 
       isnull(b.Name, '') AS BuyerName, 
       s.Name AS SupplierName, 
       IIf(a.IsRefund=1, -1, 1) as D,
       IIf(a.IsRefund=1, -1, 1)  * a.AccountAmount as Amount, 
       a.BuyerDiscount  as Discount, 
       a.BuyerID, 
       b.PartnerID,
       DATEADD(millisecond, DATEDIFF(millisecond, '00:00:00.000', cast(a.InDateTime as time)), CAST(a.AccountDate AS datetime2)) N,
       'Account' as source
 FROM tAccounts AS a 
INNER JOIN tKontragents b (nolock)
        ON a.BuyerID = b.KontragentID 
 LEFT JOIN tKontragents s  (nolock)
        ON a.SupplierID = s.KontragentID

UNION ALL 
-- данные по кассе
SELECT t.OperDate as OperDate,
       isnull(b.Name, '') as BuyerName , 
       '' as SupplierName,
       IIf(t.TranTypeID=1, 1, -1) AS D,
       t.Amount , 
       t.Discount,     
       b.KontragentID as BuyerID,
       b.PartnerID    as PartnerID,
       DATEADD(millisecond, DATEDIFF(millisecond, '00:00:00.000', cast(t.InDateTime as time)), CAST(t.OperDate AS datetime2)) N,
      'Kassa' as source 
FROM tTransaction AS t (nolock)
inner join tOperation o (nolock)
        on o.OperationID = t.OperationID 
inner JOIN tOperationType ot (nolock)
        ON ot.OperationTypeID = o.OperationTypeID 
       and ot.Name='ѕокупатели'

inner JOIN tKontragents as b (nolock) 
        ON t.KontragentID = b.KontragentID 

go
grant all on vTurnoverBuyer to public
go

select * from vTurnoverBuyer