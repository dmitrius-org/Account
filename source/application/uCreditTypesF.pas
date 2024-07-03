unit uCreditTypesF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormDBF, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBasic, cxGeometry,
  dxFramedControl, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, cxButtons, dxPanel,
  System.Skia, cxContainer, cxEdit, cxTextEdit, Vcl.Skia, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxCoreGraphics, cxButtonEdit, uLookupEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar;

type
  TCreditTypesF = class(TBaseFormDBF)
    SkLabel1: TSkLabel;
    edtName: TcxTextEdit;
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
  end;

var
  CreditTypesF: TCreditTypesF;

implementation

uses
  uCommonType, uSql;

{$R *.dfm}


{ TCreditTypesF }

procedure TCreditTypesF.btnOkClick(Sender: TObject);
begin
  inherited;
  DataCheck;

  if tRetVal.Code = 0 then
  case FormAction of
    acInsert:
    begin
      tSql.Open('''
                  declare @R int = 0
                            ,@CreditTypeID         numeric(15,0)

                  exec @R = CreditTypeInsert
                             @CreditTypeID = @CreditTypeID out
                            ,@Name         = :Name

                  select @R as R
                ''',
               ['Name'],
               [edtName.Text]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acUpdate:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = CreditTypeEdit
                             @CreditTypeID = :CreditTypeID
                            ,@Name         = :Name

                  select @R as R
                ''',
               ['Name','CreditTypeID'],
               [edtName.Text,
               ID]
               );

      tRetVal.Code := tSql.Q.FieldByName('R').Value;
    end;
    acDelete:
    begin
         tSql.Open('''
                  declare @R int = 0

                  exec @R = CreditTypeDelete
                             @CreditTypeID = :CreditTypeID

                  select @R as R
                ''',
               ['CreditTypeID'],
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

procedure TCreditTypesF.DataCheck;
begin

  tRetVal.Clear;

  case FormAction of
    acInsert, acReportCreate, acUpdate, acReportEdit:
    begin
      if edtName.Text = '' then
      begin
        tRetVal.Code := 1;
        tRetVal.Message := 'Поле [Наименование] обязательно к заполнению!';
        edtName.SetFocus;
        Exit();
      end
    end;
  end;
end;

procedure TCreditTypesF.DataLoad;
begin

  TSql.Open('''
               select Name
                     ,isActive
                     ,InDateTime
                     ,UserID
                 from tCreditTypes (nolock)
               where CreditTypeID = :CreditTypeID
            ''',
            ['CreditTypeID'],
            [ID]);

  edtName.text := TSql.Q.FieldByName('Name').AsString;
  inherited;
end;

initialization
  RegisterClass(TCreditTypesF);

end.
