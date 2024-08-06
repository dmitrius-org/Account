inherited ExpenseGroupsT: TExpenseGroupsT
  Caption = #1043#1088#1091#1087#1087#1099' '#1089#1090#1072#1090#1077#1081' '#1088#1072#1089#1093#1086#1076#1086#1074
  ClientHeight = 370
  ClientWidth = 805
  StyleElements = [seFont, seClient, seBorder]
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
    Top = 143
    Width = 805
    Height = 227
    ExplicitTop = 143
    ExplicitWidth = 805
    ExplicitHeight = 227
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
        Width = 468
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
    Visible = True
    ExplicitWidth = 805
    ExplicitHeight = 47
    Height = 47
    Width = 805
    object edtName: TcxTextEdit
      Left = 267
      Top = 15
      Properties.MaxLength = 255
      TabOrder = 0
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      OnKeyDown = edtNameKeyDown
      Width = 298
    end
    object cxButton3: TcxButton
      Left = 566
      Top = 15
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 4
      OptionsImage.Images = IM.IL
      PaintStyle = bpsGlyph
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 1
      OnClick = cxButton3Click
    end
    object btnFilterOk: TcxButton
      Left = 597
      Top = 15
      Width = 102
      Height = 25
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = IM.IL
      TabOrder = 2
      OnClick = btnFilterOkClick
    end
    object btnFilterClear: TcxButton
      Left = 699
      Top = 15
      Width = 102
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = IM.IL
      TabOrder = 3
      OnClick = btnFilterClearClick
    end
    object cxLabel1: TcxLabel
      Left = 165
      Top = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
  end
  inherited dxPanel1: TdxPanel
    Width = 805
    ExplicitWidth = 805
  end
  inherited ActionList: TActionList
    Tag = 75
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
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select ExpenseGroupID'
      '      ,Name'
      '      ,isActive'
      '      ,InDateTime'
      ''
      '  from tExpenseGroups (nolock)'
      ' where 1=1'
      '   !Name'
      ''
      'order by ExpenseGroupID')
    Left = 696
    MacroData = <
      item
        Value = Null
        Name = 'NAME'
      end>
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
