inherited CreditTypesT: TCreditTypesT
  Caption = #1042#1080#1076#1099' '#1082#1088#1077#1076#1080#1090#1086#1074
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  TextHeight = 17
  inherited ToolBar: TToolBar
    DoubleBuffered = True
  end
  inherited Grid: TcxGrid
    inherited TableView: TcxGridDBTableView
      DataController.KeyFieldNames = 'CreditTypeID'
      object TableViewCreditTypeID: TcxGridDBColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        DataBinding.FieldName = 'CreditTypeID'
        HeaderAlignmentHorz = taCenter
      end
      object TableViewName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'Name'
        HeaderAlignmentHorz = taCenter
        Width = 658
      end
    end
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    Active = True
    SQL.Strings = (
      'select *'
      '  from tCreditTypes (nolock)'
      ' order by indatetime')
    object QueryCreditTypeID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'CreditTypeID'
      Origin = 'CreditTypeID'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Precision = 15
      Size = 0
    end
    object QueryName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Size = 256
    end
    object QueryisActive: TBooleanField
      FieldName = 'isActive'
      Origin = 'isActive'
    end
    object QueryInDateTime: TSQLTimeStampField
      FieldName = 'InDateTime'
      Origin = 'InDateTime'
    end
    object QueryUserID: TFMTBCDField
      FieldName = 'UserID'
      Origin = 'UserID'
      Precision = 15
      Size = 0
    end
  end
  inherited cxStyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
