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
    QueryKassaID: TFMTBCDField;
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
    procedure TableViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    /// <summary>
    ///  EditFormData - передача дополнительных параметров для формы редактирования
    ///</summary>
    procedure EditFormData(AEditform : TBaseFormF); override;

    procedure DataLoad(); override;
    procedure SetActionEnabled(); override;

    procedure Summ();
  end;

var
  TransactionT: TTransactionT;

implementation

uses
  uCommonType, MTLogger, uImageModule, uSql, uKassaChose;

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

  Query.Open();

  Summ;

  inherited;
end;

procedure TTransactionT.EditFormData(AEditform: TBaseFormF);
var KassaID: Integer;
    KassaChose: TKassaChose;
begin
  if AEditform.FormAction in [acInsert, acAddDebet] then
  begin
    KassaID := 0;

    if AEditform.FormAction = acInsert then   // расход
      TSql.Open('''
        select n.ParentID
          from tGrant g (nolock)
         inner join tMenu n (nolock)
                 on n.MenuID = g.MenuID
         where g.ObjectType = 0
           and g.ObjectID = dbo.GetUserID()
           and g.MenuID in (5,11)
      ''', [], [])
    else
    if AEditform.FormAction = acAddDebet then // приход
      TSql.Open('''
        select n.ParentID
          from tGrant g (nolock)
         inner join tMenu n (nolock)
                 on n.MenuID = g.MenuID
         where g.ObjectType = 0
           and g.ObjectID = dbo.GetUserID()
           and g.MenuID in (4,10)
      ''', [], []);

    if TSql.q.RecordCount > 1 then
    begin
      KassaChose := TKassaChose.Create(Self);
      if KassaChose.ShowModal = mrOk then
      begin
        KassaID := KassaChose.KType.EditingValue;
      end;
      KassaChose.Free;
    end
    else
    if TSql.q.RecordCount > 0 then
    begin
      KassaID := TSql.Q.FieldByName('ParentID').AsInteger;
    end;

    TTransactionF(AEditform).KassaID := KassaID;
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

  edtPaymentDate.Date := Date();
  edtPaymentDateE.Date := Date();

  qKassa.Open;

  DataLoad;
end;

procedure TTransactionT.SetActionEnabled;
begin
  inherited;

  TSql.Open('''
    Select iif(charindex('TTransactionT.actShow', S) >0, 1, 0) as show,
           iif(charindex('TTransactionT.actEdit', S) >0, 1, 0) as edit,
           iif(charindex('TTransactionT.actDelete', S) >0, 1, 0) as del

    from (
      SELECT STRING_AGG(n.Name, ';') as S
        FROM [tKassa] k (nolock)
     /* inner join tGrant g (nolock)
              on g.ObjectType = 0
             and g.ObjectID   = dbo.GetUserID()
             and g.MenuID     = k.KassaID
      */
      inner join tMenu n (nolock)
              on n.ParentID = k.KassaID
      inner join tGrant r (nolock)
              on r.ObjectType = 0
             and r.ObjectID   = dbo.GetUserID()
             and r.MenuID     = n.MenuID

     where k.kassaID = :kassaID
     ) p
  ''', ['kassaID'], [Query.FieldByName('kassaID').asInteger]);



  actShow.Enabled := (TSql.Q.FieldByName('show').AsInteger = 1) and (Query.RecordCount > 0);
  actEdit.Enabled := (TSql.Q.FieldByName('edit').AsInteger = 1) and (Query.RecordCount > 0);
  actDelete.Enabled:=(TSql.Q.FieldByName('del').AsInteger  = 1) and (Query.RecordCount > 0);


  TSql.Open('''
        -- Приход
        select n.ParentID
          from tGrant g (nolock)
         inner join tMenu n (nolock)
                 on n.MenuID = g.MenuID
         where g.ObjectType = 0
           and g.ObjectID = dbo.GetUserID()
           and g.MenuID in (4,10)

  ''', [], []);

    tbAdd2.Enabled := (TSql.Q.RecordCount > 0);

  TSql.Open('''
        -- Расход
        select n.ParentID
          from tGrant g (nolock)
         inner join tMenu n (nolock)
                 on n.MenuID = g.MenuID
         where g.ObjectType = 0
           and g.ObjectID = dbo.GetUserID()
           and g.MenuID in (5,11)

  ''', [], []);

    actAdd.Enabled := (TSql.Q.RecordCount > 0);

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

procedure TTransactionT.TableViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  SetActionEnabled
end;

procedure TTransactionT.ToolBarCustomDrawButton(Sender: TToolBar;
  Button: TToolButton; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  //  inherited;
  if (Button.Name = tbAdd2.Name) then
  begin
    if (Button.Enabled) then
    begin
      Sender.Canvas.Font.Color := clGreen; // Задаем цвет текста
      Sender.Canvas.Font.Style := [fsBold];

    end
    else
    begin
      Sender.Canvas.Font.Color := clGray; // Задаем цвет текста
    end;
    Sender.Canvas.Brush.Color:= clBtnFace;
    Sender.Canvas.TextOut(Button.Left + 20, Button.Top + 20, TAction(Button.Action).Caption); // Рисуем текст кнопки
    // DefaultDraw := False; // Отключаем стандартную отрисовку
  end;

  if (Button.Name = tbAdd.Name) then
  begin
    if (Button.Enabled) then
    begin
      Sender.Canvas.Font.Color := clRed; // Задаем цвет текста
      Sender.Canvas.Font.Style := [fsBold];
    end
    else
    begin
      Sender.Canvas.Font.Color := clGray; // Задаем цвет текста
    end;
    Sender.Canvas.Brush.Color:= clBtnFace;
    Sender.Canvas.TextOut(Button.Left + 20, Button.Top + 20, TAction(Button.Action).Caption); // Рисуем текст кнопки
  end
end;

initialization
  RegisterClass(TTransactionT);

end.
