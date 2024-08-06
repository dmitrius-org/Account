unit uProfit_T;

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
  cxDateUtils, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit,
  uLookupEdit, Vcl.StdCtrls, cxButtons, cxCurrencyEdit, cxGeometry,
  dxFramedControl, cxLabel, dxPanel;

type
  TProfit_T = class(TBaseFormDBT)
    btnFilterClear: TcxButton;
    btnFilterOk: TcxButton;
    edtDateE: TcxDateEdit;
    edtDateB: TcxDateEdit;
    edtTranCode: TcxTextEdit;
    edtBuyer: ALookupEdit;
    edtClient: ALookupEdit;
    TableViewAccountNumber: TcxGridDBColumn;
    TableViewOperDate: TcxGridDBColumn;
    TableViewBuyerName: TcxGridDBColumn;
    TableViewClientName: TcxGridDBColumn;
    TableViewAmount: TcxGridDBColumn;
    TableViewdiscount: TcxGridDBColumn;
    TableViewSumm: TcxGridDBColumn;
    QueryAccountNumber: TStringField;
    QueryOperDate: TSQLTimeStampField;
    QueryBuyerName: TStringField;
    QueryClientName: TStringField;
    QueryC: TBooleanField;
    QueryAmount: TIntegerField;
    Querydiscount: TCurrencyField;
    QueryBuyerID: TFMTBCDField;
    QueryPartnerID: TFMTBCDField;
    QueryClientID: TFMTBCDField;
    QuerySumm: TCurrencyField;
    edtAVG: TcxCurrencyEdit;
    edtSumT: TcxCurrencyEdit;
    edtSum: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lblCount: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    procedure btnFilterClearClick(Sender: TObject);
    procedure btnFilterOkClick(Sender: TObject);
    procedure edtTranCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClientPropertiesEditValueChanged(Sender: TObject);
    procedure edtBuyerPropertiesEditValueChanged(Sender: TObject);
    procedure GridLayoutChanged(Sender: TcxCustomGrid;
      AGridView: TcxCustomGridView);
    procedure TableViewLeftPosChanged(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }
    procedure DataLoad(); override;

    procedure Summ();
    procedure AdjustEdit();
  end;

var
  Profit_T: TProfit_T;

implementation

uses
  MTLogger, uSql, uImageModule;

{$R *.dfm}


procedure TProfit_T.AdjustEdit;
var
  APoint: TPoint;
begin
//    APoint := TableView.ViewInfo.HeaderViewInfo.Items[TableViewAmount.VisibleIndex].Bounds.TopLeft;
//    APoint := TableView.Site.ClientToScreen(APoint);
//    APoint := edtAVG.Parent.ScreenToClient(APoint);
//    edtAVG.Left := APoint.X;
//    edtAVG.Width:= TableViewAmount.Width-1;


    APoint := TableView.ViewInfo.HeaderViewInfo.Items[TableViewAmount.VisibleIndex].Bounds.TopLeft;
    APoint := TableView.Site.ClientToScreen(APoint);
    APoint := edtSumT.Parent.ScreenToClient(APoint);
    edtSumT.Left := APoint.X;
    edtSumT.Width:= TableViewAmount.Width-1;

    APoint := TableView.ViewInfo.HeaderViewInfo.Items[TableViewSumm.VisibleIndex].Bounds.TopLeft;
    APoint := TableView.Site.ClientToScreen(APoint);
    APoint := edtSum.Parent.ScreenToClient(APoint);
    edtSum.Left := APoint.X;
    edtSum.Width:= TableViewSumm.Width-1;
end;

procedure TProfit_T.btnFilterClearClick(Sender: TObject);
begin
  edtTranCode.Clear;
  edtDateB.Clear;
  edtDateE.Clear;
  edtBuyer.Clear;
  edtClient.Clear;

  TableView.DataController.Filter.Clear;

  DataLoad;
end;

procedure TProfit_T.btnFilterOkClick(Sender: TObject);
begin
  DataLoad;
end;

procedure TProfit_T.DataLoad;
begin
  logger.Info('TProfit_T.DataLoad');
  Query.Close();
//

  if edtTranCode.Text <> '' then
    Query.MacroByName('AccountNumber').Value := ' and p.AccountNumber like ''%'   + edtTranCode.Text + '%'''
  else
    Query.MacroByName('AccountNumber').Value := '';


  if edtDateB.Text <> '' then
    Query.MacroByName('DateB').Value := ' and p.OperDate >= '''   + edtDateB.Text + ''''
  else
    Query.MacroByName('DateB').Value := '';

  if edtDateE.Text <> '' then
    Query.MacroByName('DateE').Value := ' and p.OperDate <= '''   + edtDateE.Text + ''''
  else
    Query.MacroByName('DateE').Value := '';


  if edtBuyer.LookupKey > 0 then
    Query.MacroByName('BuyerID').Value := ' and p.BuyerID = ' + edtBuyer.LookupKey.ToString
  else
    Query.MacroByName('BuyerID').Value := '';

  if edtClient.LookupKey > 0 then
    Query.MacroByName('ClientID').Value := ' and p.ClientID = ' + edtClient.LookupKey.ToString
  else
    Query.MacroByName('ClientID').Value := '';

//  if FormAction = acLookup then
//    Query.MacroByName('LookupFilter').Value := LookupFilter
//  else
//    Query.MacroByName('LookupFilter').Value := '';

  Query.Open();

  Summ;

  inherited;
end;

procedure TProfit_T.edtBuyerPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  DataLoad;
end;

procedure TProfit_T.edtClientPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  DataLoad;
end;

procedure TProfit_T.edtTranCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then DataLoad;
end;

procedure TProfit_T.GridLayoutChanged(Sender: TcxCustomGrid;
  AGridView: TcxCustomGridView);
begin
  AdjustEdit
end;

procedure TProfit_T.Summ;
begin
  TSQL.Q.Close;
  TSQL.Q.SQL.Text :=
  '''
      SELECT Count(*) CNT,
             sum(p.Amount) as edtAVG,
             round(sum((p.Amount * (p.discount/100))), 2) AS Summ
        FROM vTurnoverProfit AS p

    where 1=1

    !DateB
    !DateE

    !BuyerID
    !ClientID

    !AccountNumber
  ''';

  if edtTranCode.Text <> '' then
    TSQL.Q.MacroByName('AccountNumber').Value := ' and p.AccountNumber like ''%'   + edtTranCode.Text + '%'''
  else
    TSQL.Q.MacroByName('AccountNumber').Value := '';


  if edtDateB.Text <> '' then
    TSQL.Q.MacroByName('DateB').Value := ' and p.OperDate >= '''   + edtDateB.Text + ''''
  else
    TSQL.Q.MacroByName('DateB').Value := '';

  if edtDateE.Text <> '' then
    TSQL.Q.MacroByName('DateE').Value := ' and p.OperDate <= '''   + edtDateE.Text + ''''
  else
    TSQL.Q.MacroByName('DateE').Value := '';


  if edtBuyer.LookupKey > 0 then
    TSQL.Q.MacroByName('BuyerID').Value := ' and p.BuyerID = ' + edtBuyer.LookupKey.ToString
  else
    TSQL.Q.MacroByName('BuyerID').Value := '';

  if edtClient.LookupKey > 0 then
    TSQL.Q.MacroByName('ClientID').Value := ' and p.ClientID = ' + edtClient.LookupKey.ToString
  else
    TSQL.Q.MacroByName('ClientID').Value := '';


  TSQL.Q.Open;

  lblCount.Caption := 'Всего транзакций: ' + TSQL.Q.FieldByName('CNT').asString;;
  edtAVG.Value := TSQL.Q.FieldByName('Summ').AsFloat/TSQL.Q.FieldByName('edtAVG').AsFloat;
  edtSumT.Value := TSQL.Q.FieldByName('edtAVG').AsFloat;
  edtSum.Value := TSQL.Q.FieldByName('Summ').AsFloat;
end;

procedure TProfit_T.TableViewLeftPosChanged(Sender: TObject);
begin
  AdjustEdit
end;

initialization
  RegisterClass(TProfit_T);

end.






