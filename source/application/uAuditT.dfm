inherited AuditT: TAuditT
  Caption = #1040#1091#1076#1080#1090
  ClientHeight = 556
  ClientWidth = 1260
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 1276
  ExplicitHeight = 595
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 1260
    DoubleBuffered = True
  end
  inherited Grid: TcxGrid
    Top = 131
    Width = 1260
    Height = 425
    inherited TableView: TcxGridDBTableView
      object TableViewObjectType: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
        DataBinding.FieldName = 'ObjectType'
        HeaderAlignmentHorz = taCenter
        Width = 159
      end
      object TableViewObjectTypeID: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
        DataBinding.FieldName = 'ObjectTypeID'
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
      object TableViewAction: TcxGridDBColumn
        Caption = #1044#1077#1081#1089#1090#1074#1080#1077
        DataBinding.FieldName = 'Action'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 101
      end
      object TableViewObjectID: TcxGridDBColumn
        Caption = #1048#1044' '#1086#1073#1098#1077#1082#1090#1072
        DataBinding.FieldName = 'ObjectID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 144
      end
      object TableViewUserName: TcxGridDBColumn
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'UserName'
        HeaderAlignmentHorz = taCenter
        Width = 204
      end
      object TableViewInDateTime: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        DataBinding.FieldName = 'InDateTime'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Kind = ckDateTime
        HeaderAlignmentHorz = taCenter
        Width = 207
      end
      object TableViewComment: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        DataBinding.FieldName = 'Comment'
        HeaderAlignmentHorz = taCenter
        Width = 572
      end
      object TableViewUserBrief: TcxGridDBColumn
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'UserBrief'
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
    end
  end
  inherited FilterPanel: TcxGroupBox
    Visible = True
    ExplicitWidth = 1260
    ExplicitHeight = 35
    Height = 35
    Width = 1260
    object edtObjectType: TcxLookupComboBox
      Left = 109
      Top = 6
      Properties.IncrementalFilteringOptions = [ifoHighlightSearchText, ifoUseContainsOperator]
      Properties.KeyFieldNames = 'ObjectTypeID'
      Properties.ListColumns = <
        item
          FieldName = 'Brief'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsObjectType
      Properties.MaxLength = 256
      TabOrder = 0
      Width = 291
    end
    object cxLabel10: TcxLabel
      Left = 22
      Top = 7
      Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072':'
    end
    object btnFilterOk: TcxButton
      Left = 421
      Top = 6
      Width = 99
      Height = 25
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = IM.IL
      TabOrder = 2
      OnClick = btnFilterOkClick
    end
    object btnFilterClear: TcxButton
      Left = 526
      Top = 6
      Width = 99
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = IM.IL
      TabOrder = 3
      OnClick = btnFilterClearClick
    end
  end
  inherited dxPanel1: TdxPanel
    Width = 1260
    Visible = False
  end
  inherited ActionList: TActionList
    Tag = 82
    Left = 755
    Top = 325
    inherited actShow: TAction
      Tag = -1
      Visible = False
    end
    inherited actAdd: TAction
      Tag = -1
      Visible = False
    end
    inherited actEdit: TAction
      Tag = -1
      Visible = False
    end
    inherited actDelete: TAction
      Tag = -1
      Visible = False
    end
  end
  inherited PopupMenu: TPopupMenu
    Left = 570
    Top = 314
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
    DesignInfo = 18415800
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
    DesignInfo = 17104950
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      '                                    '
      'select * '
      '  from vAudit a'
      ' where 1=1'
      '  '
      '  !ObjectType')
    Left = 461
    Top = 315
    MacroData = <
      item
        Value = Null
        Name = 'OBJECTTYPE'
      end>
    object QueryObjectType: TWideStringField
      FieldName = 'ObjectType'
      Origin = 'ObjectType'
      ReadOnly = True
      Size = 512
    end
    object QueryObjectTypeID: TFMTBCDField
      FieldName = 'ObjectTypeID'
      Origin = 'ObjectTypeID'
      ReadOnly = True
      Precision = 18
      Size = 0
    end
    object QueryAction: TStringField
      FieldName = 'Action'
      Origin = 'Action'
      ReadOnly = True
      Size = 30
    end
    object QueryComment: TStringField
      FieldName = 'Comment'
      Origin = 'Comment'
      ReadOnly = True
      Size = 1024
    end
    object QueryUserBrief: TWideStringField
      FieldName = 'UserBrief'
      Origin = 'UserBrief'
      ReadOnly = True
      Required = True
      Size = 512
    end
    object QueryUserName: TWideStringField
      FieldName = 'UserName'
      Origin = 'UserName'
      ReadOnly = True
      Size = 512
    end
    object QueryInDateTime: TSQLTimeStampField
      FieldName = 'InDateTime'
      Origin = 'InDateTime'
      ReadOnly = True
    end
    object QueryObjectID: TFMTBCDField
      FieldName = 'ObjectID'
      Origin = 'ObjectID'
      Precision = 18
      Size = 0
    end
  end
  inherited DataSource: TDataSource
    Left = 674
    Top = 330
  end
  inherited cxStyleRepository: TcxStyleRepository
    Left = 118
    Top = 200
    PixelsPerInch = 96
  end
  object qObjectType: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      ' select ObjectTypeID,Brief'
      '   from tObjectType (nolock)')
    Left = 375
    Top = 325
    object qObjectTypeObjectTypeID: TFMTBCDField
      FieldName = 'ObjectTypeID'
      Origin = 'ObjectTypeID'
      Precision = 18
      Size = 0
    end
    object qObjectTypeBrief: TWideStringField
      FieldName = 'Brief'
      Origin = 'Brief'
      Size = 512
    end
  end
  object dsObjectType: TDataSource
    DataSet = qObjectType
    Left = 392
    Top = 341
  end
end
