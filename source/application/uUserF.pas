unit uUserF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBF, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxGeometry, dxFramedControl,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, cxButtons, uLookupEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxPanel, cxCheckBox, cxLabel;

type
  TUserF = class(TBaseFormDBF)
    edtLogin: TcxTextEdit;
    edtName: TcxTextEdit;
    IsAdmin: TcxCheckBox;
    IsBlock: TcxCheckBox;
    edtPassword: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxLabel1: TcxLabel;
    lblPassword: TcxLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    /// <summary>
    ///  DataLoad - получение данных с сервера, для отображения на форме
    ///</summary>
    procedure DataLoad(); override;

    /// <summary>
    ///  DataCheck - проверка заполнения обязательных полей
    ///</summary>
    procedure DataCheck();
  end;

var
  UserF: TUserF;

implementation

uses
  uCommonType, uSql;

{$R *.dfm}

{ TUserF }

procedure TUserF.btnOkClick(Sender: TObject);
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert:
    begin
      tSql.Open('''
                  declare @R       int = 0
                        ,@UserID numeric(18, 0)
                 exec @r = UserInsert
                             @UserID   = @UserID out
                            ,@Brief    = :Brief
                            ,@Name     = :Name
                            ,@isBlock  = :isBlock
                            ,@DateBlock= :DateBlock
                            ,@Password = :Password

                  select @R as R
                ''',
               ['Brief', 'Name', 'isBlock', 'DateBlock', 'Password'],
               [edtLogin.Text,
                edtName.Text,
                IsBlock.Checked,
                null,
                edtPassword.Text
                ]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
         tSql.Open('''
                  declare @R int = 0

                 exec @r = UserUpdate
                             @UserID   = :UserID
                            ,@Brief    = :Brief
                            ,@Name     = :Name
                            ,@isBlock  = :isBlock
                            ,@DateBlock= :DateBlock
                           -- ,@Password = :Password
                  select @R as R
                ''',
               ['Brief', 'Name', 'isBlock', 'DateBlock', 'UserID'],
               [edtLogin.Text,
                edtName.Text,
                IsBlock.Checked,
                null,
                ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acDelete:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = UserDelete
                              @UserID  = :UserID

                  select @R as R
                ''',
               ['UserID'],
               [ID]
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

procedure TUserF.DataCheck;
begin
  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit:
    begin
      if edtLogin.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Логин] обязательно к заполнению!';
        edtLogin.SetFocus;
        Exit();
      end;
      if edtName.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Наименование] обязательно к заполнению!';
        edtName.SetFocus;
        Exit();
      end;
    end;
  end;
end;

procedure TUserF.DataLoad;
begin
  FDQuery.Close;
  FDQuery.SQL.Text := '''
    select u.*
      from vUsers u
     where u.UserID = :UserID
  ''';
  FDQuery.ParamByName('UserID').Value := ID;
  FDQuery.Open;

  edtLogin.Text        := FDQuery.FieldValues['Brief'];
  edtName.Text         := FDQuery.FieldValues['Name'];
  IsAdmin.Checked      := FDQuery.FieldValues['isAdmin'];
  IsBlock.Checked      := FDQuery.FieldValues['isBlock'];

  case FormAction of
    acUpdate, acReportEdit, acUserAction:
    begin
        if FDQuery.FieldByName('isAdmin').AsBoolean then
        begin
          edtLogin.Enabled := False;
          edtPassword.Enabled := False;
        end;
    end;
    acDelete:
    begin
        if FDQuery.FieldByName('isAdmin').AsBoolean then
        begin
          btnOk.Enabled := False;
        end;
    end;

  else
  end;
  Caption := 'Пользователь [' + edtLogin.Text   + ']';

  inherited;
end;

procedure TUserF.FormShow(Sender: TObject);
begin
  inherited;

  case FormAction of
    acInsert, acReportCreate:
    begin
      Self.Caption := 'Добавление пользователя';
     // tSQl.Exec('delete pContacts from pContacts (rowlock) where Spid = @@Spid', [], []);

    end;
    acUpdate, acReportEdit, acUserAction:
    begin
      edtPassword.Visible := False;
      lblPassword.Visible := False;
    end;
    acDelete, acShow:
    begin
      edtPassword.Visible := False;
      lblPassword.Visible := False;
    end;
  else
  end;
end;

initialization
  RegisterClass(TUserF);

end.
