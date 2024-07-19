unit uUserAccess;

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
  cxMaskEdit, cxDropDownEdit, cxCalendar, dxPanel, cxFilter, cxCustomData,
  cxStyles, dxScrollbarAnnotations, cxTL, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, cxTLData, cxDBTL, cxCheckBox;

type
  TUserAccess = class(TBaseFormDBF)
    Tree: TcxDBTreeList;
    FDUpdateSQL: TFDUpdateSQL;
    TreecxDBTreeListColumn1: TcxDBTreeListColumn;
    TreecxDBTreeListColumn2: TcxDBTreeListColumn;
    FDQueryGrantID: TFMTBCDField;
    FDQueryObjectID: TFMTBCDField;
    FDQueryParentID: TFMTBCDField;
    FDQueryMenuID: TFMTBCDField;
    FDQueryN: TIntegerField;
    FDQueryCaption: TWideStringField;
    FDQueryValue: TBooleanField;
    FDQueryType: TIntegerField;
    FDQueryName: TWideStringField;
    FDQueryIsGroup: TBooleanField;
    FDQueryGroups: TWideStringField;
    FDQueryGroupValue: TBooleanField;
    FDQueryIcon: TWideStringField;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    /// <summary>
    ///  DataLoad - получение данных с сервера, дл€ отображени€ на форме
    ///</summary>
    procedure DataLoad(); override;
  end;

var
  UserAccess: TUserAccess;

implementation

uses
  uSql, uCommonType;

{$R *.dfm}


{ TUserAccess }

procedure TUserAccess.btnOkClick(Sender: TObject);
begin
  tSQl.q.Close;
  tSQl.q.SQL.Text := ' declare @R      int                 '+
                                  ' '+
                                  ' exec @r = GrantSave                 '+
                                  '            @ObjectID  = :ObjectID   '+
                                  '           ,@ObjectType= :ObjectType '+
                                  ' '+
                                  ' select @r as retcode ';

  tSQl.q.ParamByName('ObjectID').Value := ID; // пользователь или групп
  tSQl.q.ParamByName('ObjectType').Value := 0;  // тип пользовател€ или группы

  tSQl.q.Open;
  tRetVal.Code := tSQl.q.FieldByName('retcode').Value;

  if tRetVal.Code = 0 then
  begin
    ModalResult:=mrOK;
  end
  else
  begin
    MessageDlg(tRetVal.Message, mtError, [mbOK], 0);
  end;

end;

procedure TUserAccess.DataLoad;
begin
  FDQuery.Close;
  FDQuery.ParamByName('ObjectID').Value := ID;
  FDQuery.Open;


//  case FormAction of
//    acUpdate, acReportEdit, acUserAction:
//    begin
//        if FDQuery.FieldByName('isAdmin').AsBoolean then
//        begin
//          edtLogin.Enabled := False;
//          edtPassword.Enabled := False;
//        end;
//    end;
//    acDelete:
//    begin
//        if FDQuery.FieldByName('isAdmin').AsBoolean then
//        begin
//          btnOk.Enabled := False;
//        end;
//    end;

//  else
//  end;
//  Caption := 'ѕользователь [' + edtLogin.Text   + ']';

 // inherited;
end;

procedure TUserAccess.FormShow(Sender: TObject);
begin
  inherited;
//
end;

initialization
  RegisterClass(TUserAccess);

end.
