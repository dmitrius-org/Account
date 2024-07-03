inherited CreditsT: TCreditsT
  Caption = #1050#1088#1077#1076#1080#1090#1099
  ClientWidth = 944
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 960
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 938
    DoubleBuffered = True
  end
  inherited Grid: TcxGrid
    Width = 944
    inherited TableView: TcxGridDBTableView
      object TableViewCreditID: TcxGridDBColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        DataBinding.FieldName = 'CreditID'
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
      object TableViewCreditDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'CreditDate'
        HeaderAlignmentHorz = taCenter
        Width = 105
      end
      object TableViewCreditType: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1088#1077#1076#1080#1090#1072
        DataBinding.FieldName = 'CreditType'
        HeaderAlignmentHorz = taCenter
        Width = 212
      end
      object TableViewAmount: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088#1091#1073'.'
        DataBinding.FieldName = 'Amount'
        HeaderAlignmentHorz = taCenter
        Width = 104
      end
      object TableViewPayAmount: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072
        DataBinding.FieldName = 'PayAmount'
        HeaderAlignmentHorz = taCenter
        Width = 115
      end
      object TableViewRest: TcxGridDBColumn
        Caption = #1054#1089#1090#1072#1090#1086#1082', '#1088#1091#1073'.'
        DataBinding.FieldName = 'Rest'
        HeaderAlignmentHorz = taCenter
        Width = 117
      end
      object TableViewComment: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        DataBinding.FieldName = 'Comment'
        HeaderAlignmentHorz = taCenter
        Width = 245
      end
    end
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
    DesignInfo = 11010132
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      '            select c.CreditID'
      '                  ,t.Name        CreditType'
      '                  ,c.CreditDate'
      '                  ,c.Amount'
      '                  ,c.PayAmount'
      '                  ,0.00 as Rest'
      '                  ,c.Comment'
      '              from tCredits c (nolock)'
      '             inner join tCreditTypes t (nolock)'
      '                     on t.CreditTypeID = c.CreditTypeID'
      '              order by c.CreditDate')
    object QueryCreditID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'CreditID'
      Origin = 'CreditID'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Precision = 15
      Size = 0
    end
    object QueryCreditType: TStringField
      FieldName = 'CreditType'
      Origin = 'CreditType'
      Size = 256
    end
    object QueryCreditDate: TSQLTimeStampField
      FieldName = 'CreditDate'
      Origin = 'CreditDate'
    end
    object QueryAmount: TFloatField
      FieldName = 'Amount'
      Origin = 'Amount'
    end
    object QueryRest: TBCDField
      FieldName = 'Rest'
      Origin = 'Rest'
      ReadOnly = True
      Required = True
      Precision = 2
      Size = 2
    end
    object QueryComment: TStringField
      FieldName = 'Comment'
      Origin = 'Comment'
      Size = 1024
    end
    object QueryPayAmount: TFloatField
      FieldName = 'PayAmount'
      Origin = 'PayAmount'
    end
  end
  inherited cxStyleRepository: TcxStyleRepository
    Left = 168
    Top = 144
    PixelsPerInch = 96
  end
end
