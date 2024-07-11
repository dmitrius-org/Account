inherited CreditTypesF: TCreditTypesF
  Caption = #1042#1080#1076' '#1082#1088#1077#1076#1080#1090#1072
  ClientHeight = 171
  ClientWidth = 590
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 606
  ExplicitHeight = 210
  TextHeight = 17
  object SkLabel1: TSkLabel [0]
    Left = 8
    Top = 32
    Width = 100
    Height = 19
    Words = <
      item
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      end>
  end
  inherited Panel: TdxPanel
    Top = 125
    Width = 590
    ExplicitTop = 125
    ExplicitWidth = 590
    inherited btnCancel: TcxButton
      Left = 387
      ExplicitLeft = 387
    end
    inherited btnOk: TcxButton
      Left = 483
      OnClick = btnOkClick
      ExplicitLeft = 483
    end
  end
  object edtName: TcxTextEdit [2]
    Left = 114
    Top = 32
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1074#1080#1076#1072' '#1082#1088#1077#1076#1080#1090#1072
    Width = 468
  end
end
