if OBJECT_ID('tDocumentRequest') is null
/*begin
  ALTER TABLE tDocumentRequest SET ( SYSTEM_VERSIONING = OFF )
  drop table tDocumentRequest
  DROP TABLE hDocumentRequest
end */
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
  
     --
    ,InUserID          numeric(15, 0)
	,InDateTime        DateTime default getdate()   -- 

    ,UpUserID          numeric(15, 0) 
    ,UpDateTime        DateTime default getdate()  
     --
    ,[ValidFrom] DATETIME2 GENERATED ALWAYS AS ROW START
    ,[ValidTo] DATETIME2 GENERATED ALWAYS AS ROW END

    ,PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)

    ,CONSTRAINT PK_tDocumentRequest_DocumentRequestID PRIMARY KEY NONCLUSTERED (DocumentRequestID)
	)
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.hDocumentRequest));

	create index ao1 on tDocumentRequest(DocumentRequestID);

	grant select on tDocumentRequest to public;
end
go