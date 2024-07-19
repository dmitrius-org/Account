unit uLookupEdit;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  cxContainer, cxEdit, cxMaskEdit, FireDAC.Comp.Client, Vcl.Dialogs;

Const
  acLookup      = 6;

type
  { TcxCustomButtonEditProperties }

  TcxCustomButtonEditProperties = class(TcxCustomMaskEditProperties)
  public
    constructor Create(AOwner: TPersistent); override;
    class function GetContainerClass: TcxContainerClass; override;

    // procedure DoButtonClick; override;

  end;

  { TcxButtonEditProperties }

  TcxButtonEditProperties = class(TcxCustomButtonEditProperties)
  public

  published
    property Alignment;
    property AssignedValues;
    property AutoSelect;
    property BeepOnError;
    property Buttons;
    property CaseInsensitive;
    property CharCase;
    property ClearKey;
    property ClickKey;
    property EchoMode;
    property HideCursor; // deprecated hidden
    property HideSelection;
    property IgnoreMaskBlank;
    property Images;
    property ImeMode;
    property ImeName;
    property IncrementalSearch;
    property LookupItems;
    property LookupItemsSorted;
    property MaskKind;
    property Nullstring;
    property EditMask;
    property MaxLength;
    property OEMConvert;
    property PasswordChar;
    property ReadOnly;
    property UseLeftAlignmentOnEditing;
    property UseNullString;
    property ValidateOnEnter;
    property ValidationErrorIconAlignment;
    property ValidationOptions;
    property ViewStyle;
    property OnButtonClick;
    property OnButtonGlyphDrawParameters;
    property OnChange;
    property OnEditValueChanged;
    property OnNewLookupDisplayText;
    property OnValidate;
  end;



  AButtonEditProperties = class(TcxButtonEditProperties)
  private
//    FOnButtonClick: TcxEditButtonClickEvent;
  public
//     procedure DoButtonClick; override;

  published
    // procedure OnButtonClick; override;
  //  procedure ButtonClick(Sender: TObject; AButtonIndex: Integer);
     //: TcxEditButtonClickEvent read FOnButtonClick write FOnButtonClick;
//    property Alignment;
//    property AssignedValues;
//    property AutoSelect;
//    property BeepOnError;
//    property Buttons;
//    property CaseInsensitive;
//    property CharCase;
//    property ClearKey;
//    property ClickKey;
//    property EchoMode;
//    property HideCursor; // deprecated hidden
//    property HideSelection;
//    property IgnoreMaskBlank;
//    property Images;
//    property ImeMode;
//    property ImeName;
//    property IncrementalSearch;
//    property LookupItems;
//    property LookupItemsSorted;
//    property MaskKind;
//    property Nullstring;
//    property EditMask;
//    property MaxLength;
//    property OEMConvert;
//    property PasswordChar;
//    property ReadOnly;
//    property UseLeftAlignmentOnEditing;
//    property UseNullString;
//    property ValidateOnEnter;
//    property ValidationErrorIconAlignment;
//    property ValidationOptions;
//    property ViewStyle;
////    property OnButtonClick;
//    property OnButtonGlyphDrawParameters;
//    property OnChange;
//    property OnEditValueChanged;
//    property OnNewLookupDisplayText;
//    property OnValidate;
  end;

  { TcxCustomButtonEdit }

  ACustomButtonEdit = class(TcxCustomMaskEdit)
  private
    function GetProperties: TcxCustomButtonEditProperties;
    function GetActiveProperties: TcxCustomButtonEditProperties;
    procedure SetProperties(Value: TcxCustomButtonEditProperties);
  protected
    function InternalGetNotPublishedStyleValues: TcxEditStyleValues; override;
    function SupportsSpelling: Boolean; override;

  public
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    property ActiveProperties: TcxCustomButtonEditProperties  read GetActiveProperties;
    property Properties: TcxCustomButtonEditProperties read GetProperties     write SetProperties;
  end;

  { uLookupEdit }

  ALookupEdit = class(ACustomButtonEdit)
  private
    FAreButtonsLoaded: Boolean;
    FLookupKey: Integer;
    FLookupForm: string;
    FConnection: TFDConnection;
    FLookupFilter: string;
    FLookupSQL: string;
    FLookupResult: Integer;
    function GetActiveProperties: AButtonEditProperties;
    function GetProperties: AButtonEditProperties;
    procedure SetProperties(Value: AButtonEditProperties);
    procedure SetConnection(const Value: TFDConnection);
    procedure SetLookupKey(const Value: Integer);
    function  ACallModeLookup:Integer;
  protected
    procedure ReadState(Reader: TReader); override;
  public
    constructor Create(AOwner: TComponent); override;

    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
    property ActiveProperties: AButtonEditProperties read GetActiveProperties;

    procedure Execute;

    procedure DoButtonClick(AButtonVisibleIndex: Integer); override;
    procedure Clear;  override;

  published

    property LookupConnection: TFDConnection read FConnection write SetConnection;
    property LookupForm:string         read FLookupForm     write FLookupForm;
    property LookupSQL:string          read FLookupSQL      write FLookupSQL;
    property LookupKey:Integer         read FLookupKey      write SetLookupKey;
    property LookupFilter:string       read FLookupFilter   write FLookupFilter;
    property LookupResult:Integer      read FLookupResult   write FLookupResult;

    property Anchors;
    property AutoSize;
    property BeepOnEnter;
    property BiDiMode;
    property Constraints;
    property DragMode;
    property Enabled;
    property ParentBiDiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property Properties: AButtonEditProperties read GetProperties write SetProperties;
    property ShowHint;
    property Style;
    property StyleDisabled;
    property StyleFocused;
    property StyleHot;
    property StyleReadOnly;
    property TabOrder;
    property TabStop;
    property Text;
    property TextHint;
    property Visible;
    property DragCursor;
    property DragKind;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditing;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
    property OnEndDock;
    property OnStartDock;
  end;

implementation

uses
  cxEditConsts, dxCore, uBaseFormT, uCommonType;

const
  dxThisUnitName = 'cxButtonEdit';

{ TcxCustomButtonEditProperties }

constructor TcxCustomButtonEditProperties.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner);
  Buttons.Add;
  Buttons[0].Default := True;

  Buttons[0].Kind:= bkText;
  Buttons[0].Caption:= '...';
  Buttons[0].Width:=25;
  Buttons[0].Hint:= 'Выбрать из справочника';
  Buttons[0].ImageIndex:=0;


  Buttons.Add;
  Buttons[1].Kind:= bkGlyph;
  Buttons[1].Hint:= 'Очистить поле';
  Buttons[1].ImageIndex:=4;

end;

class function TcxCustomButtonEditProperties.GetContainerClass: TcxContainerClass;
begin
  Result := ALookupEdit;
end;

{ ACustomButtonEdit }

class function ACustomButtonEdit.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxCustomButtonEditProperties;
end;

function ACustomButtonEdit.InternalGetNotPublishedStyleValues: TcxEditStyleValues;
begin
  Result := inherited InternalGetNotPublishedStyleValues - [svButtonStyle, svButtonTransparency, svGradientButtons];
end;

function ACustomButtonEdit.SupportsSpelling: Boolean;
begin
  Result := IsTextInputMode;
end;

function ACustomButtonEdit.GetProperties: TcxCustomButtonEditProperties;
begin
  Result := TcxCustomButtonEditProperties(inherited Properties);
end;

function ACustomButtonEdit.GetActiveProperties: TcxCustomButtonEditProperties;
begin
  Result := TcxCustomButtonEditProperties(InternalGetActiveProperties);
end;

procedure ACustomButtonEdit.SetProperties(Value: TcxCustomButtonEditProperties);
begin
  Properties.Assign(Value);
end;

{ uLookupEdit }

class function ALookupEdit.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
  Result := TcxButtonEditProperties;
end;

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

function ALookupEdit.ACallModeLookup: Integer;
var obj: TBaseFormT;
     fc: TFormClass;
begin
  Result := 0;
  FLookupResult:= 0;

  fc := TFormClass(FindClass(FLookupForm));
  Application.CreateForm(fc, obj);

  obj.FormAction:= TFormAction.acLookup;
  obj.ID:=FLookupKey;
  obj.LookupFilter := LookupFilter;
  obj.Position:=poDesktopCenter;
  FLookupResult :=obj.ShowModal;

  if (obj.ID > 0) and (FLookupResult = 1) then
  begin
    // возврат ключевого поля
    Result := obj.ID;
  end;

  obj.Free;
end;

procedure ALookupEdit.Clear;
begin
  inherited;
  LookupKey:=0;
end;

constructor ALookupEdit.Create(AOwner: TComponent);
begin
  inherited;
  ShowHint:= True;
end;

procedure ALookupEdit.DoButtonClick(AButtonVisibleIndex: Integer); var FKey : Integer;
begin
  if AButtonVisibleIndex = 0 then
  begin
    if FLookupForm <> '' then
    begin
      FKey := ACallModeLookup;

      if ((FLookupResult = 1) and (FKey > 0)) then
        LookupKey := FKey;
    end;
  end
  else
  if AButtonVisibleIndex= 1 then
  begin
    LookupKey:=0;
    Clear;
  end;

  inherited;
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

function ALookupEdit.GetActiveProperties: AButtonEditProperties;
begin
  Result := AButtonEditProperties(InternalGetActiveProperties);
end;

function ALookupEdit.GetProperties: AButtonEditProperties;
begin
  Result := AButtonEditProperties(inherited Properties);
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

procedure ALookupEdit.SetProperties(Value: AButtonEditProperties);
begin
  Properties.Assign(Value);
end;

end.

