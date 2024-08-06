inherited CreditsF: TCreditsF
  Caption = #1050#1088#1077#1076#1080#1090
  ClientHeight = 335
  StyleElements = [seFont, seClient, seBorder]
  ExplicitHeight = 374
  TextHeight = 17
  inherited Panel: TdxPanel
    Top = 289
    TabOrder = 14
    ExplicitTop = 289
    inherited btnOk: TcxButton
      OnClick = btnOkClick
    end
  end
  object edtOperDate: TcxDateEdit [1]
    Left = 146
    Top = 8
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.UseNullString = True
    TabOrder = 0
    Width = 142
  end
  object edtAmount: TcxCurrencyEdit [2]
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
    TabOrder = 4
    Width = 142
  end
  object edtComment: TcxMemo [3]
    Left = 146
    Top = 203
    Anchors = [akLeft, akTop, akRight]
    Properties.MaxLength = 256
    TabOrder = 12
    Height = 81
    Width = 439
  end
  object edtCredit: ALookupEdit [4]
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
    TabOrder = 3
    Width = 439
  end
  object edtPrc: TcxCurrencyEdit [5]
    Left = 146
    Top = 109
    Properties.DisplayFormat = ',0.00 %;-,0.00 %'
    TabOrder = 6
    Width = 142
  end
  object edtPayAmount: TcxCurrencyEdit [6]
    Left = 146
    Top = 140
    Properties.DisplayFormat = ',0.00 '#8381';-,0.00 '#8381
    TabOrder = 8
    Width = 142
  end
  object edtCloseDate: TcxDateEdit [7]
    Left = 146
    Top = 171
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.UseNullString = True
    TabOrder = 10
    Width = 142
  end
  object cxLabel1: TcxLabel [8]
    Left = 5
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
  object cxLabel2: TcxLabel [9]
    Left = 5
    Top = 31
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1088#1077#1076#1080#1090#1072':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.WordWrap = True
    Width = 111
  end
  object cxLabel3: TcxLabel [10]
    Left = 5
    Top = 77
    Caption = #1057#1091#1084#1084#1072':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel4: TcxLabel [11]
    Left = 5
    Top = 110
    Caption = #1055#1088#1086#1094#1077#1085#1090' %:'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel5: TcxLabel [12]
    Left = 5
    Top = 141
    Caption = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel6: TcxLabel [13]
    Left = 5
    Top = 172
    Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel7: TcxLabel [14]
    Left = 5
    Top = 204
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
end
