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
  cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.Skia, cxRadioGroup, uLookupEdit,
  cxCurrencyEdit;

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
    actCreditPayment: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    actCredit: TAction;
    ToolButton3: TToolButton;
    edtSum: TcxCurrencyEdit;
    edtSumT: TcxCurrencyEdit;
    edtAVG: TcxCurrencyEdit;
    lblCount: TSkLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtDateBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtStatePropertiesEditValueChanged(Sender: TObject);
    procedure actCreditPaymentExecute(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
    procedure actCreditExecute(Sender: TObject);
  private
    { Private declarations }
    procedure Summ();
  public
    { Public declarations }
    procedure DataLoad(); override;
    procedure SetActionEnabled(); override;
  end;

var
  CreditsT: TCreditsT;

implementation

uses
  uCreditPaymentT, MTLogger, uCreditTypesT, uSql;

{$R *.dfm}


procedure TCreditsT.actCreditExecute(Sender: TObject);
var CreditTypesT:TCreditTypesT;
begin
  inherited;
  CreditTypesT  := TCreditTypesT.Create(self);
  CreditTypesT.ShowModal;
  CreditTypesT.Free;
end;

procedure TCreditsT.actCreditPaymentExecute(Sender: TObject);
var CreditPaymentT: TCreditPaymentT;
begin
  inherited;
  CreditPaymentT := TCreditPaymentT.create(Self);
  CreditPaymentT.CreditID := TableViewCreditID.EditValue;
  CreditPaymentT.showModal;
  CreditPaymentT.free;
end;

procedure TCreditsT.btnFilterClearClick(Sender: TObject);
begin
  edtDateB.Clear;
  edtDateE.Clear;
  edtCredit.Clear;
  edtState.EditValue := 1;

  DataLoad;
end;

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

  Summ;
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

procedure TCreditsT.SetActionEnabled;
begin
  inherited;
  logger.Info('TCreditsT.SetActionEnabled');
  actCreditPayment.Enabled := (actCreditPayment.Tag = 1) and (Query.RecordCount > 0);
end;

procedure TCreditsT.Summ;
begin
  TSQL.Q.Close;
  TSQL.Q.SQL.Text :=
  '''
            select count(*) CNT
                  ,Sum(c.Amount)   Amount
                  ,Sum(c.PayAmount) PayAmount
                  ,Sum(0.00) as Rest

              from tCredits c (nolock)
             where 1=1

             !Credit

             !DateB

             !DateE

             !CloseDate
  ''';

  if edtCredit.LookupKey > 0 then
    TSQL.Q.MacroByName('Credit').Value := ' and c.CreditID = ' + edtCredit.LookupKey.ToString
  else
    TSQL.Q.MacroByName('Credit').Value := '';

  if edtDateB.Text <> '' then
    TSQL.Q.MacroByName('DateB').Value := ' and c.CreditDate >= '''   + edtDateB.Text + ''''
  else
    TSQL.Q.MacroByName('DateB').Value := '';

  if edtDateE.Text <> '' then
    TSQL.Q.MacroByName('DateE').Value := ' and c.CreditDate <= '''   + edtDateB.Text + ''''
  else
    TSQL.Q.MacroByName('DateE').Value := '';
//
  if edtState.EditValue = 1  then
    TSQL.Q.MacroByName('CloseDate').Value := ' and isnull(c.CloseDate, '''') = '''''
  else
  if edtState.EditValue = 2  then
    TSQL.Q.MacroByName('CloseDate').Value := ' and isnull(c.CloseDate, '''') <> '''''
  else
    TSQL.Q.MacroByName('CloseDate').Value := ' ';


  TSQL.Q.Open;

  lblCount.Caption := 'Всего кредитов: ' + TSQL.Q.FieldByName('CNT').asString;;
  edtAVG.Value := TSQL.Q.FieldByName('Amount').AsFloat;
  edtSumT.Value := TSQL.Q.FieldByName('PayAmount').AsFloat;
  edtSum.Value := TSQL.Q.FieldByName('Rest').AsFloat;
end;

initialization
  RegisterClass(TCreditsT);

end.
