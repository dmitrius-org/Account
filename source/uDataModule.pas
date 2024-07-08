unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.VCLUI.Error, FireDAC.Comp.UI,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet//, Vcl.Forms
  ;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    MemTable: TFDMemTable;
    MemTableIsPart: TBooleanField;
    FDManager: TFDManager;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDGUIxErrorDialog: TFDGUIxErrorDialog;
    dsExpenseGroup: TDataSource;
    qExpenseGroup: TFDQuery;
    dsManager: TDataSource;
    qManager: TFDQuery;
    dsTaskStatus: TDataSource;
    qTaskStatus: TFDQuery;
    dsKontragent: TDataSource;
    qKontragent: TFDQuery;
    dsKontragentType: TDataSource;
    qKontragentType: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDConnectionAfterConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function dbConnect(AUser: string; APass: string): Boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MTLogger, uSql, uCommonType;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  // ���������  �����������
  CreateDefLogger(ExtractFilePath(ParamStr(0)) +'' + FormatDateTime('ddmmyyyy', Now) +'.log');
  Logger.isActive := true;
  Logger.Info('TDM.DataModuleCreate Begin');
  Logger.Info('TDM.DataModuleCreate: ' + ExtractFilePath(ParamStr(0)));

  FDManager.Active := False;
  FDManager.DriverDefFileName     := ExtractFilePath(ParamStr(0)) + 'Drivers.ini';
  FDManager.ConnectionDefFileName := ExtractFilePath(ParamStr(0)) + 'Connection.ini';
  FDManager.DriverDefFileAutoLoad := True;
  FDManager.ConnectionDefFileAutoLoad := True;
  FDManager.Active := True;


  FDConnection.ConnectionDefName:='Connection';
  FDConnection.Params.Values['DriverID'] :=FDManager.ConnectionDefs.FindConnectionDef('Connection').Params.Values['DriverID'];

  Logger.Info('TDM.DataModuleCreate End');
end;

function TDM.dbConnect(AUser, APass: string): Boolean;
begin
  Logger.Info('TDM.dbConnect Begin');
  try
    result:=False;
    try

      if (AUser<>'') and (APass<>'') then
      begin
        FDConnection.Params.Add('User_name=' + AUser);
        FDConnection.Params.Add('Password='  + APass);
      end;

      // ��������� ����������� �� ini �����
      Logger.Info('TUniMainModule ��������� �����������');
      Logger.Info('TUniMainModule ConnectionDefFileName: '+ FDManager.ConnectionDefFileName);
      Logger.Info('TUniMainModule FDConnection DriverID: ' + FDConnection.Params.Values['DriverID']);
      Logger.Info('TUniMainModule DriverID: ' + FDManager.ConnectionDefs.FindConnectionDef(FDConnection.ConnectionDefName).Params.Values['DriverID']);
      Logger.Info('TUniMainModule Server: ' +   FDManager.ConnectionDefs.FindConnectionDef(FDConnection.ConnectionDefName).Params.Values['Server']);
      Logger.Info('TUniMainModule Database: '+  FDManager.ConnectionDefs.FindConnectionDef(FDConnection.ConnectionDefName).Params.Values['Database']);
      Logger.Info('TUniMainModule User_name: '+ FDManager.ConnectionDefs.FindConnectionDef(FDConnection.ConnectionDefName).Params.Values['User_name']);


      FDConnection.Open;
     // MemTable.Open;

      //Sql.Open('Select AppClientLog, AppSqlLog from tLoggerSettings (nolock) where UserID = dbo.GetUserID() ', [],[]);
//      if Sql.Q.RecordCount > 0 then
//      begin
//        logger.isActive := Sql.Q.FindField('AppClientLog').Value;
//        logger.Info('��������� ��������');
//
//        FDMoniFlatFileClientLink.FileName := + '\log\' + AUserName + '_sql_' + FormatDateTime('ddmmyyyy', Now) +'.log';
//        FDMoniFlatFileClientLink.Tracing := Sql.Q.FindField('AppSqlLog').Value;
//      end;

    except
      on E: EFDDBEngineException do
      case E.Kind of
        ekUserPwdInvalid:
        begin
           raise Exception.Create('��� ������������ ��� ������ �������!'{+ #13#10+#13#10+E.ClassName+' ������� ������, � ����������: '+E.Message});
        end;
        ekUserPwdExpired:
          raise Exception.Create('������ ����������� � ��. ���� �������� ������ ������������ �����!' {+#13#10+#13#10+E.ClassName+' ������� ������, � ����������: '+E.Message});
        ekServerGone:
          raise Exception.Create('������ ���������� � ����� ������. ���� ���������� �� �����-�� �������!' {+#13#10+#13#10+E.ClassName+' ������� ������, � ����������: '+E.Message});
      else // other issues
        raise Exception.Create('������ ���������� � ����� ������. ����������� ������!' {+#13#10+#13#10+E.ClassName+' ������� ������, � ����������: '+E.Message});
      end;
      on E : Exception do
        raise Exception.Create(E.ClassName+' ������� ������, � ����������: '+#13#10+#13#10+E.Message);
    end;

  finally
    result:=FDConnection.Connected;
    Logger.Info('TDM.dbConnect Begin');
  end;
end;

procedure TDM.FDConnectionAfterConnect(Sender: TObject);
begin
  tSql.Connection := FDConnection;
  TRetVal.Connection := FDConnection;

  qExpenseGroup.Open();
  qManager.Open();
  qTaskStatus.Open;
  qKontragent.Open;
  qKontragentType.Open;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  qExpenseGroup.Close();
  qManager.Close();
  qTaskStatus.Close();
  qKontragent.Close();

  qKontragentType.Close();
end;

end.
