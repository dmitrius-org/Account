unit uExpenseGroupsT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBT, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  cxImageList, Vcl.Menus, System.Actions, Vcl.ActnList, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ComCtrls, Vcl.ToolWin, dxSkinBasic, cxContainer, cxGroupBox,
  System.Skia, Vcl.StdCtrls, cxButtons, cxTextEdit, Vcl.Skia;

type
  TExpenseGroupsT = class(TBaseFormDBT)
    TableViewExpenseGroupID: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    TableViewisActive: TcxGridDBColumn;
    QueryExpenseGroupID: TFMTBCDField;
    QueryName: TStringField;
    QueryisActive: TBooleanField;
    QueryInDateTime: TSQLTimeStampField;
    QueryUserID: TFMTBCDField;
    SkLabel1: TSkLabel;
    edtName: TcxTextEdit;
    cxButton3: TcxButton;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFilterOkClick(Sender: TObject);
    procedure edtNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton3Click(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
  private
    { Private declarations }
  Public
    procedure DataLoad(); override;
  end;

var
  ExpenseGroupsT: TExpenseGroupsT;

implementation

uses
  uImageModule;

{$R *.dfm}

procedure TExpenseGroupsT.btnFilterClearClick(Sender: TObject);
begin
  inherited;
  edtName.Clear;
  DataLoad;
end;

procedure TExpenseGroupsT.btnFilterOkClick(Sender: TObject);
begin
  inherited;
  DataLoad
end;

procedure TExpenseGroupsT.cxButton3Click(Sender: TObject);
begin
  inherited;
  edtName.Clear;
  DataLoad;
end;

procedure TExpenseGroupsT.DataLoad;
begin
  Query.Close;

  if edtName.Text <> '' then
    Query.MacroByName('Name').Value := ' and name like ''%'   + edtName.Text + '%'''
  else
    Query.MacroByName('Name').Value := '';

  Query.Open();
  inherited;
end;

procedure TExpenseGroupsT.edtNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then DataLoad;
end;

procedure TExpenseGroupsT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TExpenseGroupF';
end;

initialization
  RegisterClass(TExpenseGroupsT);

end.
