inherited AccountF: TAccountF
  BorderStyle = bsDialog
  Caption = #1057#1095#1077#1090#1072
  ClientHeight = 377
  ClientWidth = 827
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 843
  ExplicitHeight = 416
  TextHeight = 17
  inherited Panel: TdxPanel
    Top = 331
    Width = 827
    TabOrder = 34
    ExplicitTop = 331
    ExplicitWidth = 827
    inherited btnCancel: TcxButton
      Left = 624
      ExplicitLeft = 624
    end
    inherited btnOk: TcxButton
      Left = 715
      OnClick = btnOkClick
      ExplicitLeft = 715
    end
  end
  object edtAccountNumber: TcxTextEdit [1]
    Left = 104
    Top = 42
    Properties.OnChange = edtAccountNumberPropertiesChange
    TabOrder = 1
    Width = 147
  end
  object edtPayNumber: TcxTextEdit [2]
    Left = 104
    Top = 73
    TabOrder = 10
    Width = 147
  end
  object edtPhone: TcxTextEdit [3]
    Left = 617
    Top = 244
    TabOrder = 30
    Width = 201
  end
  object edtMail: TcxTextEdit [4]
    Left = 617
    Top = 300
    TabOrder = 33
    Width = 202
  end
  object edtAccountDate: TcxDateEdit [5]
    Left = 281
    Top = 42
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    TabOrder = 2
    Width = 104
  end
  object edtPayDate: TcxDateEdit [6]
    Left = 281
    Top = 73
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.UseNullString = True
    TabOrder = 11
    Width = 104
  end
  object edtPaymentDate: TcxDateEdit [7]
    Left = 281
    Top = 104
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.UseNullString = True
    Properties.OnChange = edtPaymentDatePropertiesChange
    TabOrder = 13
    Width = 104
  end
  object edtAccountStatus: TcxLookupComboBox [8]
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
  object edtBuyer: ALookupEdit [9]
    Left = 100
    Top = 144
    LookupConnection = DM.FDConnection
    LookupForm = 'TKontragentsT'
    LookupSQL = 'Select Name from tKontragents (nolock) where KontragentID = :ID'
    LookupKey = 0
    LookupFilter = 'and k.KontragentTypeID = 2'
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
    Properties.OnButtonClick = edtBuyerPropertiesButtonClick
    ShowHint = True
    TabOrder = 18
    Width = 285
  end
  object edtSupplier: ALookupEdit [10]
    Left = 100
    Top = 175
    LookupConnection = DM.FDConnection
    LookupForm = 'TKontragentsT'
    LookupSQL = 'Select Name from tKontragents (nolock) where KontragentID = :ID'
    LookupKey = 0
    LookupFilter = 'and k.KontragentTypeID = 3'
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
    TabOrder = 22
    Width = 285
  end
  object edtClient: ALookupEdit [11]
    Left = 100
    Top = 206
    LookupConnection = DM.FDConnection
    LookupForm = 'TKontragentsT'
    LookupSQL = 'Select Name from tKontragents (nolock) where KontragentID = :ID'
    LookupKey = 0
    LookupFilter = 'and k.KontragentTypeID = 1'
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
    Properties.OnButtonClick = edtClientPropertiesButtonClick
    ShowHint = True
    TabOrder = 24
    Width = 285
  end
  object edtComment: TcxMemo [12]
    Left = 100
    Top = 244
    Properties.MaxLength = 256
    TabOrder = 29
    Height = 81
    Width = 511
  end
  object edtAccountAmount: TcxCurrencyEdit [13]
    Left = 508
    Top = 42
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0 '#8381';-,0 '#8381
    TabOrder = 3
    Width = 102
  end
  object edtPaymentAmount: TcxCurrencyEdit [14]
    Left = 508
    Top = 104
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0 '#8381';-,0 '#8381
    Properties.OnChange = edtPaymentAmountPropertiesChange
    TabOrder = 14
    Width = 102
  end
  object edtBuyerDiscount: TcxCurrencyEdit [15]
    Left = 508
    Top = 144
    Properties.DisplayFormat = ',0.00 %;-,0.00 %'
    TabOrder = 19
    Width = 102
  end
  object edtClientDiscount: TcxCurrencyEdit [16]
    Left = 508
    Top = 206
    Properties.DisplayFormat = ',0.00 %;-,0.00 %'
    TabOrder = 25
    Width = 102
  end
  object dxPanel2: TdxPanel [17]
    Left = 508
    Top = 6
    Width = 311
    Height = 31
    Frame.Borders = []
    Frame.Scale = True
    TabOrder = 0
    object lblDoplata: TcxLabel
      Left = 249
      Top = 0
      Align = alRight
      Caption = #1057#1090#1072#1090#1091#1089':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextColor = clCrimson
      Style.IsFontAssigned = True
      ExplicitLeft = 0
      ExplicitHeight = 41
    end
  end
  object btnCopy: TcxButton [18]
    Left = 616
    Top = 104
    Width = 44
    Height = 25
    Hint = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1091#1084#1084#1091' '#1089#1095#1077#1090#1072
    OptionsImage.ImageIndex = 6
    OptionsImage.Images = IM.IL
    TabOrder = 15
    OnClick = btnCopyClick
  end
  object cxLabel1: TcxLabel [19]
    Left = 8
    Top = 43
    Caption = #1057#1095#1077#1090' '#8470':'
  end
  object cxLabel2: TcxLabel [20]
    Left = 8
    Top = 73
    Caption = #1055#1055' '#8470' :'
  end
  object cxLabel3: TcxLabel [21]
    Left = 8
    Top = 145
    Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
  end
  object cxLabel4: TcxLabel [22]
    Left = 8
    Top = 176
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082':'
  end
  object cxLabel5: TcxLabel [23]
    Left = 8
    Top = 207
    Caption = #1050#1083#1080#1077#1085#1090':'
  end
  object cxLabel6: TcxLabel [24]
    Left = 5
    Top = 245
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
  end
  object cxLabel7: TcxLabel [25]
    Left = 257
    Top = 43
    Caption = #1086#1090':'
  end
  object cxLabel8: TcxLabel [26]
    Left = 257
    Top = 74
    Caption = #1086#1090':'
  end
  object cxLabel9: TcxLabel [27]
    Left = 195
    Top = 105
    Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099':'
  end
  object cxLabel10: TcxLabel [28]
    Left = 404
    Top = 145
    Caption = #1057#1082#1080#1076#1082#1072' %:'
  end
  object cxLabel11: TcxLabel [29]
    Left = 404
    Top = 207
    Caption = #1057#1082#1080#1076#1082#1072' %:'
  end
  object cxLabel12: TcxLabel [30]
    Left = 616
    Top = 210
    Caption = #1050#1086#1085#1090#1072#1082#1090#1099':'
  end
  object cxLabel13: TcxLabel [31]
    Left = 617
    Top = 273
    Caption = 'E-Mail:'
  end
  object cxLabel14: TcxLabel [32]
    Left = 404
    Top = 43
    Caption = #1057#1091#1084#1084#1072' '#1089#1095#1077#1090#1072':'
  end
  object cxLabel15: TcxLabel [33]
    Left = 404
    Top = 105
    Caption = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099':'
  end
  object cxLabel16: TcxLabel [34]
    Left = 616
    Top = 43
    Caption = #1057#1090#1072#1090#1091#1089':'
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
