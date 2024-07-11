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
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, cxContainer, cxGroupBox;

type
  TExpenseItemsT = class(TBaseFormDBT)
    QueryExpenseItemID: TFMTBCDField;
    QueryExpenseGroup: TStringField;
    QueryName: TStringField;
    QueryisActive: TBooleanField;
    QueryInDateTime: TSQLTimeStampField;
    QueryUserID: TFMTBCDField;
    TableViewExpenseItemID: TcxGridDBColumn;
    TableViewExpenseGroup: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    actGroup: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure actGroupExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataLoad(); override;
  end;

var
  ExpenseItemsT: TExpenseItemsT;

implementation

uses
  uExpenseGroupsT;

{$R *.dfm}

procedure TExpenseItemsT.actGroupExecute(Sender: TObject);
var Group:TExpenseGroupsT;
begin
  inherited;
  Group := TExpenseGroupsT.Create(self);
  Group.ShowModal;
  Group.Free;
end;

procedure TExpenseItemsT.DataLoad;
begin
  Query.Close;
  Query.Open();
  inherited;
end;

procedure TExpenseItemsT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TExpenseItemsF';
end;
initialization
  RegisterClass(TExpenseItemsT);
end.
