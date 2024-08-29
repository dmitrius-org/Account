unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.StdActns,
  Vcl.FormTabsBar, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ActnMenus, cxImageList, cxGraphics, uGrantUtils,

  uAccountT, uTransactionT, uDocumentRequestT, uStatisticT, dxBarBuiltInMenu,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxPC,
  System.Generics.Collections, Vcl.TitleBarCtrls, Vcl.StdCtrls, cxButtons,
  Vcl.Buttons;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    ActionList: TActionList;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    ToolBar2: TToolBar;
    ImageList: TcxImageList;
    actAccount: TAction;
    ToolButton1: TToolButton;
    actKassa: TAction;
    actKontragent: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    actDocumentRequest: TAction;
    ToolButton5: TToolButton;
    actCredit: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    actTask: TAction;
    ToolButton8: TToolButton;
    actExpenseItems: TAction;
    ToolButton9: TToolButton;
    actProfit: TAction;
    ToolButton10: TToolButton;
    actDebs: TAction;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    actUser: TAction;
    actStatistic: TAction;
    ToolButton11: TToolButton;
    MainPage: TcxPageControl;
    ToolButton15: TToolButton;
    actSupplierClient: TAction;
    actAudit: TAction;
    ToolButton16: TToolButton;
    TitleBarPanel1: TTitleBarPanel;
    cxImageList1: TcxImageList;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure actAccountExecute(Sender: TObject);
    procedure actKontragentExecute(Sender: TObject);
    procedure actDocumentRequestExecute(Sender: TObject);
    procedure actTaskExecute(Sender: TObject);
    procedure actCreditExecute(Sender: TObject);
    procedure actExpenseItemsExecute(Sender: TObject);
    procedure actKassaExecute(Sender: TObject);
    procedure actProfitExecute(Sender: TObject);
    procedure actDebsExecute(Sender: TObject);
    procedure actUserExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actStatisticExecute(Sender: TObject);
    procedure MainPageCanCloseEx(Sender: TObject; ATabIndex: Integer;
      var ACanClose: Boolean);
    procedure actSupplierClientExecute(Sender: TObject);
    procedure actAuditExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FGrant: TAccess;

    procedure SetToolBarVisible();

  public
    { Public declarations }
    procedure SetActionEnabled();

     procedure CreateTab(const FormClassName: string);
     procedure CreateModal(const FormClassName: string);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses uDataModule, uBaseFormT, MTLogger, uUtilsRegistry;

procedure TMainForm.actAccountExecute(Sender: TObject);
begin
  CreateTab('TAccountT');
end;

procedure TMainForm.actAuditExecute(Sender: TObject);
begin
  CreateTab('TAuditT');
end;

procedure TMainForm.actCreditExecute(Sender: TObject);
begin
  CreateTab('TCreditsT');
end;

procedure TMainForm.actDebsExecute(Sender: TObject);
begin
  CreateTab('TDolgT');
end;

procedure TMainForm.actDocumentRequestExecute(Sender: TObject);
begin
  CreateTab('TDocumentRequestT');
end;

procedure TMainForm.actExpenseItemsExecute(Sender: TObject);
begin
  CreateTab('TExpenseItemsT');
end;

procedure TMainForm.actKassaExecute(Sender: TObject);
begin
  CreateTab('TTransactionT');
end;

procedure TMainForm.actKontragentExecute(Sender: TObject);
begin
  CreateTab('TKontragentsT');
end;

procedure TMainForm.actProfitExecute(Sender: TObject);
begin
  CreateTab('TProfit_T');
end;

procedure TMainForm.actStatisticExecute(Sender: TObject);
begin
  CreateModal('TStatisticT');
end;

procedure TMainForm.actSupplierClientExecute(Sender: TObject);
begin
  CreateTab('TSupplierClientT');
end;

procedure TMainForm.actTaskExecute(Sender: TObject);
begin
  CreateTab('TTasksT');
end;

procedure TMainForm.actUserExecute(Sender: TObject);
begin
  CreateModal('TUserT');
end;

procedure TMainForm.CreateModal(const FormClassName: string);
var form : TBaseFormT;
begin
  form := TFormClass(FindClass(FormClassName)).Create(self) as TBaseFormT;
  form.ShowModal;
  form.Free;
end;

procedure TMainForm.CreateTab(const FormClassName: string);
var form : TBaseFormT;
    //  fc : TFormClass;
      mr : TModalResult;
      Ts : TcxTabSheet;
begin
  if not DM.OpenFormList.ContainsKey(FormClassName) then
  begin
    form := TFormClass(FindClass(FormClassName)).Create(self) as TBaseFormT;
    Ts := TcxTabSheet.Create(Self);
    Ts.PageControl   := MainPage;
    Ts.Caption       := form.Caption;


    form.Parent  := Ts;
    form.Align       := alClient;
    form.BorderStyle := bsNone;
    form.Visible := True;

    Ts.Tag := Integer(form);

    dm.OpenFormList.Add(FormClassName, Ts);
  end
  else
  begin
    dm.OpenFormList.TryGetValue(FormClassName, TObject(Ts));

  end;

  MainPage.ActivePage := Ts;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RegSave('Toolbar', ToolBar2.Visible);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Caption := DM.FDManager.ConnectionDefs.FindConnectionDef('Connection').Params.Values['ApplicationName'];
  try
    ToolBar2.Visible :=  RegLoad('Toolbar');
  except
  end;
  SetToolBarVisible;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  {$IFDEF Debug}
  TAccess.GrantTemplateCreate(self);
  {$ENDIF}

  TAccess.UserGrantLoad;

  TAccess.SetGrant(self, ActionList);

  SetActionEnabled;
end;

procedure TMainForm.MainPageCanCloseEx(Sender: TObject; ATabIndex: Integer;
  var ACanClose: Boolean);
begin
    logger.Info('MainPageCanCloseEx ' );
  (DM.OpenFormList.Remove(MainPage.Pages[ATabIndex].Controls[0].ClassName));
end;

procedure TMainForm.SetActionEnabled;
begin
  actAccount.Visible := actAccount.Tag=1;
  actKassa.Visible := actKassa.Tag=1;
  actKontragent.Visible := actKontragent.Tag=1;
  actDocumentRequest.Visible := actDocumentRequest.Tag=1;
  actCredit.Visible := actCredit.Tag=1;
  actTask.Visible := actTask.Tag=1;
  actExpenseItems.Visible := actExpenseItems.Tag=1;
  actProfit.Visible := actProfit.Tag=1;
  actUser.Visible := actUser.Tag=1;
  actDebs.Visible := actDebs.Tag=1;
  actStatistic.Visible := actStatistic.Tag=1;
  actSupplierClient.Visible := actSupplierClient.Tag=1;
  actAudit.Visible := actAudit.Tag=1;
end;

procedure TMainForm.SetToolBarVisible;
begin
  if ToolBar2.Visible then
  begin
    SpeedButton1.ImageIndex := 1;
    SpeedButton1.Hint := 'Скрыть панель меню';
  end
  else
  begin
    SpeedButton1.ImageIndex := 0;
    SpeedButton1.Hint := 'Показать панель меню';
  end;
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  ToolBar2.Visible := not ToolBar2.Visible;

  SetToolBarVisible;
end;

end.
