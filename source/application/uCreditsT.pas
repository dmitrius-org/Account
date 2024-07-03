unit uCreditsT;

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
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin;

type
  TCreditsT = class(TBaseFormDBT)
    QueryCreditID: TFMTBCDField;
    QueryCreditType: TStringField;
    QueryCreditDate: TSQLTimeStampField;
    QueryAmount: TFloatField;
    QueryRest: TBCDField;
    QueryComment: TStringField;
    TableViewCreditID: TcxGridDBColumn;
    TableViewCreditType: TcxGridDBColumn;
    TableViewCreditDate: TcxGridDBColumn;
    TableViewAmount: TcxGridDBColumn;
    TableViewRest: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    QueryPayAmount: TFloatField;
    TableViewPayAmount: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreditsT: TCreditsT;

implementation

{$R *.dfm}


initialization
  RegisterClass(TCreditsT);

end.
