unit uDolgT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormT, System.ImageList,
  Vcl.ImgList, cxImageList, cxGraphics, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, cxContainer,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,uLookupEdit, cxCurrencyEdit,
  cxLabel;

type
  TDolgT = class(TBaseFormT)
    PageControl: TPageControl;
    tabBuyer: TTabSheet;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    TabClient: TTabSheet;
    qBuyer: TFDQuery;
    DSBuyer: TDataSource;
    Panel1: TPanel;
    PanelBuyer: TPanel;
    qBuyerBuyerID: TFMTBCDField;
    qBuyerBuyerName: TStringField;
    qBuyerbalance: TCurrencyField;
    TableViewBuyerID: TcxGridDBColumn;
    TableViewBuyerName: TcxGridDBColumn;
    TableViewbalance: TcxGridDBColumn;
    PopupMenuBuyer: TPopupMenu;
    actRefreshBuyer: TAction;
    actRefreshBuyer1: TMenuItem;
    edtBuyer: ALookupEdit;
    btnFilterClear: TcxButton;
    btnFilterOk: TcxButton;
    edtPartner: ALookupEdit;
    cxButton1: TcxButton;
    actAddKassaKreditRequest: TAction;
    cxButton2: TcxButton;
    actHistoryBuyer: TAction;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    Panel2: TPanel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton6: TcxButton;
    GridClient: TcxGrid;
    TableViewClient: TcxGridDBTableView;
    GridLevelClient: TcxGridLevel;
    qClient: TFDQuery;
    dsClient: TDataSource;
    actHistoryClient: TAction;
    edtClient: ALookupEdit;
    qClientClientID: TFMTBCDField;
    qClientClientName: TStringField;
    qClientbalance: TCurrencyField;
    TableViewClientClientID: TcxGridDBColumn;
    TableViewClientClientName: TcxGridDBColumn;
    TableViewClientbalance: TcxGridDBColumn;
    actRefreshClient: TAction;
    PopupMenuClient: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    cxStyleRepository: TcxStyleRepository;
    GridHeader: TcxStyle;
    GridBaground: TcxStyle;
    GridRowSelect: TcxStyle;
    GridRow: TcxStyle;
    edtTotal: TcxCurrencyEdit;
    edtSClient: TcxCurrencyEdit;
    edtSBuyer: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    procedure actRefreshBuyerExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
    procedure edtBuyerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPartnerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFilterOkClick(Sender: TObject);
    procedure actHistoryBuyerExecute(Sender: TObject);
    procedure edtClientKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure actRefreshClientExecute(Sender: TObject);
    procedure actHistoryClientExecute(Sender: TObject);
    procedure actAddKassaKreditRequestExecute(Sender: TObject);
    procedure PageControlDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure DataLoadBuyer();
    procedure DataLoadClient();

    procedure SetActionEnabled();

    procedure   sum();
  end;

var
  DolgT: TDolgT;

implementation

uses
  uCommonType, MTLogger, uSql, uImageModule, uDebsHistoryBuyerT, uDebsHistoryClientT, uBaseFormDBT, uTransactionF, uDataModule;

{$R *.dfm}

{ TDolgT }

procedure TDolgT.actAddKassaKreditRequestExecute(Sender: TObject);
var TransactionF: TTransactionF;
begin
  // заявка на расход
  TransactionF:= TTransactionF.Create(self);
  TransactionF.ID := TableViewBuyerID.EditValue;
  TransactionF.FormAction := acRequest;
  TransactionF.KassaID := 1;
  TransactionF.edtKontragent.LookupKey := TableViewBuyerID.EditValue;
  TransactionF.ShowModal;
  TransactionF.Free;
end;

procedure TDolgT.actHistoryBuyerExecute(Sender: TObject);
var DebsHistoryBuyer: TDebsHistoryBuyerT;
begin
  DebsHistoryBuyer:= TDebsHistoryBuyerT.Create(self);
  DebsHistoryBuyer.ID := TableViewBuyerID.EditValue;
  DebsHistoryBuyer.Caption := 'История долга ' + TableViewBuyerName.EditValue;
  DebsHistoryBuyer.ShowModal;
  DebsHistoryBuyer.Free;
end;

procedure TDolgT.actHistoryClientExecute(Sender: TObject);
var DebsHistoryClient: TDebsHistoryClientT;
begin
  DebsHistoryClient:= TDebsHistoryClientT.Create(self);
  DebsHistoryClient.ID := TableViewClientClientID.EditValue;
  DebsHistoryClient.Caption := 'История долга ' + TableViewClientClientName.EditValue;
  DebsHistoryClient.ShowModal;
  DebsHistoryClient.Free;
end;

procedure TDolgT.actRefreshBuyerExecute(Sender: TObject);
begin
  DataLoadBuyer;
end;

procedure TDolgT.actRefreshClientExecute(Sender: TObject);
begin
  DataLoadClient;
end;

procedure TDolgT.btnFilterClearClick(Sender: TObject);
begin
  edtBuyer.Clear;
  edtPartner.Clear;

  DataLoadBuyer;
end;

procedure TDolgT.btnFilterOkClick(Sender: TObject);
begin
  DataLoadBuyer;
end;

procedure TDolgT.cxButton3Click(Sender: TObject);
begin
  edtClient.Clear;
  DataLoadClient;
end;

procedure TDolgT.cxButton4Click(Sender: TObject);
begin
  DataLoadClient;
end;

procedure TDolgT.DataLoadBuyer;
begin
  logger.Info('TDolgT.DataLoadBuyer');
  qBuyer.Close();

  if edtBuyer.LookupKey > 0 then
    qBuyer.MacroByName('Buyer').Value := ' and BuyerID = ' + edtBuyer.LookupKey.ToString
  else
    qBuyer.MacroByName('Buyer').Value := '';

  if edtPartner.LookupKey > 0 then
    qBuyer.MacroByName('Partner').Value := ' and PartnerID = ' + edtPartner.LookupKey.ToString
  else
    qBuyer.MacroByName('Partner').Value := '';


//  if FormAction = acLookup then
//    Query.MacroByName('LookupFilter').Value := LookupFilter
//  else
//    Query.MacroByName('LookupFilter').Value := '';

  qBuyer.Open();
end;

procedure TDolgT.DataLoadClient;
begin
  logger.Info('TDolgT.DataLoadClient');
  qClient.Close();

  if edtClient.LookupKey > 0 then
    qClient.MacroByName('Client').Value := ' and ClientID = ' + edtClient.LookupKey.ToString
  else
    qClient.MacroByName('Client').Value := '';



//  if FormAction = acLookup then
//    Query.MacroByName('LookupFilter').Value := LookupFilter
//  else
//    Query.MacroByName('LookupFilter').Value := '';

  qClient.Open();
end;

procedure TDolgT.edtBuyerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then DataLoadClient;
end;

procedure TDolgT.edtClientKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then DataLoadBuyer;
end;

procedure TDolgT.edtPartnerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then DataLoadBuyer;
end;

procedure TDolgT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  if Self.FormStyle = fsMDIChild then
//    DM.OpenFormList.Delete(DM.OpenFormList.IndexOf(Self.ClassName));

  Action := caFree;
end;

procedure TDolgT.FormShow(Sender: TObject);
begin
  inherited;
  DataLoadBuyer;
  DataLoadClient;

  sum;
end;

procedure TDolgT.PageControlDrawTab(Control: TCustomTabControl;
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

procedure TDolgT.SetActionEnabled;
begin


end;

procedure TDolgT.sum;
begin

  TSql.Open('''
    select  sum(iif(source = 'Kassa', round(D*Amount / ((100-isnull(Discount, 0)) / 100), 0),
                                      round(D*Amount * ((100-isnull(Discount, 0)) / 100), 0))
           ) AS balance
      FROM vTurnoverBuyer
  ''', [], []) ;

  edtSBuyer.Value :=  TSql.q.FieldByName('balance').AsFloat;

  TSql.Open('''
    select sum(iif(source = 'Kassa', round(D*Amount, 0),
                                     round(D*Amount * ((100-isnull(Discount, 0)) / 100), 0))
           ) AS balance
      FROM vTurnoverClient
  '''  , [], []) ;

  edtSClient.Value :=  TSql.q.FieldByName('balance').AsFloat;

  edtTotal.Value := edtSClient.Value + edtSBuyer.Value;
end;

initialization
  RegisterClass(TDolgT);

end.
