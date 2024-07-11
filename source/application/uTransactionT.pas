unit uTransactionT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBT, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxContainer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxClasses, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, cxImageList, Vcl.Menus, System.Actions, Vcl.ActnList, cxGroupBox,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, uBaseFormF, uTransactionF,
  dxCore, cxDateUtils, System.Skia, Vcl.StdCtrls, cxButtons, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.Skia, cxTextEdit,
  cxMaskEdit, cxCalendar, cxCurrencyEdit;

type
  TTransactionT = class(TBaseFormDBT)
    QueryTranTypeID: TFMTBCDField;
    QueryTranType: TStringField;
    QueryOperationName: TStringField;
    QueryOperDate: TSQLTimeStampField;
    QueryKontragentName: TStringField;
    QueryDebet: TCurrencyField;
    QueryCredit: TCurrencyField;
    QueryKassa: TStringField;
    Querybalance: TCurrencyField;
    TableViewTranType: TcxGridDBColumn;
    TableViewOperationName: TcxGridDBColumn;
    TableViewOperDate: TcxGridDBColumn;
    TableViewKontragentName: TcxGridDBColumn;
    TableViewDebet: TcxGridDBColumn;
    TableViewCredit: TcxGridDBColumn;
    TableViewKassa: TcxGridDBColumn;
    TableViewbalance: TcxGridDBColumn;
    QueryTransactionID: TFMTBCDField;
    TableViewTransactionID: TcxGridDBColumn;
    tbAdd2: TToolButton;
    actAddDebet: TAction;
    N8: TMenuItem;
    edtPaymentDateE: TcxDateEdit;
    SkLabel4: TSkLabel;
    edtPaymentDate: TcxDateEdit;
    SkLabel7: TSkLabel;
    edKassa: TcxLookupComboBox;
    SkLabel6: TSkLabel;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    dsKassa: TDataSource;
    qKassa: TFDQuery;
    edtSum: TcxCurrencyEdit;
    edtSumC: TcxCurrencyEdit;
    edtSumD: TcxCurrencyEdit;
    procedure actAddDebetExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolBarCustomDrawButton(Sender: TToolBar; Button: TToolButton;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btnFilterClearClick(Sender: TObject);
    procedure btnFilterOkClick(Sender: TObject);
    procedure edKassaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    /// <summary>
    ///  EditFormData - передача дополнительных параметров для формы редактирования
    ///</summary>
    procedure EditFormData(AEditform : TBaseFormF); override;

    procedure DataLoad(); override;

    procedure Summ();
  end;

var
  TransactionT: TTransactionT;

implementation

uses
  uCommonType, MTLogger, uImageModule, uSql;

{$R *.dfm}

procedure TTransactionT.actAddDebetExecute(Sender: TObject);
begin
  //GetKassaID
  EditForm(acAddDebet);
end;

procedure TTransactionT.btnFilterClearClick(Sender: TObject);
begin
  edKassa.Clear;
  edtPaymentDate.Clear;
  edtPaymentDateE.Clear;

  DataLoad
end;

procedure TTransactionT.btnFilterOkClick(Sender: TObject);
begin
  DataLoad
end;

procedure TTransactionT.DataLoad;
begin
  logger.Info('TTransactionT.DataLoad');
  Query.Close();
//
//  if edtAccountStatus.text <> '' then
//    Query.MacroByName('AccountStatus').Value := ' and a.AccountStatusID in (' + Integer(edtAccountStatus.EditValue).ToString + ')'
//  else
//    Query.MacroByName('AccountStatus').Value := '';
//
  if edKassa.EditValue > 0 then
    Query.MacroByName('Kassa').Value := ' and t.KassaID= ' + Integer(edKassa.EditValue).ToString
  else
    Query.MacroByName('Kassa').Value := '';


  if edtPaymentDate.Text <> '' then
    Query.MacroByName('DateB').Value := ' and t.OperDate >= '''   + edtPaymentDate.Text + ''''
  else
    Query.MacroByName('DateB').Value := '';

  if edtPaymentDateE.Text <> '' then
    Query.MacroByName('DateE').Value := ' and t.OperDate <= '''   + edtPaymentDateE.Text + ''''
  else
    Query.MacroByName('DateE').Value := '';

//  if FormAction = acLookup then
//    Query.MacroByName('LookupFilter').Value := LookupFilter
//  else
//    Query.MacroByName('LookupFilter').Value := '';

  Query.Open();

  Summ;

  inherited;
end;

procedure TTransactionT.EditFormData(AEditform: TBaseFormF);
begin
  if AEditform.FormAction in [acInsert, acAddDebet] then
  begin
    TTransactionF(AEditform).KassaID := 1;
  end;
end;

procedure TTransactionT.edKassaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then DataLoad;
end;

procedure TTransactionT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qKassa.Close;
end;

procedure TTransactionT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TTransactionF';

  tbAdd2.Left := tbShow.Width;
end;

procedure TTransactionT.FormShow(Sender: TObject);
begin
  inherited;
  qKassa.Open;

  edtPaymentDate.Date := Date();
  edtPaymentDateE.Date := Date();
end;

procedure TTransactionT.Summ;
begin
  TSQL.Q.Close;
  TSQL.Q.SQL.Text :=
  '''
  Select
       sum(iif(t.TranTypeID = 1, t.Amount, 0)) as Debet
      ,sum(iif(t.TranTypeID = 2, t.Amount, 0)) as Credit
      ,sum(iif(t.TranTypeID = 1, 1, -1) * t.Amount) as balance
  from tTransaction t (nolock)
  where 1=1

  !Kassa

  !DateB

  !DateE
  ''';

  if edKassa.EditValue > 0 then
    TSQL.Q.MacroByName('Kassa').Value := ' and t.KassaID= ' + Integer(edKassa.EditValue).ToString
  else
    TSQL.Q.MacroByName('Kassa').Value := '';


  if edtPaymentDate.Text <> '' then
    TSQL.Q.MacroByName('DateB').Value := ' and t.OperDate >= '''   + edtPaymentDate.Text + ''''
  else
    TSQL.Q.MacroByName('DateB').Value := '';

  if edtPaymentDateE.Text <> '' then
    TSQL.Q.MacroByName('DateE').Value := ' and t.OperDate <= '''   + edtPaymentDateE.Text + ''''
  else
    TSQL.Q.MacroByName('DateE').Value := '';


  TSQL.Q.Open;


  edtSumD.Value := TSQL.Q.FieldByName('Debet').AsFloat;
  edtSumC.Value := TSQL.Q.FieldByName('Credit').AsFloat;
  edtSum.Value := TSQL.Q.FieldByName('balance').AsFloat;

end;

procedure TTransactionT.ToolBarCustomDrawButton(Sender: TToolBar;
  Button: TToolButton; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  //  inherited;
  if Button.Name = tbAdd2.Name then
  begin
    Sender.Canvas.Font.Color := clGreen; // Задаем цвет текста
    Sender.Canvas.Font.Style := [fsBold];
    Sender.Canvas.Brush.Color:= clBtnFace;
    Sender.Canvas.TextOut(Button.Left + 20, Button.Top + 20, TAction(Button.Action).Caption); // Рисуем текст кнопки
    // DefaultDraw := False; // Отключаем стандартную отрисовку
  end;

  if Button.Name = tbAdd.Name then
  begin
    Sender.Canvas.Font.Color := clRed; // Задаем цвет текста
    Sender.Canvas.Font.Style := [fsBold];
    Sender.Canvas.Brush.Color:= clBtnFace;
    Sender.Canvas.TextOut(Button.Left + 20, Button.Top + 20, TAction(Button.Action).Caption); // Рисуем текст кнопки
  end
end;

initialization
  RegisterClass(TTransactionT);

end.
