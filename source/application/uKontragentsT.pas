unit uKontragentsT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBT, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxClasses, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, cxImageList, Vcl.Menus, System.Actions, Vcl.ActnList,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, cxContainer, cxGroupBox,
  cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, cxDBCheckComboBox, cxCheckComboBox,
  dxCoreGraphics, System.Skia, Vcl.Skia, cxButtonEdit, uLookupEdit,
  Vcl.StdCtrls, cxButtons, cxGeometry, dxFramedControl, dxPanel;

type
  TKontragentsT = class(TBaseFormDBT)
    QueryKontragentID: TFMTBCDField;
    QueryKontragentType: TStringField;
    QueryKontragentName: TStringField;
    QueryINN: TStringField;
    QueryDiscount: TFloatField;
    QueryDiscountDate: TSQLTimeStampField;
    QueryPartnerName: TStringField;
    TableViewKontragentID: TcxGridDBColumn;
    TableViewKontragentType: TcxGridDBColumn;
    TableViewKontragentName: TcxGridDBColumn;
    TableViewINN: TcxGridDBColumn;
    TableViewDiscount: TcxGridDBColumn;
    TableViewDiscountDate: TcxGridDBColumn;
    TableViewPartnerName: TcxGridDBColumn;
    QueryKontragentTypeID: TFMTBCDField;
    AddMenu: TPopupMenu;
    pmAddClient: TMenuItem;
    pmAddBuyer: TMenuItem;
    pmAddSupplier: TMenuItem;
    N11: TMenuItem;
    actAddBuyer: TAction;
    actAddSupplier: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    actAddClient: TAction;
    cxLabel1: TcxLabel;
    SkLabel2: TSkLabel;
    edtName: TcxTextEdit;
    SkLabel1: TSkLabel;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    edtPartner: TcxLookupComboBox;
    pnKontragent: TdxPanel;
    edtKontragentType: TcxCheckComboBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    procedure actEditExecute(Sender: TObject);
    procedure actAddBuyerExecute(Sender: TObject);
    procedure actAddSupplierExecute(Sender: TObject);
    procedure actAddClientExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btnFilterOkClick(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
    procedure edtKontragentTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actDeleteExecute(Sender: TObject);
    procedure actShowExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure GridFilter;
    procedure setKontragentType();
  end;

var
  KontragentsT: TKontragentsT;

implementation

uses
  uDataModule, uComboBox, MTLogger;

{$R *.dfm}
procedure TKontragentsT.actAddBuyerExecute(Sender: TObject);
begin
  EditFormClass := 'TBuyerF';
  actAddExecute(Sender);
end;

procedure TKontragentsT.actAddClientExecute(Sender: TObject);
begin
  EditFormClass := 'TClientF';
  actAddExecute(Sender);
end;

procedure TKontragentsT.actAddSupplierExecute(Sender: TObject);
begin
  EditFormClass := 'TSupplierF';
  actAddExecute(Sender);
end;

procedure TKontragentsT.actDeleteExecute(Sender: TObject);
begin
  setKontragentType;
  inherited;
end;

procedure TKontragentsT.actEditExecute(Sender: TObject);
begin
  setKontragentType;
  inherited;
end;

procedure TKontragentsT.actShowExecute(Sender: TObject);
begin
  setKontragentType;
  inherited;
end;

procedure TKontragentsT.btnFilterClearClick(Sender: TObject);
begin
  edtName.Clear;
  edtPartner.Clear;
  edtKontragentType.Clear;
  GridFilter;
end;

procedure TKontragentsT.btnFilterOkClick(Sender: TObject);
begin
  GridFilter;
end;

procedure TKontragentsT.cxButton1Click(Sender: TObject);
begin
  edtKontragentType.Clear;
  GridFilter;
end;

procedure TKontragentsT.cxButton2Click(Sender: TObject);
begin
  edtPartner.Clear;
  GridFilter;
end;

procedure TKontragentsT.cxButton3Click(Sender: TObject);
begin
  edtName.Clear;
  GridFilter;
end;

procedure TKontragentsT.edtKontragentTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then GridFilter;
end;

procedure TKontragentsT.FormShow(Sender: TObject);
begin
  inherited;
  ComboBoxFill(edtKontragentType,
  '''
    select KontragentTypeID as ID
          ,Name
      from tKontragentType kt (nolock)
    '''
  )
end;

procedure TKontragentsT.GridFilter;
var FKontragentType:string;
begin
  logger.Info('TKontragentsT.GridFilter Begin');

  try

    Query.Close();
    FKontragentType :=GetComboChecks(edtKontragentType);

    if FKontragentType <> '' then
      Query.MacroByName('KontragentType').Value := ' and k.KontragentTypeID in (' + FKontragentType + ')'
    else
      Query.MacroByName('KontragentType').Value := '';

    if edtName.Text <> '' then
      Query.MacroByName('edtName').Value := ' and (k.name like '''   + edtName.Text + ''' or k.inn like ''' + edtName.Text + ''')'
    else
      Query.MacroByName('edtName').Value := '';


    if edtPartner.Text <> '' then
      Query.MacroByName('Partner').Value := 'and  k.PartnerID = ' + edtPartner.EditValue
    else
      Query.MacroByName('Partner').Value := '';

    Query.Open();


  finally
    logger.Info('TKontragentsT.GridFilter End');
  end;
end;

procedure TKontragentsT.setKontragentType;
begin
  case Query.fieldByname('KontragentTypeID').Value of
      1:
        EditFormClass := 'TClientF';
      2:
        EditFormClass := 'TBuyerF';
      3:
        EditFormClass := 'TSupplierF';
  end;
end;

initialization
  RegisterClass(TKontragentsT);
end.
