unit uDebsHistoryClientT;

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
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, cxGridExportLink,
  Vcl.OleAuto, dxSkinBasic;

type
  TDebsHistoryClientT = class(TBaseFormDBT)
    actExportToExcel: TAction;
    TableViewOperDate: TcxGridDBColumn;
    TableViewClientName: TcxGridDBColumn;
    TableViewSupplierName: TcxGridDBColumn;
    TableViewdebet: TcxGridDBColumn;
    TableViewDiscount: TcxGridDBColumn;
    TableViewAmountDiscount: TcxGridDBColumn;
    TableViewcredit: TcxGridDBColumn;
    TableViewbalance: TcxGridDBColumn;
    ToolButton1: TToolButton;
    QueryOperDate: TSQLTimeStampField;
    QueryClientName: TStringField;
    QuerySupplierName: TStringField;
    Querydebet: TCurrencyField;
    QueryDiscount: TCurrencyField;
    QueryAmountDiscount: TCurrencyField;
    Querycredit: TCurrencyField;
    Querybalance: TCurrencyField;
    QueryClientID: TFMTBCDField;
    QueryPartnerID: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure actExportToExcelExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataLoad(); override;
  end;

var
  DebsHistoryClientT: TDebsHistoryClientT;



implementation

uses
  MTLogger;

{$R *.dfm}

{ TDebsHistoryBuyerT }

procedure TDebsHistoryClientT.actExportToExcelExecute(Sender: TObject);
var
  SaveDialog: TSaveDialog;　　
  path: string; // path information
  Excelapp: variant; // Variation variables
begin
  SaveDialog := TSaveDialog.Create(nil);
  path := '';
  try
    with SaveDialog do
    begin
      FileName := StringReplace(Self.Caption, '.', '',[rfReplaceAll]) + ' ' + FormatDateTime('YYYYMMDD', Now ()); // default file name
      Filter := '*.xls|*.xls|*.xlsx|*.xlsx|';
      if Execute then
      begin
        case FilterIndex of
          1:
            ExportGridToExcel(FileName, grid, true, true, true, 'xls');
          2:
            ExportGridToXLSX(FileName, grid, true, true, true, 'xlsx');  //2007
        end;
      end;
    end;
  finally

    case SaveDialog.FilterIndex of
      1:
        path := SaveDialog.FileName + '.xls';
      2:
        path := SaveDialog.FileName + '.xlsx';  //2007
    end;


    logger.Info(path);

    SaveDialog.Free;
  end;

  if path <> '' then     //open a file
  begin
    ExcelAPP := CreateOleObject('Excel.Application'); // Create an excel object
    ExcelAPP.Visible := false;
    Excelapp.Workbooks.open (path); // Use Excel's method to open the file
    ExcelAPP.WorkSheets[1].Activate; // The file operation, here is no different from the VBA operation anymore
    ExcelAPP.Visible :=  True; // Show out
  end;
end;

procedure TDebsHistoryClientT.actRefreshExecute(Sender: TObject);
begin
  inherited;
  DataLoad
end;

procedure TDebsHistoryClientT.DataLoad;
begin
  inherited;
  Query.Close();

  Query.ParamByName('ClientID').AsInteger := id;

  Query.Open();
end;

procedure TDebsHistoryClientT.FormShow(Sender: TObject);
begin
  inherited;
  DataLoad
end;

initialization
  RegisterClass(TDebsHistoryClientT);

end.
