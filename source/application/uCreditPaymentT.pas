unit uCreditPaymentT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBT, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxContainer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxClasses, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, cxImageList, Vcl.Menus, System.Actions, Vcl.ActnList, cxGroupBox,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.ToolWin, System.Skia, dxCore,
  cxDateUtils, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Vcl.Skia, uBaseFormF;

type
  TCreditPaymentT = class(TBaseFormDBT)
    SkLabel7: TSkLabel;
    edtPaymentDate: TcxDateEdit;
    SkLabel4: TSkLabel;
    edtPaymentDateE: TcxDateEdit;
    btnFilterOk: TcxButton;
    btnFilterClear: TcxButton;
    edtComment: TcxTextEdit;
    SkLabel1: TSkLabel;
    cxButton3: TcxButton;
    QueryTransactionID: TFMTBCDField;
    QueryOperDate: TSQLTimeStampField;
    QueryAmount: TCurrencyField;
    QueryComment: TStringField;
    TableViewTransactionID: TcxGridDBColumn;
    TableViewOperDate: TcxGridDBColumn;
    TableViewAmount: TcxGridDBColumn;
    TableViewComment: TcxGridDBColumn;
    procedure btnFilterOkClick(Sender: TObject);
    procedure btnFilterClearClick(Sender: TObject);
    procedure edtPaymentDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCreditID: Integer;
    procedure SetCreditID(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property  CreditID: Integer read FCreditID write SetCreditID;

    procedure DataLoad(); override;

    /// <summary>
    ///  EditFormData - передача дополнительных параметров для формы редактирования
    ///</summary>
    procedure EditFormData(AEditform : TBaseFormF); override;
  end;

var
  CreditPaymentT: TCreditPaymentT;

implementation

uses
  uCommonType, MTLogger, uSql, uBaseFormDBF, uTransactionF;

{$R *.dfm}

{ TCreditPaymentT }

procedure TCreditPaymentT.btnFilterClearClick(Sender: TObject);
begin
  edtComment.Clear;
  edtPaymentDate.Clear;
  edtPaymentDateE.Clear;

  DataLoad
end;

procedure TCreditPaymentT.btnFilterOkClick(Sender: TObject);
begin
  DataLoad
end;

procedure TCreditPaymentT.cxButton3Click(Sender: TObject);
begin
  inherited;
  edtComment.Clear;
end;

procedure TCreditPaymentT.DataLoad;
begin
  logger.Info('TCreditPaymentT.DataLoad');
  Query.Close();

  if edtComment.Text <> '' then
    Query.MacroByName('Comment').Value := ' and a.Comment like ''%'   + edtComment.Text + '%'''
  else
    Query.MacroByName('Comment').Value := '';


  if edtPaymentDate.Text <> '' then
    Query.MacroByName('DateB').Value := ' and t.OperDate >= '''   + edtPaymentDate.Text + ''''
  else
    Query.MacroByName('DateB').Value := '';

  if edtPaymentDateE.Text <> '' then
    Query.MacroByName('DateE').Value := ' and t.OperDate <= '''   + edtPaymentDateE.Text + ''''
  else
    Query.MacroByName('DateE').Value := '';

  Query.ParamByName('CreditID').AsInteger := CreditID;

  Query.Open();

  inherited;
end;

procedure TCreditPaymentT.EditFormData(AEditform: TBaseFormF);
begin
  if AEditform.FormAction in [acInsert, acAddDebet] then
  begin
    TTransactionF(AEditform).KassaID := 1;
    TTransactionF(AEditform).CreditID := FCreditID;
  end;

  TTransactionF(AEditform).IsCredit := True;
end;

procedure TCreditPaymentT.edtPaymentDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then DataLoad;
end;

procedure TCreditPaymentT.FormCreate(Sender: TObject);
begin
  inherited;
  EditFormClass := 'TTransactionF';
end;

procedure TCreditPaymentT.SetCreditID(const Value: Integer);
begin
  FCreditID := Value;
end;

initialization
  RegisterClass(TCreditPaymentT);

end.
