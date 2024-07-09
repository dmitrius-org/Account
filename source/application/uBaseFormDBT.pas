unit uBaseFormDBT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFormT, System.ImageList,
  Vcl.ImgList, cxImageList, cxGraphics, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, uCommonType, dxSkinBasic,
  cxContainer, cxGroupBox;

type
  TBaseFormDBT = class(TBaseFormT)
    Query: TFDQuery;
    DataSource: TDataSource;
    TableView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    actRefresh: TAction;
    N5: TMenuItem;
    cxStyleRepository: TcxStyleRepository;
    GridHeader: TcxStyle;
    GridBaground: TcxStyle;
    GridRowSelect: TcxStyle;
    N7: TMenuItem;
    FilterPanel: TcxGroupBox;
    procedure FormShow(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actShowExecute(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actLookupExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private





    /// <summary>
    ///  SaveGridState - сохранение настроек таблицы
    ///</summary>
    procedure SaveGridState();
    /// <summary>
    ///  RestoreGridState - восстановление настроек таблицы
    ///</summary>
    procedure RestoreGridState();
  protected

  public
    { Public declarations }
    var EditFormClass: String;
    procedure EditForm(AFormAction: TFormAction);

    procedure DataLoad(); dynamic;
    procedure SetActionEnabled(); dynamic;
  end;

var
  BaseFormDBT: TBaseFormDBT;

implementation

uses
  uDataModule, uBaseFormF, MTLogger;

{$R *.dfm}

{ TBaseFormDBT }

procedure TBaseFormDBT.actAddExecute(Sender: TObject);
begin
  inherited;
  EditForm(acInsert);
end;

procedure TBaseFormDBT.actDeleteExecute(Sender: TObject);
begin
  inherited;
  EditForm(acDelete);
end;

procedure TBaseFormDBT.actEditExecute(Sender: TObject);
begin
  inherited;
  EditForm(acUpdate);
end;

procedure TBaseFormDBT.actLookupExecute(Sender: TObject);
begin
  inherited;
  ID := Query.FieldByName(TableView.DataController.KeyFieldNames).Value;
  Self.Close;
end;

procedure TBaseFormDBT.actRefreshExecute(Sender: TObject);
begin
  inherited;
  DataLoad;
end;

procedure TBaseFormDBT.actShowExecute(Sender: TObject);
begin
  inherited;
  EditForm(acShow);
end;

procedure TBaseFormDBT.DataLoad;
begin
  logger.Info('TBaseFormDBT.DataLoad');
  SetActionEnabled;
end;

procedure TBaseFormDBT.EditForm(AFormAction: TFormAction);
var editform : TBaseFormF;
    mr : TModalResult;
begin
  editform := TFormClass(FindClass(EditFormClass)).Create(self) as TBaseFormF;

  if AFormAction in [acShow, acUpdate, acDelete, acClone, acResetAcc] then
  begin
    editform.id := Query.FieldByName(TableView.DataController.KeyFieldNames).Value;
  end;
  editform.FormAction := AFormAction;

  mr := editform.ShowModal;

  if mr = mrOk then
  begin
     DataLoad();
  end;

end;

procedure TBaseFormDBT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SaveGridState;
end;

procedure TBaseFormDBT.FormShow(Sender: TObject);
begin
  inherited;
  RestoreGridState;

  DataLoad();
end;

procedure TBaseFormDBT.PopupMenuPopup(Sender: TObject);
begin
  inherited;
  SetActionEnabled;
end;

procedure TBaseFormDBT.RestoreGridState;
var
  AStoreKey, ASaveViewName: string;
  AOptions: TcxGridStorageOptions;
begin
  AStoreKey := 'Software\AccountApp\Grid_' + self.name;
  ASaveViewName := 'TableView Layout';
  AOptions := [gsoUseFilter];

  TableView.RestoreFromRegistry(AStoreKey, False, False, AOptions, ASaveViewName);
end;

procedure TBaseFormDBT.SaveGridState;
var
  AStoreKey, ASaveViewName: string;
  AOptions: TcxGridStorageOptions;
begin
  AStoreKey := 'Software\AccountApp\Grid_' + self.name;

  ASaveViewName := 'TableView Layout';
  AOptions := [gsoUseFilter];

  TableView.StoreToRegistry(AStoreKey, True, AOptions, ASaveViewName);
end;

procedure TBaseFormDBT.SetActionEnabled;
begin
  logger.Info('TBaseFormDBT.SetActionEnabled');
  actAdd.Enabled := (actAdd.Tag = 1);
  actShow.Enabled := (actShow.Tag = 1) and (Query.RecordCount > 0);
  actEdit.Enabled := (actEdit.Tag = 1) and (Query.RecordCount > 0);
  actDelete.Enabled := (actDelete.Tag = 1) and (Query.RecordCount > 0);

  actRefresh.Enabled := (actRefresh.Tag = 1);

  actLookup.Visible := FormAction = acLookup;
end;

end.
