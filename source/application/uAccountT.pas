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
  dxPanel, cxLabel, cxLocalization, Data.FMTBcd, Data.SqlExpr;

type
  TAccountT = class(TBaseFormDBT)
    QueryPaymentDate: TSQLTimeStampField;
    QueryAccountNumber: TStringField;
    QueryPaymentAmount: TIntegerField;
    QueryBuyerDiscount: TCurrencyField;
    QueryClientDiscount: TCurrencyField;
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
    UpdateSQL: TFDUpdateSQL;
    QueryaBuyerID: TFMTBCDField;
    dsBuyer: TDataSource;
    qBuyer: TFDQuery;
    dsClient: TDataSource;
    qClient: TFDQuery;
    QuerySupplierID: TFMTBCDField;
    dsSupplier: TDataSource;
    qSupplier: TFDQuery;
    QueryClientID: TFMTBCDField;
    QueryBuyerName: TStringField;
    QuerySupplieName: TStringField;
    QueryClientName: TStringField;
    dxPanel2: TdxPanel;
    lblSum: TcxLabel;
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
    procedure edtBuyerPropertiesButtonClick(Sender: TObject;      AButtonIndex: Integer);
    procedure TableViewStatusNameCustomDrawCell(Sender: TcxCustomGridTableView;      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;       var ADone: Boolean);
    procedure TableViewEditing(Sender: TcxCustomGridTableView;   AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure TableViewSupplieNamePropertiesEditValueChanged(Sender: TObject);
    procedure TableViewBuyerNamePropertiesEditValueChanged(Sender: TObject);
    procedure TableViewClientNamePropertiesEditValueChanged(Sender: TObject);
    procedure QueryBeforePost(DataSet: TDataSet);
    procedure TableViewSelectionChanged(Sender: TcxCustomGridTableView);
    procedure TableViewEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure TableViewTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure TableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure TableViewDataControllerSummaryDefaultGroupSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
    procedure TableViewDataControllerSummaryFooterSummaryItemsSummary(
      ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
      var OutArguments: TcxSummaryEventOutArguments);
  private
    { Private declarations }

    procedure CalculateSum;

    procedure CalculateTotal;

    procedure MoveToNextColumn;
  protected



  public
    { Public declarations }
    procedure DataLoad(); override;
    procedure SetActionEnabled(); override;
  end;

var
  AccountT: TAccountT;

implementation

uses uCommonType, MTLogger, uKontragentsT, uImageModule, uDataModule, uSql;

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


  TableView.DataController.Filter.Clear;

  DataLoad;
end;

procedure TAccountT.btnFilterOkClick(Sender: TObject);
begin
  DataLoad;
end;

procedure TAccountT.CalculateSum;
var
  I, J: Integer;
  Sum: Double;
  View: TcxGridTableView;
  SelectedRowIndex, SelectedColumnIndex: Integer;
begin
  Sum := 0;
  View := TableView;
  lblSum.Caption := '';
  // Перебор всех выделенных ячеек
  for I := 0 to View.Controller.SelectedRecordCount - 1 do
  begin
    SelectedRowIndex := View.Controller.SelectedRecords[I].RecordIndex;
    for J := 0 to View.Controller.SelectedColumnCount - 1 do
    begin
      SelectedColumnIndex := View.Controller.SelectedColumns[J].Index;
      // Проверка, что выбранная ячейка находится в нужном столбце (например, Column2)
      if SelectedColumnIndex = TableViewPaymentAmount.Index then
      begin
        // Добавление значения ячейки к сумме
        try
          Sum := Sum + View.DataController.Values[SelectedRowIndex, SelectedColumnIndex];
        except
          Exit;
        end;
      end;
    end;

    lblSum.Caption := 'Итого: ' + FormatFloat('###,##0', Sum);
  end;
end;

procedure TAccountT.CalculateTotal;
var
  I: Integer;
  Sum: Double;
begin
  Sum := 0;
  // Перебор всех записей в таблице
  for I := 0 to TableView.DataController.FilteredRecordCount - 1 do
  begin
    // Суммирование значений в нужном столбце (например, Column2)
    Sum := Sum + TableView.DataController.Values[TableView.DataController.FilteredRecordIndex[I], TableViewPaymentAmount.Index];
  end;

  TableViewPaymentAmount.Caption := FormatFloat('###,##0', Sum );// Sum.ToString();

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

//  if edtBuyer.LookupKey > 0 then
//    Query.MacroByName('Buyer').Value := ' and a.BuyerID = ' + edtBuyer.LookupKey.ToString
//  else
//    Query.MacroByName('Buyer').Value := '';

//  if edtSupplier.LookupKey > 0 then
//    Query.MacroByName('Supplier').Value := ' and a.SupplierID = ' + edtSupplier.LookupKey.ToString
//  else
//    Query.MacroByName('Supplier').Value := '';

//  if edtClient.LookupKey > 0 then
//    Query.MacroByName('Client').Value := ' and a.ClientID = ' + edtClient.LookupKey.ToString
//  else
//    Query.MacroByName('Client').Value := '';

//  if edtAccountNumber.Text <> '' then
//    Query.MacroByName('AccountNumber').Value := ' and a.AccountNumber like ''%'   + edtAccountNumber.Text + '%'''
//  else
//    Query.MacroByName('AccountNumber').Value := '';

  if edtPayNumber.Text <> '' then
    Query.MacroByName('PayNumber').Value := ' and a.PayNumber like ''%'   + edtPayNumber.Text + '%'''
  else
    Query.MacroByName('PayNumber').Value := '';

//  if edtAccountDate.Text <> '' then
//    Query.MacroByName('AccountDate').Value := ' and a.PaymentDate = '''   + edtAccountDate.Text + ''''
//  else
//    Query.MacroByName('AccountDate').Value := '';

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

  Query.Open();

  inherited;
end;

procedure TAccountT.edtAccountNumberKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
end;

procedure TAccountT.FormShow(Sender: TObject);
begin
  qAccountStatus.Close;
  qAccountStatus.Open;

  qBuyer.Close;
  qBuyer.Open;

  qClient.Close;
  qClient.Open;

  qSupplier.Close;
  qSupplier.Open;


  with qBuyer do
  begin
    DisableControls;
    TcxComboBoxProperties( TableViewBuyerName.Properties ).Items.Clear;
    TcxComboBoxProperties( TableViewBuyerName.Properties).Items.BeginUpdate;
    First;
    while not Eof do
    begin

      TcxComboBoxProperties(TableViewBuyerName.Properties ).Items.AddObject(FieldByName('Name').AsString, TObject(FieldByName('KontragentID').AsInteger));

      Next;
    end;
    TcxComboBoxProperties( TableViewBuyerName.Properties).Items.EndUpdate;
    EnableControls;
  end;

  with qSupplier do
  begin
    DisableControls;
    TcxComboBoxProperties( TableViewSupplieName.Properties ).Items.Clear;
    TcxComboBoxProperties( TableViewSupplieName.Properties ).Items.BeginUpdate;
    First;
    while not Eof do
    begin

      TcxComboBoxProperties( TableViewSupplieName.Properties ).Items.AddObject(FieldByName('Name').AsString, TObject(FieldByName('KontragentID').AsInteger));

      Next;
    end;
    TcxComboBoxProperties( TableViewSupplieName.Properties).Items.EndUpdate;
    EnableControls;
  end;

  with qClient do
  begin
    DisableControls;
    TcxComboBoxProperties( TableViewClientName.Properties ).Items.Clear;
    TcxComboBoxProperties( TableViewClientName.Properties ).Items.BeginUpdate;
    First;
    while not Eof do
    begin

      TcxComboBoxProperties( TableViewClientName.Properties ).Items.AddObject(FieldByName('Name').AsString, TObject(FieldByName('KontragentID').AsInteger));

      Next;
    end;
    TcxComboBoxProperties( TableViewClientName.Properties).Items.EndUpdate;
    EnableControls;
  end;
  inherited;
end;

procedure TAccountT.MoveToNextColumn;
var
  View: TcxGridTableView;
  ColIndex, RowIndex: Integer;
begin
  View := TableView;
  ColIndex := View.Controller.FocusedColumn.Index;
  RowIndex := View.Controller.FocusedRowIndex;

  // Проверка, если текущая колонка не последняя
  if ColIndex < View.ColumnCount - 1 then
  begin
    // Переход к следующей колонке
    View.Controller.FocusedColumnIndex := ColIndex;
  end
  else
  begin
    // Если текущая колонка последняя, переход на первую колонку следующей строки
    if RowIndex < View.DataController.RecordCount - 1 then
    begin
      View.Controller.FocusedColumnIndex := 0;
      View.Controller.FocusedRowIndex := RowIndex + 1;
    end
    else
    begin
      // Если текущая строка последняя, оставаться на последней колонке
      View.Controller.FocusedColumnIndex := ColIndex;
    end;
  end;
end;

procedure TAccountT.QueryBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('PaymentDate').IsNull or (Trim(DataSet.FieldByName('PaymentDate').AsString) = '') then
    raise Exception.Create('Поле "Дата счета" обязательно к заполнению');

  if DataSet.FieldByName('AccountNumber').IsNull or (Trim(DataSet.FieldByName('AccountNumber').AsString) = '') then
    raise Exception.Create('Поле "Номер счета" обязательно к заполнению');

  if DataSet.FieldByName('PaymentAmount').IsNull or (Trim(DataSet.FieldByName('PaymentAmount').AsString) = '') then
    raise Exception.Create('Поле "Сумма" обязательно к заполнению');

  if DataSet.FieldByName('BuyerName').IsNull or (Trim(DataSet.FieldByName('BuyerName').AsString) = '') then
    raise Exception.Create('Поле "Покупатель" обязательно к заполнению');

  if DataSet.FieldByName('SupplieName').IsNull or (Trim(DataSet.FieldByName('SupplieName').AsString) = '') then
    raise Exception.Create('Поле "Поставщик" обязательно к заполнению');

  if DataSet.FieldByName('ClientName').IsNull or (Trim(DataSet.FieldByName('ClientName').AsString) = '') then
    raise Exception.Create('Поле "Клиент" обязательно к заполнению');
end;

procedure TAccountT.SetActionEnabled;
begin
  inherited;

  actClone.Enabled := (actClone.Tag = 1) and (Query.RecordCount > 0);
  actRefund.Enabled := (actRefund.Tag = 1);
  actRefundFromAccount.Enabled := (actRefundFromAccount.Tag = 1) and (Query.RecordCount > 0);
  actKontragent.Enabled := (actKontragent.Tag = 1);
end;

procedure TAccountT.TableViewBuyerNamePropertiesEditValueChanged(Sender: TObject);
var  SelectedObject: TObject;
begin
  if (TableView.Controller.FocusedRecord.IsNewItemRecord) then
  begin
    SelectedObject := TcxComboBox(Sender).Properties.Items.Objects[TcxComboBox(Sender).ItemIndex];
    TableViewBuyerName.EditValue := TcxComboBox(Sender).Text;

    Query.FieldByName('BuyerID').Value :=   Integer(SelectedObject);

    TSql.Open('select Discount from tKontragents (nolock) where KontragentID=:ID', ['ID'], [Integer(SelectedObject)]);

    if TSql.Q.RecordCount>0 then
      TableViewBuyerDiscount.EditValue := TSql.Q.FieldByName('Discount').AsFloat;
  end;
end;

procedure TAccountT.TableViewClientNamePropertiesEditValueChanged(Sender: TObject);
var  SelectedObject: TObject;
begin
  if (TableView.Controller.FocusedRecord.IsNewItemRecord) then
  begin
    SelectedObject := TcxComboBox(Sender).Properties.Items.Objects[TcxComboBox(Sender).ItemIndex];
    TableViewClientName.EditValue := TcxComboBox(Sender).Text;
    Query.FieldByName('ClientID').Value :=   Integer(SelectedObject);

    TSql.Open('select Discount from tKontragents (nolock) where KontragentID=:ID', ['ID'], [Integer(SelectedObject)]);

    if TSql.Q.RecordCount>0 then
      TableViewClientDiscount.EditValue := TSql.Q.FieldByName('Discount').AsFloat;
  end;
end;

procedure TAccountT.TableViewCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//  if (AViewInfo.GridRecord.Values[TableViewAccountStatusID.Index]=1) then
//    ACanvas.font.color:= clGreen
//  else
//  if (AViewInfo.GridRecord.Values[TableViewAccountStatusID.Index]=2) then
//    ACanvas.font.color:= clRed;
end;

procedure TAccountT.TableViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
  CalculateTotal;
end;

procedure TAccountT.TableViewDataControllerSummaryDefaultGroupSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
begin
 logger.Info('TableViewDataControllerSummaryDefaultGroupSummaryItemsSummary');
end;

procedure TAccountT.TableViewDataControllerSummaryFooterSummaryItemsSummary(
  ASender: TcxDataSummaryItems; Arguments: TcxSummaryEventArguments;
  var OutArguments: TcxSummaryEventOutArguments);
begin
 logger.Info('TableViewDataControllerSummaryFooterSummaryItemsSummary');
end;

procedure TAccountT.TableViewEditing(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  AAllow := (Sender.Controller.FocusedRecord is TcxGridNewItemRow) or (Sender.Controller.FocusedRecord is TcxGridFilterRow)
end;

procedure TAccountT.TableViewEditKeyDown(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    MoveToNextColumn;
    Key := 0;  // Чтобы предотвратить стандартное поведение клавиши Enter
  end;
end;

procedure TAccountT.TableViewSelectionChanged(Sender: TcxCustomGridTableView);
begin
  CalculateSum;
end;

procedure TAccountT.TableViewStatusNameCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
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
  inherited;
//  if AItem = nil then exit;
//  if ARecord.Values[TableViewStatusName.Index] = 'Оплачен' then
//
//    AStyle := StylePaid
//  else
//  if ARecord.Values[TableViewStatusName.Index] = 'Оплачен частично' then
//   AStyle := StylePartPaid;

end;

procedure TAccountT.TableViewSupplieNamePropertiesEditValueChanged(Sender: TObject);
var  SelectedObject: TObject;
begin
  SelectedObject := TcxComboBox(Sender).Properties.Items.Objects[TcxComboBox(Sender).ItemIndex];
  TableViewSupplieName.EditValue := TcxComboBox(Sender).Text;
  Query.FieldByName('SupplierID').Value :=   Integer(SelectedObject);
end;

procedure TAccountT.TableViewTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;


  logger.Info(AValue);
end;

initialization
  RegisterClass(TAccountT);
end.
