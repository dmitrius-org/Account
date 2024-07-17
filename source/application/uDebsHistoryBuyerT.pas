unit uDebsHistoryBuyerT;

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
  Vcl.OleAuto;

type
  TDebsHistoryBuyerT = class(TBaseFormDBT)
    actExportToExcel: TAction;
    QueryOperDate: TSQLTimeStampField;
    QueryBuyerName: TStringField;
    QuerySupplierName: TStringField;
    Querydebet: TCurrencyField;
    QueryDiscount: TCurrencyField;
    QueryAmountDiscount: TCurrencyField;
    Querycredit: TCurrencyField;
    Querybalance: TCurrencyField;
    QueryBuyerID: TFMTBCDField;
    QueryPartnerID: TFMTBCDField;
    TableViewOperDate: TcxGridDBColumn;
    TableViewBuyerName: TcxGridDBColumn;
    TableViewSupplierName: TcxGridDBColumn;
    TableViewdebet: TcxGridDBColumn;
    TableViewDiscount: TcxGridDBColumn;
    TableViewAmountDiscount: TcxGridDBColumn;
    TableViewcredit: TcxGridDBColumn;
    TableViewbalance: TcxGridDBColumn;
    ToolButton1: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure actExportToExcelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataLoad(); override;
  end;

var
  DebsHistoryBuyerT: TDebsHistoryBuyerT;



implementation

{$R *.dfm}

{ TDebsHistoryBuyerT }

procedure TDebsHistoryBuyerT.actExportToExcelExecute(Sender: TObject);
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
      FileName := Self.Caption + ' ' + FormatDateTime('YYYYMMDD', Now ()); // default file name
      Filter := '*.xls|*.xls|*.xlsx|*.xlsx|';
      if Execute then
      begin
        case SaveDialog.FilterIndex of
          1:
            ExportGridToExcel(SaveDialog.FileName, grid, true, true, true, 'xls');
          2:
            ExportGridToXLSX(SaveDialog.FileName, grid, true, true, true, 'xlsx');  //2007
        end;
      end;
    end;
  finally
    path := SaveDialog.FileName;
    SaveDialog.Free;
  end;

  if path <> '' then     //open a file
  begin
    ExcelAPP := CreateOleObject('Excel.Application'); // Create an excel object
    ExcelAPP.Visible := false;
         Excelapp.Workbooks.open (PATH); // Use Excel's method to open the file
    ExcelAPP.WorkSheets[1] .Activate; // The file operation, here is no different from the VBA operation anymore
    ExcelAPP.Visible :=  True; // Show out
  end;
end;

procedure TDebsHistoryBuyerT.DataLoad;
begin
  inherited;
  Query.Close();

  Query.ParamByName('BuyerID').AsInteger := id;

  Query.Open();
end;

procedure TDebsHistoryBuyerT.FormShow(Sender: TObject);
begin
  inherited;
  DataLoad
end;

initialization
  RegisterClass(TDebsHistoryBuyerT);

end.
