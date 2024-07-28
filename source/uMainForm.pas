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
  System.Generics.Collections;

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
  private
    { Private declarations }
    FGrant: TAccess;

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

uses uDataModule, uBaseFormT, MTLogger;

procedure TMainForm.actAccountExecute(Sender: TObject);
begin
  CreateTab('TAccountT');
end;

procedure TMainForm.actCreditExecute(Sender: TObject);
begin
  CreateModal('TCreditsT');
end;

procedure TMainForm.actDebsExecute(Sender: TObject);
begin
  CreateModal('TDolgT');
end;

procedure TMainForm.actDocumentRequestExecute(Sender: TObject);
begin
  CreateTab('TDocumentRequestT');
end;

procedure TMainForm.actExpenseItemsExecute(Sender: TObject);
begin
  CreateModal('TExpenseItemsT');
end;

procedure TMainForm.actKassaExecute(Sender: TObject);
begin
  CreateTab('TTransactionT');
end;

procedure TMainForm.actKontragentExecute(Sender: TObject);
begin
  CreateModal('TKontragentsT');
end;

procedure TMainForm.actProfitExecute(Sender: TObject);
begin
  CreateModal('TProfit_T');
end;

procedure TMainForm.actStatisticExecute(Sender: TObject);
begin
  CreateModal('TStatisticT');
end;

procedure TMainForm.actTaskExecute(Sender: TObject);
begin
  CreateModal('TTasksT');
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
    mr : TModalResult;

    Ts : TcxTabSheet;
begin

    if not DM.OpenFormList.ContainsKey(FormClassName) then
    begin
      form := TFormClass(FindClass(FormClassName)).Create(self) as TBaseFormT;
      Ts := TcxTabSheet.Create(Self);
      Ts.PageControl := MainPage;
      Ts.Caption := form.Caption;
      form.Align := alClient;
      form.Parent := Ts;
      form.BorderStyle := bsNone;


      Ts.Tag := Integer(form);

      dm.OpenFormList.Add(FormClassName, Ts);
    end
    else
    begin
      dm.OpenFormList.TryGetValue(FormClassName, TObject(Ts));
    end;

    MainPage.ActivePage := Ts;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Caption := DM.FDManager.ConnectionDefs.FindConnectionDef('Connection').Params.Values['ApplicationName'];

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
end;

end.
