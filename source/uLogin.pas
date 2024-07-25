unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, cxLabel, cxTextEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons;

type
  TLoginForm = class(TForm)
    edtLogin: TcxTextEdit;
    cxLabel1: TcxLabel;
    edtPassword: TcxTextEdit;
    cxLabel2: TcxLabel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

uses uDataModule, uImageModule;

procedure TLoginForm.btnCancelClick(Sender: TObject);
begin
 // Close;
   modalresult := mrCancel;
end;

procedure TLoginForm.btnOKClick(Sender: TObject);
begin
  if dm.dbConnect(edtLogin.Text, edtPassword.Text) then
  begin
    modalresult := mrOk;
  end
  else
  begin

  end;
end;

end.
