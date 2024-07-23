----if OBJECT_ID('GetKassaID') is not null
----    drop function GetKassaID
----/*
----  function GetKassaID - 
----*/
----go

----create function dbo.GetKassaID()
----RETURNS numeric(18, 0)
----WITH EXECUTE AS CALLER
----AS
----BEGIN
----  declare @UserID  numeric(18,0)
----         ,@KassaID numeric(18,0)

----  select @UserID = UserID
----    from tUser (nolock)
----   where brief = dbo.GetLogin()


----   select @KassaID = 1

----  RETURN(@KassaID);
----END
----go
----grant exec on dbo.GetKassaID to public
----go

