unit uTasksF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBF, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, cxGeometry,
  dxFramedControl, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxCoreGraphics, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, cxButtons,
  cxButtonEdit, uLookupEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  dxPanel, System.Skia, Vcl.Skia, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMemo;

type
  TTasksF = class(TBaseFormDBF)
    SkLabel1: TSkLabel;
    edtCreateDate: TcxDateEdit;
    SkLabel2: TSkLabel;
    SkLabel3: TSkLabel;
    edtDueDate: TcxDateEdit;
    SkLabel4: TSkLabel;
    SkLabel5: TSkLabel;
    edtComment: TcxMemo;
    edtManager: TcxLookupComboBox;
    edtTaskStatus: TcxLookupComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
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
  TasksF: TTasksF;

implementation

uses
  uCommonType, uSql, uDataModule;

{$R *.dfm}

{ TTasksF }

procedure TTasksF.btnOkClick(Sender: TObject);
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert:
    begin
      tSql.Open('''
                  declare @R int = 0
                            ,@TaskID         numeric(15,0)

                  exec @R = TaskInsert
                              @TaskID         = @TaskID output
                             ,@Comment	      = :Comment
                             ,@DueDate        = :DueDate
                             ,@CreateDate     = :CreateDate
                             ,@ManagerID      = :ManagerID
                             ,@TaskStatusID   = :TaskStatusID

                  select @R as R
                ''',
               ['CreateDate', 'ManagerID', 'DueDate', 'TaskStatusID', 'Comment'],
               [edtCreateDate.date,
               edtManager.EditValue,
               edtDueDate.Date,
               edtTaskStatus.EditValue,
               edtComment.text
               ]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = TaskEdit
                              @TaskID         = :TaskID
                             ,@Comment	      = :Comment
                             ,@DueDate        = :DueDate
                             ,@CreateDate     = :CreateDate
                             ,@ManagerID      = :ManagerID
                             ,@TaskStatusID   = :TaskStatusID

                  select @R as R
                ''',
               ['CreateDate', 'ManagerID', 'DueDate', 'TaskStatusID', 'Comment', 'TaskID'],
               [edtCreateDate.date,
               edtManager.EditValue,
               edtDueDate.Date,
               edtTaskStatus.EditValue,
               edtComment.text,
               ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acDelete:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = TaskDelete
                             @TaskID = :TaskID

                  select @R as R
                ''',
               ['TaskID'],
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

procedure TTasksF.DataCheck;
begin

  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit:
    begin
      if edtCreateDate.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Дата] обязательно к заполнению!';
        edtCreateDate.SetFocus;
        Exit();
      end;
      if edtManager.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Менеджер] обязательно к заполнению!';
        edtManager.SetFocus;
        Exit();
      end;
      if edtTaskStatus.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Статус] обязательно к заполнению!';
        edtTaskStatus.SetFocus;
        Exit();
      end;
      if edtComment.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Поручение] обязательно к заполнению!';
        edtComment.SetFocus;
        Exit();
      end
    end;
  end;
end;

procedure TTasksF.DataLoad;
begin
  FDQuery.Close;
  FDQuery.sql.text :=
  '''
            Select t.*
              from tTasks t (nolock)

             where t.TaskID = :TaskID
  ''';
  FDQuery.ParamByName('TaskID').AsInteger := ID;
  FDQuery.Open;

  edtCreateDate.Date := FDQuery.FieldByName('CreateDate').Value;
  edtManager.EditValue :=  FDQuery.FieldByName('ManagerID').Value;
  edtDueDate.Date := FDQuery.FieldByName('DueDate').Value;
  edtTaskStatus.EditValue :=  FDQuery.FieldByName('TaskStatusID').Value;
  edtComment.text := FDQuery.FieldByName('Comment').AsString;

  inherited;
end;


procedure TTasksF.FormShow(Sender: TObject);
begin
  inherited;

  case FormAction of
    acInsert, acReportCreate:
    begin
      edtCreateDate.date := Date();
      edtTaskStatus.EditValue := 3; //3-не начато
    end;
//    acUpdate, acReportEdit, acUserAction:
//    begin
//    end;
//    acDelete:
//    begin
//    end;
//    acShow:
//    begin
//    end;
  else
  end;
end;

initialization
  RegisterClass(TTasksF);

end.
