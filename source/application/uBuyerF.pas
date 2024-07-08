unit uBuyerF;

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
  cxCurrencyEdit, System.JSON;

type
  TBuyerF = class(TBaseFormDBF)
    PageControl1: TPageControl;
    TabCommon: TTabSheet;
    SkLabel1: TSkLabel;
    SkLabel2: TSkLabel;
    SkLabel3: TSkLabel;
    edtName: TcxTextEdit;
    edtDiscountDate: TcxDateEdit;
    TabContact: TTabSheet;
    TabDiscount: TTabSheet;
    dsContact: TDataSource;
    qContact: TFDQuery;
    qDiscount: TFDQuery;
    dsDiscount: TDataSource;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    GridDiscount: TcxGrid;
    TableViewDiscount: TcxGridDBTableView;
    GridLevelDiscount: TcxGridLevel;
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
    TableViewPhone: TcxGridDBColumn;
    TableViewMail: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    cxImageList: TcxImageList;
    ActionList: TActionList;
    acContactAdd: TAction;
    acContactEdit: TAction;
    acContactDelete: TAction;
    acContactRefresh: TAction;
    acContactSave: TAction;
    qDiscountObjectTypeID: TIntegerField;
    qDiscountObjectID: TFMTBCDField;
    qDiscountDiscount: TFloatField;
    qDiscountDiscountDate: TSQLTimeStampField;
    qDiscountComment: TStringField;
    TableViewDiscountDiscount: TcxGridDBColumn;
    TableViewDiscountDiscountDate: TcxGridDBColumn;
    edtSignPartner: TcxCheckBox;
    edtINN: TcxTextEdit;
    SkLabel4: TSkLabel;
    edtPartner: TcxLookupComboBox;
    SkLabel5: TSkLabel;
    edtFullName: TcxTextEdit;
    SkLabel6: TSkLabel;
    edtlegalAaddress: TcxTextEdit;
    edtPostAddress: TcxTextEdit;
    SkLabel7: TSkLabel;
    SkLabel8: TSkLabel;
    edtEdo: TcxTextEdit;
    edtEdoID: TcxTextEdit;
    SkLabel9: TSkLabel;
    edtEdoIDL: TSkLabel;
    btnAuutoFillByInn: TcxButton;
    edtDiscount: TcxCurrencyEdit;
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
    procedure edtSignPartnerPropertiesChange(Sender: TObject);
    procedure btnAuutoFillByInnClick(Sender: TObject);
  private
    { Private declarations }
  public
    /// <summary>
    ///  DataLoad - ��������� ������ � �������, ��� ����������� �� �����
    ///</summary>
    procedure DataLoad(); override;

    /// <summary>
    ///  DataCheck - �������� ���������� ������������ �����
    ///</summary>
    procedure DataCheck();

    procedure ContactRefresh();
    procedure DiscountRefresh();


    procedure ContactSaveButtonSetEnabled();
    procedure ContactEditButtonSetEnabled();

    procedure  setPartner();
  end;

var
  BuyerF: TBuyerF;

implementation

uses
  uCommonType, uSql, uDataModule, MTLogger, uGetKontragentData;

{$R *.dfm}

{ TClientF }

procedure TBuyerF.acContactAddExecute(Sender: TObject);
begin
  qContact.Insert;
end;

procedure TBuyerF.acContactDeleteExecute(Sender: TObject);
begin
  qContact.Delete;
end;

procedure TBuyerF.acContactEditExecute(Sender: TObject);
begin
  qContact.Edit;
end;

procedure TBuyerF.acContactRefreshExecute(Sender: TObject);
begin
  ContactRefresh;
end;

procedure TBuyerF.acContactSaveExecute(Sender: TObject);
begin
  qContact.Post;
end;

procedure TBuyerF.btnAuutoFillByInnClick(Sender: TObject);
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
      MessageDlg('������ �� �������', mtError, [mbOK], 0);
  end;
end;

procedure TBuyerF.btnOkClick(Sender: TObject);
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert:
    begin
      tSql.Open('''
                  declare @R       int = 0
                         ,@BuyerID numeric(15,0)

                  exec @R = BuyerInsert
                              @BuyerID      = @BuyerID out
                             ,@Name    	    = :Name
                             ,@FullName	    = :FullName
                             ,@Inn	        = :Inn
                             ,@PostAddress	= :PostAddress
                             ,@LegalAddress	= :LegalAddress
                             ,@Edo	        = :Edo
                             ,@EdoID	      = :EdoID
                             ,@Discount	    = :Discount
                             ,@DiscountDate	= :DiscountDate
                             ,@PartnerID  	= :PartnerID
                             ,@IsPartner  	= :IsPartner
                  select @R as R
                ''',
               ['Name', 'FullName', 'Inn', 'PostAddress', 'LegalAddress', 'Edo',
                'EdoID', 'Discount', 'DiscountDate', 'PartnerID', 'IsPartner'],
               [edtName.Text,
                edtFullName.Text,
                edtINN.Text,
                edtPostAddress.Text,
                edtlegalAaddress.Text,
                edtEdo.Text,
                edtEdoID.Text,
                edtDiscount.Value,
                edtDiscountDate.Date,
                edtPartner.EditValue,
                edtSignPartner.Checked
                ]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = BuyerEdit
                              @BuyerID      = :BuyerID
                             ,@Name    	    = :Name
                             ,@FullName	    = :FullName
                             ,@Inn	        = :Inn
                             ,@PostAddress	= :PostAddress
                             ,@LegalAddress	= :LegalAddress
                             ,@Edo	        = :Edo
                             ,@EdoID	      = :EdoID
                             ,@Discount	    = :Discount
                             ,@DiscountDate	= :DiscountDate
                             ,@PartnerID  	= :PartnerID
                             ,@IsPartner  	= :IsPartner

                  select @R as R
                ''',
               ['Name', 'FullName', 'Inn', 'PostAddress', 'LegalAddress', 'Edo',
                'EdoID', 'Discount', 'DiscountDate', 'PartnerID', 'IsPartner', 'BuyerID'],
               [edtName.Text,
                edtFullName.Text,
                edtINN.Text,
                edtPostAddress.Text,
                edtlegalAaddress.Text,
                edtEdo.Text,
                edtEdoID.Text,
                edtDiscount.Value,
                edtDiscountDate.Text,
                edtPartner.EditValue,
                edtSignPartner.Checked,
                ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acDelete:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = BuyerDelete
                              @BuyerID  = :BuyerID

                  select @R as R
                ''',
               ['BuyerID'],
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

procedure TBuyerF.ContactRefresh;
begin
  qContact.Close;
  qContact.Open;
end;

procedure TBuyerF.DataCheck;
begin

  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit:
    begin
      if edtName.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := '���� [������������] ����������� � ����������!';
        edtName.SetFocus;
        Exit();
      end;

      if not edtSignPartner.Checked then
      begin
        if edtINN.text = '' then
        begin
          tRetVal.Code := 1;
          tRetVal.Message := '���� [���] ����������� � ����������!';
          edtINN.SetFocus;
          Exit();
        end;

        if edtDiscountDate.Text = '' then
        begin
          tRetVal.Code := 1;
          tRetVal.Message := '���� [���� ������] ����������� � ����������!';
          edtDiscountDate.SetFocus;
          Exit();
        end;
        if edtDiscount.Text = '' then
        begin
          tRetVal.Code := 1;
          tRetVal.Message := '���� [������] ����������� � ����������!';
          edtDiscount.SetFocus;
          Exit();
        end
      end;
    end;
  end;
end;

procedure TBuyerF.DataLoad;
begin
  TSql.Open('''

              exec ContactFill
                      @ObjectTypeID      = 2
                     ,@ObjectID          = :KontragentID
                     ,@Mode              = 0

            exec DiscountFill
                      @ObjectTypeID      = 2
                     ,@ObjectID          = :KontragentID
                     ,@Mode              = 0


              select Name
                    ,FullName
                    ,Inn
                    ,PostAddress
                    ,LegalAddress
                    ,Edo
                    ,EdoID
                    ,Discount
                    ,DiscountDate
                    ,PartnerID
                    ,IsPartner
                    ,Debts
                    ,InDateTime
                    ,UserID
                from tKontragents  (nolock)
               where KontragentID = :KontragentID
            ''',
            ['KontragentID'],
            [ID]
            );
  edtSignPartner.Checked := TSql.Q.FieldByName('IsPartner').AsBoolean;
  edtINN.Text := TSql.Q.FieldByName('Inn').AsString;
  edtPartner.EditValue := TSql.Q.FieldByName('PartnerID').AsInteger;
  edtName.Text := TSql.Q.FieldByName('Name').AsString;
  edtFullName.Text := TSql.Q.FieldByName('FullName').AsString;
  edtPostAddress.Text := TSql.Q.FieldByName('PostAddress').AsString;
  edtlegalAaddress.Text := TSql.Q.FieldByName('LegalAddress').AsString;
  edtEdo.Text := TSql.Q.FieldByName('Edo').AsString;
  edtEdoID.Text := TSql.Q.FieldByName('EdoID').AsString;

  if TSql.Q.FieldByName('DiscountDate').IsNull then
    edtDiscountDate.Text:=''
  else
    edtDiscountDate.Date :=  TSql.Q.FieldByName('DiscountDate').Value;
  edtDiscount.Value := TSql.Q.FieldByName('Discount').AsCurrency;

  inherited;
end;

procedure TBuyerF.DiscountRefresh;
begin
  qDiscount.close;
  qDiscount.Open;
end;

procedure TBuyerF.edtSignPartnerPropertiesChange(Sender: TObject);
begin
  setPartner;
end;

procedure TBuyerF.FormShow(Sender: TObject);
begin
  inherited;

  case FormAction of
    acInsert, acReportCreate:
    begin
      Self.Caption := '���������� ����������';
      edtDiscountDate.date := Date();
      tSQl.Exec('delete pContacts from pContacts (rowlock) where Spid = @@Spid', [], []);
      tSQl.Exec('delete pDiscounts from pDiscounts (rowlock) where Spid = @@Spid', [], []);
    end;
    acUpdate, acReportEdit, acUserAction:
    begin
      self.Caption := '��������� ���������� ' +  edtName.Text;
    end;
    acDelete:
    begin
      self.Caption := '�������� ���������� ' + edtName.Text;
    end;
    acShow:
    begin
      self.Caption := '�������� ���������� ' +  edtName.Text;
    end;
  else
  end;

  ContactRefresh;
  DiscountRefresh;

  setPartner;
end;

procedure TBuyerF.PageControl1DrawTab(Control: TCustomTabControl;
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

procedure TBuyerF.setPartner;
begin

  edtINN.Enabled := not edtSignPartner.Checked;
  edtPartner.Enabled := not edtSignPartner.Checked;
  edtPostAddress.Enabled := not edtSignPartner.Checked;
  edtlegalAaddress.Enabled := not edtSignPartner.Checked;
  edtEdo.Enabled := not edtSignPartner.Checked;
  edtEdoID.Enabled :=not  edtSignPartner.Checked;
  edtDiscountDate.Enabled :=not  edtSignPartner.Checked;
  edtDiscount.Enabled :=not  edtSignPartner.Checked;

  btnAuutoFillByInn.Enabled :=not  edtSignPartner.Checked;

end;

procedure TBuyerF.TableViewDataControllerDataChanged(Sender: TObject);
begin
  inherited;

  ContactSaveButtonSetEnabled;
  ContactEditButtonSetEnabled;
end;

procedure TBuyerF.ContactSaveButtonSetEnabled;
begin
  acContactSave.Enabled := qContact.State in [dsEdit, dsNewValue, dsInsert];
end;

procedure TBuyerF.ContactEditButtonSetEnabled;
begin
  acContactEdit.Enabled:= qContact.RecordCount > 0;
  acContactDelete.Enabled:= qContact.RecordCount > 0;
end;

procedure TBuyerF.TableViewUpdateEdit(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
begin
  inherited;
  ContactSaveButtonSetEnabled;
end;

initialization
  RegisterClass(TBuyerF);
end.