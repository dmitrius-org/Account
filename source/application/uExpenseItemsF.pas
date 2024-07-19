unit uExpenseItemsF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBF, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, cxGeometry,
  dxFramedControl, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, cxButtons, dxPanel,
  System.Skia, cxContainer, cxEdit, cxTextEdit, Vcl.Skia, cxCheckBox,
  cxMaskEdit, cxButtonEdit, cxDBEdit, dxDBSparkline, dxSparkline, dxTokenEdit,
  dxDBTokenEdit, dxCoreGraphics, uLookupEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxCalendar;

type
  TExpenseItemsF = class(TBaseFormDBF)
    SkLabel1: TSkLabel;
    edtName: TcxTextEdit;
    cbIsActive: TcxCheckBox;
    SkLabel2: TSkLabel;
    edtExpenseGroup: ALookupEdit;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    /// <summary>
    ///  DataLoad - получение данных с сервера, дл€ отображени€ на форме
    ///</summary>
    procedure DataLoad(); override;

    /// <summary>
    ///  DataCheck - проверка заполнени€ об€зательных полей
    ///</summary>
    procedure DataCheck();
  end;

var
  ExpenseItemsF: TExpenseItemsF;

implementation

uses
  uSql, uCommonType, uDataModule, uImageModule;

{$R *.dfm}

procedure TExpenseItemsF.btnOkClick(Sender: TObject);
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
                     from tExpenseItems (nolock)
                    where Name = :Name)
        begin
          select @R = 1
                ,@M = 'Ќаименование существует'

          goto exit_
        end;

        insert tExpenseItems
              (Name, isActive, ExpenseGroupID, InUserID, UpUserID)
        select :Name, :isActive, :ExpenseGroupID, dbo.GetUserID(), dbo.GetUserID()


        exit_:

        select @R as R
              ,@M as M

      ''';

      tSql.Open(sqltext,
               ['Name','isActive', 'ExpenseGroupID'],
               [edtName.Text,
               cbIsActive.Checked,
               edtExpenseGroup.LookupKey
               ]
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
                     from tExpenseItems (nolock)
                    where Name             = :Name
                      and ExpenseGroupID   = :ExpenseGroupID
                      and ExpenseItemID   <> :ExpenseItemID)
        begin
          select @R = 1
                ,@M = 'Ќаименование существует'

          goto exit_
        end;

        Update tExpenseItems
           set Name     = :Name,
               isActive = :isActive,
               ExpenseGroupID=:ExpenseGroupID,
               UpUserID = dbo.GetUserID(),
               UpDateTime=GetDate()
         where ExpenseItemID =:ExpenseItemID

        exit_:

        select @R as R
              ,@M as M

      ''';

      tSql.Open(sqltext,
               ['Name','isActive', 'ExpenseGroupID', 'ExpenseItemID'],
               [edtName.Text,
               cbIsActive.Checked,
               edtExpenseGroup.LookupKey,
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

        delete
          from tExpenseItems
         where ExpenseItemID = :ExpenseItemID


        exit_:

        select @R as R
              ,@M as M

      ''';

      tSql.Open(sqltext,
               ['ExpenseItemID'],
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

procedure TExpenseItemsF.DataCheck;
begin
  inherited;

  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit:
    begin
      if edtName.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'ѕоле [Ќаименование] об€зательно к заполнению!';
        edtName.SetFocus;
        Exit();
      end
    end;
  end;
end;

procedure TExpenseItemsF.DataLoad;
begin
  FDQuery.Close;
  FDQuery.sql.text :=
  '''
            select e.ExpenseItemID
                  ,g.Name ExpenseGroup
                  ,e.ExpenseGroupID
                  ,e.Name
                  ,e.isActive
                  ,e.upDateTime
                  ,e.upUserID
              from tExpenseItems e (nolock)
              left join tExpenseGroups g (nolock)
                     on g.ExpenseGroupID = e.ExpenseGroupID
              where e.ExpenseItemID=:ExpenseItemID
  ''';
  FDQuery.ParamByName('ExpenseItemID').AsInteger := ID;
  FDQuery.Open;

  edtName.text := FDQuery.FieldByName('Name').AsString;
  edtExpenseGroup.LookupKey := FDQuery.FieldByName('ExpenseGroupID').AsInteger;
  cbIsActive.Checked := FDQuery.FieldByName('Name').AsBoolean;
  inherited;
end;

initialization
  RegisterClass(TExpenseItemsF);
end.
