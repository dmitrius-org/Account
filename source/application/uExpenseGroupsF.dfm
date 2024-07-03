inherited ExpenseGroupF: TExpenseGroupF
  ClientHeight = 182
  ClientWidth = 521
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 537
  ExplicitHeight = 221
  TextHeight = 17
  object SkLabel1: TSkLabel [0]
    Left = 8
    Top = 24
    Width = 100
    Height = 19
    Anchors = [akLeft, akTop, akRight]
    Words = <
      item
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      end>
  end
  inherited Panel: TdxPanel
    Top = 136
    Width = 521
    ExplicitTop = 136
    ExplicitWidth = 521
    inherited dxPanel1: TdxPanel
      Width = 297
      ExplicitWidth = 297
    end
    inherited btnCancel: TcxButton
      Left = 315
      ExplicitLeft = 315
    end
    inherited btnOk: TcxButton
      Left = 411
      OnClick = btnOkClick
      ExplicitLeft = 411
    end
  end
  object edtName: TcxTextEdit [2]
    Left = 114
    Top = 24
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1089#1090#1072#1090#1100#1080' '#1088#1072#1089#1093#1086#1076#1086#1074
    Width = 399
  end
  object cbIsActive: TcxCheckBox [3]
    Left = 114
    Top = 79
    Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090
    Style.TransparentBorder = False
    TabOrder = 2
  end
end
