               (* *****************************************************************************


Copyright (C) 2018 Company
***************************************************************************** *)

unit  uCommonType;

interface

uses System.SysUtils, System.UITypes, System.Rtti,
     FireDAC.Comp.Client, FireDAC.Comp.Script;

Type
  /// <summary> Типы действий </summary>
  TFormAction = (
   acNone          = 0
   /// <summary> acInsert - добавление </summary>
  ,acInsert        = 1
  /// <summary> acUpdate - изменение </summary>
  ,acUpdate        = 2
  /// <summary> acDelete - Удаление </summary>
  ,acDelete        = 3
  /// <summary> acShow - удаление </summary>
  ,acShow          = 4
  /// <summary> acCancel - отмена </summary>
  ,acCancel        = 5
  /// <summary> acLookup - выбрать </summary>
  ,acLookup        = 6
  ,acChecking      = 7
  ,acCheckKey      = 8
  ,acChildInsert   = 9
  ,acVerify        = 10
  ,acHistory       = 11
  ,acTemplate      = 12  // используется для технических нужд
  ,acReset         = 13
  ,acParentShow    = 14
  ,acChildDelete   = 15
  ,acReportCreate  = 16
  ,acReportEdit    = 17
  ,acSelect        = 18
  ,acHolding       = 19  // проведен, редактирование запрещено
  ,acUserAction    = 20
  ,acLogin         = 21
  ,acExit          = 22
  /// <summary> asRefresh - Обновление </summary>
  ,acRefresh       = 23
  /// <summary> acMessage - Сообщение </summary>
  ,acMessage       = 24
  ,acOn            = 25
  ,acOff           = 26
  ,acClone         = 27
  ,acResetAcc      = 28
  );

   /// <summary> Типы объектов системы </summary>
  TObjectType = (
   otUser           = 2          //пользователи
  ,otTask           = 11         //Автоматические задания

  );

  /// <summary> Типы для справочников </summary>
  THandHookType = (
   htNone           = 0
  ,htSystemic       = 1          //системный
  ,htNotWork        = 2          //не действует
  );

  TExceptionInform = (
    erInformation
   ,erNotInformation
  );

  /// <summary> tGridLayout - </summary>
  tGridLayout = (
   glSave = 0
  ,glLoad = 1
  );


  /// <summary> Типы для обработки ошибок </summary>
  TRetVal = record
  strict private
    class var FCode: Integer;
    class var FMessage: string;          // сообщение
    class var FID     : Integer;         // для тех нужд
    class var FErrType: TMsgDlgType;     // тип ошибки
    class var FConnection: TFDConnection;

    class function GetCode: Integer; static;     // код ошибки
    class function GetID: Integer;   static;
    class procedure SetCode(const Value: Integer); static;

    /// <summary>
    /// GetMessage - установка текстового значения ошибки по его коду в переменной RetCode
    /// </summary>
    /// <returns>Текст ошибки возвращается в переменную RetMsg; Type: string</returns>
    class function GetMessage():string; static;
    class procedure SetMessage(const Value: string); static;

    class function GetConnection: TFDConnection; static;
    class procedure SetConnection(const Value: TFDConnection); static;
  public
    class property Connection: TFDConnection read GetConnection write SetConnection;
    /// <summary>Code - код ошибки</summary>
    class property Code: Integer     read GetCode write SetCode;
    /// <summary>Message - текст ошибки</summary>
    class property Message: string   read GetMessage write SetMessage ;
    /// <summary>ID - идентификатор, используется для тех. нужд</summary>
    class property ID: Integer       read GetID      write FID      ;
    /// <summary>ErrType - тип ошибки: mtWarning, mtError, mtInformation, mtConfirmation, mtCustom</summary>
    class property ErrType: TMsgDlgType read FErrType write FErrType ;
     /// <summary> Clear - очистка текущих значений</summary>
    class function Clear:TRetVal;  static;
  end;


  /// <summary>
  /// TMultiProp.Objects - Установка свойства для нескольких объектов.
  /// </summary>
  /// <example>
  /// <code>
  /// TMultiProp.Objects([Self.clLegDialogButton, Self.OKButton,  Self.CancelButton])['Enabled']:=True;
  /// </code>
  /// </example>
  TMultiProp = record
  strict private
    class var FData : array of TObject;
  public
    type
      TObjectProperty = record
        strict private
          procedure setValue(propName : string; value : TValue);
          function GetValue(propName : string) : TValue;
        public
          property Properties[propName :string ] :TValue read GetValue write setValue;  default;
      end;

    class function Objects(objects : array of TObject) : TObjectProperty; static;
  end;

implementation

{ TRetVal }

class function TRetVal.Clear: TRetVal;
begin
  FCode    := 0;
  FMessage := '';
  FID      := 0;
end;

class function TRetVal.GetCode: Integer;
begin
  Result := FCode;
end;

class function TRetVal.GetConnection: TFDConnection;
begin
  result := FConnection;
end;

class function TRetVal.GetID: Integer;
begin
  Result := FID;
end;

class function TRetVal.GetMessage:string;
var
  Qry: TFDQuery;
Begin
  if (FCode <> 0) and (FMessage = '') then
  begin
    try
      Qry := TFDQuery.Create(nil);
      Qry.Connection := FConnection;

      Qry.SQL.Text := 'select dbo.GetRetMsg(:RetCode)';
      Qry.ParamByName('RetCode').Value := FCode;
      Qry.Open;

      if not Qry.IsEmpty then
        FMessage := '[' + FCode.ToString + '] ' + Qry.Fields.Fields[0].AsString
      else
        FMessage := '';
    finally
      FreeAndNil(Qry);
    end
  end;

  result:= FMessage;
end;

class procedure TRetVal.SetCode(const Value: Integer);
begin
  Clear;
  FCode := Value;
end;

class procedure TRetVal.SetConnection(const Value: TFDConnection);
begin
  if Assigned(Value) then
    FConnection := Value;
end;

class procedure TRetVal.SetMessage(const Value: string);
begin
  FMessage := Value;
end;

{TMultiProp}

class function TMultiProp.Objects(objects: array of TObject): TObjectProperty;
var i : integer;
Begin
  setLength(FData, length(objects));
  for i := 0 to high(objects) do
    FData[i] := objects[i];
end;

procedure TMultiProp.TObjectProperty.setValue(propName: string; value: TValue);
var ctx : TRttiContext;
      t : TRttiType;
      p : TRttiProperty;
    obj : TObject;
Begin
  ctx := TRttiContext.Create();
  propName := LowerCase(propName);
  try
    for obj in FData do
    Begin
      t := ctx.GetType(obj.ClassType);
      if t = nil then continue;
      for p in t.GetProperties() do
      Begin
        if LowerCase(p.Name) <> propName then continue;
        p.SetValue(obj, value);
      end;
    end;
  finally
    ctx.Free();
    FData := nil;
  end;
end;

function TMultiProp.TObjectProperty.GetValue(propName: string): TValue;
var ctx : TRttiContext;
      t : TRttiType;
      p : TRttiProperty;
    obj : TObject;
Begin
  ctx := TRttiContext.Create();
  propName := LowerCase(propName);
  try
    for obj in FData do
    Begin
      t := ctx.GetType(obj.ClassType);
      if t = nil then continue;
      for p in t.GetProperties() do
      Begin
        if LowerCase(p.Name) <> propName then continue;
        Result := p.GetValue(obj);
        Break;
      end;
    end;
  finally
    ctx.Free();
    FData := nil;
  end;

end;

end.

