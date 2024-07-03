if OBJECT_ID('tRetCode') is null
--drop table tRetCode
/* **********************************************************
tRetCode - коды ошибок
********************************************************** */
begin
	create table tRetCode
	(
	 RetCode           numeric(15,0)   --  
	,Message           varchar(512)       --
	);

	create unique index ao1 on tRetCode(RetCode);

	grant all on tRetCode to public;
end
go
---------------------------------------------------------------------
if OBJECT_ID('tRetMessage') is not null
  drop table tRetMessage
/* **********************************************************
tRetMessage - коды ошибок
********************************************************** */
go
create table tRetMessage
(
 Spid           numeric(18, 0) default @@Spid
,RetCode        numeric(18, 0)   --  
,Message        varchar(1024)       --
);

create index ao1 on tRetMessage(Spid, RetCode);

grant all on tRetMessage to public;
go
---------------------------------------------------------------------
if OBJECT_ID('GetRetMsg') is not null
    drop function GetRetMsg
/* **********************************************************
  GetRetMsg - получение описания ошибки по коду
********************************************************** */
go

create function dbo.GetRetMsg
              (@RetCode numeric(18,0))
RETURNS nvarchar(1024)
WITH EXECUTE AS CALLER
AS
BEGIN
  declare @Message varchar(1024);

  if @RetCode > 0
    Select @Message = Message 
      from tRetCode with (nolock index=ao1)  
     where RetCode = @RetCode
  else
    Select @Message = Message 
      from tRetMessage with (nolock index=ao1) 
     where spid     = @@spid
       and RetCode  = @RetCode

  RETURN(@Message);
END
go
grant exec on dbo.GetRetMsg to public
go



delete from tRetCode
-- tUsers
insert tRetCode (RetCode, Message) select 100,   'Вид кредита существует!'

insert tRetCode (RetCode, Message) select 120,   'Клиент с заданным наименование существует!'