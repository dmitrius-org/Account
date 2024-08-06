inherited TasksF: TTasksF
  Caption = #1055#1086#1088#1091#1095#1077#1085#1080#1077
  ClientHeight = 304
  ClientWidth = 603
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 619
  ExplicitHeight = 343
  TextHeight = 17
  inherited Panel: TdxPanel
    Top = 258
    Width = 603
    TabOrder = 10
    ExplicitTop = 258
    ExplicitWidth = 603
    inherited btnCancel: TcxButton
      Left = 398
      ExplicitLeft = 398
    end
    inherited btnOk: TcxButton
      Left = 491
      OnClick = btnOkClick
      ExplicitLeft = 491
    end
  end
  object edtCreateDate: TcxDateEdit [1]
    Left = 151
    Top = 8
    TabOrder = 0
    Width = 121
  end
  object edtDueDate: TcxDateEdit [2]
    Left = 151
    Top = 86
    TabOrder = 5
    Width = 121
  end
  object edtComment: TcxMemo [3]
    Left = 151
    Top = 162
    Properties.MaxLength = 512
    TabOrder = 9
    Height = 79
    Width = 435
  end
  object edtManager: TcxLookupComboBox [4]
    Left = 151
    Top = 48
    Properties.KeyFieldNames = 'UserID'
    Properties.ListColumns = <
      item
        FieldName = 'Name'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsManager
    Properties.MaxLength = 256
    TabOrder = 3
    Width = 435
  end
  object edtTaskStatus: TcxLookupComboBox [5]
    Left = 151
    Top = 123
    Properties.KeyFieldNames = 'TaskStatusID'
    Properties.ListColumns = <
      item
        FieldName = 'Name'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsTaskStatus
    Properties.MaxLength = 256
    TabOrder = 7
    Width = 435
  end
  object cxLabel1: TcxLabel [6]
    Left = 8
    Top = 9
    Caption = #1044#1072#1090#1072':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel2: TcxLabel [7]
    Left = 8
    Top = 47
    Caption = #1052#1077#1085#1077#1076#1078#1077#1088':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel3: TcxLabel [8]
    Left = 9
    Top = 85
    Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel4: TcxLabel [9]
    Left = 8
    Top = 122
    Caption = #1057#1090#1072#1090#1091#1089':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel5: TcxLabel [10]
    Left = 8
    Top = 161
    Caption = #1055#1086#1088#1091#1095#1077#1085#1080#1077':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  inherited FDQuery: TFDQuery
    Left = 428
    Top = 96
  end
end
