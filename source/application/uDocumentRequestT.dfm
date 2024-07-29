inherited DocumentRequestT: TDocumentRequestT
  BorderIcons = [biSystemMenu]
  Caption = #1047#1072#1087#1088#1086#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 535
  ClientWidth = 930
  Visible = True
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 946
  ExplicitHeight = 574
  TextHeight = 17
  inherited Grid: TcxGrid [0]
    Top = 112
    Width = 930
    Height = 423
    ExplicitTop = 122
    ExplicitWidth = 930
    ExplicitHeight = 413
    inherited TableView: TcxGridDBTableView
      DataController.KeyFieldNames = 'DocumentRequestID'
      object TableViewDocumentRequestID: TcxGridDBColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        DataBinding.FieldName = 'DocumentRequestID'
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
      object TableViewPayDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
        DataBinding.FieldName = 'PayDate'
        HeaderAlignmentHorz = taCenter
        Width = 94
      end
      object TableViewAccountNumber: TcxGridDBColumn
        Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
        DataBinding.FieldName = 'AccountNumber'
        HeaderAlignmentHorz = taCenter
        Width = 124
      end
      object TableViewPhone: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'Phone'
        HeaderAlignmentHorz = taCenter
        Width = 177
      end
      object TableViewMail: TcxGridDBColumn
        Caption = #1055#1086#1095#1090#1072
        DataBinding.FieldName = 'Mail'
        HeaderAlignmentHorz = taCenter
        Width = 171
      end
      object TableViewSupplierName: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'SupplierName'
        HeaderAlignmentHorz = taCenter
        Width = 181
      end
      object TableViewSupplierInn: TcxGridDBColumn
        Caption = #1048#1085#1085' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        DataBinding.FieldName = 'SupplierInn'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 114
      end
      object TableViewBuyerName: TcxGridDBColumn
        Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'BuyerName'
        HeaderAlignmentHorz = taCenter
        Width = 130
      end
      object TableViewBuyerInn: TcxGridDBColumn
        Caption = #1048#1085#1085' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103
        DataBinding.FieldName = 'BuyerInn'
        HeaderAlignmentHorz = taCenter
        Width = 122
      end
    end
  end
  inherited ToolBar: TToolBar [1]
    Width = 930
    DoubleBuffered = True
    ExplicitWidth = 930
  end
  inherited FilterPanel: TcxGroupBox
    Visible = True
    ExplicitWidth = 930
    ExplicitHeight = 72
    Height = 72
    Width = 930
    object SkLabel5: TSkLabel
      Left = 211
      Top = 14
      Width = 17
      Height = 19
      Words = <
        item
          Caption = #1086#1090':'
        end>
    end
    object SkLabel1: TSkLabel
      Left = 7
      Top = 14
      Width = 53
      Height = 19
      Words = <
        item
          Caption = #1057#1095#1077#1090' '#8470':'
        end>
    end
    object SkLabel12: TSkLabel
      Left = 346
      Top = 45
      Width = 75
      Height = 19
      Words = <
        item
          Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082':'
        end>
    end
    object SkLabel8: TSkLabel
      Left = 346
      Top = 14
      Width = 78
      Height = 19
      Words = <
        item
          Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
        end>
    end
    object SkLabel3: TSkLabel
      Left = 7
      Top = 45
      Width = 59
      Height = 19
      Words = <
        item
          Caption = #1058#1077#1083#1077#1092#1086#1085':'
        end>
    end
    object edtAccountDate: TcxDateEdit
      Left = 231
      Top = 12
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      TabOrder = 1
      OnKeyDown = edtAccountNumberKeyDown
      Width = 104
    end
    object edtAccountNumber: TcxTextEdit
      Left = 77
      Top = 12
      TabOrder = 0
      OnKeyDown = edtAccountNumberKeyDown
      Width = 130
    end
    object edtBuyer: ALookupEdit
      Left = 430
      Top = 12
      LookupConnection = DM.FDConnection
      LookupForm = 'TKontragentsT'
      LookupSQL = 'Select Name from tKontragents (nolock) where KontragentID = :ID'
      LookupKey = 0
      LookupFilter = 'and k.KontragentTypeID = 2 and isnull(k.IsPartner, 0) = 0'
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
      TabOrder = 2
      OnKeyDown = edtAccountNumberKeyDown
      Width = 264
    end
    object edtSupplier: ALookupEdit
      Left = 430
      Top = 41
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
      TabOrder = 4
      OnKeyDown = edtAccountNumberKeyDown
      Width = 264
    end
    object btnFilterOk: TcxButton
      Left = 700
      Top = 12
      Width = 99
      Height = 25
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = IM.IL
      TabOrder = 3
      OnClick = btnFilterOkClick
    end
    object btnFilterClear: TcxButton
      Left = 700
      Top = 43
      Width = 99
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = IM.IL
      TabOrder = 6
      OnClick = btnFilterClearClick
    end
    object edtPhone: TcxTextEdit
      Left = 77
      Top = 43
      TabOrder = 5
      OnKeyDown = edtAccountNumberKeyDown
      Width = 258
    end
  end
  inherited ActionList: TActionList
    Tag = 30
    Left = 636
    Top = 226
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
    DesignInfo = 11731015
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      'Select dr.DocumentRequestID'
      '      ,dr.PayDate'
      '      ,dr.AccountNumber'
      '      ,dr.Phone'
      '      ,dr.Mail'
      '      ,s.Name SupplierName'
      '      ,s.Inn  SupplierInn'
      '      ,b.Name BuyerName'
      '      ,b.Inn  BuyerInn'
      '  from tDocumentRequest dr (nolock)'
      '  left join tKontragents s (nolock)'
      '         on s.KontragentID = dr.SupplierID'
      '  left join tKontragents b (nolock)'
      '         on b.KontragentID = dr.BuyerID'
      ' where 1=1'
      ''
      ' !AccountNumber'
      ' '
      ' !PayDate'
      ' '
      ' !Buyer'
      ' '
      ' !Supplier'
      ' '
      ' !Phone')
    Left = 699
    Top = 227
    MacroData = <
      item
        Value = Null
        Name = 'ACCOUNTNUMBER'
      end
      item
        Value = Null
        Name = 'PAYDATE'
      end
      item
        Value = Null
        Name = 'BUYER'
      end
      item
        Value = Null
        Name = 'SUPPLIER'
      end
      item
        Value = Null
        Name = 'PHONE'
      end>
    object QueryDocumentRequestID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'DocumentRequestID'
      Origin = 'DocumentRequestID'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Precision = 15
      Size = 0
    end
    object QueryPayDate: TSQLTimeStampField
      FieldName = 'PayDate'
      Origin = 'PayDate'
    end
    object QueryAccountNumber: TStringField
      FieldName = 'AccountNumber'
      Origin = 'AccountNumber'
      Size = 256
    end
    object QueryPhone: TStringField
      FieldName = 'Phone'
      Origin = 'Phone'
      Size = 256
    end
    object QueryMail: TStringField
      FieldName = 'Mail'
      Origin = 'Mail'
      Size = 256
    end
    object QuerySupplierName: TStringField
      FieldName = 'SupplierName'
      Origin = 'SupplierName'
      Size = 256
    end
    object QuerySupplierInn: TStringField
      FieldName = 'SupplierInn'
      Origin = 'SupplierInn'
      Size = 11
    end
    object QueryBuyerName: TStringField
      FieldName = 'BuyerName'
      Origin = 'BuyerName'
      Size = 256
    end
    object QueryBuyerInn: TStringField
      FieldName = 'BuyerInn'
      Origin = 'BuyerInn'
      Size = 11
    end
  end
  inherited cxStyleRepository: TcxStyleRepository
    Left = 146
    Top = 168
    PixelsPerInch = 96
  end
end
