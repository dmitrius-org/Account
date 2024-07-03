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
  cxGrid, Vcl.ComCtrls, Vcl.ToolWin, dxSkinBasic;

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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   // Public declarations }
  end;

var
  ExpenseGroupsT: TExpenseGroupsT;

implementation

{$R *.dfm}

procedure TExpenseGroupsT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TExpenseGroupF';
end;

initialization
  RegisterClass(TExpenseGroupsT);

end.
