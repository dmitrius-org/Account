inherited Profit_T: TProfit_T
  Caption = #1055#1088#1080#1073#1099#1083#1100' '#1089' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1081
  ClientHeight = 441
  ClientWidth = 1034
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 1050
  ExplicitHeight = 480
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 1034
    DoubleBuffered = True
    ExplicitWidth = 1034
  end
  inherited Grid: TcxGrid
    Top = 196
    Width = 1034
    Height = 245
    OnLayoutChanged = GridLayoutChanged
    ExplicitTop = 196
    ExplicitWidth = 1034
    ExplicitHeight = 245
    inherited TableView: TcxGridDBTableView
      OnLeftPosChanged = TableViewLeftPosChanged
      object TableViewAccountNumber: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1090#1088#1085#1079#1072#1082#1094#1080#1080
        DataBinding.FieldName = 'AccountNumber'
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object TableViewOperDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'OperDate'
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object TableViewBuyerName: TcxGridDBColumn
        Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'BuyerName'
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
      object TableViewClientName: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090
        DataBinding.FieldName = 'ClientName'
        HeaderAlignmentHorz = taCenter
        Width = 180
      end
      object TableViewAmount: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080
        DataBinding.FieldName = 'Amount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0 '#8381';-,0 '#8381
        HeaderAlignmentHorz = taCenter
        Width = 116
      end
      object TableViewdiscount: TcxGridDBColumn
        Caption = '% '#1087#1088#1080#1073#1099#1083#1080
        DataBinding.FieldName = 'discount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00 %;-,0.00 %'
        HeaderAlignmentHorz = taCenter
        Width = 74
      end
      object TableViewSumm: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1087#1088#1080#1073#1099#1083#1080
        DataBinding.FieldName = 'Summ'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0 '#8381';-,0 '#8381
        HeaderAlignmentHorz = taCenter
        Width = 126
      end
    end
  end
  inherited FilterPanel: TcxGroupBox
    Visible = True
    ExplicitWidth = 1034
    ExplicitHeight = 100
    Height = 100
    Width = 1034
    object btnFilterClear: TcxButton
      Left = 730
      Top = 44
      Width = 99
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = IM.IL
      TabOrder = 8
      OnClick = btnFilterClearClick
    end
    object btnFilterOk: TcxButton
      Left = 730
      Top = 16
      Width = 99
      Height = 25
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = IM.IL
      TabOrder = 2
      OnClick = btnFilterOkClick
    end
    object edtDateE: TcxDateEdit
      Left = 265
      Top = 44
      Properties.ClearKey = 46
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.UseNullString = True
      TabOrder = 6
      OnKeyDown = edtTranCodeKeyDown
      Width = 104
    end
    object edtDateB: TcxDateEdit
      Left = 129
      Top = 44
      Properties.ClearKey = 46
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.UseNullString = True
      TabOrder = 5
      OnKeyDown = edtTranCodeKeyDown
      Width = 104
    end
    object edtTranCode: TcxTextEdit
      Left = 129
      Top = 16
      TabOrder = 0
      OnKeyDown = edtTranCodeKeyDown
      Width = 104
    end
    object edtBuyer: ALookupEdit
      Left = 474
      Top = 16
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
      Properties.OnEditValueChanged = edtBuyerPropertiesEditValueChanged
      ShowHint = True
      TabOrder = 1
      OnKeyDown = edtTranCodeKeyDown
      Width = 234
    end
    object edtClient: ALookupEdit
      Left = 474
      Top = 44
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
      Properties.OnEditValueChanged = edtClientPropertiesEditValueChanged
      ShowHint = True
      TabOrder = 7
      OnKeyDown = edtTranCodeKeyDown
      Width = 234
    end
    object edtAVG: TcxCurrencyEdit
      Left = 446
      Top = 74
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0.00 %;-,0.00 %'
      Properties.ReadOnly = True
      Style.Color = clLightblue
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.ReadOnly = True
      Style.IsFontAssigned = True
      TabOrder = 13
      Width = 121
    end
    object edtSumT: TcxCurrencyEdit
      Left = 573
      Top = 74
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0 '#8381';-,0 '#8381
      Properties.ReadOnly = True
      Style.Color = clLightblue
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.ReadOnly = True
      Style.IsFontAssigned = True
      TabOrder = 14
      Width = 121
    end
    object edtSum: TcxCurrencyEdit
      Left = 759
      Top = 74
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0 '#8381';-,0 '#8381
      Properties.ReadOnly = True
      Style.Color = clLightsalmon
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.ReadOnly = True
      Style.IsFontAssigned = True
      TabOrder = 15
      Width = 125
    end
    object cxLabel1: TcxLabel
      Left = 14
      Top = 17
      Caption = #1050#1086#1076' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080':'
    end
    object cxLabel2: TcxLabel
      Left = 14
      Top = 45
      Caption = #1044#1072#1090#1072' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1080':'
    end
    object lblCount: TcxLabel
      Left = 12
      Top = 81
      Caption = #1042#1089#1077#1075#1086' '#1090#1088#1072#1085#1079#1072#1082#1094#1080#1081':'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxLabel3: TcxLabel
      Left = 392
      Top = 17
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
    end
    object cxLabel4: TcxLabel
      Left = 237
      Top = 47
      Caption = #1087#1086':'
    end
    object cxLabel5: TcxLabel
      Left = 392
      Top = 45
      Caption = #1050#1083#1080#1077#1085#1090':'
    end
    object cxLabel6: TcxLabel
      Left = 328
      Top = 73
      Caption = #1057#1088#1077#1076#1085#1103#1103' '#1087#1088#1080#1073#1099#1083#1100':'
    end
  end
  inherited dxPanel1: TdxPanel
    Width = 1034
    Visible = False
    ExplicitWidth = 1034
  end
  inherited ActionList: TActionList
    Tag = 55
    Left = 550
    Top = 151
  end
  inherited PopupMenu: TPopupMenu
    inherited N6: TMenuItem
      Visible = False
    end
    inherited N1: TMenuItem
      Visible = False
    end
    inherited N2: TMenuItem
      Visible = False
    end
    inherited N3: TMenuItem
      Visible = False
    end
    inherited N4: TMenuItem
      Visible = False
    end
    inherited N7: TMenuItem
      Visible = False
    end
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
    DesignInfo = 13500458
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      'SELECT p.AccountNumber, '
      '       p.OperDate, '
      '       p.BuyerName, '
      '       p.ClientName, '
      '       p.C, '
      '       p.Amount, '
      '       p.discount,'
      '       p.BuyerID, '
      '       p.PartnerID, '
      '       p.ClientID,'
      '       (p.Amount * (p.discount/100)) AS Summ'
      'FROM vTurnoverProfit AS p'
      ''
      'where 1=1'
      ''
      '!DateB'
      ''
      '!DateE'
      ''
      '!BuyerID'
      ''
      '!ClientID'
      ''
      '!AccountNumber')
    Left = 491
    Top = 239
    MacroData = <
      item
        Value = Null
        Name = 'DATEB'
      end
      item
        Value = Null
        Name = 'DATEE'
      end
      item
        Value = Null
        Name = 'BUYERID'
      end
      item
        Value = Null
        Name = 'CLIENTID'
      end
      item
        Value = Null
        Name = 'ACCOUNTNUMBER'
      end>
    object QueryAccountNumber: TStringField
      FieldName = 'AccountNumber'
      Origin = 'AccountNumber'
      Size = 256
    end
    object QueryOperDate: TSQLTimeStampField
      FieldName = 'OperDate'
      Origin = 'OperDate'
      ReadOnly = True
    end
    object QueryBuyerName: TStringField
      FieldName = 'BuyerName'
      Origin = 'BuyerName'
      ReadOnly = True
      Required = True
      Size = 256
    end
    object QueryClientName: TStringField
      FieldName = 'ClientName'
      Origin = 'ClientName'
      ReadOnly = True
      Required = True
      Size = 256
    end
    object QueryC: TBooleanField
      FieldName = 'C'
      Origin = 'C'
    end
    object QueryAmount: TIntegerField
      FieldName = 'Amount'
      Origin = 'Amount'
      ReadOnly = True
    end
    object Querydiscount: TCurrencyField
      Alignment = taCenter
      FieldName = 'discount'
      Origin = 'discount'
      ReadOnly = True
    end
    object QueryBuyerID: TFMTBCDField
      FieldName = 'BuyerID'
      Origin = 'BuyerID'
      Precision = 15
      Size = 0
    end
    object QueryPartnerID: TFMTBCDField
      FieldName = 'PartnerID'
      Origin = 'PartnerID'
      Precision = 15
      Size = 0
    end
    object QueryClientID: TFMTBCDField
      FieldName = 'ClientID'
      Origin = 'ClientID'
      Precision = 15
      Size = 0
    end
    object QuerySumm: TCurrencyField
      FieldName = 'Summ'
      Origin = 'Summ'
      ReadOnly = True
    end
  end
  inherited cxStyleRepository: TcxStyleRepository
    Left = 143
    Top = 176
    PixelsPerInch = 96
  end
end
