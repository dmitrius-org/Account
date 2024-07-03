inherited TasksF: TTasksF
  Caption = #1055#1086#1088#1091#1095#1077#1085#1080#1077
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 17
  object SkLabel1: TSkLabel [0]
    Left = 8
    Top = 160
    Width = 75
    Height = 19
    Words = <
      item
        Caption = #1055#1086#1088#1091#1095#1077#1085#1080#1077':'
      end>
  end
  object SkLabel2: TSkLabel [1]
    Left = 11
    Top = 14
    Width = 33
    Height = 19
    Words = <
      item
        Caption = #1044#1072#1090#1072':'
      end>
  end
  object SkLabel3: TSkLabel [2]
    Left = 8
    Top = 48
    Width = 72
    Height = 19
    Words = <
      item
        Caption = #1052#1077#1085#1077#1076#1078#1077#1088':'
      end>
  end
  object SkLabel4: TSkLabel [3]
    Left = 11
    Top = 88
    Width = 117
    Height = 19
    Words = <
      item
        Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103':'
      end>
  end
  object SkLabel5: TSkLabel [4]
    Left = 8
    Top = 124
    Width = 44
    Height = 19
    Words = <
      item
        Caption = #1057#1090#1072#1090#1091#1089':'
      end>
  end
  inherited Panel: TdxPanel
    inherited btnCancel: TcxButton
      Left = 388
      ExplicitLeft = 388
    end
    inherited btnOk: TcxButton
      Left = 481
      OnClick = btnOkClick
      ExplicitLeft = 481
    end
  end
  object edtCreateDate: TcxDateEdit [6]
    Left = 134
    Top = 10
    TabOrder = 1
    Width = 121
  end
  object edtDueDate: TcxDateEdit [7]
    Left = 134
    Top = 86
    TabOrder = 2
    Width = 121
  end
  object edtComment: TcxMemo [8]
    Left = 134
    Top = 162
    Properties.MaxLength = 512
    TabOrder = 3
    Height = 79
    Width = 451
  end
  object edtManager: TcxLookupComboBox [9]
    Left = 134
    Top = 48
    Properties.KeyFieldNames = 'UserID'
    Properties.ListColumns = <
      item
        FieldName = 'Name'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsManager
    Properties.MaxLength = 256
    TabOrder = 4
    Width = 451
  end
  object edtTaskStatus: TcxLookupComboBox [10]
    Left = 134
    Top = 123
    Properties.KeyFieldNames = 'TaskStatusID'
    Properties.ListColumns = <
      item
        FieldName = 'Name'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = DM.dsTaskStatus
    Properties.MaxLength = 256
    TabOrder = 5
    Width = 451
  end
  inherited FDQuery: TFDQuery
    Left = 428
    Top = 96
  end
end
