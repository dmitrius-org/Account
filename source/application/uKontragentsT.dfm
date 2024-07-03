inherited KontragentsT: TKontragentsT
  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099
  ClientHeight = 469
  ClientWidth = 928
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 944
  ExplicitHeight = 508
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 922
    DoubleBuffered = True
  end
  inherited Grid: TcxGrid
    Width = 928
    Height = 348
    ExplicitTop = 121
    ExplicitHeight = 291
    inherited TableView: TcxGridDBTableView
      DataController.KeyFieldNames = 'KontragentID'
      object TableViewKontragentID: TcxGridDBColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        DataBinding.FieldName = 'KontragentID'
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
      object TableViewKontragentType: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'KontragentType'
        HeaderAlignmentHorz = taCenter
        Width = 92
      end
      object TableViewKontragentName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'KontragentName'
        HeaderAlignmentHorz = taCenter
        Width = 257
      end
      object TableViewINN: TcxGridDBColumn
        Caption = #1048#1085#1085
        DataBinding.FieldName = 'INN'
        HeaderAlignmentHorz = taCenter
        Width = 130
      end
      object TableViewDiscount: TcxGridDBColumn
        Caption = #1057#1082#1080#1076#1082#1072
        DataBinding.FieldName = 'Discount'
        HeaderAlignmentHorz = taCenter
        Width = 98
      end
      object TableViewDiscountDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1089#1082#1080#1076#1082#1080
        DataBinding.FieldName = 'DiscountDate'
        HeaderAlignmentHorz = taCenter
        Width = 113
      end
      object TableViewPartnerName: TcxGridDBColumn
        Caption = #1055#1072#1088#1090#1085#1077#1088
        DataBinding.FieldName = 'PartnerName'
        HeaderAlignmentHorz = taCenter
        Width = 185
      end
    end
  end
  inherited FilterPanel: TcxGroupBox
    Visible = True
    Width = 928
  end
  inherited ActionList: TActionList
    Left = 560
    Top = 224
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      'select k.KontragentID'
      '      ,k.KontragentTypeID'
      '      ,kt.Name as KontragentType'
      '      ,k.Name  as KontragentName'
      '      ,k.INN'
      '      ,k.Discount'
      '      ,k.DiscountDate'
      '      ,K.Name  as PartnerName'
      '  from tKontragents k (nolock)'
      ' inner join tKontragentType kt (nolock)'
      '         on kt.KontragentTypeID = k.KontragentTypeID'
      '  left join tKontragents p (nolock)'
      '         on p.KontragentID = k.PartnerID'
      ' order by k.KontragentTypeID, k.Name ')
    Left = 632
    Top = 232
    object QueryKontragentID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'KontragentID'
      Origin = 'KontragentID'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Precision = 15
      Size = 0
    end
    object QueryKontragentType: TStringField
      FieldName = 'KontragentType'
      Origin = 'KontragentType'
      Size = 32
    end
    object QueryKontragentName: TStringField
      FieldName = 'KontragentName'
      Origin = 'KontragentName'
      Size = 256
    end
    object QueryINN: TStringField
      FieldName = 'INN'
      Origin = 'INN'
      Size = 11
    end
    object QueryDiscount: TFloatField
      FieldName = 'Discount'
      Origin = 'Discount'
    end
    object QueryDiscountDate: TSQLTimeStampField
      FieldName = 'DiscountDate'
      Origin = 'DiscountDate'
    end
    object QueryPartnerName: TStringField
      FieldName = 'PartnerName'
      Origin = 'PartnerName'
      Size = 256
    end
    object QueryKontragentTypeID: TFMTBCDField
      FieldName = 'KontragentTypeID'
      Origin = 'KontragentTypeID'
      Precision = 15
      Size = 0
    end
  end
  inherited DataSource: TDataSource
    Left = 640
    Top = 288
  end
  inherited cxStyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
