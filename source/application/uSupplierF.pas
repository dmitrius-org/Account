unit uSupplierF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBF, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, cxGeometry,
  dxFramedControl, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxCoreGraphics, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, cxButtons,
  cxButtonEdit, uLookupEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  dxPanel, dxBarBuiltInMenu, cxPC, System.Skia, cxCalc, Vcl.Skia, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, cxImageList,
  Vcl.ToolWin, cxCheckBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCurrencyEdit, System.JSON ;

type
  TSupplierF = class(TBaseFormDBF)
    dsContact: TDataSource;
    qContact: TFDQuery;
    qContactID: TFMTBCDField;
    qContactSpid: TFMTBCDField;
    qContactContactID: TFMTBCDField;
    qContactObjectTypeID: TIntegerField;
    qContactObjectID: TFMTBCDField;
    qContactPhone: TStringField;
    qContactMail: TStringField;
    qContactComment: TStringField;
    qContactInDateTime: TSQLTimeStampField;
    qContactUpDateTime: TSQLTimeStampField;
    qContactUpdate: TFDUpdateSQL;
    cxImageList: TcxImageList;
    ActionList: TActionList;
    acContactAdd: TAction;
    acContactEdit: TAction;
    acContactDelete: TAction;
    acContactRefresh: TAction;
    acContactSave: TAction;
    PageControl1: TPageControl;
    TabCommon: TTabSheet;
    SkLabel1: TSkLabel;
    SkLabel4: TSkLabel;
    SkLabel6: TSkLabel;
    SkLabel7: TSkLabel;
    SkLabel8: TSkLabel;
    SkLabel9: TSkLabel;
    edtEdoIDL: TSkLabel;
    edtName: TcxTextEdit;
    edtINN: TcxTextEdit;
    edtFullName: TcxTextEdit;
    edtlegalAaddress: TcxTextEdit;
    edtPostAddress: TcxTextEdit;
    edtEdo: TcxTextEdit;
    edtEdoID: TcxTextEdit;
    btnAuutoFillByInn: TcxButton;
    TabContact: TTabSheet;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    TableViewPhone: TcxGridDBColumn;
    TableViewMail: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1DrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure acContactAddExecute(Sender: TObject);
    procedure acContactEditExecute(Sender: TObject);
    procedure acContactDeleteExecute(Sender: TObject);
    procedure acContactSaveExecute(Sender: TObject);
    procedure acContactRefreshExecute(Sender: TObject);
    procedure TableViewUpdateEdit(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure TableViewDataControllerDataChanged(Sender: TObject);
    procedure btnAuutoFillByInnClick(Sender: TObject);
  private
    { Private declarations }
  public
    /// <summary>
    ///  DataLoad - получение данных с сервера, для отображения на форме
    ///</summary>
    procedure DataLoad(); override;

    /// <summary>
    ///  DataCheck - проверка заполнения обязательных полей
    ///</summary>
    procedure DataCheck();

    procedure ContactRefresh();

    procedure ContactSaveButtonSetEnabled();
    procedure ContactEditButtonSetEnabled();

  end;

var
  SupplierF: TSupplierF;

implementation

uses
  uCommonType, uSql, uDataModule, MTLogger, uGetKontragentData;

{$R *.dfm}

{ TClientF }

procedure TSupplierF.acContactAddExecute(Sender: TObject);
begin
  qContact.Insert;
end;

procedure TSupplierF.acContactDeleteExecute(Sender: TObject);
begin
  qContact.Delete;
end;

procedure TSupplierF.acContactEditExecute(Sender: TObject);
begin
  qContact.Edit;
end;

procedure TSupplierF.acContactRefreshExecute(Sender: TObject);
begin
  ContactRefresh;
end;

procedure TSupplierF.acContactSaveExecute(Sender: TObject);
begin
  qContact.Post;
end;

procedure TSupplierF.btnAuutoFillByInnClick(Sender: TObject);
var
   JSonValue:TJSonValue;
    s: string;
begin
  inherited;

  if edtINN.Text <> '' then
  begin
    JsonValue := TJSonObject.ParseJSONValue( getKontragentDataByInn(edtINN.Text) );

    if JsonValue.TryGetValue('inn', s) then
    begin
      edtName.Text := JsonValue.GetValue<string>('short_name');
      edtFullName.Text := JsonValue.GetValue<string>('full_name');
      edtlegalAaddress.Text := JsonValue.GetValue<string>('address');
      JsonValue.Free;
    end
    else
      MessageDlg('Данные не найдены', mtError, [mbOK], 0);
  end;
end;

procedure TSupplierF.btnOkClick(Sender: TObject);
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert:
    begin
      tSql.Open('''
                  declare @R          int = 0
                         ,@SupplierID numeric(15,0)

                  exec @R = SupplierInsert
                              @SupplierID   = @SupplierID out
                             ,@Name    	    = :Name
                             ,@FullName	    = :FullName
                             ,@Inn	        = :Inn
                             ,@PostAddress	= :PostAddress
                             ,@LegalAddress	= :LegalAddress
                             ,@Edo	        = :Edo
                             ,@EdoID	      = :EdoID

                  select @R as R
                ''',
               ['Name', 'FullName', 'Inn', 'PostAddress', 'LegalAddress', 'Edo', 'EdoID'],
               [edtName.Text,
                edtFullName.Text,
                edtINN.Text,
                edtPostAddress.Text,
                edtlegalAaddress.Text,
                edtEdo.Text,
                edtEdoID.Text
                ]
               );


      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = SupplierEdit
                              @SupplierID   = :SupplierID
                             ,@Name    	    = :Name
                             ,@FullName	    = :FullName
                             ,@Inn	        = :Inn
                             ,@PostAddress	= :PostAddress
                             ,@LegalAddress	= :LegalAddress
                             ,@Edo	        = :Edo
                             ,@EdoID	      = :EdoID

                  select @R as R
                ''',
               ['Name', 'FullName', 'Inn', 'PostAddress', 'LegalAddress', 'Edo', 'EdoID', 'SupplierID'],
               [edtName.Text,
                edtFullName.Text,
                edtINN.Text,
                edtPostAddress.Text,
                edtlegalAaddress.Text,
                edtEdo.Text,
                edtEdoID.Text,
                ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acDelete:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = SupplierDelete
                             @SupplierID = :SupplierID

                  select @R as R
                ''',
               ['SupplierID'],
               [ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
  end;

  if tRetVal.Code = 0 then
  begin
    ModalResult:=mrOK;
  end
  else
  begin
    MessageDlg(tRetVal.Message, mtError, [mbOK], 0);
  end;
end;

procedure TSupplierF.ContactRefresh;
begin
  qContact.Close;
  qContact.Open;
end;

procedure TSupplierF.DataCheck;
begin

  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit:
    begin

      if edtINN.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Инн] обязательно к заполнению!';
        edtINN.SetFocus;
        Exit();
      end;

      if edtName.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Наименование] обязательно к заполнению!';
        edtName.SetFocus;
        Exit();
      end;
    end;
  end;
end;

procedure TSupplierF.DataLoad;
begin
  FDQuery.Close;
  FDQuery.sql.text :=
  '''
              exec ContactFill
                      @ObjectTypeID      = 3
                     ,@ObjectID          = :KontragentID
                     ,@Mode              = 0

              select Name
                    ,FullName
                    ,Inn
                    ,PostAddress
                    ,LegalAddress
                    ,Edo
                    ,EdoID
                    ,Debts
                    ,upDateTime
                    ,UpUserID
                from tKontragents  (nolock)
               where KontragentID = :KontragentID
  ''';
  FDQuery.ParamByName('KontragentID').AsInteger := ID;
  FDQuery.Open;

  edtINN.Text           := FDQuery.FieldByName('Inn').Value;
  edtName.Text          := FDQuery.FieldByName('Name').Value;
  edtFullName.Text      := FDQuery.FieldByName('FullName').Value;
  edtPostAddress.Text   := FDQuery.FieldByName('PostAddress').Value;
  edtlegalAaddress.Text := FDQuery.FieldByName('LegalAddress').Value;
  edtEdo.Text           := FDQuery.FieldByName('Edo').Value;
  edtEdoID.Text         := FDQuery.FieldByName('EdoID').Value;

  inherited;
end;

procedure TSupplierF.FormShow(Sender: TObject);
begin
  inherited;

  case FormAction of
    acInsert, acReportCreate:
    begin
      Self.Caption := 'Добавление поставщика';
      tSQl.Exec('delete pContacts from pContacts (rowlock) where Spid = @@Spid', [], []);
      //tSQl.Exec('delete pDiscounts from pDiscounts (rowlock) where Spid = @@Spid', [], []);
    end;
    acUpdate, acReportEdit, acUserAction:
    begin
      self.Caption := 'Изменение поставщика ' +  edtName.Text;
    end;
    acDelete:
    begin
      self.Caption := 'Удаление поставщика ' + edtName.Text;
    end;
    acShow:
    begin
      self.Caption := 'Просмотр поставщика ' +  edtName.Text;
    end;
  else
  end;

  ContactRefresh;

end;

procedure TSupplierF.PageControl1DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
y    : Integer;
x    : Integer;
aRect: TRect;
begin
  if Active then
  begin
    Control.Canvas.Brush.Color := clWebLightGreen;
    Control.Canvas.FillRect(Rect);
  end
  else
  begin
    Control.Canvas.Brush.Color := clBtnFace;
    Control.Canvas.FillRect(Rect);
  end;

  y  := Rect.Top + ((Rect.Bottom - Rect.Top - Control.Canvas.TextHeight(TTabControl(Control).Tabs[TabIndex])) div 2) + 1;
  x  := Rect.Left + ((Rect.Right - Rect.Left - Control.Canvas.TextWidth (TTabControl(Control).Tabs[TabIndex])) div 2) + 1;
  //draw the tab title
  Control.Canvas.TextOut(x,y,TTabControl(Control).Tabs[TabIndex]);
end;


procedure TSupplierF.TableViewDataControllerDataChanged(Sender: TObject);
begin
  inherited;

  ContactSaveButtonSetEnabled;
  ContactEditButtonSetEnabled;
end;

procedure TSupplierF.ContactSaveButtonSetEnabled;
begin
  acContactSave.Enabled := qContact.State in [dsEdit, dsNewValue, dsInsert];
end;

procedure TSupplierF.ContactEditButtonSetEnabled;
begin
  acContactEdit.Enabled:= qContact.RecordCount > 0;
  acContactDelete.Enabled:= qContact.RecordCount > 0;
end;

procedure TSupplierF.TableViewUpdateEdit(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
begin
  inherited;
  ContactSaveButtonSetEnabled;
end;

initialization
  RegisterClass(TSupplierF);
end.
