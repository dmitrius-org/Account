inherited UserAccess: TUserAccess
  Caption = 'UserAccess'
  ClientHeight = 490
  ClientWidth = 570
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 586
  ExplicitHeight = 529
  TextHeight = 17
  inherited Panel: TdxPanel
    Top = 444
    Width = 570
    TabOrder = 1
    ExplicitTop = 444
    ExplicitWidth = 570
    inherited btnCancel: TcxButton
      Left = 367
      ExplicitLeft = 367
    end
    inherited btnOk: TcxButton
      Left = 463
      OnClick = btnOkClick
      ExplicitLeft = 463
    end
  end
  object Tree: TcxDBTreeList [1]
    Left = 0
    Top = 0
    Width = 570
    Height = 444
    Align = alClient
    Bands = <
      item
      end>
    DataController.DataSource = DataSource
    DataController.ParentField = 'ParentID'
    DataController.KeyField = 'MenuID'
    Navigator.Buttons.CustomButtons = <>
    OptionsData.Appending = True
    OptionsData.Deleting = False
    OptionsData.ImmediatePost = True
    RootValue = -1
    ScrollbarAnnotations.CustomAnnotations = <>
    TabOrder = 0
    object TreecxDBTreeListColumn1: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      Caption.Text = #1052#1077#1085#1102
      DataBinding.FieldName = 'Caption'
      Options.Customizing = False
      Options.Editing = False
      Width = 395
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object TreecxDBTreeListColumn2: TcxDBTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.Alignment = taCenter
      Caption.AlignHorz = taCenter
      Caption.Text = #1044#1086#1089#1090#1091#1087
      DataBinding.FieldName = 'Value'
      Options.Customizing = False
      Width = 122
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  inherited FDQuery: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvAutoCommitUpdates]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.AutoCommitUpdates = True
    UpdateObject = FDUpdateSQL
    SQL.Strings = (
      '   exec GrantSelect'
      '           @ObjectID   = :ObjectID'
      '          ,@ObjectType = 0'
      ''
      '    Select *'
      '      from vGrant'
      '     where ObjectID = :ObjectID'
      '     order by N')
    ParamData = <
      item
        Name = 'OBJECTID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryGrantID: TFMTBCDField
      FieldName = 'GrantID'
      Origin = 'GrantID'
      Precision = 18
      Size = 0
    end
    object FDQueryObjectID: TFMTBCDField
      FieldName = 'ObjectID'
      Origin = 'ObjectID'
      Precision = 18
      Size = 0
    end
    object FDQueryParentID: TFMTBCDField
      FieldName = 'ParentID'
      Origin = 'ParentID'
      Precision = 18
      Size = 0
    end
    object FDQueryMenuID: TFMTBCDField
      FieldName = 'MenuID'
      Origin = 'MenuID'
      Precision = 18
      Size = 0
    end
    object FDQueryN: TIntegerField
      FieldName = 'N'
      Origin = 'N'
    end
    object FDQueryCaption: TWideStringField
      FieldName = 'Caption'
      Origin = 'Caption'
      Size = 512
    end
    object FDQueryValue: TBooleanField
      FieldName = 'Value'
      Origin = 'Value'
    end
    object FDQueryType: TIntegerField
      FieldName = 'Type'
      Origin = 'Type'
    end
    object FDQueryName: TWideStringField
      FieldName = 'Name'
      Origin = 'Name'
      Size = 512
    end
    object FDQueryIsGroup: TBooleanField
      FieldName = 'IsGroup'
      Origin = 'IsGroup'
    end
    object FDQueryGroups: TWideStringField
      FieldName = 'Groups'
      Origin = 'Groups'
      Size = 512
    end
    object FDQueryGroupValue: TBooleanField
      FieldName = 'GroupValue'
      Origin = 'GroupValue'
    end
    object FDQueryIcon: TWideStringField
      FieldName = 'Icon'
      Origin = 'Icon'
      Size = 512
    end
  end
  inherited DataSource: TDataSource
    DataSet = FDQuery
  end
  object FDUpdateSQL: TFDUpdateSQL
    Connection = DM.FDConnection
    InsertSQL.Strings = (
      '')
    ModifySQL.Strings = (
      'UPDATE pGrant'
      '   SET Value = :NEW_Value'
      ' WHERE Spid  = @@Spid'
      '   AND ObjectID = :OLD_ObjectID '
      '   AND MenuID   = :OLD_MenuID')
    DeleteSQL.Strings = (
      '')
    FetchRowSQL.Strings = (
      'SELECT --Spid, GrantID, ObjectID, MenuID, N, ParentID, Name, '
      '       Value'
      '  from pGrant (nolock)'
      ' WHERE Spid     = @@Spid'
      '   AND ObjectID = :ObjectID'
      '   AND MenuID   = :MenuID'
      '')
    Left = 441
    Top = 183
  end
end
