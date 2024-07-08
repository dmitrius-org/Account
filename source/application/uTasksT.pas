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
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, cxContainer, cxGroupBox;

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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasksT: TTasksT;

implementation

{$R *.dfm}
procedure TTasksT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TTasksF';
end;

initialization
  RegisterClass(TTasksT);
end.
