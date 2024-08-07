﻿unit uTransactionF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBF, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxGeometry,
  dxFramedControl, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, cxButtons, uLookupEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxPanel, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit, cxMemo, cxLabel;

type
  TTransactionF = class(TBaseFormDBF)
    edtTranType: TcxLookupComboBox;
    dsTranType: TDataSource;
    qTranType: TFDQuery;
    edtOperation: TcxLookupComboBox;
    dsOperation: TDataSource;
    qOperation: TFDQuery;
    edtOperDate: TcxDateEdit;
    edtAmount: TcxCurrencyEdit;
    edtComment: TcxMemo;
    edtKontragent: ALookupEdit;
    edtExpenseItem: ALookupEdit;
    edtCreditD: ALookupEdit;
    dxPanel2: TdxPanel;
    dxPanel3: TdxPanel;
    cxLabel5: TcxLabel;
    lblKassa: TcxLabel;
    lblRest: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    edtCreditDL: TcxLabel;
    edtExpenseItemL: TcxLabel;
    edtKontragentL: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure edtOperationPropertiesEditValueChanged(Sender: TObject);
    procedure edtTranTypePropertiesEditValueChanged(Sender: TObject);
  private
    FKassaID: Integer;
    FIsCredit: Boolean;
    FCreditID: Integer;
    procedure SetKassaID(const Value: Integer);
    procedure SetIsCredit(const Value: Boolean);
    procedure SetCreditID(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property  KassaID: Integer read FKassaID write SetKassaID;

    property  CreditID: Integer read FCreditID write SetCreditID;
    property  IsCredit: Boolean read FIsCredit write SetIsCredit;

    /// <summary>
    ///  DataLoad - получение данных с сервера, для отображения на форме
    ///</summary>
    procedure DataLoad(); override;

    /// <summary>
    ///  DataCheck - проверка заполнения обязательных полей
    ///</summary>
    procedure DataCheck();

    procedure SetTranType();
    procedure SetOperation();

    /// <summary>
    ///  CurrentCashBalance - текщий остаток по кассе
    ///</summary>
    procedure CurrentCashBalance();


    function GetOperation(ATranTypeID, AKassaID, AOperationTypeID: integer): Integer;
  end;

var
  TransactionF: TTransactionF;

implementation

uses
  uDataModule, uCommonType, uSql, uImageModule;

{$R *.dfm}

procedure TTransactionF.btnOkClick(Sender: TObject);
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert, acClone, acAddDebet, acRequest:
    begin
      tSql.Open('''
                  declare @R              int = 0
                         ,@TransactionID  numeric(15,0)

                  exec @R =  TransactionAdd
                                 @TransactionID = @TransactionID out
                                ,@TranTypeID    = :TranTypeID
                                ,@OperationID   = :OperationID
                                ,@OperDate      = :OperDate
                                ,@ExpenseItemID = :ExpenseItemID
                                ,@CreditID      = :CreditID
                                ,@Amount        = :Amount
                                ,@Comment       = :Comment
                                ,@KassaID       = :KassaID
                                ,@KontragentID  = :KontragentID
                                ,@Discount      = :Discount
                                ,@ParentID      = :ParentID


                  select @R as R
                ''',
               ['TranTypeID', 'OperationID', 'OperDate', 'ExpenseItemID', 'CreditID', 'Amount',
                'Comment', 'KassaID', 'KontragentID', 'Discount', 'ParentID'],
               [
                 edtTranType.EditValue
                ,edtOperation.EditValue
                ,edtOperDate.date
                ,edtExpenseItem.LookupKey
                ,edtCreditD.LookupKey
                ,edtAmount.Value
                ,edtComment.Text
                ,FKassaID
                ,edtKontragent.LookupKey
                ,null
                ,0
                ]
               );


      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
         tSql.Open('''
                  declare @R int = 0


                  exec @R =  TransactionEdit
                                 @TransactionID = :TransactionID
                                ,@TranTypeID    = :TranTypeID
                                ,@OperationID   = :OperationID
                                ,@OperDate      = :OperDate
                                ,@ExpenseItemID = :ExpenseItemID
                                ,@CreditID      = :CreditID
                                ,@Amount        = :Amount
                                ,@Comment       = :Comment
                                --,@KassaID       = :KassaID
                                ,@KontragentID  = :KontragentID
                                ,@Discount      = :Discount
                                ,@ParentID      = :ParentID


                  select @R as R
                ''',
               ['TranTypeID', 'OperationID', 'OperDate', 'ExpenseItemID', 'CreditID', 'Amount',
                'Comment', {'KassaID',} 'KontragentID', 'Discount', 'ParentID', 'TransactionID'],
               [
                 edtTranType.EditValue
                ,edtOperation.EditValue
                ,edtOperDate.date
                ,edtExpenseItem.LookupKey
                ,edtCreditD.LookupKey
                ,edtAmount.Value
                ,edtComment.Text
               // ,FKassaID
                ,edtKontragent.LookupKey
                ,null
                ,0
                ,ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acDelete:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = TransactionDelete
                              @TransactionID = :TransactionID

                  select @R as R
                ''',
               ['TransactionID'], [ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
  end;

  if tRetVal.Code = 0 then
  begin
    ModalResult:=mrOK;
  end
  else
  begin
    MessageDlg(tRetVal.Message, mtError, [mbOK], 0);
  end;

end;

procedure TTransactionF.CurrentCashBalance;
begin
  TSql.Open('exec CurrentCashBalance @KassaID = :KassaID', ['KassaID'], [FKassaID]);

  if TSql.q.RecordCount > 0 then
    lblRest.Caption := 'Остаток по кассе: ' + FormatFloat('###,##0.00', TSql.q.FieldByName('balance').AsFloat)
  else
    lblRest.Caption := 'Остаток по кассе: 0';
end;

procedure TTransactionF.DataCheck;
begin
  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit, acClone, acAddDebet, acRequest:
    begin

      if edtTranType.EditValue = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Тип] обязательно к заполнению!';
        edtTranType.SetFocus;
        Exit();
      end;

      if edtOperation.EditValue = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Операция] обязательно к заполнению!';
        edtOperation.SetFocus;
        Exit();
      end;

      if edtOperDate.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Дата] обязательно к заполнению!';
        edtOperDate.SetFocus;
        Exit();
      end;


      if edtAmount.Value = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Сумма] обязательно к заполнению!';
        edtAmount.SetFocus;
        Exit();
      end;

      if (edtKontragent.Visible) and (edtKontragent.LookupKey = 0) then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Контрагент] обязательно к заполнению!';
        edtKontragent.SetFocus;
        Exit();
      end;

      if (edtCreditD.Visible) and (edtCreditD.LookupKey = 0) then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Кредит] обязательно к заполнению!';
        edtCreditD.SetFocus;
        Exit();
      end;

      if (edtExpenseItem.Visible) and (edtExpenseItem.LookupKey = 0) then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Статья расходов] обязательно к заполнению!';
        edtExpenseItem.SetFocus;
        Exit();
      end;

    end;
  end;
end;

procedure TTransactionF.DataLoad;
begin
  FDQuery.Close;
  FDQuery.sql.text :=
  '''
               select t.TransactionID
                     ,t.TranTypeID
                     ,t.OperationID
                     ,t.OperDate
                     ,t.ExpenseItemID
                     ,t.CreditID
                     ,t.Amount
                     ,t.Comment
                     ,t.KassaID
                     ,t.KontragentID
                     ,t.Discount
                     ,t.ParentID
                     ,t.InDateTime
                     ,t.UpUserID
                     ,t.UpDateTime
                 from tTransaction t (nolock)
                where t.TransactionID = :TransactionID
            ''';
  FDQuery.ParamByName('TransactionID').AsInteger := ID;
  FDQuery.Open;

  KassaID                    := FDQuery.FieldByName('KassaID').AsInteger; // 1

  edtTranType.EditValue       := FDQuery.FieldByName('TranTypeID').AsInteger;
  edtOperation.EditValue      := FDQuery.FieldByName('OperationID').AsInteger;
  edtOperDate.Text            := FDQuery.FieldByName('OperDate').AsString;
  edtAmount.Value              := FDQuery.FieldByName('Amount').AsFloat;
  edtComment.Text             := FDQuery.FieldByName('Comment').AsString;

  edtKontragent.LookupKey     := FDQuery.FieldByName('KontragentID').AsInteger;
  edtCreditD.LookupKey        := FDQuery.FieldByName('CreditID').AsInteger;
  edtExpenseItem.LookupKey    := FDQuery.FieldByName('ExpenseItemID').AsInteger;

  inherited;
end;

procedure TTransactionF.edtOperationPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  SetOperation
end;

procedure TTransactionF.edtTranTypePropertiesEditValueChanged(Sender: TObject);
begin
  SetTranType;
end;

procedure TTransactionF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qTranType.close;
  qOperation.Close;
end;

procedure TTransactionF.FormShow(Sender: TObject);
begin
  qTranType.Open;

  inherited;

  case FormAction of
    acInsert, acReportCreate:
    begin

      edtOperDate.date := Date();

      if FIsCredit then
      begin
        Self.Caption := 'Добавление выплаты по кредиту';
        edtTranType.Enabled := False;
        edtTranType.EditValue := 2;
        edtOperation.Enabled := False;
        edtOperation.EditValue:=GetOperation(edtTranType.EditValue, FKassaID,  3);

        edtCreditD.LookupKey := CreditID;
        edtCreditD.Enabled := False;

      end
      else
      begin
        Self.Caption := 'Добавление расходного документа';
        edtTranType.EditValue := 2;
        edtTranType.Enabled := False;
        edtOperation.EditValue := GetOperation(edtTranType.EditValue, FKassaID,  2);
      end;
    end;
    acAddDebet:
    begin

      edtOperDate.date := Date();

      if FIsCredit then
      begin
        Self.Caption := 'Добавление приходного документа';
        edtTranType.Enabled := False;
        edtTranType.EditValue := 1;
        edtOperation.Enabled := False;
        edtOperation.EditValue:=GetOperation(edtTranType.EditValue, FKassaID,  3);

        edtCreditD.LookupKey := CreditID;
        edtCreditD.Enabled := False;
      end
      else
      begin
        Self.Caption := 'Добавление приходного документа';
        edtTranType.EditValue := 1;
        edtTranType.Enabled := False;
        edtOperation.EditValue := GetOperation(edtTranType.EditValue, FKassaID,  1);
      end;
    end;
    acRequest:   //// заявка на расход
    begin

      edtOperDate.date := Date();

      Self.Caption := 'Добавление заявки на расход';
      edtTranType.Enabled := False;
      edtTranType.EditValue := 3;
      edtOperation.Enabled := False;
      edtOperation.EditValue:=GetOperation(edtTranType.EditValue, FKassaID,  2);

    end;
    acUpdate, acReportEdit, acUserAction:
    begin
      self.Caption := 'Изменение документа ';

      if FIsCredit then
      begin
        Self.Caption := 'Изменение выплаты по кредиту';
        edtTranType.Enabled := False;
        edtOperation.Enabled := False;
        edtCreditD.Enabled := False;
      end

    end;
    acDelete:
    begin
      self.Caption := 'Удаление документа ';
    end;
    acShow:
    begin
      self.Caption := 'Просмотр документа ';
    end;
  else
  end;

  CurrentCashBalance;
end;

function TTransactionF.GetOperation(ATranTypeID, AKassaID,  AOperationTypeID: integer): Integer;
begin
  TSql.Open('select OperationID from tOperation (nolock) where TranTypeID = :TranTypeID and KassaID= :KassaID and OperationTypeID = :OperationTypeID',
  ['TranTypeID', 'KassaID', 'OperationTypeID'], [ATranTypeID, AKassaID, AOperationTypeID]);

  if TSql.Q.RecordCount >0 then
    Result := TSql.Q.FieldByName('OperationID').AsInteger
  else
    Result := 0;

end;

procedure TTransactionF.SetCreditID(const Value: Integer);
begin
  FCreditID := Value;
end;

procedure TTransactionF.SetIsCredit(const Value: Boolean);
begin
  FIsCredit := Value;
end;

procedure TTransactionF.SetKassaID(const Value: Integer);
begin
  FKassaID := Value;

  TSql.Open(
  '''
               select k.Name
                 from tKassa k (nolock)
                where k.KassaID = :KassaID
  ''', ['KassaID'], [FKassaID]);

  lblKassa.Caption := TSql.Q.FieldByName('Name').asString;

end;

procedure TTransactionF.SetOperation;
begin
  tsql.Open('select * from tOperation (nolock) where OperationID = :OperationID ', ['OperationID'], [edtOperation.EditValue]);
  if TSql.q.RecordCount > 0 then
  begin
      // 1 - Клиенты; 2 - Прочие расходы; 4 - Поставщик; 8 - Покупатели; 16 - Кредиты

      edtKontragent.Visible := (tsql.q.FieldByName('LinkObject').AsInteger and 1 > 0 ) or
                               (tsql.q.FieldByName('LinkObject').AsInteger and 8 > 0);

      if tsql.q.FieldByName('LinkObject').AsInteger and 1 > 0 then
      begin
        edtKontragent.LookupFilter:='and k.KontragentTypeID = 1';
      end
      else
      if tsql.q.FieldByName('LinkObject').AsInteger and 8 > 0 then
      begin
        edtKontragent.LookupFilter:='and k.KontragentTypeID = 2';
      end;


      edtExpenseItem.Visible := (tsql.q.FieldByName('LinkObject').AsInteger and 2 > 0 );
      edtCreditD.Visible := (tsql.q.FieldByName('LinkObject').AsInteger and 16 > 0 );

      edtKontragentL.Visible :=edtKontragent.Visible;
      edtExpenseItemL.Visible :=edtExpenseItem.Visible;
      edtCreditDL.Visible :=edtCreditD.Visible;

  end;
end;

procedure TTransactionF.SetTranType;
begin
  qOperation.Close;
  qOperation.ParamByName('TranTypeID').Value  :=  edtTranType.EditValue;
  qOperation.ParamByName('KassaID').Value  :=  FKassaID;
  qOperation.Open;
end;

initialization
  RegisterClass(TTransactionF);
end.
