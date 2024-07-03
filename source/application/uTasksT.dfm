inherited TasksT: TTasksT
  Caption = #1055#1086#1088#1091#1095#1077#1085#1080#1103
  ClientWidth = 830
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  ExplicitLeft = -150
  ExplicitWidth = 846
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 824
    DoubleBuffered = True
  end
  inherited Grid: TcxGrid
    Width = 830
    inherited TableView: TcxGridDBTableView
      DataController.KeyFieldNames = 'TaskID'
      object TableViewCreateDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'CreateDate'
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object TableViewManager: TcxGridDBColumn
        Caption = #1052#1077#1085#1077#1076#1078#1077#1088
        DataBinding.FieldName = 'Manager'
        HeaderAlignmentHorz = taCenter
        Width = 219
      end
      object TableViewComment: TcxGridDBColumn
        Caption = #1055#1086#1088#1091#1095#1077#1085#1080#1077
        DataBinding.FieldName = 'Comment'
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
      object TableViewDueDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
        DataBinding.FieldName = 'DueDate'
        HeaderAlignmentHorz = taCenter
        Width = 129
      end
      object TableViewTaskStatus: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1091#1089
        DataBinding.FieldName = 'TaskStatus'
        HeaderAlignmentHorz = taCenter
        Width = 133
      end
    end
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
    DesignInfo = 12583004
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      'Select t.CreateDate'
      '      ,u.Name as Manager'
      '      ,t.Comment'
      '      ,t.DueDate'
      '      ,s.Name as TaskStatus'
      '      ,t.TaskID'
      '  from tTasks t (nolock)'
      ' inner join tUser u (nolock)'
      '         on u.UserID = t.ManagerID'
      ' left join tTaskStatus s (nolock)'
      '        on s.TaskStatusID=t.TaskStatusID'
      ''
      'order by t.CreateDate')
    object QueryCreateDate: TSQLTimeStampField
      FieldName = 'CreateDate'
      Origin = 'CreateDate'
    end
    object QueryManager: TWideStringField
      FieldName = 'Manager'
      Origin = 'Manager'
      Size = 512
    end
    object QueryComment: TStringField
      FieldName = 'Comment'
      Origin = 'Comment'
      Size = 512
    end
    object QueryDueDate: TSQLTimeStampField
      FieldName = 'DueDate'
      Origin = 'DueDate'
    end
    object QueryTaskStatus: TStringField
      FieldName = 'TaskStatus'
      Origin = 'TaskStatus'
      Size = 32
    end
    object QueryTaskID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'TaskID'
      Origin = 'TaskID'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Precision = 15
      Size = 0
    end
  end
  inherited cxStyleRepository: TcxStyleRepository
    Left = 160
    Top = 128
    PixelsPerInch = 96
  end
end
