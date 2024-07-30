unit uTasksT;

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
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, cxContainer, cxGroupBox, Vcl.StdCtrls, cxButtons, cxTextEdit, cxGeometry,
  dxFramedControl, cxLabel, dxPanel;

type
  TTasksT = class(TBaseFormDBT)
    QueryCreateDate: TSQLTimeStampField;
    QueryManager: TWideStringField;
    QueryComment: TStringField;
    QueryDueDate: TSQLTimeStampField;
    QueryTaskStatus: TStringField;
    TableViewCreateDate: TcxGridDBColumn;
    TableViewManager: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    TableViewDueDate: TcxGridDBColumn;
    TableViewTaskStatus: TcxGridDBColumn;
    QueryTaskID: TFMTBCDField;
    edtComment: TcxTextEdit;
    cxButton3: TcxButton;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    cxLabel1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFilterOkClick(Sender: TObject);
    procedure edtCommentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton3Click(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataLoad(); override;

  end;

var
  TasksT: TTasksT;

implementation

uses
  uImageModule;

{$R *.dfm}
procedure TTasksT.btnFilterClearClick(Sender: TObject);
begin
  inherited;
  edtComment.Clear;
  DataLoad;
end;

procedure TTasksT.btnFilterOkClick(Sender: TObject);
begin
  inherited;
  DataLoad
end;

procedure TTasksT.cxButton3Click(Sender: TObject);
begin
  inherited;
  edtComment.Clear;
    DataLoad;
end;

procedure TTasksT.DataLoad;
begin
  Query.Close;

  if edtComment.Text <> '' then
    Query.MacroByName('Comment').Value := ' and t.Comment like ''%'   + edtComment.Text + '%'''
  else
    Query.MacroByName('Comment').Value := '';

  Query.Open();
  inherited;
end;

procedure TTasksT.edtCommentKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if Key = 13 then DataLoad;
end;

procedure TTasksT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TTasksF';
end;

initialization
  RegisterClass(TTasksT);
end.
