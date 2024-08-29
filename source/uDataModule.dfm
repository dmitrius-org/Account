object DM: TDM
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    ConnectionName = 'Connection'
    Params.Strings = (
      'Database=AccountDB'
      'User_Name=sa'
      'Password=CE192a12!@'
      'Server=WIN-26BJ6Q2GFSI\BOOSTER'
      'DriverID=MSSQL')
    FetchOptions.AssignedValues = [evMode, evAutoFetchAll]
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnectionAfterConnect
    Left = 42
    Top = 14
  end
  object MemTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 43
    Top = 88
    object MemTableIsPart: TBooleanField
      FieldName = 'IsPart'
    end
  end
  object FDManager: TFDManager
    DriverDefFileAutoLoad = False
    ConnectionDefFileAutoLoad = False
    WaitCursor = gcrAppWait
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 150
    Top = 10
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrAppWait
    Left = 257
    Top = 9
  end
  object FDGUIxErrorDialog: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 255
    Top = 81
  end
  object dsExpenseGroup: TDataSource
    DataSet = qExpenseGroup
    Left = 492
    Top = 32
  end
  object qExpenseGroup: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      '                           '
      '  Select ExpenseGroupID,'
      '         Name'
      '    from tExpenseGroups (nolock)')
    Left = 476
    Top = 16
  end
  object dsManager: TDataSource
    DataSet = qManager
    Left = 492
    Top = 120
  end
  object qManager: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'Select UserID'
      '      ,Name'
      '  from tUser (nolock)'
      ' where isnull(isBlock, 0) = 0')
    Left = 476
    Top = 104
  end
  object dsTaskStatus: TDataSource
    DataSet = qTaskStatus
    Left = 492
    Top = 208
  end
  object qTaskStatus: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      ' select *'
      '   from tTaskStatus (nolock)')
    Left = 476
    Top = 192
  end
  object dsKontragent: TDataSource
    DataSet = qKontragent
    Left = 534
    Top = 337
  end
  object qKontragent: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT KontragentID,'
      '       Name '
      '  FROM [tKontragents] (nolock)'
      ' where IsPartner = 1')
    Left = 484
    Top = 280
  end
  object dsKontragentType: TDataSource
    DataSet = qKontragentType
    Left = 388
    Top = 296
  end
  object qKontragentType: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select distinct '
      '       KontragentTypeID'
      '      ,Name '
      '  from tKontragentType kt (nolock)')
    Left = 372
    Top = 280
  end
  object cxLocalizer1: TcxLocalizer
    Left = 63
    Top = 224
  end
end
