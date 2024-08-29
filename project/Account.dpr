  program Account;

uses
  Vcl.Forms,
  uDataModule in '..\source\uDataModule.pas' {DM: TDataModule},
  uMainForm in '..\source\uMainForm.pas' {MainForm},
  uLogin in '..\source\uLogin.pas' {LoginForm},
  uCommonType in '..\source\lib\uCommonType.pas',
  uSql in '..\source\lib\uSql.pas',
  uVarUtils in '..\source\lib\uVarUtils.pas',
  uBaseFormT in '..\source\application\uBaseFormT.pas' {BaseFormT},
  uBaseFormDBT in '..\source\application\uBaseFormDBT.pas' {BaseFormDBT},
  uExpenseGroupsT in '..\source\application\uExpenseGroupsT.pas' {ExpenseGroupsT},
  uBaseFormF in '..\source\application\uBaseFormF.pas' {BaseFormF},
  uBaseFormDBF in '..\source\application\uBaseFormDBF.pas' {BaseFormDBF},
  uExpenseGroupsF in '..\source\application\uExpenseGroupsF.pas' {ExpenseGroupF},
  uExpenseItemsT in '..\source\application\uExpenseItemsT.pas' {ExpenseItemsT},
  uExpenseItemsF in '..\source\application\uExpenseItemsF.pas' {ExpenseItemsF},
  MTLogger in '..\source\lib\logger\MTLogger.pas',
  MTUtils in '..\source\lib\logger\MTUtils.pas',
  TimeIntervals in '..\source\lib\logger\TimeIntervals.pas',
  uImageModule in '..\source\application\uImageModule.pas' {IM: TDataModule},
  uCreditTypesT in '..\source\application\uCreditTypesT.pas' {CreditTypesT},
  uCreditTypesF in '..\source\application\uCreditTypesF.pas' {CreditTypesF},
  uCreditsT in '..\source\application\uCreditsT.pas' {CreditsT},
  uCreditsF in '..\source\application\uCreditsF.pas' {CreditsF},
  uTasksT in '..\source\application\uTasksT.pas' {TasksT},
  uTasksF in '..\source\application\uTasksF.pas' {TasksF},
  uKontragentsT in '..\source\application\uKontragentsT.pas' {KontragentsT},
  uSupplierF in '..\source\application\uSupplierF.pas' {SupplierF},
  uClientF in '..\source\application\uClientF.pas' {ClientF},
  uComboBox in '..\source\lib\uComboBox.pas',
  uBuyerF in '..\source\application\uBuyerF.pas' {BuyerF},
  uGetKontragentData in '..\source\lib\uGetKontragentData.pas',
  uAccountT in '..\source\application\uAccountT.pas' {AccountT},
  uAccountF in '..\source\application\uAccountF.pas' {AccountF},
  uTransactionT in '..\source\application\uTransactionT.pas' {TransactionT},
  uTransactionF in '..\source\application\uTransactionF.pas' {TransactionF},
  uDocumentRequestT in '..\source\application\uDocumentRequestT.pas' {DocumentRequestT},
  uDocumentRequestF in '..\source\application\uDocumentRequestF.pas' {DocumentRequestF},
  uCreditPaymentT in '..\source\application\uCreditPaymentT.pas' {CreditPaymentT},
  uProfit_T in '..\source\application\uProfit_T.pas' {Profit_T},
  uDebsHistoryClientT in '..\source\application\uDebsHistoryClientT.pas' {DebsHistoryClientT},
  uDolgT in '..\source\application\uDolgT.pas' {DolgT},
  uDebsHistoryBuyerT in '..\source\application\uDebsHistoryBuyerT.pas' {DebsHistoryBuyerT},
  uUserT in '..\source\application\uUserT.pas' {UserT},
  uUserF in '..\source\application\uUserF.pas' {UserF},
  uUserAccess in '..\source\application\uUserAccess.pas' {UserAccess},
  uGrantUtils in '..\source\application\uGrantUtils.pas',
  uKassaChose in '..\source\application\uKassaChose.pas' {KassaChose},
  uStatisticT in '..\source\uStatisticT.pas' {StatisticT},
  uSupplierClientT in '..\source\uSupplierClientT.pas' {SupplierClientT},
  uSupplierClientF in '..\source\application\uSupplierClientF.pas' {SupplierClientF},
  uAuditT in '..\source\application\uAuditT.pas' {AuditT},
  uUtilsRegistry in '..\source\application\uUtilsRegistry.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;


  Application.CreateForm(TDM, DM);
  Application.CreateForm(TIM, IM);
  Application.Title := DM.FDManager.ConnectionDefs.FindConnectionDef('Connection').Params.Values['ApplicationName'];

  {$IFDEF Release}
  var LoginForm: TLoginForm;
  LoginForm := TLoginForm.Create(nil);

  if LoginForm.ShowModal = 1 then
  {$ELSE}
  if 1=1 then
  {$ENDIF}
  begin
    Application.CreateForm(TMainForm, MainForm);

    Application.Run;

  end
  else
  begin
    Application.Terminate;
  end;

end.
