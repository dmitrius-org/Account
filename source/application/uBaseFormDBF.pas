unit uBaseFormDBF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormF, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxGeometry, dxFramedControl, cxContainer, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxButtonEdit, cxDBEdit, dxPanel, cxCheckBox,
  System.Skia, Vcl.Skia, dxSkinBasic, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxCoreGraphics, uLookupEdit, cxDropDownEdit, cxCalendar;

type
  TBaseFormDBF = class(TBaseFormF)
    FDQuery: TFDQuery;
    DataSource: TDataSource;
    Panel: TdxPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    dxPanel1: TdxPanel;
    edtInDate: TcxDateEdit;
    edtUser: ALookupEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }


  public
    { Public declarations }


    /// <summary>
    ///  DataLoad - получение данных с сервера, для отображения на форме
    ///</summary>
    procedure DataLoad(); virtual;
  end;

var
  BaseFormDBF: TBaseFormDBF;

implementation

uses
  uCommonType, uSql, uImageModule, uDataModule;

{$R *.dfm}

{ TBaseFormF1 }


procedure TBaseFormDBF.DataLoad;
begin
  edtUser.LookupKey := FDQuery.FieldByName('upUserID').AsInteger;
  edtInDate.Date    := FDQuery.FieldByName('upDateTime').AsDateTime;
  FDQuery.Close;
end;

procedure TBaseFormDBF.FormShow(Sender: TObject);
begin
  inherited;
  case FormAction of
    acInsert, acReportCreate, acAddDebet:
    begin
      btnOk.Caption := ' Добавить';
    end;
    acUpdate, acReportEdit, acUserAction:
    begin
      btnOk.Caption := ' Сохранить';

    end;
    acDelete:
    begin
      btnOk.Caption := ' Удалить';
    end;
    acShow:
    begin

      btnOk.Caption := ' Закрыть';
    end;

  else
    btnOk.Caption := ' Выполнить';
  end;

  // начитываем данные с базы
  case FormAction of
    acUpdate, acReportEdit, acUserAction, acDelete, acShow, acMessage:
    begin
      DataLoad;
    end
  else
    //
  end;
end;

end.
