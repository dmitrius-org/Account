unit uCreditTypesT;

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
  TCreditTypesT = class(TBaseFormDBT)
    QueryCreditTypeID: TFMTBCDField;
    QueryName: TStringField;
    QueryisActive: TBooleanField;
    QueryInDateTime: TSQLTimeStampField;
    QueryUserID: TFMTBCDField;
    TableViewCreditTypeID: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataLoad(); override;
  end;

var
  CreditTypesT: TCreditTypesT;

implementation

{$R *.dfm}

procedure TCreditTypesT.DataLoad;
begin
  Query.Close;
  Query.Open();
  inherited;
end;

procedure TCreditTypesT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TCreditTypesF';
end;

initialization
  RegisterClass(TCreditTypesT);

end.
