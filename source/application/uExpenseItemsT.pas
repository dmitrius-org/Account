unit uExpenseItemsT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBT, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxClasses, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, cxImageList, Vcl.Menus, System.Actions, Vcl.ActnList,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, cxContainer, cxGroupBox,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  uLookupEdit, cxGeometry, dxFramedControl, cxLabel, dxPanel;

type
  TExpenseItemsT = class(TBaseFormDBT)
    QueryExpenseItemID: TFMTBCDField;
    QueryExpenseGroup: TStringField;
    QueryName: TStringField;
    QueryisActive: TBooleanField;
    QueryInDateTime: TSQLTimeStampField;
    TableViewExpenseItemID: TcxGridDBColumn;
    TableViewExpenseGroup: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    actGroup: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    edtName: TcxTextEdit;
    cxButton3: TcxButton;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    edtExpenseGroup: ALookupEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure actGroupExecute(Sender: TObject);
    procedure btnFilterOkClick(Sender: TObject);
    procedure edtNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton3Click(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
    procedure edtExpenseGroupPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataLoad(); override;
    procedure SetActionEnabled(); override;

  end;

var
  ExpenseItemsT: TExpenseItemsT;

implementation

uses
  uExpenseGroupsT, uImageModule;

{$R *.dfm}

procedure TExpenseItemsT.actGroupExecute(Sender: TObject);
var Group:TExpenseGroupsT;
begin
  Group := TExpenseGroupsT.Create(self);
  Group.ShowModal;
  Group.Free;
end;

procedure TExpenseItemsT.btnFilterClearClick(Sender: TObject);
begin
  inherited;
  edtName.Clear;

  TableView.DataController.Filter.Clear;

  DataLoad;
end;

procedure TExpenseItemsT.btnFilterOkClick(Sender: TObject);
begin
  inherited;
  DataLoad
end;

procedure TExpenseItemsT.cxButton3Click(Sender: TObject);
begin
  inherited;
  edtName.Clear;
  DataLoad;
end;

procedure TExpenseItemsT.DataLoad;
begin
  Query.Close;

  if edtName.Text <> '' then
    Query.MacroByName('Name').Value := ' and e.name like ''%'   + edtName.Text + '%'''
  else
    Query.MacroByName('Name').Value := '';

  if edtExpenseGroup.LookupKey > 0 then
    Query.MacroByName('ExpenseGroup').Value := ' and e.ExpenseGroupID = ' + edtExpenseGroup.LookupKey.ToString
  else
    Query.MacroByName('ExpenseGroup').Value := '';

  Query.Open();
  inherited;
end;

procedure TExpenseItemsT.edtExpenseGroupPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if AButtonIndex = 1 then
  begin
    DataLoad;
  end;
end;

procedure TExpenseItemsT.edtNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if Key = 13 then DataLoad;
end;

procedure TExpenseItemsT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TExpenseItemsF';
end;
procedure TExpenseItemsT.SetActionEnabled;
begin
  inherited;
  actGroup.Enabled := (actGroup.Tag = 1);
end;

initialization
  RegisterClass(TExpenseItemsT);
end.
