inherited ExpenseGroupsT: TExpenseGroupsT
  Caption = #1043#1088#1091#1087#1087#1099' '#1089#1090#1072#1090#1077#1081' '#1088#1072#1089#1093#1086#1076#1086#1074
  ClientHeight = 370
  ClientWidth = 805
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  ExplicitWidth = 821
  ExplicitHeight = 409
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 805
    DoubleBuffered = True
    ParentFont = False
    ExplicitWidth = 805
  end
  inherited Grid: TcxGrid
    Width = 805
    Height = 271
    ExplicitWidth = 805
    ExplicitHeight = 271
    inherited TableView: TcxGridDBTableView
      DataController.KeyFieldNames = 'ExpenseGroupID'
      OptionsCustomize.ColumnExpressionEditing = True
      object TableViewExpenseGroupID: TcxGridDBColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        DataBinding.FieldName = 'ExpenseGroupID'
        HeaderAlignmentHorz = taCenter
        Styles.Footer = GridHeader
        Styles.Header = GridHeader
      end
      object TableViewName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'Name'
        HeaderAlignmentHorz = taCenter
        Styles.Footer = GridHeader
        Styles.Header = GridHeader
        Width = 488
      end
      object TableViewisActive: TcxGridDBColumn
        Caption = #1055#1088#1080#1079#1085#1072#1082' '#1072#1082#1090#1080#1074#1085#1086#1089#1090#1080
        DataBinding.FieldName = 'isActive'
        HeaderAlignmentHorz = taCenter
        Styles.Footer = GridHeader
        Styles.Header = GridHeader
        Width = 159
      end
    end
  end
  inherited FilterPanel: TcxGroupBox
    ExplicitWidth = 805
    Width = 805
  end
  inherited ActionList: TActionList
    Left = 616
  end
  inherited PopupMenu: TPopupMenu
    Left = 616
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    Active = True
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select ExpenseGroupID'
      '      ,Name'
      '      ,isActive'
      '      ,InDateTime'
      '      ,UserID'
      '  from tExpenseGroups (nolock)'
      ''
      'order by ExpenseGroupID')
    Left = 696
    object QueryExpenseGroupID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'ExpenseGroupID'
      Origin = 'ExpenseGroupID'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Precision = 15
      Size = 0
    end
    object QueryName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      ReadOnly = True
      Size = 256
    end
    object QueryisActive: TBooleanField
      FieldName = 'isActive'
      Origin = 'isActive'
      ReadOnly = True
    end
    object QueryInDateTime: TSQLTimeStampField
      FieldName = 'InDateTime'
      Origin = 'InDateTime'
      ReadOnly = True
    end
    object QueryUserID: TFMTBCDField
      FieldName = 'UserID'
      Origin = 'UserID'
      ReadOnly = True
      Precision = 15
      Size = 0
    end
  end
  inherited DataSource: TDataSource
    Top = 184
  end
  inherited cxStyleRepository: TcxStyleRepository
    Left = 184
    Top = 144
    PixelsPerInch = 96
    inherited GridHeader: TcxStyle
      AssignedValues = [svBitmap, svColor, svFont, svTextColor]
      Color = 14671839
    end
  end
end
