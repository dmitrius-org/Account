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
  cxContainer, cxEdit, cxTextEdit, cxCheckBox,
  cxMaskEdit, cxButtonEdit, cxDBEdit, dxDBSparkline, dxSparkline, dxTokenEdit,
  dxDBTokenEdit, dxCoreGraphics, uLookupEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDropDownEdit, cxCalendar, cxLabel;

type
  TExpenseItemsF = class(TBaseFormDBF)
    edtName: TcxTextEdit;
    cbIsActive: TcxCheckBox;
    edtExpenseGroup: ALookupEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    /// <summary>
    ///  DataLoad - ��������� ������ � �������, ��� ����������� �� �����
    ///</summary>
    procedure DataLoad(); override;

    /// <summary>
    ///  DataCheck - �������� ���������� ������������ �����
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
                ,@M = '������������ ����������'

          goto exit_
        end;

        DECLARE @ID TABLE (ID numeric(15,0));

        insert tExpenseItems
              (Name, isActive, ExpenseGroupID, InUserID, UpUserID)
        OUTPUT INSERTED.ExpenseItemID INTO @ID
        select :Name, :isActive, :ExpenseGroupID, dbo.GetUserID(), dbo.GetUserID()

       declare @AuditID numeric(18, 2)
              ,@ExpenseItemID numeric(18, 2)
              ,@Comment  varchar(255)

       select @Comment = '���������� ������ ��������: ' + :Name

       Select @ExpenseItemID = ID from @ID

       exec AuditInsert
              @AuditID      = @AuditID out
             ,@ObjectID     = @ExpenseItemID
             ,@ObjectTypeID = 10
             ,@Action       = 'add'
             ,@Comment      = @Comment

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
                ,@M = '������������ ����������'

          goto exit_
        end;

        Update tExpenseItems
           set Name     = :Name,
               isActive = :isActive,
               ExpenseGroupID=:ExpenseGroupID,
               UpUserID = dbo.GetUserID(),
               UpDateTime=GetDate()
         where ExpenseItemID =:ExpenseItemID

       declare @AuditID numeric(18, 2)
              ,@Comment  varchar(255)

       select @Comment = '��������� ������ ��������: ' + :Name

       exec AuditInsert
              @AuditID      = @AuditID out
             ,@ObjectID     = :ExpenseItemID
             ,@ObjectTypeID = 10
             ,@Action       = 'edit'
             ,@Comment      = @Comment

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

        declare @AuditID  numeric(18, 2)
               ,@Comment  varchar(255)

        select @Comment = '�������� ������ �������� ��:' + cast(:ExpenseItemID as varchar)

        exec AuditInsert
                @AuditID      = @AuditID out
                ,@ObjectID     = :ExpenseItemID
                ,@ObjectTypeID = 10
                ,@Action       = 'delete'
                ,@Comment      = @Comment


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
        tRetVal.Message := '���� [������������] ����������� � ����������!';
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
