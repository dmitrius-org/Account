inherited SupplierClientT: TSupplierClientT
  Caption = #1057#1074#1103#1079#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072' '#1089' '#1082#1083#1080#1077#1085#1090#1086#1084
  ClientHeight = 515
  ClientWidth = 912
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 928
  ExplicitHeight = 554
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 912
    DoubleBuffered = True
    ExplicitWidth = 906
  end
  inherited Grid: TcxGrid
    Top = 132
    Width = 912
    Height = 383
    ExplicitWidth = 906
    ExplicitHeight = 360
    inherited TableView: TcxGridDBTableView
      DataController.KeyFieldNames = 'SupplierClientID'
      FilterRow.Visible = True
      object TableViewSupplierClientID: TcxGridDBColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        DataBinding.FieldName = 'SupplierClientID'
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
      object TableViewSupplierName: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        DataBinding.FieldName = 'SupplierName'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.IncrementalFiltering = True
        HeaderAlignmentHorz = taCenter
        Width = 300
      end
      object TableViewClientName: TcxGridDBColumn
        Caption = #1050#1083#1080#1077#1085#1090
        DataBinding.FieldName = 'ClientName'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.IncrementalFiltering = True
        HeaderAlignmentHorz = taCenter
        Width = 300
      end
      object TableViewDiscount: TcxGridDBColumn
        Caption = #1057#1082#1080#1076#1082#1072
        DataBinding.FieldName = 'Discount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00 %;-,0.00 %'
        HeaderAlignmentHorz = taCenter
        Width = 148
      end
      object TableViewDiscountDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1089#1082#1080#1076#1082#1080
        DataBinding.FieldName = 'DiscountDate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.DateButtons = [btnClear, btnToday]
        HeaderAlignmentHorz = taCenter
        Width = 123
      end
    end
  end
  inherited FilterPanel: TcxGroupBox
    Visible = True
    ExplicitWidth = 912
    ExplicitHeight = 36
    Height = 36
    Width = 912
    object btnFilterClear: TcxButton
      Left = 3
      Top = 5
      Width = 99
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = IM.IL
      TabOrder = 0
      OnClick = btnFilterClearClick
    end
  end
  inherited dxPanel1: TdxPanel
    Width = 912
    ExplicitWidth = 906
  end
  inherited ActionList: TActionList
    Tag = 81
    Left = 630
    Top = 113
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      ''
      'select *'
      '  from vSupplierClient'
      ' where 1=1')
    Left = 693
    Top = 114
    object QuerySupplierClientID: TFMTBCDField
      FieldName = 'SupplierClientID'
      Origin = 'SupplierClientID'
      Required = True
      Precision = 15
      Size = 0
    end
    object QueryDiscount: TCurrencyField
      FieldName = 'Discount'
      Origin = 'Discount'
    end
    object QueryDiscountDate: TSQLTimeStampField
      FieldName = 'DiscountDate'
      Origin = 'DiscountDate'
    end
    object QuerySupplierName: TStringField
      FieldName = 'SupplierName'
      Origin = 'SupplierName'
      Size = 256
    end
    object QueryClientName: TStringField
      FieldName = 'ClientName'
      Origin = 'ClientName'
      Size = 256
    end
  end
  inherited cxStyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
