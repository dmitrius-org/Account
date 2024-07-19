unit uCreditsF;

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
  dxPanel, System.Skia, cxCheckBox, Vcl.Skia, cxMemo, cxCurrencyEdit;

type
  TCreditsF = class(TBaseFormDBF)
    SkLabel7: TSkLabel;
    SkLabel8: TSkLabel;
    SkLabel14: TSkLabel;
    edtOperDate: TcxDateEdit;
    edtAmount: TcxCurrencyEdit;
    edtComment: TcxMemo;
    edtCreditL: TSkLabel;
    edtCredit: ALookupEdit;
    SkLabel9: TSkLabel;
    edtPrc: TcxCurrencyEdit;
    SkLabel1: TSkLabel;
    edtPayAmount: TcxCurrencyEdit;
    SkLabel2: TSkLabel;
    edtCloseDate: TcxDateEdit;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  CreditsF: TCreditsF;

implementation

uses
  uCommonType, uSql;

{$R *.dfm}


{ TCreditsF }

procedure TCreditsF.btnOkClick(Sender: TObject);
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert, acClone, acReset, acResetAcc:
    begin
      tSql.Open('''
                  declare @R         int = 0
                         ,@CreditID  numeric(15,0)

                  exec @R = CreditInsert
                              @CreditID     = @CreditID out
                             ,@CreditTypeID = :CreditTypeID
                             ,@CreditDate   = :CreditDate
                             ,@Amount       = :Amount
                             ,@Prc          = :Prc
                             ,@PayAmount    = :PayAmount
                             ,@CloseDate    = :CloseDate
                             ,@Comment      = :Comment

                  select @R as R
                ''',
               ['CreditTypeID', 'CreditDate', 'Amount', 'Prc', 'PayAmount',
               'CloseDate', 'Comment'],
               [ edtCredit.LookupKey
                ,edtOperDate.Text
                ,edtAmount.Value
                ,edtPrc.Value
                ,edtPayAmount.Value
                ,edtCloseDate.Text
                ,edtComment.Text
                ]
               );


      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = CreditEdit
                              @CreditID     = :CreditID
                             ,@CreditTypeID = :CreditTypeID
                             ,@CreditDate   = :CreditDate
                             ,@Amount       = :Amount
                             ,@Prc          = :Prc
                             ,@PayAmount    = :PayAmount
                             ,@CloseDate    = :CloseDate
                             ,@Comment      = :Comment

                  select @R as R
                ''',
               ['CreditTypeID', 'CreditDate', 'Amount', 'Prc', 'PayAmount',
               'CloseDate', 'Comment', 'CreditID'],
               [ edtCredit.LookupKey
                ,edtOperDate.Text
                ,edtAmount.Value
                ,edtPrc.Value
                ,edtPayAmount.Value
                ,edtCloseDate.Text
                ,edtComment.Text
                ,ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acDelete:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = CreditDelete
                              @CreditID = :CreditID

                  select @R as R
                ''',
               ['CreditID'], [ID]
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

procedure TCreditsF.DataCheck;
begin
 tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit, acClone, acAddDebet:
    begin

      if edtOperDate.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := '���� [����] ����������� � ����������!';
        edtOperDate.SetFocus;
        Exit();
      end;

      if edtCredit.LookupKey = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := '���� [������������ �������] ����������� � ����������!';
        edtCredit.SetFocus;
        Exit();
      end;


      if edtAmount.Value = 0 then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := '���� [�����] ����������� � ����������!';
        edtAmount.SetFocus;
        Exit();
      end;

      if (edtPrc.Value = 0 ) then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := '���� [������� �� �������] ����������� � ����������!';
        edtPrc.SetFocus;
        Exit();
      end;

      if (edtPayAmount.Value = 0 ) then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := '���� [����� �������] ����������� � ����������!';
        edtPayAmount.SetFocus;
        Exit();
      end;

    end;
  end;
end;

procedure TCreditsF.DataLoad;
begin
  FDQuery.Close;
  FDQuery.sql.text :=
  '''
    Select CreditID
          ,CreditTypeID
          ,CreditDate
          ,Amount
          ,Prc
          ,PayAmount
          ,CloseDate
          ,Comment
          ,InDateTime
          ,upUserID
          ,upDateTime
      from tCredits (nolock)
    where CreditID = :CreditID
  ''';
  FDQuery.ParamByName('CreditID').AsInteger := ID;
  FDQuery.Open;

  edtOperDate.Text            := FDQuery.FieldByName('CreditDate').AsString;
  edtCredit.LookupKey         := FDQuery.FieldByName('CreditTypeID').AsInteger;
  edtAmount.Value             := FDQuery.FieldByName('Amount').AsFloat;
  edtPrc.Value                := FDQuery.FieldByName('Prc').AsFloat;
  edtPayAmount.Value          := FDQuery.FieldByName('PayAmount').AsFloat;
  edtCloseDate.Text           := FDQuery.FieldByName('CloseDate').AsString;
  edtComment.Text             := FDQuery.FieldByName('Comment').AsString;

  inherited;
end;

procedure TCreditsF.FormShow(Sender: TObject);
begin
  inherited;

  case FormAction of
    acInsert, acReportCreate:
    begin
      Self.Caption := '���������� �������';
      edtOperDate.date := Date();

    end;
    acUpdate, acReportEdit, acUserAction:
    begin
      self.Caption := '��������� ������� ';
    end;
    acDelete:
    begin
      self.Caption := '�������� ������� ';
    end;
    acShow:
    begin
      self.Caption := '�������� ������� ';
    end;
  else
  end;
end;

initialization
  RegisterClass(TCreditsF);
end.
