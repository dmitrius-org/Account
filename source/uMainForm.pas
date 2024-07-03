unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TMainForm = class(TForm)
    MainActionList: TActionList;
    MainMenu: TMainMenu;
    actExpenseItems: TAction;
    actExpenseGroups: TAction;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses uDataModule;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Caption := DM.FDManager.ConnectionDefs.FindConnectionDef('Connection').Params.Values['ApplicationName'];
end;

end.
