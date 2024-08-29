unit uSupplierClientT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBT, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxContainer, cxGeometry,
  dxFramedControl, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, cxClasses,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  cxImageList, System.Actions, Vcl.ActnList, Vcl.StdCtrls, cxButtons, dxPanel,
  cxGroupBox, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin,
  cxDropDownEdit, cxCalendar, cxCurrencyEdit;

type
  TSupplierClientT = class(TBaseFormDBT)
    QuerySupplierClientID: TFMTBCDField;
    QueryDiscount: TCurrencyField;
    QueryDiscountDate: TSQLTimeStampField;
    QuerySupplierName: TStringField;
    QueryClientName: TStringField;
    TableViewSupplierClientID: TcxGridDBColumn;
    TableViewDiscount: TcxGridDBColumn;
    TableViewDiscountDate: TcxGridDBColumn;
    TableViewSupplierName: TcxGridDBColumn;
    TableViewClientName: TcxGridDBColumn;
    btnFilterClear: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
        procedure DataLoad(); override;
  end;

var
  SupplierClientT: TSupplierClientT;

implementation

uses
  uSql;

{$R *.dfm}

{ TSupplierClientT }

procedure TSupplierClientT.btnFilterClearClick(Sender: TObject);
begin
  TableView.DataController.Filter.Clear;

  DataLoad;
end;

procedure TSupplierClientT.DataLoad;
begin
  inherited;
  Query.Close;

//  if edtName.Text <> '' then
//    Query.MacroByName('Name').Value := ' and name like ''%'   + edtName.Text + '%'''
//  else
//    Query.MacroByName('Name').Value := '';

  Query.Open();
  inherited;
end;

procedure TSupplierClientT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TSupplierClientF';
//
//  TSQL.Open('SELECT distinct KontragentID, Name  FROM [tKontragents] (nolock) where KontragentTypeID = 3', [], []);
//  with TSQL.Q do
//  begin
//    DisableControls;
//    TcxComboBoxProperties( TableViewSupplierName.Properties ).Items.Clear;
//    TcxComboBoxProperties( TableViewSupplierName.Properties ).Items.BeginUpdate;
//    First;
//    while not Eof do
//    begin
//
//      TcxComboBoxProperties( TableViewSupplierName.Properties ).Items.AddObject(FieldByName('Name').AsString, TObject(FieldByName('KontragentID').AsInteger));
//
//      Next;
//    end;
//    TcxComboBoxProperties( TableViewSupplierName.Properties ).Items.EndUpdate;
//    EnableControls;
//  end;

//  TSQL.Open('SELECT distinct KontragentID, Name  FROM [tKontragents] (nolock) where KontragentTypeID = 1', [], []);
//  with TSQL.Q do
//  begin
//    DisableControls;
//    TcxComboBoxProperties( TableViewClientName.Properties ).Items.Clear;
//    TcxComboBoxProperties( TableViewClientName.Properties ).Items.BeginUpdate;
//    First;
//    while not Eof do
//    begin
//
//      TcxComboBoxProperties( TableViewClientName.Properties ).Items.AddObject(FieldByName('Name').AsString, TObject(FieldByName('KontragentID').AsInteger));
//
//      Next;
//    end;
//    TcxComboBoxProperties( TableViewClientName.Properties ).Items.EndUpdate;
//    EnableControls;
//  end;
end;

initialization
  RegisterClass(TSupplierClientT);

end.
