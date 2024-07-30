unit uStatisticT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBT, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxContainer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxClasses, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, cxImageList, Vcl.Menus, System.Actions, Vcl.ActnList, cxGroupBox,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, dxCore,
  cxDateUtils, Vcl.StdCtrls, cxButtons, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel, System.Skia, Vcl.Skia;

type
  TStatisticT = class(TBaseFormDBT)
    QueryID: TFMTBCDField;
    QuerySpid: TFMTBCDField;
    QueryName: TStringField;
    QueryRest: TCurrencyField;
    QueryCnt: TIntegerField;
    TableViewName: TcxGridDBColumn;
    TableViewRest: TcxGridDBColumn;
    TableViewCnt: TcxGridDBColumn;
    edtType: TcxLookupComboBox;
    edtDateE: TcxDateEdit;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    edtDateB: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure btnFilterOkClick(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
    procedure edtDateBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataLoad(); override;
  end;

var
  StatisticT: TStatisticT;

implementation

{$R *.dfm}

{ TStatisticT }

procedure TStatisticT.btnFilterClearClick(Sender: TObject);
begin
  edtType.Clear;
  edtDateB.Clear;
  edtDateE.Clear;

  DataLoad
end;

procedure TStatisticT.btnFilterOkClick(Sender: TObject);
begin
  DataLoad
end;

procedure TStatisticT.DataLoad;
begin
  Query.Close;

  if edtDateB.Text <> '' then
    Query.ParamByName('DateBegin').value := edtDateB.Text
  else
    Query.ParamByName('DateBegin').value := null;

  if edtDateE.Text <> '' then
    Query.ParamByName('DateEnd').value := edtDateE.Text
  else
    Query.ParamByName('DateEnd').value := null;

  Query.Open();

  inherited;
end;

procedure TStatisticT.edtDateBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then DataLoad;
end;

initialization
  RegisterClass(TStatisticT);
end.
