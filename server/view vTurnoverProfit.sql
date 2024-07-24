if OBJECT_ID('vTurnoverProfit') is not null
    drop view vTurnoverProfit
/*
  TurnoverProfit -  
*/
go
create view vTurnoverProfit
as

  SELECT a.AccountNumber, 
       isnull(a.PaymentDate, a.AccountDate) AS OperDate, 
       isnull(b.Name,'') AS BuyerName, 
       a.BuyerDiscount,
       a.ClientDiscount,
       isnull(C.Name,'') AS ClientName,
       a.IsRefund AS C, 
       case 
         when isnull(a.PaymentAmount, 0) = 0 then a.AccountAmount 
         else a.PaymentAmount
       end Amount,
       IIf(a.BuyerDiscount>0, a.BuyerDiscount-a.ClientDiscount, 0) AS Discount,
       a.BuyerID, 
       b.KontragentID as PartnerID, 
       a.ClientID AS ClientID

  FROM tAccounts AS a (nolock)
  LEFT JOIN tKontragents AS b (nolock) 
         ON a.BuyerID = b.KontragentID
  LEFT JOIN tKontragents AS c (nolock)
         ON a.ClientID = c.KontragentID
go
grant all on vTurnoverProfit to public
go

select * from vTurnoverProfit