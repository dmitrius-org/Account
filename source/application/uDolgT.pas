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
  System.Skia, Vcl.StdCtrls, cxButtons, Vcl.Skia, cxTextEdit, cxMaskEdit,
  uLookupEdit;

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
    cxStyleRepository: TcxStyleRepository;
    GridHeader: TcxStyle;
    GridBaground: TcxStyle;
    GridRowSelect: TcxStyle;
    edtBuyer: ALookupEdit;
    SkLabel8: TSkLabel;
    btnFilterClear: TcxButton;
    btnFilterOk: TcxButton;
    edtPartner: ALookupEdit;
    SkLabel1: TSkLabel;
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
    SkLabel13: TSkLabel;
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
    procedure cxButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure DataLoadBuyer();
    procedure DataLoadClient();

    procedure SetActionEnabled();
  end;

var
  DolgT: TDolgT;

implementation

uses
  uCommonType, MTLogger, uSql, uImageModule, uDebsHistoryBuyerT, uDebsHistoryClientT;

{$R *.dfm}

{ TDolgT }

procedure TDolgT.actHistoryBuyerExecute(Sender: TObject);
var DebsHistoryBuyer: TDebsHistoryBuyerT;
begin
  DebsHistoryBuyer:= TDebsHistoryBuyerT.Create(self);
  DebsHistoryBuyer.ID := TableViewBuyerID.EditValue;
  DebsHistoryBuyer.Caption := 'История долга по ' + TableViewBuyerName.EditValue;
  DebsHistoryBuyer.ShowModal;
  DebsHistoryBuyer.Free;

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

procedure TDolgT.cxButton6Click(Sender: TObject);
var DebsHistoryClient: TDebsHistoryClientT;
begin
  DebsHistoryClient:= TDebsHistoryClientT.Create(self);
  DebsHistoryClient.ID := TableViewClientClientID.EditValue;
  DebsHistoryClient.Caption := 'История долга по ' + TableViewBuyerName.EditValue;
  DebsHistoryClient.ShowModal;
  DebsHistoryClient.Free;
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

procedure TDolgT.FormShow(Sender: TObject);
begin
  inherited;
  DataLoadBuyer;
  DataLoadClient;
end;

procedure TDolgT.SetActionEnabled;
begin


end;

initialization
  RegisterClass(TDolgT);

end.
