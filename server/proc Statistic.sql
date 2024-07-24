
if OBJECT_ID('pStatistic') is not null
  drop table pStatistic
/* **********************************************************
pStatistic - Таблица 
********************************************************** */
begin
	create table pStatistic
	(
     ID                numeric(15, 0)  
    ,Spid              numeric(15, 0) 
    ,Name              varchar(60)
	,Rest              money   
	,Cnt               int 

	);

	create index ao1 on pStatistic(Spid);

	grant select on pStatistic to public;
end
go



if OBJECT_ID('Statistic') is not null
    drop proc Statistic
/*
  Statistic - 
*/
go
create proc Statistic
              @Type  	       int      = null
             ,@DateBegin       datetime = null
             ,@DateEnd         datetime = null
as
  declare @r int = 0

  select @DateBegin = isnull(@DateBegin, '20000101')
        ,@DateEnd   = isnull(@DateEnd,   '20701231')

  delete pStatistic from pStatistic where Spid = @@spid



  INSERT INTO pStatistic (spid, ID, Name, Rest, Cnt) 
  SELECT @@spid, 0, 'Общая касса', 
         isnull(sum(IIf(TranTypeID=1, 1, -1) * Amount ), 0), 
         Count(*)
    FROM tTransaction (nolock) 
   where OperDate between @DateBegin and @DateEnd  

  INSERT INTO pStatistic (spid, ID, Name, Rest, Cnt) 
  SELECT @@spid, 1, 'К1', isnull(sum(IIf(TranTypeID=1, 1, -1) * Amount ), 0), Count(*)
    FROM tTransaction (nolock) 
   where OperDate between @DateBegin and @DateEnd  
     and KassaID = 1

  INSERT INTO pStatistic (spid, ID, Name, Rest, Cnt) 
  SELECT @@spid, 2, 'К2', isnull(sum(IIf(TranTypeID=1, 1, -1) * Amount ), 0), Count(*)
    FROM tTransaction (nolock) 
   where OperDate between @DateBegin and @DateEnd  
     and KassaID = 2

  INSERT INTO pStatistic (spid, ID, Name, Rest, Cnt) 
  SELECT @@spid, 5, 'Долг Клиенты', 
         isnull(sum( -1 * D * round(Amount * ((100-isnull(Discount, 0)) / 100), 0) ), 0), 
         Count(*)
    FROM vTurnoverClient 
   WHERE OperDate  between @DateBegin and @DateEnd  

  INSERT INTO pStatistic (spid, ID, Name, Rest, Cnt) 
  SELECT @@spid, 6, 'Не оплаченные счета', isnull(sum(IIf(IsRefund=1,-1,1)*AccountAmount), 0) , Count(*)
    FROM tAccounts  
    WHERE AccountDate between @DateBegin and @DateEnd  
      And isnull(PaymentAmount, 0) = 0



  Select *
    from pStatistic (nolock)
   where spid = @@spid

 exit_:
 return @r

grant exec on Statistic to public
go



exec Statistic