unit uDocumentRequestF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBF, cxGraphics, cxControls, XPStyleActnCtrls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxGeometry,
  dxFramedControl, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, cxButtons, uLookupEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxPanel, System.Skia, Vcl.Skia,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ToolWin, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, cxImageList, Vcl.ExtCtrls;

type
  TDocumentRequestF = class(TBaseFormDBF)
    edtBuyer: ALookupEdit;
    edtSupplier: ALookupEdit;
    SkLabel12: TSkLabel;
    SkLabel8: TSkLabel;
    edtAccountDate: TcxDateEdit;
    SkLabel5: TSkLabel;
    edtAccountNumber: TcxTextEdit;
    SkLabel1: TSkLabel;
    edtPhone: TcxTextEdit;
    SkLabel2: TSkLabel;
    edtMail: TcxTextEdit;
    SkLabel3: TSkLabel;
    cxImageList: TcxImageList;
    ActionList: TActionList;
    acCommentAdd: TAction;
    acCommentEdit: TAction;
    acCommentDelete: TAction;
    acCommentRefresh: TAction;
    acCommentSave: TAction;
    qComment: TFDQuery;
    dsComment: TDataSource;
    qCommentID: TFMTBCDField;
    qCommentCommentID: TFMTBCDField;
    qCommentSpid: TFMTBCDField;
    qCommentComment: TStringField;
    qCommentObjectID: TFMTBCDField;
    qCommentObjectType: TFMTBCDField;
    qCommentInDateTime: TSQLTimeStampField;
    qCommentUpDateTime: TSQLTimeStampField;
    qCommentInUserID: TFMTBCDField;
    qCommentUpUserID: TFMTBCDField;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    TableViewInDateTime: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    qCommentUpdate: TFDUpdateSQL;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acCommentAddExecute(Sender: TObject);
    procedure acCommentEditExecute(Sender: TObject);
    procedure acCommentDeleteExecute(Sender: TObject);
    procedure acCommentRefreshExecute(Sender: TObject);
    procedure acCommentSaveExecute(Sender: TObject);
    procedure TableViewUpdateEdit(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure TableViewDataControllerDataChanged(Sender: TObject);
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

    procedure CommentRefresh();

    procedure CommentSaveButtonSetEnabled();
    procedure CommentEditButtonSetEnabled();
  end;

var
  DocumentRequestF: TDocumentRequestF;

implementation

uses
  uImageModule, uDataModule, uCommonType, uSql;

{$R *.dfm}


procedure TDocumentRequestF.acCommentAddExecute(Sender: TObject);
begin
  qComment.Insert;
end;

procedure TDocumentRequestF.acCommentDeleteExecute(Sender: TObject);
begin
  qComment.Delete;
end;

procedure TDocumentRequestF.acCommentEditExecute(Sender: TObject);
begin
  qComment.Edit;
end;

procedure TDocumentRequestF.acCommentRefreshExecute(Sender: TObject);
begin
  CommentRefresh;
end;

procedure TDocumentRequestF.acCommentSaveExecute(Sender: TObject);
begin
  qComment.Post;
end;

procedure TDocumentRequestF.btnOkClick(Sender: TObject);
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert:
    begin
      tSql.Open('''
                  declare @R int = 0
                         ,@DocumentRequestID  numeric(15,0)

                  exec @R = DocumentRequestAdd
                             @DocumentRequestID= @DocumentRequestID out
                            ,@PayDate          = :PayDate
                            ,@AccountNumber	   = :AccountNumber
                            ,@SupplierID	     = :SupplierID
                            ,@BuyerID	         = :BuyerID
                            ,@Phone	           = :Phone
                            ,@Mail	           = :Mail
                            ,@AccountID        = :AccountID

                  select @R as R
                ''',
               ['PayDate', 'AccountNumber', 'SupplierID', 'BuyerID',
                'Phone', 'Mail', 'AccountID'],
               [edtAccountDate.text
               ,edtAccountNumber.text
               ,edtSupplier.LookupKey
               ,edtBuyer.LookupKey
               ,edtPhone.text
               ,edtMail.text
               ,0]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = DocumentRequestEdit
                             @DocumentRequestID= :DocumentRequestID
                            ,@PayDate          = :PayDate
                            ,@AccountNumber	   = :AccountNumber
                            ,@SupplierID	     = :SupplierID
                            ,@BuyerID	         = :BuyerID
                            ,@Phone	           = :Phone
                            ,@Mail	           = :Mail
                            ,@AccountID        = :AccountID

                  select @R as R
                ''',
               ['PayDate', 'AccountNumber', 'SupplierID', 'BuyerID',
                'Phone', 'Mail', 'AccountID', 'DocumentRequestID'],
               [edtAccountDate.text
               ,edtAccountNumber.text
               ,edtSupplier.LookupKey
               ,edtBuyer.LookupKey
               ,edtPhone.text
               ,edtMail.text
               ,0
               ,ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acDelete:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = DocumentRequestDelete
                             @DocumentRequestID = :DocumentRequestID

                  select @R as R
                ''',
               ['DocumentRequestID'],
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

procedure TDocumentRequestF.CommentEditButtonSetEnabled;
begin
  acCommentEdit.Enabled:= qComment.RecordCount > 0;
  acCommentDelete.Enabled:= qComment.RecordCount > 0;
end;

procedure TDocumentRequestF.CommentRefresh;
begin
  qComment.Close;
  qComment.Open;
end;

procedure TDocumentRequestF.CommentSaveButtonSetEnabled;
begin
   acCommentSave.Enabled := qComment.State in [dsEdit, dsNewValue, dsInsert];
end;

procedure TDocumentRequestF.DataCheck;
begin
  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit, acClone, acAddDebet:
    begin
      if edtAccountNumber.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Счет №] обязательно к заполнению!';
        edtAccountNumber.SetFocus;
        Exit();
      end;

      if edtAccountDate.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Дата оплаты] обязательно к заполнению!';
        edtAccountDate.SetFocus;
        Exit();
      end;

      if edtBuyer.LookupKey = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Покупатель] обязательно к заполнению!';
        edtBuyer.SetFocus;
        Exit();
      end;

      if edtSupplier.LookupKey = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Поставщик] обязательно к заполнению!';
        edtSupplier.SetFocus;
        Exit();
      end;
    end;
  end;
end;

procedure TDocumentRequestF.DataLoad;
begin
  FDQuery.Close;
  FDQuery.sql.text :=
  '''
    exec CommentFill
          @ObjectTypeID = 4
         ,@ObjectID     = :DocumentRequestID
         ,@Mode         = 0

    select dr.DocumentRequestID
          ,dr.PayDate
          ,dr.AccountNumber
          ,dr.SupplierID
          ,dr.BuyerID
          ,dr.Phone
          ,dr.Mail
          ,dr.InDateTime
          ,dr.UserID
      from tDocumentRequest dr (nolock)
     where dr.DocumentRequestID = :DocumentRequestID
  ''';
  FDQuery.ParamByName('DocumentRequestID').AsInteger := ID;
  FDQuery.Open;

  edtAccountNumber.text := FDQuery.FieldByName('AccountNumber').AsString;
  edtAccountDate.text   := FDQuery.FieldByName('PayDate').AsString;
  edtBuyer.LookupKey    := FDQuery.FieldByName('BuyerID').AsInteger;
  edtSupplier.LookupKey := FDQuery.FieldByName('SupplierID').AsInteger;
  edtPhone.text         := FDQuery.FieldByName('Phone').AsString;
  edtMail.text          := FDQuery.FieldByName('Mail').AsString;

  inherited;
end;

procedure TDocumentRequestF.FormShow(Sender: TObject);
begin

  inherited;

  case FormAction of
    acInsert, acReportCreate:
    begin
      Self.Caption := 'Добавление запроса документа';
      edtAccountDate.date := Date();

      tSQl.Exec('delete pComments from pComments (rowlock) where Spid = @@Spid', [], []);
    end;
    acUpdate, acReportEdit, acUserAction:
    begin
      self.Caption := 'Изменение запроса документа ';
    end;
    acDelete:
    begin
      self.Caption := 'Удаление запроса документа ';
    end;
    acShow:
    begin
      self.Caption := 'Просмотр запроса документа ';
    end;
  else
  end;

  CommentRefresh;

end;

procedure TDocumentRequestF.TableViewDataControllerDataChanged(Sender: TObject);
begin
  inherited;
  CommentSaveButtonSetEnabled;
  CommentEditButtonSetEnabled;
end;

procedure TDocumentRequestF.TableViewUpdateEdit(Sender: TcxCustomGridTableView;  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
begin
  CommentSaveButtonSetEnabled;
end;

initialization
  RegisterClass(TDocumentRequestF);
end.
