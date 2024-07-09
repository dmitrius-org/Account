inherited AccountF: TAccountF
  BorderStyle = bsDialog
  Caption = #1057#1095#1077#1090#1072
  ClientHeight = 377
  ClientWidth = 827
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 843
  ExplicitHeight = 416
  TextHeight = 17
  object SkLabel1: TSkLabel [0]
    Left = 8
    Top = 44
    Width = 53
    Height = 19
    Words = <
      item
        Caption = #1057#1095#1077#1090' '#8470':'
      end>
  end
  object SkLabel2: TSkLabel [1]
    Left = 8
    Top = 73
    Width = 47
    Height = 19
    Words = <
      item
        Caption = #1055#1055' '#8470' :'
      end>
  end
  object SkLabel3: TSkLabel [2]
    Left = 257
    Top = 75
    Width = 17
    Height = 19
    Words = <
      item
        Caption = #1086#1090':'
      end>
  end
  object SkLabel4: TSkLabel [3]
    Left = 404
    Top = 44
    Width = 84
    Height = 19
    Words = <
      item
        Caption = #1057#1091#1084#1084#1072' '#1089#1095#1077#1090#1072':'
      end>
  end
  object SkLabel5: TSkLabel [4]
    Left = 257
    Top = 44
    Width = 17
    Height = 19
    Words = <
      item
        Caption = #1086#1090':'
      end>
  end
  object SkLabel6: TSkLabel [5]
    Left = 617
    Top = 44
    Width = 44
    Height = 19
    Words = <
      item
        Caption = #1057#1090#1072#1090#1091#1089':'
      end>
  end
  object SkLabel7: TSkLabel [6]
    Left = 190
    Top = 106
    Width = 84
    Height = 19
    Words = <
      item
        Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099':'
      end>
  end
  object SkLabel8: TSkLabel [7]
    Left = 404
    Top = 106
    Width = 96
    Height = 19
    Words = <
      item
        Caption = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099':'
      end>
  end
  object SkLabel9: TSkLabel [8]
    Left = 404
    Top = 147
    Width = 64
    Height = 19
    Words = <
      item
        Caption = #1057#1082#1080#1076#1082#1072' %:'
      end>
  end
  object SkLabel10: TSkLabel [9]
    Left = 404
    Top = 210
    Width = 64
    Height = 19
    Words = <
      item
        Caption = #1057#1082#1080#1076#1082#1072' %:'
      end>
  end
  object SkLabel11: TSkLabel [10]
    Left = 8
    Top = 145
    Width = 78
    Height = 19
    Words = <
      item
        Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
      end>
  end
  object SkLabel12: TSkLabel [11]
    Left = 8
    Top = 177
    Width = 75
    Height = 19
    Words = <
      item
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082':'
      end>
  end
  object SkLabel13: TSkLabel [12]
    Left = 8
    Top = 208
    Width = 48
    Height = 19
    Words = <
      item
        Caption = #1050#1083#1080#1077#1085#1090':'
      end>
  end
  object SkLabel14: TSkLabel [13]
    Left = 8
    Top = 244
    Width = 92
    Height = 19
    Words = <
      item
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
      end>
  end
  object SkLabel15: TSkLabel [14]
    Left = 617
    Top = 215
    Width = 63
    Height = 19
    Words = <
      item
        Caption = #1050#1086#1085#1090#1072#1082#1090#1099':'
      end>
  end
  object SkLabel16: TSkLabel [15]
    Left = 617
    Top = 275
    Width = 43
    Height = 19
    Words = <
      item
        Caption = 'E-Mail:'
      end>
  end
  inherited Panel: TdxPanel
    Top = 331
    Width = 827
    TabOrder = 17
    ExplicitTop = 331
    ExplicitWidth = 827
    inherited dxPanel1: TdxPanel
      TabOrder = 0
      inherited edtInDate: TcxDateEdit
        TabOrder = 1
      end
      inherited edtUser: ALookupEdit
        TabOrder = 0
      end
    end
    inherited btnCancel: TcxButton
      Left = 624
      ExplicitLeft = 624
    end
    inherited btnOk: TcxButton
      Left = 715
      TabOrder = 2
      OnClick = btnOkClick
      ExplicitLeft = 715
    end
  end
  object edtAccountNumber: TcxTextEdit [17]
    Left = 104
    Top = 42
    Properties.OnChange = edtAccountNumberPropertiesChange
    TabOrder = 1
    Width = 147
  end
  object edtPayNumber: TcxTextEdit [18]
    Left = 104
    Top = 73
    TabOrder = 5
    Width = 147
  end
  object edtPhone: TcxTextEdit [19]
    Left = 617
    Top = 244
    TabOrder = 15
    Width = 201
  end
  object edtMail: TcxTextEdit [20]
    Left = 617
    Top = 300
    TabOrder = 16
    Width = 202
  end
  object edtAccountDate: TcxDateEdit [21]
    Left = 281
    Top = 42
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    TabOrder = 2
    Width = 104
  end
  object edtPayDate: TcxDateEdit [22]
    Left = 281
    Top = 73
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.UseNullString = True
    TabOrder = 6
    Width = 104
  end
  object edtPaymentDate: TcxDateEdit [23]
    Left = 281
    Top = 104
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.UseNullString = True
    Properties.OnChange = edtPaymentDatePropertiesChange
    TabOrder = 7
    Width = 104
  end
  object edtAccountStatus: TcxLookupComboBox [24]
    Left = 674
    Top = 42
    Properties.KeyFieldNames = 'AccountStatusID'
    Properties.ListColumns = <
      item
        FieldName = 'Name'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsAccountStatus
    Properties.MaxLength = 256
    TabOrder = 4
    Width = 144
  end
  object edtBuyer: ALookupEdit [25]
    Left = 100
    Top = 144
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
    TabOrder = 9
    LookupConnection = DM.FDConnection
    LookupForm = 'TKontragentsT'
    LookupSQL = 'Select Name from tKontragents (nolock) where KontragentID = :ID'
    LookupKey = 0
    LookupFilter = 'and k.KontragentTypeID = 2'
    ShowDelButton = False
    Width = 285
  end
  object edtSupplier: ALookupEdit [26]
    Left = 100
    Top = 175
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
    TabOrder = 11
    LookupConnection = DM.FDConnection
    LookupForm = 'TKontragentsT'
    LookupSQL = 'Select Name from tKontragents (nolock) where KontragentID = :ID'
    LookupKey = 0
    LookupFilter = 'and k.KontragentTypeID = 3'
    ShowDelButton = False
    Width = 285
  end
  object edtClient: ALookupEdit [27]
    Left = 100
    Top = 206
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
    TabOrder = 12
    LookupConnection = DM.FDConnection
    LookupForm = 'TKontragentsT'
    LookupSQL = 'Select Name from tKontragents (nolock) where KontragentID = :ID'
    LookupKey = 0
    LookupFilter = 'and k.KontragentTypeID = 1'
    ShowDelButton = False
    Width = 285
  end
  object edtComment: TcxMemo [28]
    Left = 100
    Top = 244
    Properties.MaxLength = 256
    TabOrder = 14
    Height = 81
    Width = 511
  end
  object edtAccountAmount: TcxCurrencyEdit [29]
    Left = 508
    Top = 42
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0 '#8381';-,0 '#8381
    TabOrder = 3
    Width = 102
  end
  object edtPaymentAmount: TcxCurrencyEdit [30]
    Left = 508
    Top = 104
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0 '#8381';-,0 '#8381
    Properties.OnChange = edtPaymentAmountPropertiesChange
    TabOrder = 8
    Width = 102
  end
  object edtBuyerDiscount: TcxCurrencyEdit [31]
    Left = 508
    Top = 144
    Properties.DisplayFormat = ',0.00 %;-,0.00 %'
    TabOrder = 10
    Width = 102
  end
  object edtClientDiscount: TcxCurrencyEdit [32]
    Left = 508
    Top = 206
    Properties.DisplayFormat = ',0.00 %;-,0.00 %'
    TabOrder = 13
    Width = 102
  end
  object dxPanel2: TdxPanel [33]
    Left = 616
    Top = -3
    Width = 203
    Height = 41
    Frame.Borders = []
    TabOrder = 0
    object lblDoplata: TSkLabel
      Left = 0
      Top = 0
      Width = 203
      Height = 41
      Align = alClient
      TextSettings.Font.Size = 15.000000000000000000
      TextSettings.Font.Weight = Bold
      TextSettings.FontColor = claCrimson
      TextSettings.HorzAlign = Center
      Words = <
        item
          Caption = 'lblDoplata'
        end>
      ExplicitLeft = 34
      ExplicitTop = 8
      ExplicitWidth = 64
      ExplicitHeight = 19
    end
  end
  inherited FDQuery: TFDQuery
    Top = 318
  end
  inherited DataSource: TDataSource
    Left = 359
    Top = 334
  end
  object dsAccountStatus: TDataSource
    DataSet = qAccountStatus
    Left = 179
    Top = 302
  end
  object qAccountStatus: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      ''
      'select AccountStatusID'
      '      ,Name'
      ' from tAccountStatus (nolock)')
    Left = 163
    Top = 286
  end
end
