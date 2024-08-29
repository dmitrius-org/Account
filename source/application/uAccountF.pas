unit uAccountF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBF, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxGeometry,
  dxFramedControl, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxCoreGraphics, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, cxButtons,
  cxButtonEdit, uLookupEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  dxPanel, cxCurrencyEdit, cxDBEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo, cxLabel;

type
  TAccountF = class(TBaseFormDBF)
    edtAccountNumber: TcxTextEdit;
    edtPayNumber: TcxTextEdit;
    edtPhone: TcxTextEdit;
    edtMail: TcxTextEdit;
    edtAccountDate: TcxDateEdit;
    edtPayDate: TcxDateEdit;
    edtPaymentDate: TcxDateEdit;
    edtAccountStatus: TcxLookupComboBox;
    edtBuyer: ALookupEdit;
    edtSupplier: ALookupEdit;
    edtClient: ALookupEdit;
    edtComment: TcxMemo;
    dsAccountStatus: TDataSource;
    qAccountStatus: TFDQuery;
    edtAccountAmount: TcxCurrencyEdit;
    edtPaymentAmount: TcxCurrencyEdit;
    edtBuyerDiscount: TcxCurrencyEdit;
    edtClientDiscount: TcxCurrencyEdit;
    dxPanel2: TdxPanel;
    btnCopy: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    lblDoplata: TcxLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtAccountNumberPropertiesChange(Sender: TObject);
    procedure edtPaymentDatePropertiesChange(Sender: TObject);
    procedure edtPaymentAmountPropertiesChange(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure edtBuyerPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtClientPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edtSupplierPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FIsRefund: Boolean;
    FParentID: Integer;
    procedure SetStatus();
  public
    /// <summary>
    ///  DataLoad - получение данных с сервера, для отображения на форме
    ///</summary>
    procedure DataLoad(); override;

    procedure DataClone();

    /// <summary>
    ///  DataCheck - проверка заполнения обязательных полей
    ///</summary>
    procedure DataCheck();
  end;

var
  AccountF: TAccountF;

implementation

uses
  uImageModule, uDataModule, uCommonType, uSql;

{$R *.dfm}
{ TAccountF }

procedure TAccountF.btnCopyClick(Sender: TObject);
begin
  inherited;
  edtPaymentAmount.Value := edtAccountAmount.Value;
end;

procedure TAccountF.btnOkClick(Sender: TObject);
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert, acClone, acReset, acResetAcc:
    begin

      // проверка наличия счета с одинаковым номером
      tSql.Open('''
                  declare @R          int = 0

                  exec @R = AccountNumberCheck
                              @AccountNumber = :AccountNumber
                             ,@SupplierID    = :SupplierID

                  select @R as R
                ''',
               ['AccountNumber','SupplierID'],
               [edtAccountNumber.Text
               ,edtSupplier.LookupKey]
               );

      if tSql.Q.FieldByName('R').Value > 0 then
      case MessageDlg('Счет заданным номером существует, продолжить выполнение операции?', mtConfirmation, [mbOK, mbCancel], 0) of
        mrOk:
          begin
            // OK
          end;
        mrCancel:
          begin
            exit;
          end;
      end;

      tSql.Open('''
                  declare @R          int = 0
                         ,@AccountID  numeric(15,0)

                  exec @R = AccountInsert

                              @AccountID         = @AccountID    out
                             ,@PaymentDate       = :PaymentDate
                             ,@PaymentAmount     = :PaymentAmount
                             ,@AccountNumber     = :AccountNumber
                             ,@AccountDate       = :AccountDate
                             ,@AccountAmount     = :AccountAmount
                             ,@BuyerID           = :BuyerID
                             ,@BuyerDiscount     = :BuyerDiscount
                             ,@SupplierID        = :SupplierID
                             ,@ClientID          = :ClientID
                             ,@ClientDiscount    = :ClientDiscount
                             ,@ParentID          = :ParentID
                             ,@IsRefund          = :IsRefund
                             ,@AccountStatusID   = :AccountStatusID
                             ,@Comment           = :Comment
                             ,@Phone             = :Phone
                             ,@Mail              = :Mail
                             ,@PayNumber         = :PayNumber
                             ,@PayDate           = :PayDate

                  select @R as R
                ''',
               ['AccountNumber', 'PayNumber', 'AccountDate', 'PayDate', 'PaymentDate', 'AccountAmount', 'PaymentAmount',
                'BuyerDiscount', 'ClientDiscount', 'Phone', 'Mail', 'Comment', 'AccountStatusID',
                'BuyerID', 'SupplierID', 'ClientID', 'ParentID', 'IsRefund'],
               [
                 edtAccountNumber.Text
                ,edtPayNumber.Text
                ,edtAccountDate.date
                ,edtPayDate.text
                ,edtPaymentDate.text
                ,edtAccountAmount.Value
                ,edtPaymentAmount.Value
                ,edtBuyerDiscount.Value
                ,edtClientDiscount.Value
                ,edtPhone.Text
                ,edtMail.Text
                ,edtComment.Text
                ,edtAccountStatus.EditValue
                ,edtBuyer.LookupKey
                ,edtSupplier.LookupKey
                ,edtClient.LookupKey
                ,FParentID
                ,FIsRefund
                ]
               );


      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
      // проверка наличия счета с одинаковым номером
      tSql.Open('''
                  declare @R          int = 0

                  exec @R = AccountNumberCheck
                          @AccountID     = :AccountID
                         ,@AccountNumber = :AccountNumber
                         ,@SupplierID    = :SupplierID

                  select @R as R
                ''',
               ['AccountNumber','SupplierID','AccountID'],
               [edtAccountNumber.Text
               ,edtSupplier.LookupKey
               ,ID]
               );

      if tSql.Q.FieldByName('R').Value > 0 then
      case MessageDlg('Счет заданным номером существует, продолжить выполнение операции?', mtConfirmation, [mbOK, mbCancel], 0) of
        mrOk:
          begin
            // OK
          end;
        mrCancel:
          begin
            exit;
          end;
      end;

         tSql.Open('''
                  declare @R int = 0

                 exec @R = AccountEdit

                              @AccountID         = :AccountID
                             ,@PaymentDate       = :PaymentDate
                             ,@PaymentAmount     = :PaymentAmount
                             ,@AccountNumber     = :AccountNumber
                             ,@AccountDate       = :AccountDate
                             ,@AccountAmount     = :AccountAmount
                             ,@BuyerID           = :BuyerID
                             ,@BuyerDiscount     = :BuyerDiscount
                             ,@SupplierID        = :SupplierID
                             ,@ClientID          = :ClientID
                             ,@ClientDiscount    = :ClientDiscount
                             ,@ParentID          = null
                             ,@IsRefund          = null
                             ,@AccountStatusID   = :AccountStatusID
                             ,@Comment           = :Comment
                             ,@Phone             = :Phone
                             ,@Mail              = :Mail
                             ,@PayNumber         = :PayNumber
                             ,@PayDate           = :PayDate

                  select @R as R
                ''',
               ['AccountNumber', 'PayNumber', 'AccountDate', 'PayDate', 'PaymentDate', 'AccountAmount', 'PaymentAmount',
                'BuyerDiscount', 'ClientDiscount', 'Phone', 'Mail', 'Comment', 'AccountStatusID',
                'BuyerID', 'SupplierID', 'ClientID', 'AccountID'],
               [
                 edtAccountNumber.Text
                ,edtPayNumber.Text
                ,edtAccountDate.date
                ,edtPayDate.text
                ,edtPaymentDate.text
                ,edtAccountAmount.Value
                ,edtPaymentAmount.Value
                ,edtBuyerDiscount.Value
                ,edtClientDiscount.Value
                ,edtPhone.Text
                ,edtMail.Text
                ,edtComment.Text
                ,edtAccountStatus.EditValue
                ,edtBuyer.LookupKey
                ,edtSupplier.LookupKey
                ,edtClient.LookupKey
                ,ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acDelete:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = AccountDelete
                              @AccountID = :AccountID

                  select @R as R
                ''',
               ['AccountID'], [ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
  end;

  if tRetVal.Code = 0 then
  begin
    if FormAction = acShow then
      ModalResult:=mrNo
    else
      ModalResult:=mrOK;
  end
  else
  begin
    MessageDlg(tRetVal.Message, mtError, [mbOK], 0);
  end;
end;

procedure TAccountF.DataCheck;
begin

  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit, acClone, acReset, acResetAcc:
    begin

      if edtAccountNumber.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Счет №] обязательно к заполнению!';
        edtAccountNumber.SetFocus;
        Exit();
      end;

      if edtAccountDate.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Дата счета] обязательно к заполнению!';
        edtAccountDate.SetFocus;
        Exit();
      end;

      if edtAccountAmount.Value = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Сумма счета] обязательно к заполнению!';
        edtAccountAmount.SetFocus;
        Exit();
      end;


      if edtBuyer.LookupKey = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Покупатель] обязательно к заполнению!';
        edtBuyer.SetFocus;
        Exit();
      end;
      if edtSupplier.LookupKey = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Поставщик] обязательно к заполнению!';
        edtSupplier.SetFocus;
        Exit();
      end;
      if edtClient.LookupKey = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Клиент] обязательно к заполнению!';
        edtClient.SetFocus;
        Exit();
      end;


      if edtBuyerDiscount.Value = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Скидка %] обязательно к заполнению!';
        edtBuyerDiscount.SetFocus;
        Exit();
      end;
      if edtClientDiscount.Value = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Скидка %] обязательно к заполнению!';
        edtClientDiscount.SetFocus;
        Exit();
      end;

      if edtAccountStatus.EditValue = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Статус] обязательно к заполнению!';
        edtAccountStatus.SetFocus;
        Exit();
      end;
    end;

  end;
end;

procedure TAccountF.DataClone;
begin
  FDQuery.Close;
  FDQuery.sql.text :=
  '''
              Select  AccountID
                     ,PaymentDate
                     ,PaymentAmount
                     ,AccountNumber
                     ,AccountDate
                     ,AccountAmount
                     ,BuyerID
                     ,BuyerDiscount
                     ,SupplierID
                     ,ClientID
                     ,ClientDiscount
                     ,ParentID
                     ,IsRefund
                     ,AccountStatusID
                     ,Comment
                     ,Phone
                     ,Mail
                     ,PayNumber
                     ,PayDate
                     ,InDateTime
                     ,upUserID
                     ,upDateTime
                 from tAccounts (nolock)
                where AccountID = :AccountID
            ''';
  FDQuery.ParamByName('AccountID').AsInteger := ID;
  FDQuery.Open;

end;

procedure TAccountF.DataLoad;
begin
  FDQuery.Close;
  FDQuery.sql.text :=
  '''
              Select  AccountID
                     ,PaymentDate
                     ,PaymentAmount
                     ,AccountNumber
                     ,AccountDate
                     ,AccountAmount
                     ,BuyerID
                     ,BuyerDiscount
                     ,SupplierID
                     ,ClientID
                     ,ClientDiscount
                     ,ParentID
                     ,IsRefund
                     ,AccountStatusID
                     ,Comment
                     ,Phone
                     ,Mail
                     ,PayNumber
                     ,PayDate
                     ,InDateTime
                     ,InUserID
                     ,UpUserID
                     ,UpDateTime
                 from tAccounts (nolock)
                where AccountID = :AccountID
            ''';
  FDQuery.ParamByName('AccountID').AsInteger := ID;
  FDQuery.Open;

  edtAccountNumber.Text  := FDQuery.FieldByName('AccountNumber').AsString;
  edtPayNumber.Text      := FDQuery.FieldByName('PayNumber').AsString;
  edtAccountDate.date    := FDQuery.FieldByName('AccountDate').AsDateTime;
  edtPayDate.Text        := FDQuery.FieldByName('PayDate').AsString;
  edtPaymentDate.Text    := FDQuery.FieldByName('PaymentDate').AsString;
  edtAccountAmount.Value := FDQuery.FieldByName('AccountAmount').AsInteger;
  edtPaymentAmount.Value := FDQuery.FieldByName('PaymentAmount').AsInteger;
  edtBuyerDiscount.Value := FDQuery.FieldByName('BuyerDiscount').AsFloat;
  edtClientDiscount.Value:= FDQuery.FieldByName('ClientDiscount').AsFloat;
  edtPhone.Text          := FDQuery.FieldByName('Phone').AsString;
  edtMail.Text           := FDQuery.FieldByName('Mail').AsString;
  edtComment.Text        := FDQuery.FieldByName('Comment').AsString;
  edtAccountStatus.EditValue := FDQuery.FieldByName('AccountStatusID').AsInteger;

  edtBuyer.LookupKey     :=  FDQuery.FieldByName('BuyerID').AsInteger;
  edtSupplier.LookupKey  :=  FDQuery.FieldByName('SupplierID').AsInteger;
  edtClient.LookupKey    :=  FDQuery.FieldByName('ClientID').AsInteger;
  inherited;
end;

procedure TAccountF.edtAccountNumberPropertiesChange(Sender: TObject);
begin
  inherited;
  SetStatus;
end;

procedure TAccountF.edtBuyerPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if ((AButtonIndex = 0) and (edtBuyer.LookupResult = 1)) then
  begin
    TSql.Open('select Discount from tKontragents (nolock) where KontragentID=:ID', ['ID'], [edtBuyer.LookupKey]);

    if TSql.Q.RecordCount>0 then
      edtBuyerDiscount.Value := TSql.Q.FieldByName('Discount').AsFloat;
  end;
end;

procedure TAccountF.edtClientPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if ((AButtonIndex = 0) and (edtClient.LookupResult = 1)) then
  begin
    TSql.Open('''
      declare @Discount money
      exec ClientPrc
             @ClientID   = :ClientID
            ,@SupplierID = :SupplierID
            ,@Discount   = @Discount out

      select @Discount as Discount

    ''', ['ClientID', 'SupplierID'], [edtClient.LookupKey, edtSupplier.LookupKey]);

    if TSql.Q.RecordCount>0 then
      edtClientDiscount.Value := TSql.Q.FieldByName('Discount').AsFloat;
  end;
end;

procedure TAccountF.edtPaymentAmountPropertiesChange(Sender: TObject);
begin
  SetStatus;
end;

procedure TAccountF.edtPaymentDatePropertiesChange(Sender: TObject);
begin
  SetStatus;
end;

procedure TAccountF.edtSupplierPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if ((AButtonIndex = 0) and (edtSupplier.LookupResult = 1)) then
  begin
    TSql.Open('''
      declare @Discount money
      exec ClientPrc
             @ClientID   = :ClientID
            ,@SupplierID = :SupplierID
            ,@Discount   = @Discount out

      select @Discount as Discount

    ''', ['ClientID', 'SupplierID'], [edtClient.LookupKey, edtSupplier.LookupKey]);

    if TSql.Q.RecordCount>0 then
      edtClientDiscount.Value := TSql.Q.FieldByName('Discount').AsFloat;
  end;
end;

procedure TAccountF.FormShow(Sender: TObject);
begin
  qAccountStatus.Close;
  qAccountStatus.Open;

  inherited;

  case FormAction of
    acInsert, acReportCreate:
    begin
      Self.Caption := 'Добавление счета';
      edtAccountDate.date := Date();
      edtPaymentDate.date := Date();
    end;
    acReset:
    begin
      Self.Caption := 'Добавление возврата';
      edtAccountDate.date := Date();
      edtPaymentDate.date := Date();
      FIsRefund := True;
    end;
    acUpdate, acReportEdit, acUserAction:
    begin
      self.Caption := 'Изменение счета ' +  edtAccountNumber.Text + ' от: ' + edtAccountDate.text;
    end;
    acDelete:
    begin
      self.Caption := 'Удаление счета ' + edtAccountNumber.Text + ' от: ' + edtAccountDate.text;
    end;
    acShow:
    begin
      self.Caption := 'Просмотр покупателя ' +  edtAccountNumber.Text + ' от: ' + edtAccountDate.text;
    end;
    acClone:
    begin
      DataClone;
      Self.Caption := 'Добавление счета на основе' +  FDQuery.FieldByName('AccountNumber').AsString +
                      ' от: ' + FDQuery.FieldByName('AccountDate').AsString;


      edtAccountNumber.Text  := FDQuery.FieldByName('AccountNumber').AsString;
      edtPayNumber.Text      := FDQuery.FieldByName('PayNumber').AsString;
      edtAccountDate.date    := FDQuery.FieldByName('AccountDate').AsDateTime;
      //edtPayDate.Text        := FDQuery.FieldByName('PayDate').AsString;
      //edtPaymentDate.Text    := FDQuery.FieldByName('PaymentDate').AsString;
      edtAccountAmount.Value := FDQuery.FieldByName('AccountAmount').AsInteger;
      edtPaymentAmount.Value := FDQuery.FieldByName('PaymentAmount').AsInteger;
      edtBuyerDiscount.Value := FDQuery.FieldByName('BuyerDiscount').AsFloat;
      edtClientDiscount.Value:= FDQuery.FieldByName('ClientDiscount').AsFloat;
      edtPhone.Text          := FDQuery.FieldByName('Phone').AsString;
      edtMail.Text           := FDQuery.FieldByName('Mail').AsString;
      edtComment.Text        := FDQuery.FieldByName('Comment').AsString;
      //edtAccountStatus.EditValue := FDQuery.FieldByName('AccountStatusID').AsInteger;

      edtBuyer.LookupKey     :=  FDQuery.FieldByName('BuyerID').AsInteger;
      edtSupplier.LookupKey  :=  FDQuery.FieldByName('SupplierID').AsInteger;
      edtClient.LookupKey    :=  FDQuery.FieldByName('ClientID').AsInteger;
    end;


    acResetAcc:
    begin
      DataClone;
      Self.Caption := 'Добавление возврата на основе' +  FDQuery.FieldByName('AccountNumber').AsString +
                      ' от: ' + FDQuery.FieldByName('AccountDate').AsString;


      edtAccountNumber.Text  := FDQuery.FieldByName('AccountNumber').AsString;
      edtPayNumber.Text      := FDQuery.FieldByName('PayNumber').AsString;
      edtAccountDate.date    := FDQuery.FieldByName('AccountDate').AsDateTime;
      //edtPayDate.Text        := FDQuery.FieldByName('PayDate').AsString;
      //edtPaymentDate.Text    := FDQuery.FieldByName('PaymentDate').AsString;
      edtAccountAmount.Value := FDQuery.FieldByName('AccountAmount').AsInteger;
      edtPaymentAmount.Value := FDQuery.FieldByName('PaymentAmount').AsInteger;
      edtBuyerDiscount.Value := FDQuery.FieldByName('BuyerDiscount').AsFloat;
      edtClientDiscount.Value:= FDQuery.FieldByName('ClientDiscount').AsFloat;
      edtPhone.Text          := FDQuery.FieldByName('Phone').AsString;
      edtMail.Text           := FDQuery.FieldByName('Mail').AsString;
      edtComment.Text        := FDQuery.FieldByName('Comment').AsString;
      //edtAccountStatus.EditValue := FDQuery.FieldByName('AccountStatusID').AsInteger;

      edtBuyer.LookupKey     :=  FDQuery.FieldByName('BuyerID').AsInteger;
      edtSupplier.LookupKey  :=  FDQuery.FieldByName('SupplierID').AsInteger;
      edtClient.LookupKey    :=  FDQuery.FieldByName('ClientID').AsInteger;

      FIsRefund := True;
      FParentID := ID;
    end;
  else
  end;

  SetStatus;

end;

procedure TAccountF.SetStatus;
begin
  lblDoplata.Caption := 'Сумма доплаты: ' +FloatToStr(edtAccountAmount.Value - edtPaymentAmount.Value);

  if edtPaymentAmount.Value = 0 then
    edtAccountStatus.EditValue := 3
  else
  if (edtAccountNumber.text <> '' )and (edtPaymentDate.text <> '') and (edtPaymentAmount.Value = edtAccountAmount.Value)  then
  begin
    edtAccountStatus.EditValue := 1;
  end
  else
  if (edtAccountNumber.text <> '' )and (edtPaymentDate.text <> '') and (edtPaymentAmount.Value <> edtAccountAmount.Value)  then
  begin
    edtAccountStatus.EditValue := 2;
  end;

end;

initialization
  RegisterClass(TAccountF);
end.
