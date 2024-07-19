inherited UserF: TUserF
  Caption = 'UserF'
  ClientHeight = 230
  ClientWidth = 440
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 456
  ExplicitHeight = 269
  TextHeight = 17
  object SkLabel1: TSkLabel [0]
    Left = 17
    Top = 8
    Width = 43
    Height = 19
    Words = <
      item
        Caption = #1051#1086#1075#1080#1085':'
      end>
  end
  object SkLabel2: TSkLabel [1]
    Left = 17
    Top = 39
    Width = 100
    Height = 19
    Words = <
      item
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      end>
  end
  object SkLabel3: TSkLabel [2]
    Left = 175
    Top = 18
    Width = 43
    Height = 19
    Words = <
      item
        Caption = #1051#1086#1075#1080#1085':'
      end>
  end
  object lblPassword: TSkLabel [3]
    Left = 17
    Top = 72
    Width = 51
    Height = 19
    Words = <
      item
        Caption = #1055#1072#1088#1086#1083#1100':'
      end>
  end
  inherited Panel: TdxPanel
    Top = 184
    Width = 440
    TabOrder = 5
    inherited btnCancel: TcxButton
      Left = 237
    end
    inherited btnOk: TcxButton
      Left = 333
      OnClick = btnOkClick
    end
  end
  object edtLogin: TcxTextEdit [5]
    Left = 123
    Top = 8
    Properties.MaxLength = 255
    TabOrder = 0
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1083#1086#1075#1080#1085
    Width = 298
  end
  object edtName: TcxTextEdit [6]
    Left = 123
    Top = 39
    Properties.MaxLength = 255
    TabOrder = 1
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Width = 298
  end
  object IsAdmin: TcxCheckBox [7]
    Left = 123
    Top = 112
    Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
    Properties.ReadOnly = True
    Style.TransparentBorder = False
    TabOrder = 3
  end
  object IsBlock: TcxCheckBox [8]
    Left = 123
    Top = 139
    Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1085
    Style.TransparentBorder = False
    TabOrder = 4
  end
  object edtPassword: TcxTextEdit [9]
    Left = 123
    Top = 70
    Properties.MaxLength = 255
    TabOrder = 2
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
    Width = 298
  end
end
