program Account_D12;

uses
  Vcl.Forms,
  uDataModule in '..\source\uDataModule.pas' {DM: TDataModule},
  uMainForm in '..\source\uMainForm.pas' {MainForm},
  MTLogger in '..\source\components\logger\MTLogger.pas',
  MTUtils in '..\source\components\logger\MTUtils.pas',
  TimeIntervals in '..\source\components\logger\TimeIntervals.pas',
  uLogin in '..\source\uLogin.pas' {LoginForm},
  uCommonType in '..\source\lib\uCommonType.pas',
  uSql in '..\source\lib\uSql.pas',
  uVarUtils in '..\source\lib\uVarUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TDM, DM);
  Application.Title := DM.FDManager.ConnectionDefs.FindConnectionDef('Connection').Params.Values['ApplicationName'];

  var LoginForm: TLoginForm;

  LoginForm := TLoginForm.Create(nil);

  if LoginForm.ShowModal = 1 then
  begin
    LoginForm.Free;
    Application.CreateForm(TMainForm, MainForm);
    Application.Run;
  end
  else
  begin
    Application.Terminate;
  end;

end.
