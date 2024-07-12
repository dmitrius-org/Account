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
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, cxContainer, cxGroupBox,
  System.Skia, dxCore, cxDateUtils, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.Skia, cxRadioGroup, uLookupEdit;

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
    SkLabel7: TSkLabel;
    edtDateB: TcxDateEdit;
    SkLabel4: TSkLabel;
    edtDateE: TcxDateEdit;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    edtCredit: ALookupEdit;
    edtCreditL: TSkLabel;
    edtState: TcxRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure edtDateBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtStatePropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DataLoad(); override;
  end;

var
  CreditsT: TCreditsT;

implementation

{$R *.dfm}


procedure TCreditsT.DataLoad;
begin
  Query.Close;

  if edtCredit.LookupKey > 0 then
    Query.MacroByName('Credit').Value := ' and c.CreditID = ' + edtCredit.LookupKey.ToString
  else
    Query.MacroByName('Credit').Value := '';

  if edtDateB.Text <> '' then
    Query.MacroByName('DateB').Value := ' and c.CreditDate >= '''   + edtDateB.Text + ''''
  else
    Query.MacroByName('DateB').Value := '';

  if edtDateE.Text <> '' then
    Query.MacroByName('DateE').Value := ' and c.CreditDate <= '''   + edtDateB.Text + ''''
  else
    Query.MacroByName('DateE').Value := '';
//
  if edtState.EditValue = 1  then
    Query.MacroByName('CloseDate').Value := ' and isnull(c.CloseDate, '''') = '''''
  else
  if edtState.EditValue = 2  then
    Query.MacroByName('CloseDate').Value := ' and isnull(c.CloseDate, '''') <> '''''
  else
    Query.MacroByName('CloseDate').Value := ' ';

  Query.Open();
  inherited;
end;

procedure TCreditsT.edtDateBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then DataLoad;
end;

procedure TCreditsT.edtStatePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  DataLoad;
end;

procedure TCreditsT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TCreditsF';
end;

initialization
  RegisterClass(TCreditsT);

end.
