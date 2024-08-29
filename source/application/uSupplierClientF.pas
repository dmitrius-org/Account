unit uSupplierClientF;

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
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxPanel, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, cxDBData, cxCurrencyEdit, Vcl.ToolWin, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxLabel, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, cxImageList;

type
  TSupplierClientF = class(TBaseFormDBF)
    PageControl1: TPageControl;
    TabCommon: TTabSheet;
    dxPanel2: TdxPanel;
    edtDiscount: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    edtDiscountDate: TcxDateEdit;
    TabDiscount: TTabSheet;
    GridDiscount: TcxGrid;
    TableViewDiscount: TcxGridDBTableView;
    TableViewDiscountDiscountDate: TcxGridDBColumn;
    TableViewDiscountDiscount: TcxGridDBColumn;
    GridLevelDiscount: TcxGridLevel;
    qDiscount: TFDQuery;
    qDiscountObjectTypeID: TIntegerField;
    qDiscountObjectID: TFMTBCDField;
    qDiscountDiscount: TFloatField;
    qDiscountDiscountDate: TSQLTimeStampField;
    qDiscountComment: TStringField;
    dsDiscount: TDataSource;
    edtSupplier: ALookupEdit;
    edtClient: ALookupEdit;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    procedure FormShow(Sender: TObject);
    procedure PageControl1DrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
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

    procedure DiscountRefresh();
  end;

var
  SupplierClientF: TSupplierClientF;

implementation

uses
  uCommonType, uSql;

{$R *.dfm}

{ TSupplierClientF }

procedure TSupplierClientF.btnOkClick(Sender: TObject);
begin
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert:
    begin
      tSql.Open('''
                  declare @R int = 0
                            ,@SupplierClientID numeric(15,0)

                  exec @R = SupplierClientInsert
                              @SupplierClientID = @SupplierClientID out
                             ,@ClientID         = :ClientID
                             ,@SupplierID       = :SupplierID
                             ,@Discount         = :Discount
                             ,@DiscountDate     = :DiscountDate


                  select @R as R
                ''',
               ['SupplierID', 'ClientID', 'Discount', 'DiscountDate'],
               [edtSupplier.LookupKey,
                edtClient.LookupKey,
                edtDiscount.Value,
                edtDiscountDate.Date]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = SupplierClientEdit
                              @SupplierClientID = :SupplierClientID
                             ,@ClientID         = :ClientID
                             ,@SupplierID       = :SupplierID
                             ,@Discount         = :Discount
                             ,@DiscountDate     = :DiscountDate

                  select @R as R
                ''',
               ['SupplierClientID', 'SupplierID', 'ClientID', 'Discount', 'DiscountDate'],
               [ID,
                edtSupplier.LookupKey,
                edtClient.LookupKey,
                edtDiscount.Value,
                edtDiscountDate.Date]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acDelete:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = SupplierClientDelete
                             @SupplierClientID = :SupplierClientID

                  select @R as R
                ''',
               ['SupplierClientID'],
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

procedure TSupplierClientF.DataCheck;
begin
  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit:
    begin
      if edtSupplier.LookupKey = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Поставщик] обязательно к заполнению!';
        PageControl1.ActivePage := TabCommon;
        edtSupplier.SetFocus;
        Exit();
      end;
      if edtClient.LookupKey = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Клиент] обязательно к заполнению!';
        PageControl1.ActivePage := TabCommon;
        edtClient.SetFocus;
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

procedure TSupplierClientF.DataLoad;
begin
  FDQuery.Close;
  FDQuery.sql.text :=
  '''

            exec DiscountFill
                      @ObjectTypeID      = 4
                     ,@ObjectID          = :SupplierClientID
                     ,@Mode              = 0


              select *
                from tSupplierClient (nolock)
               where SupplierClientID = :SupplierClientID
            ''';
  FDQuery.ParamByName('SupplierClientID').AsInteger := ID;
  FDQuery.Open;

  edtSupplier.LookupKey := FDQuery.FieldByName('SupplierID').asInteger;
  edtClient.LookupKey := FDQuery.FieldByName('ClientID').asInteger;
  edtDiscountDate.Date :=  FDQuery.FieldByName('DiscountDate').Value;
  edtDiscount.Value := FDQuery.FieldByName('Discount').Value;

  inherited;
end;

procedure TSupplierClientF.DiscountRefresh;
begin
  qDiscount.close;
  qDiscount.Open;
end;

procedure TSupplierClientF.FormShow(Sender: TObject);
begin
  inherited;

  PageControl1.ActivePage := TabCommon;

  case FormAction of
    acInsert, acReportCreate:
    begin
      Self.Caption := 'Добавление';
      edtDiscountDate.date := Date();
      tSQl.Exec('delete pContacts from pContacts (rowlock) where Spid = @@Spid', [], []);
      tSQl.Exec('delete pDiscounts from pDiscounts (rowlock) where Spid = @@Spid', [], []);
    end;
    acUpdate, acReportEdit, acUserAction:
    begin
      self.Caption := 'Изменение данных ' ;
    end;
    acDelete:
    begin
      self.Caption := 'Удаление данных ' ;
    end;
    acShow:
    begin
      self.Caption := 'Просмотр данных ' ;
    end;
  else
  end;

  DiscountRefresh;
end;



procedure TSupplierClientF.PageControl1DrawTab(Control: TCustomTabControl;
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

initialization
  RegisterClass(TSupplierClientF);

end.
