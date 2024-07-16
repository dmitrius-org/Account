inherited TasksT: TTasksT
  Caption = #1055#1086#1088#1091#1095#1077#1085#1080#1103
  ClientWidth = 830
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  ExplicitWidth = 846
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 830
    DoubleBuffered = True
    ExplicitWidth = 830
  end
  inherited Grid: TcxGrid
    Top = 88
    Width = 830
    Height = 402
    ExplicitWidth = 830
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
        Width = 189
      end
      object TableViewComment: TcxGridDBColumn
        Caption = #1055#1086#1088#1091#1095#1077#1085#1080#1077
        DataBinding.FieldName = 'Comment'
        HeaderAlignmentHorz = taCenter
        Width = 239
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
  inherited FilterPanel: TcxGroupBox
    Visible = True
    ExplicitWidth = 830
    ExplicitHeight = 48
    Height = 48
    Width = 830
    object SkLabel1: TSkLabel
      Left = 186
      Top = 15
      Width = 75
      Height = 19
      Anchors = [akTop, akRight]
      Words = <
        item
          Caption = #1055#1086#1088#1091#1095#1077#1085#1080#1077':'
        end>
    end
    object edtComment: TcxTextEdit
      Left = 267
      Top = 15
      Anchors = [akTop, akRight]
      Properties.MaxLength = 255
      TabOrder = 0
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077
      OnKeyDown = edtCommentKeyDown
      Width = 300
    end
    object cxButton3: TcxButton
      Left = 568
      Top = 15
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Anchors = [akTop, akRight]
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 4
      OptionsImage.Images = IM.IL
      PaintStyle = bpsGlyph
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 1
      OnClick = cxButton3Click
    end
    object btnFilterOk: TcxButton
      Left = 610
      Top = 15
      Width = 102
      Height = 25
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = IM.IL
      TabOrder = 2
      OnClick = btnFilterOkClick
    end
    object btnFilterClear: TcxButton
      Left = 711
      Top = 15
      Width = 102
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = IM.IL
      TabOrder = 3
      OnClick = btnFilterClearClick
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
      ' where 1=1'
      '    '
      '    !Comment  '
      ''
      'order by t.CreateDate')
    MacroData = <
      item
        Value = Null
        Name = 'COMMENT'
      end>
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
