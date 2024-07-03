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
  dxPanel, dxBarBuiltInMenu, cxPC, System.Skia, cxCalc, Vcl.Skia, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, cxImageList,
  Vcl.ToolWin;

type
  TClientF = class(TBaseFormDBF)
    PageControl1: TPageControl;
    TabCommon: TTabSheet;
    SkLabel1: TSkLabel;
    SkLabel2: TSkLabel;
    SkLabel3: TSkLabel;
    edtName: TcxTextEdit;
    edtDiscountDate: TcxDateEdit;
    edtDiscount: TcxCalcEdit;
    TabContact: TTabSheet;
    TabDiscount: TTabSheet;
    dsContact: TDataSource;
    qContact: TFDQuery;
    qDiscount: TFDQuery;
    dsDiscount: TDataSource;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
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
    qContactUserID: TFMTBCDField;
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
    ///  DataLoad - ��������� ������ � �������, ��� ����������� �� �����
    ///</summary>
    procedure DataLoad(); override;

    /// <summary>
    ///  DataCheck - �������� ���������� ������������ �����
    ///</summary>
    procedure DataCheck();

    procedure ContactRefresh();

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
        tRetVal.Message := '���� [������������] ����������� � ����������!';
        edtName.SetFocus;
        Exit();
      end;
      if edtDiscountDate.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := '���� [���� ������] ����������� � ����������!';
        edtDiscountDate.SetFocus;
        Exit();
      end;
      if edtDiscount.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := '���� [������] ����������� � ����������!';
        edtDiscount.SetFocus;
        Exit();
      end
    end;
  end;
end;

procedure TClientF.DataLoad;
begin
  TSql.Open('''

              exec ContactFill
                      @ObjectTypeID      = 1
                     ,@ObjectID          = :KontragentID
                     ,@Mode              = 0

              select
                     k.Name
                    ,k.Discount
                    ,k.DiscountDate
                    ,k.InDateTime
                    ,k.UserID
                from tKontragents k (nolock)
               where k.KontragentID = :KontragentID
            ''',
            ['KontragentID'],
            [ID]
            );

  edtName.Text := TSql.Q.FieldByName('Name').Value;
  edtDiscountDate.Date :=  TSql.Q.FieldByName('Discount').Value;
  edtDiscount.Value := TSql.Q.FieldByName('Discount').Value;

  inherited;
end;

procedure TClientF.FormShow(Sender: TObject);
begin
  inherited;

  case FormAction of
    acInsert, acReportCreate:
    begin
      edtDiscountDate.date := Date();
      tSQl.Exec('delete pContacts from pContacts (rowlock) where Spid = @@Spid', [], []);
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

  ContactRefresh;
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
