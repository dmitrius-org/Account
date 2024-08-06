inherited UserF: TUserF
  Caption = 'UserF'
  ClientHeight = 230
  ClientWidth = 438
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 454
  ExplicitHeight = 269
  TextHeight = 17
  inherited Panel: TdxPanel
    Top = 184
    Width = 438
    TabOrder = 8
    ExplicitTop = 184
    ExplicitWidth = 440
    inherited btnCancel: TcxButton
      Left = 235
      ExplicitLeft = 237
    end
    inherited btnOk: TcxButton
      Left = 331
      OnClick = btnOkClick
      ExplicitLeft = 333
    end
  end
  object edtLogin: TcxTextEdit [1]
    Left = 123
    Top = 8
    Properties.MaxLength = 255
    TabOrder = 1
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085
    Width = 298
  end
  object edtName: TcxTextEdit [2]
    Left = 123
    Top = 39
    Properties.MaxLength = 255
    TabOrder = 3
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Width = 298
  end
  object IsAdmin: TcxCheckBox [3]
    Left = 123
    Top = 112
    Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
    Properties.ReadOnly = True
    Style.TransparentBorder = False
    TabOrder = 6
  end
  object IsBlock: TcxCheckBox [4]
    Left = 123
    Top = 139
    Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1085
    Style.TransparentBorder = False
    TabOrder = 7
  end
  object edtPassword: TcxTextEdit [5]
    Left = 123
    Top = 70
    Properties.MaxLength = 255
    TabOrder = 5
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
    Width = 298
  end
  object cxLabel5: TcxLabel [6]
    Left = 8
    Top = 7
    Caption = #1051#1086#1075#1080#1085':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel1: TcxLabel [7]
    Left = 8
    Top = 38
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object lblPassword: TcxLabel [8]
    Left = 8
    Top = 69
    Caption = #1055#1072#1088#1086#1083#1100':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
end
