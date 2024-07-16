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
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, cxContainer, cxGroupBox,
  System.Skia, Vcl.StdCtrls, cxButtons, cxTextEdit, Vcl.Skia;

type
  TCreditTypesT = class(TBaseFormDBT)
    QueryCreditTypeID: TFMTBCDField;
    QueryName: TStringField;
    QueryisActive: TBooleanField;
    QueryInDateTime: TSQLTimeStampField;
    QueryUserID: TFMTBCDField;
    TableViewCreditTypeID: TcxGridDBColumn;
    TableViewName: TcxGridDBColumn;
    SkLabel1: TSkLabel;
    edtName: TcxTextEdit;
    btnFilterClear: TcxButton;
    btnFilterOk: TcxButton;
    cxButton3: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFilterOkClick(Sender: TObject);
    procedure edtNameKeyDown(Sender: TObject; var Key: Word;
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
  CreditTypesT: TCreditTypesT;

implementation

uses
  uImageModule;

{$R *.dfm}

procedure TCreditTypesT.btnFilterClearClick(Sender: TObject);
begin
  inherited;
  edtName.Clear;
  DataLoad;
end;

procedure TCreditTypesT.btnFilterOkClick(Sender: TObject);
begin
  inherited;
  DataLoad;
end;

procedure TCreditTypesT.cxButton3Click(Sender: TObject);
begin
  inherited;
  edtName.Clear;
  DataLoad;
end;

procedure TCreditTypesT.DataLoad;
begin
  Query.Close;

  if edtName.Text <> '' then
    Query.MacroByName('Name').Value := ' and name like ''%'   + edtName.Text + '%'''
  else
    Query.MacroByName('Name').Value := '';

  Query.Open();
  inherited;
end;

procedure TCreditTypesT.edtNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then DataLoad;
end;

procedure TCreditTypesT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TCreditTypesF';
end;

initialization
  RegisterClass(TCreditTypesT);

end.
