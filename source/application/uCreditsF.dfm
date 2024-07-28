inherited CreditsF: TCreditsF
  Caption = #1050#1088#1077#1076#1080#1090
  ClientHeight = 335
  StyleElements = [seFont, seClient, seBorder]
  ExplicitHeight = 374
  TextHeight = 17
  object SkLabel7: TSkLabel [0]
    Left = 8
    Top = 11
    Width = 33
    Height = 19
    Words = <
      item
        Caption = #1044#1072#1090#1072':'
      end>
  end
  object SkLabel8: TSkLabel [1]
    Left = 8
    Top = 76
    Width = 50
    Height = 19
    TextSettings.Font.Weight = Bold
    Words = <
      item
        Caption = #1057#1091#1084#1084#1072':'
      end>
  end
  object SkLabel14: TSkLabel [2]
    Left = 8
    Top = 203
    Width = 92
    Height = 19
    Words = <
      item
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
      end>
  end
  object edtCreditL: TSkLabel [3]
    Left = 8
    Top = 36
    Width = 132
    Height = 34
    AutoSize = False
    Words = <
      item
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1088#1077#1076#1080#1090#1072':'
      end>
  end
  object SkLabel9: TSkLabel [4]
    Left = 8
    Top = 110
    Width = 134
    Height = 19
    Words = <
      item
        Caption = #1055#1088#1086#1094#1077#1085#1090' '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091':'
      end>
  end
  object SkLabel1: TSkLabel [5]
    Left = 8
    Top = 142
    Width = 103
    Height = 19
    Words = <
      item
        Caption = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072':'
      end>
  end
  object SkLabel2: TSkLabel [6]
    Left = 8
    Top = 172
    Width = 96
    Height = 19
    Words = <
      item
        Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103':'
      end>
  end
  inherited Panel: TdxPanel
    Top = 289
    TabOrder = 7
    ExplicitTop = 304
    inherited btnOk: TcxButton
      OnClick = btnOkClick
    end
  end
  object edtOperDate: TcxDateEdit [8]
    Left = 146
    Top = 8
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.UseNullString = True
    TabOrder = 0
    Width = 142
  end
  object edtAmount: TcxCurrencyEdit [9]
    Left = 146
    Top = 70
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0 '#8381';-,0 '#8381
    Properties.Nullstring = '0'
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 142
  end
  object edtComment: TcxMemo [10]
    Left = 146
    Top = 203
    Anchors = [akLeft, akTop, akRight]
    Properties.MaxLength = 256
    TabOrder = 6
    Height = 81
    Width = 439
  end
  object edtCredit: ALookupEdit [11]
    Left = 146
    Top = 39
    LookupConnection = DM.FDConnection
    LookupForm = 'TCreditTypesT'
    LookupSQL = 'select name from tCreditTypes (nolock) where CreditTypeID = :ID'
    LookupKey = 0
    Anchors = [akLeft, akTop, akRight]
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
    Width = 439
  end
  object edtPrc: TcxCurrencyEdit [12]
    Left = 146
    Top = 109
    Properties.DisplayFormat = ',0.00 %;-,0.00 %'
    TabOrder = 3
    Width = 142
  end
  object edtPayAmount: TcxCurrencyEdit [13]
    Left = 146
    Top = 140
    Properties.DisplayFormat = ',0.00 '#8381';-,0.00 '#8381
    TabOrder = 4
    Width = 142
  end
  object edtCloseDate: TcxDateEdit [14]
    Left = 146
    Top = 171
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.UseNullString = True
    TabOrder = 5
    Width = 142
  end
end
