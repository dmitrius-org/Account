inherited ExpenseItemsF: TExpenseItemsF
  Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
  ClientHeight = 197
  StyleElements = [seFont, seClient, seBorder]
  ExplicitHeight = 236
  TextHeight = 17
  object SkLabel1: TSkLabel [0]
    Left = 16
    Top = 55
    Width = 100
    Height = 19
    Words = <
      item
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      end>
  end
  object SkLabel2: TSkLabel [1]
    Left = 16
    Top = 20
    Width = 48
    Height = 19
    Words = <
      item
        Caption = #1043#1088#1091#1087#1087#1072':'
      end>
  end
  inherited Panel: TdxPanel
    Top = 151
    ExplicitTop = 151
    inherited dxPanel1: TdxPanel
      inherited edtInDate: TcxDateEdit
        Properties.DateButtons = []
        Properties.UseLeftAlignmentOnEditing = False
      end
    end
    inherited btnOk: TcxButton
      OnClick = btnOkClick
    end
  end
  object edtName: TcxTextEdit [3]
    Left = 122
    Top = 55
    Properties.MaxLength = 255
    TabOrder = 1
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1089#1090#1072#1090#1100#1080' '#1088#1072#1089#1093#1086#1076#1086#1074
    Width = 473
  end
  object cbIsActive: TcxCheckBox [4]
    Left = 122
    Top = 95
    Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090
    Style.TransparentBorder = False
    TabOrder = 2
  end
  object edtExpenseGroup: ALookupEdit [5]
    Left = 122
    Top = 16
    ParentShowHint = False
    Properties.Buttons = <
      item
        Caption = '...'
        Default = True
        ImageIndex = 0
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
        Kind = bkText
        Width = 25
      end
      item
        ImageIndex = 4
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077
        Kind = bkGlyph
      end>
    Properties.Images = IM.IL
    ShowHint = True
    TabOrder = 3
    TextHint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1075#1088#1091#1087#1087#1091
    LookupConnection = DM.FDConnection
    LookupForm = 'TExpenseGroupsT'
    LookupSQL = 
      '  Select Name from tExpenseGroups (nolock) where ExpenseGroupID ' +
      '= :ID'
    LookupKey = 0
    ShowDelButton = False
    Width = 473
  end
  inherited FDQuery: TFDQuery
    Left = 556
    Top = 128
  end
  inherited DataSource: TDataSource
    Left = 484
    Top = 128
  end
end
