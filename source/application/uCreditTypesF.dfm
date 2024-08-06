inherited CreditTypesF: TCreditTypesF
  Caption = #1042#1080#1076' '#1082#1088#1077#1076#1080#1090#1072
  ClientHeight = 171
  ClientWidth = 590
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 606
  ExplicitHeight = 210
  TextHeight = 17
  inherited Panel: TdxPanel
    Top = 125
    Width = 590
    TabOrder = 2
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
  object edtName: TcxTextEdit [1]
    Left = 128
    Top = 32
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1074#1080#1076#1072' '#1082#1088#1077#1076#1080#1090#1072
    Width = 454
  end
  object cxLabel1: TcxLabel [2]
    Left = 8
    Top = 31
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
end
