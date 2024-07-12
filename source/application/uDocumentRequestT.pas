unit uDocumentRequestT;

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
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, dxCore, cxDateUtils,
  System.Skia, cxTextEdit, Vcl.Skia, cxMaskEdit, cxDropDownEdit, cxCalendar,
  uLookupEdit, Vcl.StdCtrls, cxButtons;

type
  TDocumentRequestT = class(TBaseFormDBT)
    edtAccountDate: TcxDateEdit;
    SkLabel5: TSkLabel;
    edtAccountNumber: TcxTextEdit;
    SkLabel1: TSkLabel;
    edtBuyer: ALookupEdit;
    edtSupplier: ALookupEdit;
    SkLabel12: TSkLabel;
    SkLabel8: TSkLabel;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    edtPhone: TcxTextEdit;
    SkLabel2: TSkLabel;
    SkLabel3: TSkLabel;
    QueryDocumentRequestID: TFMTBCDField;
    QueryPayDate: TSQLTimeStampField;
    QueryAccountNumber: TStringField;
    QueryPhone: TStringField;
    QueryMail: TStringField;
    QuerySupplierName: TStringField;
    QuerySupplierInn: TStringField;
    QueryBuyerName: TStringField;
    QueryBuyerInn: TStringField;
    TableViewDocumentRequestID: TcxGridDBColumn;
    TableViewPayDate: TcxGridDBColumn;
    TableViewAccountNumber: TcxGridDBColumn;
    TableViewPhone: TcxGridDBColumn;
    TableViewMail: TcxGridDBColumn;
    TableViewSupplierName: TcxGridDBColumn;
    TableViewSupplierInn: TcxGridDBColumn;
    TableViewBuyerName: TcxGridDBColumn;
    TableViewBuyerInn: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure edtAccountNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure DataLoad(); override;
  public
    { Public declarations }
  end;

var
  DocumentRequestT: TDocumentRequestT;

implementation

{$R *.dfm}


procedure TDocumentRequestT.DataLoad;
begin
  Query.Close();

  if edtAccountNumber.Text <> '' then
    Query.MacroByName('AccountNumber').Value := ' and dr.AccountNumber like ''%'   + edtAccountNumber.Text + '%'''
  else
    Query.MacroByName('AccountNumber').Value := '';

  if edtAccountDate.Text <> '' then
    Query.MacroByName('PayDate').Value := ' and dr.PayDate = '''   + edtAccountDate.Text + ''''
  else
    Query.MacroByName('PayDate').Value := '';

  if edtBuyer.LookupKey > 0 then
    Query.MacroByName('Buyer').Value := ' and dr.BuyerID = ' + edtBuyer.LookupKey.ToString
  else
    Query.MacroByName('Buyer').Value := '';

  if edtSupplier.LookupKey > 0 then
    Query.MacroByName('Supplier').Value := ' and dr.SupplierID = ' + edtSupplier.LookupKey.ToString
  else
    Query.MacroByName('Supplier').Value := '';

  if edtPhone.Text <> '' then
    Query.MacroByName('Phone').Value := ' and dr.Phone like ''%'   + edtPhone.Text + '%'''
  else
    Query.MacroByName('Phone').Value := '';

  Query.Open();
  inherited;
end;

procedure TDocumentRequestT.edtAccountNumberKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then DataLoad;
end;

procedure TDocumentRequestT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TDocumentRequestF';
end;

initialization
  RegisterClass(TDocumentRequestT);
end.
