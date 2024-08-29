unit uAuditT;

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
  cxCalendar, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TAuditT = class(TBaseFormDBT)
    QueryObjectType: TWideStringField;
    QueryObjectTypeID: TFMTBCDField;
    QueryAction: TStringField;
    QueryComment: TStringField;
    QueryUserBrief: TWideStringField;
    QueryUserName: TWideStringField;
    QueryInDateTime: TSQLTimeStampField;
    TableViewObjectType: TcxGridDBColumn;
    TableViewObjectTypeID: TcxGridDBColumn;
    TableViewAction: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    TableViewUserBrief: TcxGridDBColumn;
    TableViewUserName: TcxGridDBColumn;
    TableViewInDateTime: TcxGridDBColumn;
    edtObjectType: TcxLookupComboBox;
    cxLabel10: TcxLabel;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    qObjectType: TFDQuery;
    dsObjectType: TDataSource;
    qObjectTypeObjectTypeID: TFMTBCDField;
    qObjectTypeBrief: TWideStringField;
    QueryObjectID: TFMTBCDField;
    TableViewObjectID: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnFilterOkClick(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure DataLoad(); override;
  end;

var
  AuditT: TAuditT;

implementation

{$R *.dfm}

{ TAuditT }

procedure TAuditT.btnFilterClearClick(Sender: TObject);
begin
  edtObjectType.Clear;

  TableView.DataController.Filter.Clear;

  DataLoad;
end;

procedure TAuditT.btnFilterOkClick(Sender: TObject);
begin
  inherited;
  DataLoad;
end;

procedure TAuditT.DataLoad;
begin
  Query.Close;

//  if edtName.Text <> '' then
//    Query.MacroByName('Name').Value := ' and e.name like ''%'   + edtName.Text + '%'''
//  else
//    Query.MacroByName('Name').Value := '';
  if edtObjectType.text <> '' then
    Query.MacroByName('ObjectType').Value := ' and a.ObjectTypeID in (' + Integer(edtObjectType.EditValue).ToString + ')'
  else
    Query.MacroByName('ObjectType').Value := '';

  Query.Open();
  inherited;
end;

procedure TAuditT.FormShow(Sender: TObject);
begin
  inherited;

  qObjectType.Close;
  qObjectType.Open;
end;

initialization
  RegisterClass(TAuditT);

end.
