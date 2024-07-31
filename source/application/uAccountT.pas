unit uAccountT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBT, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxContainer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxClasses, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, cxImageList, Vcl.Menus, System.Actions, Vcl.ActnList, cxGroupBox,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, dxCore,
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls, cxButtons,
  dxCoreGraphics, cxButtonEdit, uLookupEdit, cxGeometry, dxFramedControl,
  dxPanel, cxLabel, cxLocalization, cxEMFLookupEdit, dxEMF.DataSet,
  dxEMF.DataDefinitions, cxEMFData;

type
  TAccountT = class(TBaseFormDBT)
    QueryPaymentDate: TSQLTimeStampField;
    QueryAccountNumber: TStringField;
    QueryPaymentAmount: TIntegerField;
    QueryBuyerName: TStringField;
    QueryBuyerDiscount: TCurrencyField;
    QueryClientName: TStringField;
    QueryClientDiscount: TCurrencyField;
    QuerySupplieName: TStringField;
    QueryAccountStatusID: TFMTBCDField;
    QueryStatusName: TStringField;
    QueryAccountID: TFMTBCDField;
    TableViewPaymentDate: TcxGridDBColumn;
    TableViewAccountNumber: TcxGridDBColumn;
    TableViewPaymentAmount: TcxGridDBColumn;
    TableViewBuyerName: TcxGridDBColumn;
    TableViewBuyerDiscount: TcxGridDBColumn;
    TableViewClientName: TcxGridDBColumn;
    TableViewClientDiscount: TcxGridDBColumn;
    TableViewSupplieName: TcxGridDBColumn;
    TableViewAccountStatusID: TcxGridDBColumn;
    TableViewStatusName: TcxGridDBColumn;
    TableViewAccountID: TcxGridDBColumn;
    AddMenu: TPopupMenu;
    pmAddClient: TMenuItem;
    N8: TMenuItem;
    actClone: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    actRefund: TAction;
    actRefundFromAccount: TAction;
    N11: TMenuItem;
    N12: TMenuItem;
    StylePaid: TcxStyle;
    StylePartPaid: TcxStyle;
    edtAccountNumber: TcxTextEdit;
    edtPayNumber: TcxTextEdit;
    edtAccountDate: TcxDateEdit;
    edtPayDate: TcxDateEdit;
    edtPaymentDate: TcxDateEdit;
    edtPaymentDateE: TcxDateEdit;
    edtAccountStatus: TcxLookupComboBox;
    edtType: TcxComboBox;
    edtBuyer: ALookupEdit;
    edtSupplier: ALookupEdit;
    edtClient: ALookupEdit;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    qAccountStatus: TFDQuery;
    dsAccountStatus: TDataSource;
    actKontragent: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    cxButton5: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure actCloneExecute(Sender: TObject);
    procedure actRefundExecute(Sender: TObject);
    procedure actRefundFromAccountExecute(Sender: TObject);
    procedure TableViewCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure TableViewStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure FormShow(Sender: TObject);
    procedure btnFilterOkClick(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
    procedure edtAccountNumberKeyDown(Sender: TObject; var Key: Word;   Shift: TShiftState);
    procedure actKontragentExecute(Sender: TObject);
    procedure edtBuyerPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TableViewStatusNameCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  protected



  public
    { Public declarations }
    procedure DataLoad(); override;
    procedure SetActionEnabled(); override;
  end;

var
  AccountT: TAccountT;

implementation

uses
  uCommonType, MTLogger, uKontragentsT, uImageModule;

{$R *.dfm}

procedure TAccountT.actCloneExecute(Sender: TObject);
begin
  EditForm(acClone);
end;

procedure TAccountT.actKontragentExecute(Sender: TObject);
var kontragent: TKontragentsT;
begin
  kontragent:= TKontragentsT.Create(self);
  kontragent.Visible := False;
  kontragent.ShowModal;
  kontragent.Free;
end;

procedure TAccountT.actRefundExecute(Sender: TObject);
begin
  EditForm(acReset);
end;

procedure TAccountT.actRefundFromAccountExecute(Sender: TObject);
begin
  EditForm(acResetAcc);
end;

procedure TAccountT.btnFilterClearClick(Sender: TObject);
begin
  edtAccountNumber.Clear;
  edtPayNumber.Clear;
  edtPaymentDate.Clear;
  edtAccountDate.Clear;
  edtPayDate.Clear;
  edtPaymentDateE.Clear;
  edtBuyer.Clear;
  edtSupplier.Clear;
  edtClient.Clear;
  edtAccountStatus.Clear;
  edtType.Text := '';

  DataLoad;
end;

procedure TAccountT.btnFilterOkClick(Sender: TObject);
begin
  DataLoad;
end;

procedure TAccountT.DataLoad;
begin
  logger.Info('TAccountT.DataLoad');
  Query.Close();

  if edtAccountStatus.text <> '' then
    Query.MacroByName('AccountStatus').Value := ' and a.AccountStatusID in (' + Integer(edtAccountStatus.EditValue).ToString + ')'
  else
    Query.MacroByName('AccountStatus').Value := '';

  if edtType.ItemIndex <> -1 then
    Query.MacroByName('IsRefund').Value := ' and a.IsRefund = 1 '
  else
    Query.MacroByName('IsRefund').Value := '';


  if edtBuyer.LookupKey > 0 then
    Query.MacroByName('Buyer').Value := ' and a.BuyerID = ' + edtBuyer.LookupKey.ToString
  else
    Query.MacroByName('Buyer').Value := '';

  if edtSupplier.LookupKey > 0 then
    Query.MacroByName('Supplier').Value := ' and a.SupplierID = ' + edtSupplier.LookupKey.ToString
  else
    Query.MacroByName('Supplier').Value := '';

  if edtClient.LookupKey > 0 then
    Query.MacroByName('Client').Value := ' and a.ClientID = ' + edtClient.LookupKey.ToString
  else
    Query.MacroByName('Client').Value := '';


  if edtAccountNumber.Text <> '' then
    Query.MacroByName('AccountNumber').Value := ' and a.AccountNumber like ''%'   + edtAccountNumber.Text + '%'''
  else
    Query.MacroByName('AccountNumber').Value := '';

  if edtPayNumber.Text <> '' then
    Query.MacroByName('PayNumber').Value := ' and a.PayNumber like ''%'   + edtPayNumber.Text + '%'''
  else
    Query.MacroByName('PayNumber').Value := '';


  if edtAccountDate.Text <> '' then
    Query.MacroByName('AccountDate').Value := ' and a.PaymentDate = '''   + edtAccountDate.Text + ''''
  else
    Query.MacroByName('AccountDate').Value := '';


  if edtPayDate.Text <> '' then
    Query.MacroByName('PayDate').Value := ' and a.PayDate = '''   + edtPayDate.Text + ''''
  else
    Query.MacroByName('PayDate').Value := '';

  if edtPaymentDate.Text <> '' then
    Query.MacroByName('PaymentDateB').Value := ' and a.PaymentDate >= '''   + edtPaymentDate.Text + ''''
  else
    Query.MacroByName('PaymentDateB').Value := '';

  if edtPaymentDateE.Text <> '' then
    Query.MacroByName('PaymentDateE').Value := ' and a.PaymentDate <= '''   + edtPaymentDateE.Text + ''''
  else
    Query.MacroByName('PaymentDateE').Value := '';

//  if FormAction = acLookup then
//    Query.MacroByName('LookupFilter').Value := LookupFilter
//  else
//    Query.MacroByName('LookupFilter').Value := '';

  Query.Open();

  inherited;
end;

procedure TAccountT.edtAccountNumberKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then DataLoad;
end;

procedure TAccountT.edtBuyerPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if AButtonIndex = 1 then
  begin
    DataLoad;
  end;
end;

procedure TAccountT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TAccountF';

//  if (not (FormAction = acLookup ))then
//  begin
//   // Self.WindowState := wsMaximized;
//   // Self.BorderIcons := [biSystemMenu];
//  end;

end;

procedure TAccountT.FormShow(Sender: TObject);
begin
  qAccountStatus.Close;
  qAccountStatus.Open;


  inherited;
end;

procedure TAccountT.SetActionEnabled;
begin
  inherited;

  logger.Info('TAccountT.SetActionEnabled');
  actClone.Enabled := (actClone.Tag = 1) and (Query.RecordCount > 0);
  actRefund.Enabled := (actRefund.Tag = 1);
  actRefundFromAccount.Enabled := (actRefundFromAccount.Tag = 1) and (Query.RecordCount > 0);
  actKontragent.Enabled := (actKontragent.Tag = 1);
end;

procedure TAccountT.TableViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
//  if (AViewInfo.GridRecord.Values[TableViewAccountStatusID.Index]=1) then
//    ACanvas.font.color:= clGreen
//  else
//  if (AViewInfo.GridRecord.Values[TableViewAccountStatusID.Index]=2) then
//    ACanvas.font.color:= clRed;
end;

procedure TAccountT.TableViewStatusNameCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if (AViewInfo.GridRecord.Values[TableViewAccountStatusID.Index]=1) then
    ACanvas.font.color:= clGreen
  else
  if (AViewInfo.GridRecord.Values[TableViewAccountStatusID.Index]=2) then
    ACanvas.font.color:= clRed;

end;

procedure TAccountT.TableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
//  if AItem = nil then exit;
//  if ARecord.Values[TableViewStatusName.Index] = 'Оплачен' then
//
//    AStyle := StylePaid
//  else
//  if ARecord.Values[TableViewStatusName.Index] = 'Оплачен частично' then
//   AStyle := StylePartPaid;

end;

initialization
  RegisterClass(TAccountT);
end.
