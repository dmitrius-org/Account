inherited ExpenseItemsF: TExpenseItemsF
  Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
  ClientHeight = 197
  ClientWidth = 611
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 627
  ExplicitHeight = 236
  TextHeight = 17
  inherited Panel: TdxPanel
    Top = 151
    Width = 611
    TabOrder = 5
    ExplicitTop = 151
    ExplicitWidth = 611
    inherited dxPanel1: TdxPanel
      inherited edtInDate: TcxDateEdit
        Properties.DateButtons = []
        Properties.UseLeftAlignmentOnEditing = False
      end
    end
    inherited btnCancel: TcxButton
      Left = 408
      ExplicitLeft = 408
    end
    inherited btnOk: TcxButton
      Left = 504
      OnClick = btnOkClick
      ExplicitLeft = 504
    end
  end
  object edtName: TcxTextEdit [1]
    Left = 131
    Top = 55
    Properties.MaxLength = 255
    TabOrder = 3
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1089#1090#1072#1090#1100#1080' '#1088#1072#1089#1093#1086#1076#1086#1074
    Width = 464
  end
  object cbIsActive: TcxCheckBox [2]
    Left = 131
    Top = 95
    Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090
    Style.TransparentBorder = False
    TabOrder = 4
  end
  object edtExpenseGroup: ALookupEdit [3]
    Left = 131
    Top = 16
    LookupConnection = DM.FDConnection
    LookupForm = 'TExpenseGroupsT'
    LookupSQL = 
      '  Select Name from tExpenseGroups (nolock) where ExpenseGroupID ' +
      '= :ID'
    LookupKey = 0
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
    TabOrder = 1
    TextHint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1075#1088#1091#1087#1087#1091
    Width = 464
  end
  object cxLabel1: TcxLabel [4]
    Left = 8
    Top = 54
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel2: TcxLabel [5]
    Left = 8
    Top = 15
    Caption = #1043#1088#1091#1087#1087#1072':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
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
