if OBJECT_ID('tDocumentRequest') is null
--  drop table tDocumentRequest
/* **********************************************************
tAccounts - 
********************************************************** */
begin
	create table tDocumentRequest
	(
	 DocumentRequestID numeric(15, 0)  identity  --
    ,PayDate           datetime
	,AccountNumber     varchar(256)  
    ,SupplierID        numeric(15, 0) 
    ,BuyerID           numeric(15, 0)     
    ,Comment           varchar(256)
    ,Phone             varchar(256)
    ,Mail              varchar(256)
    ,AccountID         numeric(15, 0)
  
	,InDateTime        DateTime default getdate()   -- 
    ,UserID            numeric(15, 0) 
	);

	create index ao1 on tDocumentRequest(DocumentRequestID);

	grant select on tDocumentRequest to public;
end
go