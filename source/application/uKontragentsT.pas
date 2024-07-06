unit uKontragentsT;

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
  TKontragentsT = class(TBaseFormDBT)
    QueryKontragentID: TFMTBCDField;
    QueryKontragentType: TStringField;
    QueryKontragentName: TStringField;
    QueryINN: TStringField;
    QueryDiscount: TFloatField;
    QueryDiscountDate: TSQLTimeStampField;
    QueryPartnerName: TStringField;
    TableViewKontragentID: TcxGridDBColumn;
    TableViewKontragentType: TcxGridDBColumn;
    TableViewKontragentName: TcxGridDBColumn;
    TableViewINN: TcxGridDBColumn;
    TableViewDiscount: TcxGridDBColumn;
    TableViewDiscountDate: TcxGridDBColumn;
    TableViewPartnerName: TcxGridDBColumn;
    QueryKontragentTypeID: TFMTBCDField;
    AddMenu: TPopupMenu;
    pmAddClient: TMenuItem;
    pmAddBuyer: TMenuItem;
    pmAddSupplier: TMenuItem;
    N11: TMenuItem;
    actAddBuyer: TAction;
    actAddSupplier: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    actAddClient: TAction;
    procedure actEditExecute(Sender: TObject);
    procedure actAddBuyerExecute(Sender: TObject);
    procedure actAddSupplierExecute(Sender: TObject);
    procedure actAddClientExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KontragentsT: TKontragentsT;

implementation

{$R *.dfm}
procedure TKontragentsT.actAddBuyerExecute(Sender: TObject);
begin
  EditFormClass := 'TBuyerF';
  actAddExecute(Sender);
end;

procedure TKontragentsT.actAddClientExecute(Sender: TObject);
begin
  EditFormClass := 'TClientF';
  actAddExecute(Sender);
end;

procedure TKontragentsT.actAddSupplierExecute(Sender: TObject);
begin
  EditFormClass := 'TClientF';
  actAddExecute(Sender);
end;

procedure TKontragentsT.actEditExecute(Sender: TObject);
begin
  case Query.fieldByname('KontragentTypeID').Value of
      1:
        EditFormClass := 'TClientF';
      2:
        EditFormClass := 'TBuyerF';
      3:
        EditFormClass := 'TClientF';
  end;
  inherited;
end;

initialization
  RegisterClass(TKontragentsT);
end.
                   s