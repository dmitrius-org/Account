unit uBuyerF;

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
  Vcl.ToolWin, cxCheckBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TBuyerF = class(TBaseFormDBF)
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
    edtSignPartner: TcxCheckBox;
    edtINN: TcxTextEdit;
    SkLabel4: TSkLabel;
    edtPartner: TcxLookupComboBox;
    SkLabel5: TSkLabel;
    edtFullName: TcxTextEdit;
    SkLabel6: TSkLabel;
    edtlegalAaddress: TcxTextEdit;
    edtPostAddress: TcxTextEdit;
    SkLabel7: TSkLabel;
    SkLabel8: TSkLabel;
    edtEdo: TcxTextEdit;
    edtEdoID: TcxTextEdit;
    SkLabel9: TSkLabel;
    edtEdoIDL: TSkLabel;
    btnAuutoFillByInn: TcxButton;
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
  BuyerF: TBuyerF;

implementation

uses
  uCommonType, uSql, uDataModule, MTLogger;

{$R *.dfm}

{ TClientF }

procedure TBuyerF.acContactAddExecute(Sender: TObject);
begin
  qContact.Insert;
end;

procedure TBuyerF.acContactDeleteExecute(Sender: TObject);
begin
  qContact.Delete;
end;

procedure TBuyerF.acContactEditExecute(Sender: TObject);
begin
  qContact.Edit;
end;

procedure TBuyerF.acContactRefreshExecute(Sender: TObject);
begin
  ContactRefresh;
end;

procedure TBuyerF.acContactSaveExecute(Sender: TObject);
begin
  qContact.Post;
end;

procedure TBuyerF.btnOkClick(Sender: TObject);
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert:
    begin
      tSql.Open('''
                  declare @R       int = 0
                         ,@BuyerID numeric(15,0)

                  exec @R = BuyerInsert
                              @BuyerID      = @BuyerID out
                             ,@Name    	    = :Name
                             ,@FullName	    = :FullName
                             ,@Inn	        = :Inn
                             ,@PostAddress	= :PostAddress
                             ,@LegalAddress	= :LegalAddress
                             ,@Edo	        = :Edo
                             ,@EdoID	      = :EdoID
                             ,@Discount	    = :Discount
                             ,@DiscountDate	= :DiscountDate
                             ,@PartnerID  	= :PartnerID
                             ,@IsPartner  	= :IsPartner
                  select @R as R
                ''',
               ['Name', 'FullName', 'Inn', 'PostAddress', 'LegalAddress', 'Edo',
                'EdoID', 'Discount', 'DiscountDate', 'PartnerID', 'IsPartner'],
               [edtName.Text,
                edtFullName.Text,
                edtINN.Text,
                edtPostAddress.Text,
                edtlegalAaddress.Text,
                edtEdo.Text,
                edtEdoID.Text,
                edtDiscount.Value,
                edtDiscountDate.Date,
                edtPartner.EditValue,
                edtSignPartner.Checked
                ]
               );


      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = BuyerEdit
                              @BuyerID      = :BuyerID
                             ,@Name    	    = :Name
                             ,@FullName	    = :FullName
                             ,@Inn	        = :Inn
                             ,@PostAddress	= :PostAddress
                             ,@LegalAddress	= :LegalAddress
                             ,@Edo	        = :Edo
                             ,@EdoID	      = :EdoID
                             ,@Discount	    = :Discount
                             ,@DiscountDate	= :DiscountDate
                             ,@PartnerID  	= :PartnerID
                             ,@IsPartner  	= :IsPartner

                  select @R as R
                ''',
               ['Name', 'FullName', 'Inn', 'PostAddress', 'LegalAddress', 'Edo',
                'EdoID', 'Discount', 'DiscountDate', 'PartnerID', 'IsPartner', 'BuyerID'],
               [edtName.Text,
                edtFullName.Text,
                edtINN.Text,
                edtPostAddress.Text,
                edtlegalAaddress.Text,
                edtEdo.Text,
                edtEdoID.Text,
                edtDiscount.Value,
                edtDiscountDate.Date,
                edtPartner.EditValue,
                edtSignPartner.Checked,
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

procedure TBuyerF.ContactRefresh;
begin
  qContact.Close;
  qContact.Open;
end;

procedure TBuyerF.DataCheck;
begin

  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit:
    begin
      if edtName.text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Наименование] обязательно к заполнению!';
        edtName.SetFocus;
        Exit();
      end;
      if edtDiscountDate.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Дата скидки] обязательно к заполнению!';
        edtDiscountDate.SetFocus;
        Exit();
      end;
      if edtDiscount.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Скидка] обязательно к заполнению!';
        edtDiscount.SetFocus;
        Exit();
      end
    end;
  end;
end;

procedure TBuyerF.DataLoad;
begin
  TSql.Open('''

              exec ContactFill
                      @ObjectTypeID      = 2
                     ,@ObjectID          = :KontragentID
                     ,@Mode              = 0

            exec DiscountFill
                      @ObjectTypeID      = 2
                     ,@ObjectID          = :KontragentID
                     ,@Mode              = 0


              select Name
                    ,FullName
                    ,Inn
                    ,PostAddress
                    ,LegalAddress
                    ,Edo
                    ,EdoID
                    ,Discount
                    ,DiscountDate
                    ,PartnerID
                    ,IsPartner
                    ,Debts
                    ,InDateTime
                    ,UserID
                from tKontragents  (nolock)
               where KontragentID = :KontragentID
            ''',
            ['KontragentID'],
            [ID]
            );
  edtSignPartner.Checked := TSql.Q.FieldByName('IsPartner').AsBoolean;
  edtINN.Text := TSql.Q.FieldByName('Inn').Value;
  edtPartner.EditValue := TSql.Q.FieldByName('PartnerID').AsInteger;
  edtName.Text := TSql.Q.FieldByName('Name').Value;
  edtFullName.Text := TSql.Q.FieldByName('FullName').Value;
  edtPostAddress.Text := TSql.Q.FieldByName('PostAddress').Value;
  edtlegalAaddress.Text := TSql.Q.FieldByName('LegalAddress').Value;
  edtEdo.Text := TSql.Q.FieldByName('Edo').Value;
  edtEdoID.Text := TSql.Q.FieldByName('EdoID').Value;
  edtDiscountDate.Date :=  TSql.Q.FieldByName('DiscountDate').Value;
  edtDiscount.Value := TSql.Q.FieldByName('Discount').Value;

  inherited;
end;

procedure TBuyerF.DiscountRefresh;
begin
  qDiscount.close;
  qDiscount.Open;
end;

procedure TBuyerF.FormShow(Sender: TObject);
begin
  inherited;

  case FormAction of
    acInsert, acReportCreate:
    begin
      Self.Caption := 'Добавление покупателя';
      edtDiscountDate.date := Date();
      tSQl.Exec('delete pContacts from pContacts (rowlock) where Spid = @@Spid', [], []);
      tSQl.Exec('delete pDiscounts from pDiscounts (rowlock) where Spid = @@Spid', [], []);
    end;
    acUpdate, acReportEdit, acUserAction:
    begin
      self.Caption := 'Изменение покупателя';
    end;
    acDelete:
    begin
      self.Caption := 'Удаление покупателя';
    end;
    acShow:
    begin
      self.Caption := 'Просмотр покупателя';
    end;
  else
  end;

  ContactRefresh;
  DiscountRefresh;
end;

procedure TBuyerF.PageControl1DrawTab(Control: TCustomTabControl;
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

procedure TBuyerF.TableViewDataControllerDataChanged(Sender: TObject);
begin
  inherited;

  ContactSaveButtonSetEnabled;
  ContactEditButtonSetEnabled;
end;

procedure TBuyerF.ContactSaveButtonSetEnabled;
begin
  acContactSave.Enabled := qContact.State in [dsEdit, dsNewValue, dsInsert];
end;

procedure TBuyerF.ContactEditButtonSetEnabled;
begin
  acContactEdit.Enabled:= qContact.RecordCount > 0;
  acContactDelete.Enabled:= qContact.RecordCount > 0;
end;

procedure TBuyerF.TableViewUpdateEdit(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit);
begin
  inherited;
  ContactSaveButtonSetEnabled;
end;

initialization
  RegisterClass(TBuyerF);
end.
