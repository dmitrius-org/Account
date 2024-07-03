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
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KontragentsT: TKontragentsT;

implementation

uses
  uKontragentsChose;

{$R *.dfm}
procedure TKontragentsT.actAddExecute(Sender: TObject);
var
  KontragentsChose: TKontragentsChose;
  result: TModalResult;
begin
  KontragentsChose:= TKontragentsChose.create(self);

  result := KontragentsChose.ShowModal;

  if result = mrOk then
  begin

    case KontragentsChose.KType.EditValue of
      1:
        EditFormClass := 'TClientF';
      2:
        EditFormClass := 'TClientF';
      3:
        EditFormClass := 'TClientF';
    end;

    inherited;
  end;

  KontragentsChose.free;

end;

procedure TKontragentsT.actEditExecute(Sender: TObject);
begin
  case Query.fieldByname('KontragentTypeID').Value of
      1:
        EditFormClass := 'TClientF';
      2:
        EditFormClass := 'TClientF';
      3:
        EditFormClass := 'TClientF';
  end;
  inherited;
end;

initialization
  RegisterClass(TKontragentsT);
end.
                   s