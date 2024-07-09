unit uLookupEdit;

interface

uses   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
 System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, cxButtonEdit,cxEdit,
  {AFormU,} FireDAC.Comp.Client, Vcl.Dialogs,
  Vcl.StdCtrls;

Const
  acLookup      = 6;

type
  ALookupEdit = class(TcxButtonEdit)
private
  FConnection     : TFDConnection;
  FLookupForm     : string;
  FLookupSQL      : string;
  FShowDelButton  : Boolean;
  FLookupKey      : Integer;
  FLookupFilter: string;

  function  ACallModeLookup:Integer;
  procedure SetLookupKey(const Value: Integer);
protected
  procedure SetConnection(const Value: TFDConnection);
  procedure SetShowDelButton(const Value: Boolean);
public
  constructor Create(AOwner: TComponent); override;
  destructor  Destroy; override;

  procedure ALookupEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);

  procedure Execute;
published
  property LookupConnection: TFDConnection read FConnection     write SetConnection;
  property LookupForm:string         read FLookupForm     write FLookupForm;
  property LookupSQL:string          read FLookupSQL      write FLookupSQL;
  property LookupKey:Integer         read FLookupKey      write SetLookupKey;
  property LookupFilter:string       read FLookupFilter   write FLookupFilter;

  property ShowDelButton:Boolean     read FShowDelButton  write SetShowDelButton;

end;

implementation

uses uBaseFormT, uCommonType;

constructor ALookupEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
 // FProperties.Images := IM.IL;

  FProperties.Buttons[0].Kind:= bkText;
  FProperties.Buttons[0].Caption:= '...';
  FProperties.Buttons[0].Width:=25;
  FProperties.Buttons[0].Hint:= 'Выбрать из справочника';
  FProperties.Buttons[0].ImageIndex:=0;

  begin
    FProperties.Buttons.Add;
    FProperties.Buttons[1].Kind:= bkGlyph;
   // FProperties.Buttons[1].Caption:= 'X';
    FProperties.Buttons[1].Hint:= 'Очистить поле';
    FProperties.Buttons[1].ImageIndex:=4;
  end;

  FProperties.OnButtonClick:=ALookupEditPropertiesButtonClick;

  ShowHint:= True;
end;

destructor ALookupEdit.Destroy;
begin
  SetConnection(nil);
  inherited Destroy;
end;

procedure ALookupEdit.SetConnection(const Value: TFDConnection);
begin
  if FConnection <> Value then begin FConnection := Value; end;
end;

procedure ALookupEdit.SetLookupKey(const Value: Integer);
begin
  FLookupKey := Value;

  if FLookupKey > 0 then
  begin
    Execute;
  end;
end;

procedure ALookupEdit.SetShowDelButton(const Value: Boolean);
begin
  FShowDelButton:= Value;
end;

function ALookupEdit.ACallModeLookup:Integer;
var       obj : TBaseFormT;
           fc : TFormClass;
begin
  Result := 0;

  fc := TFormClass(FindClass(FLookupForm));
  Application.CreateForm(fc, obj);

  obj.FormAction:= TFormAction.acLookup;
  obj.ID:=FLookupKey; //Properties.Buttons[0].Tag;
  obj.LookupFilter := LookupFilter;
  obj.Position:=poDesktopCenter;
  obj.ShowModal;

  if obj.ID > 0 then
  begin
    // возврат ключевого поля
    Result := obj.ID;
  end;

  obj.Free;
end;

procedure ALookupEdit.ALookupEditPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);

begin
  if AButtonIndex = 0 then
  begin
    if FLookupForm <> '' then
      LookupKey := ACallModeLookup;
  end
  else
  if AButtonIndex = 1 then
  begin
    LookupKey:=0;
    Clear;
  end;
end;

procedure ALookupEdit.Execute;
var FQuery : TFDQuery;
begin
  if FLookupKey > 0 then
  begin
    FQuery:= TFDQuery.Create(nil);

    // выполнение запроса
    try
      FQuery.Connection:= FConnection;
      FQuery.SQL.Text:= FLookupSQL;
      FQuery.ParamByName('ID').AsInteger := FLookupKey;


      FQuery.OpenOrExecute;
      if FQuery.RecordCount > 0 then
        Text:=FQuery.Fields.Fields[0].AsString;
    except
//        On E :Exception do
//          Result.STR:= E.ClassName+  ' Ошибка:  ' + E.Message;
      Text:='';
      FQuery.Free;
    end;

     // записываем результат запроса в результирующий массив
    if FQuery.RecordCount > 0 then
      Text:=FQuery.Fields.Fields[0].Value
    else Text:='';

    FQuery.Free;
  end;
end;


(*

procedure ALookupEdit.ReadState(Reader: TReader);
begin
  if not FAreButtonsLoaded then
  begin
    Properties.Buttons.Clear;
    ActiveProperties.Buttons.Clear;
    FAreButtonsLoaded := True;
  end;
  inherited ReadState(Reader);
end;
*)

end.
