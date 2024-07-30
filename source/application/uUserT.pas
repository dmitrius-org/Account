unit uUserT;

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
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxGeometry, dxFramedControl,
  cxLabel, dxPanel;

type
  TUserT = class(TBaseFormDBT)
    QueryUserID: TFMTBCDField;
    QueryBrief: TWideStringField;
    QueryName: TWideStringField;
    QueryisAdmin: TBooleanField;
    QueryisBlock: TBooleanField;
    QueryDateBlock: TSQLTimeStampField;
    QueryinDatetime: TSQLTimeStampField;
    QueryupDatetime: TSQLTimeStampField;
    TableViewUserID: TcxGridDBColumn;
    TableViewBrief: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    TableViewisAdmin: TcxGridDBColumn;
    TableViewisBlock: TcxGridDBColumn;
    edtLogin: TcxTextEdit;
    cxButton3: TcxButton;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    actAccess: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    N8: TMenuItem;
    N9: TMenuItem;
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    procedure btnFilterClearClick(Sender: TObject);
    procedure btnFilterOkClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure edtLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure actAccessExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataLoad(); override;
    procedure SetActionEnabled(); override;
  end;

var
  UserT: TUserT;

implementation

uses
  uImageModule, uCommonType, uUserAccess;

{$R *.dfm}

{ TUserT }

procedure TUserT.actAccessExecute(Sender: TObject);
var UserAccess: TUserAccess;
begin
  UserAccess:= TUserAccess.Create(self);
  UserAccess.ID := TableViewUserID.EditValue;
  UserAccess.FormAction:= acUpdate;
  UserAccess.ShowModal;
  UserAccess.Free;

end;

procedure TUserT.btnFilterClearClick(Sender: TObject);
begin
  edtLogin.Clear;
  DataLoad;
end;

procedure TUserT.btnFilterOkClick(Sender: TObject);
begin
  DataLoad;
end;

procedure TUserT.cxButton3Click(Sender: TObject);
begin
  edtLogin.Clear;
  DataLoad;
end;

procedure TUserT.DataLoad;
begin
  Query.Close;

  if edtLogin.Text <> '' then
    Query.MacroByName('Brief').Value := ' and Brief like ''%'   + edtLogin.Text + '%'''
  else
    Query.MacroByName('Brief').Value := '';

  Query.Open();
  inherited;
end;

procedure TUserT.edtLoginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then DataLoad;
end;

procedure TUserT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TUserF';
end;


procedure TUserT.SetActionEnabled;
begin
  inherited;
  actAccess.Enabled := (actAccess.Tag = 1);
end;

initialization
  RegisterClass(TUserT);
end.
