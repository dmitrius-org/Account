unit uSql;

interface

uses System.SysUtils, System.UITypes, Variants, Data.DB,
     FireDAC.Comp.Client, FireDAC.Comp.Script ;

Type
  /// <summary>
  /// Класс для работы с SQL запросами.
  /// </summary>
  TSql = class
  strict private

    class var FQuery: TFDQuery;
   	class var FConnection: TFDConnection;
	
    class function GetConnection: TFDConnection; static;
    class procedure SetConnection(const Value: TFDConnection); static;

    class procedure Prepare(AQuery: TFDQuery; AParams: array of string; AArgs: array of variant);
  public
    class property Connection: TFDConnection read GetConnection write SetConnection;

    class function Q():TFDQuery; static;

    /// <summary>
    /// Возвращает результат запроса переданного в параметре ASqlText
    /// в компонент AQuery. Запрос выполняется как "Query.Open".
    /// </summary>
    class procedure Open(AQuery: TFDQuery; AParams: array of string; AArgs: array of variant); overload; static;

    /// <summary>
    /// Возвращает результат запроса переданного в параметре ASqlText
    /// в компонент TSql.Q.
    /// </summary>
    class procedure Open(ASql: String; AParams: array of string; AArgs: array of variant); overload; static;

    class procedure Exec(ASql: String; AParams: array of string; AArgs: array of variant); static;

    /// <summary>
    /// GetSetting - получение значния настройки
    /// </summary>
    class function GetSetting(ASetting: String): Variant; overload; static;
    class function GetSetting(ASetting: String; ADefValue: Double): Double; overload; static;
    class function GetSetting(ASetting: String; ADefValue: Boolean): Boolean; overload; static;
    class function GetSetting(ASetting: String; ADefValue: Integer): Integer; overload; static;
  end;


implementation

uses
  uVarUtils;


{ TSql }

class function TSql.GetSetting(ASetting: String): Variant;
var Query: TFDQuery;
begin
  Query :=TFDQuery.Create(nil);
//  Query.FetchOptions.AutoFetchAll := TFDAutoFetchAll.afAll;
  Query.FetchOptions.RowsetSize := 1000000;
  Try
    Query.Connection := FConnection;
    Query.Close;
    Query.SQL.Text:= 'SELECT isnull((SELECT Val FROM [tSettings] (Nolock) WHERE Brief = :ASetting), '''') as val';
    Query.ParamByName('ASetting').Value := ASetting;
    Query.Open();
    result:= Query.FieldByName('Val').Value;
    Query.Close;
  Finally
    FreeAndNil(Query);
  End;
end;

class function TSql.GetSetting(ASetting: String; ADefValue: Double): Double;
var v: Variant;
begin
  v := GetSetting(ASetting);
  result:= VarToDoubleDef(v, ADefValue);
end;

class function TSql.GetSetting(ASetting: String; ADefValue: Boolean): Boolean;
var v: Variant;
begin
  v := GetSetting(ASetting);
  result:= VarToBoolDef(v, ADefValue);
end;

class function TSql.Q: TFDQuery;
begin
  if not Assigned(FQuery) then
  begin
    FQuery := TFDQuery.Create(nil);
    FQuery.Connection := FConnection;
  end;

  result := FQuery;
end;

class procedure TSql.Exec(ASql: String; AParams: array of string;  AArgs: array of variant);
var FQueryTMP:TFDQuery;
begin
  FQueryTMP := TFDQuery.Create(nil);
  FQueryTMP.Connection := FConnection;

  FQueryTMP.SQL.Text := ASql;
  Prepare(FQueryTMP, AParams, AArgs);
  FQueryTMP.ExecSQL;
  FQueryTMP.Close;
  FreeAndNil(FQueryTMP);
end;

class procedure TSql.Open(AQuery: TFDQuery; AParams: array of string; AArgs: array of variant);
begin
  AQuery.Close;
  Prepare(AQuery, AParams, AArgs);
  AQuery.Open;
end;

class procedure TSql.Open(ASql: String; AParams: array of string; AArgs: array of variant);
begin
  Q.Close;
  Q.SQL.Text := ASql;
  Open(Q, AParams, AArgs);
end;

class procedure TSql.Prepare(AQuery: TFDQuery; AParams: array of string; AArgs: array of variant);
var i: Integer;
begin
  for i := 0 to High(AParams) do
  begin
    if AArgs[i] = null then
    begin
      with AQuery.ParamByName(AParams[i]) do
      begin
        DataType := ftString;
        Clear;
      end;
    end
    else
      AQuery.ParamByName(AParams[i]).Value := AArgs[i];
  end;
end;

class function TSql.GetConnection: TFDConnection;
begin
  Result:= FConnection;
end;

class procedure TSql.SetConnection(const Value: TFDConnection);
begin
  if Assigned(Value) then
  begin
    FConnection:= Value;

    if not Assigned(FQuery) then FQuery := TFDQuery.Create(nil);

    FQuery.Connection :=FConnection;
  end;
end;

class function TSql.GetSetting(ASetting: String; ADefValue: Integer): Integer;
var v: Variant;
begin
  v := GetSetting(ASetting);
  result:= VarToIntDef(v, ADefValue);
end;

end.
