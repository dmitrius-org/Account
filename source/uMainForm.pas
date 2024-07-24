unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.StdActns,
  Vcl.FormTabsBar, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ActnMenus, cxImageList, cxGraphics, uGrantUtils;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FormTabsBar1: TFormTabsBar;
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
    procedure FormCreate(Sender: TObject);
    procedure actAccountExecute(Sender: TObject);
    procedure FormTabsBar1AcceptForm(AForm: TForm; var AAccept: Boolean);
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
  private
    { Private declarations }
    FGrant: TAccess;

  public
    { Public declarations }
    procedure CreateMDIChild(const FormClassName: string);

    procedure SetActionEnabled();
  end;

var
  MainForm: TMainForm;


implementation

{$R *.dfm}

uses uDataModule, uBaseFormT, MTLogger;

procedure TMainForm.actAccountExecute(Sender: TObject);
begin
  CreateMDIChild('TAccountT');
end;

procedure TMainForm.actCreditExecute(Sender: TObject);
begin
  CreateMDIChild('TCreditsT');
end;

procedure TMainForm.actDebsExecute(Sender: TObject);
begin
  CreateMDIChild('TDolgT');
end;

procedure TMainForm.actDocumentRequestExecute(Sender: TObject);
begin
  CreateMDIChild('TDocumentRequestT');
end;

procedure TMainForm.actExpenseItemsExecute(Sender: TObject);
begin
  CreateMDIChild('TExpenseItemsT');
end;

procedure TMainForm.actKassaExecute(Sender: TObject);
begin
  CreateMDIChild('TTransactionT');
end;

procedure TMainForm.actKontragentExecute(Sender: TObject);
begin
  CreateMDIChild('TKontragentsT');
end;

procedure TMainForm.actProfitExecute(Sender: TObject);
begin
  CreateMDIChild('TProfit_T');
end;

procedure TMainForm.actStatisticExecute(Sender: TObject);
begin
  CreateMDIChild('TStatisticT');
end;

procedure TMainForm.actTaskExecute(Sender: TObject);
begin
  CreateMDIChild('TTasksT');
end;

procedure TMainForm.actUserExecute(Sender: TObject);
begin
  CreateMDIChild('TUserT');
end;

procedure TMainForm.CreateMDIChild(const FormClassName: string);
var form : TBaseFormT;
    mr : TModalResult;
begin

  if dm.OpenFormList.IndexOf(FormClassName) >= 0 then
  begin
//     form := (Find(FormClassName)). as TForm;
//     form.Show;
  end
  else
  begin

    form := TFormClass(FindClass(FormClassName)).Create(self) as TBaseFormT;
    form.FormStyle := fsMDIChild;
    dm.OpenFormList.Add(FormClassName);
  end;
  //form.ShowModal;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Caption := DM.FDManager.ConnectionDefs.FindConnectionDef('Connection').Params.Values['ApplicationName'];

end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  //{$IFDEF Debug}
  //TAccess.GrantTemplateCreate(self);
  //{$ENDIF}

  TAccess.UserGrantLoad;

  TAccess.SetGrant(self, ActionList);

  SetActionEnabled;
end;

procedure TMainForm.FormTabsBar1AcceptForm(AForm: TForm; var AAccept: Boolean);
begin
  logger.Info('FormTabsBar1AcceptForm ' + AForm.Name);
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
end;

end.
