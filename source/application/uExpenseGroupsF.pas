unit uExpenseGroupsF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBF, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxGeometry,
  dxFramedControl, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, cxButtons, dxPanel,
  cxContainer, cxEdit, System.Skia, Vcl.Skia, cxCheckBox, cxTextEdit,
  dxSkinBasic, Vcl.ComCtrls, dxCore, cxDateUtils, dxCoreGraphics, cxButtonEdit,
  uLookupEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TExpenseGroupF = class(TBaseFormDBF)
    edtName: TcxTextEdit;
    cbIsActive: TcxCheckBox;
    SkLabel1: TSkLabel;
    procedure btnOkClick(Sender: TObject);
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
  ExpenseGroupF: TExpenseGroupF;

implementation

uses
  uCommonType, uSql;

{$R *.dfm}


procedure TExpenseGroupF.DataCheck;
begin
  inherited;

  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit:
    begin
      if edtName.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Наименование] обязательно к заполнению!';
        edtName.SetFocus;
        Exit();
      end
    end;
  end;
end;

procedure TExpenseGroupF.DataLoad;
begin
  FDQuery.Close;
  FDQuery.sql.text :=
  '''
               select Name
                     ,isActive
                     ,upDateTime
                     ,upUserID
                 from tExpenseGroups (nolock)
               where ExpenseGroupID = :ExpenseGroupID
  ''';
  FDQuery.ParamByName('ExpenseGroupID').AsInteger := ID;
  FDQuery.Open;

  edtName.text := FDQuery.FieldByName('Name').AsString;
  cbIsActive.Checked := FDQuery.FieldByName('Name').AsBoolean;
  inherited;
end;

procedure TExpenseGroupF.btnOkClick(Sender: TObject);
var sqltext: string;
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert:
    begin
      sqltext :='''
        declare @R int = 0
               ,@M varchar(256) = ''

        if exists (Select 1
                     from tExpenseGroups (nolock)
                    where Name = :Name)
        begin
          select @R = 1
                ,@M = 'Наименование существует'

          goto exit_
        end;

        insert tExpenseGroups
              (Name, isActive, InUserID, UpUserID)
        select :Name,
               :isActive,
               dbo.GetUserID(),
               dbo.GetUserID()


        exit_:

        select @R as R
              ,@M as M

      ''';

      tSql.Open(sqltext,
               ['Name','isActive'],
               [edtName.Text,
               cbIsActive.Checked]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
      tRetVal.Message := tSql.Q.FieldByName('M').Value;
    end;
    acUpdate:
    begin
      sqltext :='''
        declare @R int = 0
               ,@M varchar(256) = ''

        if exists (Select 1
                     from tExpenseGroups (nolock)
                    where Name             = :Name
                      and ExpenseGroupID  <> :ExpenseGroupID)
        begin
          select @R = 1
                ,@M = 'Наименование существует'

          goto exit_
        end;

        Update tExpenseGroups
           set Name     = :Name,
               isActive = :isActive,
               UpUserID = dbo.GetUserID(),
               UpDateTime=GetDate()
         where ExpenseGroupID = :ExpenseGroupID


        exit_:

        select @R as R
              ,@M as M

      ''';

      tSql.Open(sqltext,
               ['Name','isActive', 'ExpenseGroupID'],
               [edtName.Text,
               cbIsActive.Checked,
               ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
      tRetVal.Message := tSql.Q.FieldByName('M').Value;
    end;
    acDelete:
    begin
      sqltext :='''
        declare @R int = 0
               ,@M varchar(256) = ''

        if exists (Select 1
                     from tExpenseItems (nolock)
                    where ExpenseGroupID = :ExpenseGroupID)
        begin
          select @R = 1
                ,@M = 'Группа используется в справочнике "Статьи расходов"'

          goto exit_
        end;

        delete
          from tExpenseGroups
         where ExpenseGroupID = :ExpenseGroupID


        exit_:

        select @R as R
              ,@M as M

      ''';

      tSql.Open(sqltext,
               ['ExpenseGroupID'],
               [ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
      tRetVal.Message := tSql.Q.FieldByName('M').Value;
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

initialization
  RegisterClass(TExpenseGroupF);

end.
