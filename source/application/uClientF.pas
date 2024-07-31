unit uClientF;

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
  dxPanel, dxBarBuiltInMenu, cxPC, cxCalc, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, cxImageList,
  Vcl.ToolWin, cxCurrencyEdit, cxLabel;

type
  TClientF = class(TBaseFormDBF)
    PageControl1: TPageControl;
    TabCommon: TTabSheet;
    TabContact: TTabSheet;
    TabDiscount: TTabSheet;
    dsContact: TDataSource;
    qContact: TFDQuery;
    qDiscount: TFDQuery;
    dsDiscount: TDataSource;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    GridDiscount: TcxGrid;
    TableViewDiscount: TcxGridDBTableView;
    GridLevelDiscount: TcxGridLevel;
    qContactID: TFMTBCDField;
    qContactSpid: TFMTBCDField;
    qContactContactID: TFMTBCDField;
    qContactObjectTypeID: TIntegerField;
    qContactObjectID: TFMTBCDField;
    qContactPhone: TStringField;
    qContactMail: TStringField;
    qContactComment: TStringField;
    qContactInDateTime: TSQLTimeStampField;
    qContactUpDateTime: TSQLTimeStampField;
    qContactUpdate: TFDUpdateSQL;
    TableViewPhone: TcxGridDBColumn;
    TableViewMail: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    cxImageList: TcxImageList;
    ActionList: TActionList;
    acContactAdd: TAction;
    acContactEdit: TAction;
    acContactDelete: TAction;
    acContactRefresh: TAction;
    acContactSave: TAction;
    qDiscountObjectTypeID: TIntegerField;
    qDiscountObjectID: TFMTBCDField;
    qDiscountDiscount: TFloatField;
    qDiscountDiscountDate: TSQLTimeStampField;
    qDiscountComment: TStringField;
    TableViewDiscountDiscount: TcxGridDBColumn;
    TableViewDiscountDiscountDate: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dxPanel2: TdxPanel;
    edtDiscount: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    edtDiscountDate: TcxDateEdit;
    edtName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxStyle2: TcxStyle;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1DrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure acContactAddExecute(Sender: TObject);
    procedure acContactEditExecute(Sender: TObject);
    procedure acContactDeleteExecute(Sender: TObject);
    procedure acContactSaveExecute(Sender: TObject);
    procedure acContactRefreshExecute(Sender: TObject);
    procedure TableViewUpdateEdit(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
    procedure TableViewDataControllerDataChanged(Sender: TObject);
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

    procedure ContactRefresh();
    procedure DiscountRefresh();


    procedure ContactSaveButtonSetEnabled();
    procedure ContactEditButtonSetEnabled();

  end;

var
  ClientF: TClientF;

implementation

uses
  uCommonType, uSql, uDataModule, MTLogger;

{$R *.dfm}

{ TClientF }

procedure TClientF.acContactAddExecute(Sender: TObject);
begin
  qContact.Insert;
end;

procedure TClientF.acContactDeleteExecute(Sender: TObject);
begin
  qContact.Delete;
end;

procedure TClientF.acContactEditExecute(Sender: TObject);
begin
  qContact.Edit;
end;

procedure TClientF.acContactRefreshExecute(Sender: TObject);
begin
  ContactRefresh;
end;

procedure TClientF.acContactSaveExecute(Sender: TObject);
begin
  qContact.Post;
end;

procedure TClientF.btnOkClick(Sender: TObject);
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert:
    begin
      tSql.Open('''
                  declare @R int = 0
                            ,@ClientID numeric(15,0)

                  exec @R = ClientInsert
                                @ClientID    = @ClientID out
                               ,@Name        = :Name
                               ,@Discount    = :Discount
                               ,@DiscountDate= :DiscountDate

                  select @R as R
                ''',
               ['Name', 'DiscountDate', 'Discount'],
               [edtName.Text ,
                edtDiscountDate.Date,
                edtDiscount.Value]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = ClientEdit
                                @ClientID    = :ClientID
                               ,@Name        = :Name
                               ,@Discount    = :Discount
                               ,@DiscountDate= :DiscountDate

                  select @R as R
                ''',
               ['Name', 'DiscountDate', 'Discount', 'ClientID'],
               [edtName.Text ,
                edtDiscountDate.Date,
                edtDiscount.Value,
                ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acDelete:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = ClientDelete
                             @ClientID = :ClientID

                  select @R as R
                ''',
               ['ClientID'],
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

procedure TClientF.ContactRefresh;
begin
  qContact.Close;
  qContact.Open;
end;

procedure TClientF.DataCheck;
begin

  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit:
    begin
      if edtName.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Наименование] обязательно к заполнению!';
        PageControl1.ActivePage := TabCommon;
        edtName.SetFocus;
        Exit();
      end;
      if edtDiscountDate.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Дата скидки] обязательно к заполнению!';
        PageControl1.ActivePage := TabCommon;
        edtDiscountDate.SetFocus;
        Exit();
      end;
      if edtDiscount.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Скидка] обязательно к заполнению!';
        PageControl1.ActivePage := TabCommon;
        edtDiscount.SetFocus;
        Exit();
      end
    end;
  end;
end;

procedure TClientF.DataLoad;
begin
  FDQuery.Close;
  FDQuery.sql.text :=
  '''
            exec ContactFill
                      @ObjectTypeID      = 1
                     ,@ObjectID          = :KontragentID
                     ,@Mode              = 0

            exec DiscountFill
                      @ObjectTypeID      = 1
                     ,@ObjectID          = :KontragentID
                     ,@Mode              = 0


              select
                     k.*
                from tKontragents k (nolock)
               where k.KontragentID = :KontragentID
            ''';
  FDQuery.ParamByName('KontragentID').AsInteger := ID;
  FDQuery.Open;

  edtName.Text := FDQuery.FieldByName('Name').Value;
  edtDiscountDate.Date :=  FDQuery.FieldByName('DiscountDate').Value;
  edtDiscount.Value := FDQuery.FieldByName('Discount').Value;

  inherited;
end;

procedure TClientF.DiscountRefresh;
begin
  qDiscount.close;
  qDiscount.Open;
end;

procedure TClientF.FormShow(Sender: TObject);
begin
  inherited;

  case FormAction of
    acInsert, acReportCreate:
    begin
      Self.Caption := 'Добавление клиента';
      edtDiscountDate.date := Date();
      tSQl.Exec('delete pContacts from pContacts (rowlock) where Spid = @@Spid', [], []);
      tSQl.Exec('delete pDiscounts from pDiscounts (rowlock) where Spid = @@Spid', [], []);
    end;
    acUpdate, acReportEdit, acUserAction:
    begin
      self.Caption := 'Изменение клиента ' +  edtName.Text;
    end;
    acDelete:
    begin
      self.Caption := 'Удаление клиента ' + edtName.Text;
    end;
    acShow:
    begin
      self.Caption := 'Просмотр клиента ' +  edtName.Text;
    end;
  else
  end;

  ContactRefresh;
  DiscountRefresh;
end;

procedure TClientF.PageControl1DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
y    : Integer;
x    : Integer;
aRect: TRect;
begin
  if Active then
  begin
    Control.Canvas.Brush.Color := clWebLightGreen;
    Control.Canvas.FillRect(Rect);
  end
  else
  begin
    Control.Canvas.Brush.Color := clBtnFace;
    Control.Canvas.FillRect(Rect);
  end;

  y  := Rect.Top + ((Rect.Bottom - Rect.Top - Control.Canvas.TextHeight(TTabControl(Control).Tabs[TabIndex])) div 2) + 1;
  x  := Rect.Left + ((Rect.Right - Rect.Left - Control.Canvas.TextWidth (TTabControl(Control).Tabs[TabIndex])) div 2) + 1;
  //draw the tab title
  Control.Canvas.TextOut(x,y,TTabControl(Control).Tabs[TabIndex]);
end;

procedure TClientF.TableViewDataControllerDataChanged(Sender: TObject);
begin
  inherited;

  ContactSaveButtonSetEnabled;
  ContactEditButtonSetEnabled;
end;

procedure TClientF.ContactSaveButtonSetEnabled;
begin
  acContactSave.Enabled := qContact.State in [dsEdit, dsNewValue, dsInsert];
end;

procedure TClientF.ContactEditButtonSetEnabled;
begin
  acContactEdit.Enabled:= qContact.RecordCount > 0;
  acContactDelete.Enabled:= qContact.RecordCount > 0;
end;

procedure TClientF.TableViewUpdateEdit(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
begin
  inherited;
  ContactSaveButtonSetEnabled;
end;

initialization
  RegisterClass(TClientF);
end.
