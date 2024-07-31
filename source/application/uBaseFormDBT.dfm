inherited BaseFormDBT: TBaseFormDBT
  Caption = 'BaseFormDBT'
  ClientHeight = 490
  ClientWidth = 816
  Font.Height = -13
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 832
  ExplicitHeight = 529
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 816
    Height = 40
    AutoSize = False
    ButtonHeight = 40
    ButtonWidth = 87
    Color = 12566463
    Ctl3D = False
    DoubleBuffered = True
    DrawingStyle = dsGradient
    GradientEndColor = 12566463
    GradientStartColor = 12566463
    ParentDoubleBuffered = False
    Transparent = False
    Visible = False
    StyleElements = []
    Wrapable = False
    ExplicitWidth = 816
    ExplicitHeight = 40
    inherited tbShow: TToolButton
      Style = tbsTextButton
      ExplicitWidth = 87
      ExplicitHeight = 40
    end
    inherited tbAdd: TToolButton
      Left = 87
      ExplicitLeft = 87
      ExplicitWidth = 87
      ExplicitHeight = 40
    end
    inherited tbEdit: TToolButton
      Left = 174
      ExplicitLeft = 174
      ExplicitWidth = 87
      ExplicitHeight = 40
    end
    inherited tbDelete: TToolButton
      Left = 261
      ExplicitLeft = 261
      ExplicitWidth = 87
      ExplicitHeight = 40
    end
  end
  object Grid: TcxGrid [1]
    Left = 0
    Top = 155
    Width = 816
    Height = 335
    Align = alClient
    PopupMenu = PopupMenu
    TabOrder = 3
    LockedStateImageOptions.Text = 'Please wait...'
    LookAndFeel.NativeStyle = False
    object TableView: TcxGridDBTableView
      OnGetStoredProperties = TableViewGetStoredProperties
      OnGetStoredPropertyValue = TableViewGetStoredPropertyValue
      OnSetStoredPropertyValue = TableViewSetStoredPropertyValue
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCellDblClick = TableViewCellDblClick
      DataController.DataSource = DataSource
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.ColumnsQuickCustomizationSorted = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideSelection = True
      OptionsView.NoDataToDisplayInfoText = #1053#1077#1090' '#1076#1072#1085#1085#1099#1093
      OptionsView.DataRowHeight = 25
      OptionsView.GroupByBox = False
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.HeaderHeight = 30
      OptionsView.Indicator = True
      OptionsView.RowSeparatorColor = clBlack
      Styles.Background = GridBaground
      Styles.Content = GridRow
      Styles.Footer = GridHeader
      Styles.Header = GridHeader
      Styles.Selection = GridRowSelect
    end
    object GridLevel: TcxGridLevel
      GridView = TableView
    end
  end
  object FilterPanel: TcxGroupBox [2]
    Left = 0
    Top = 96
    Align = alTop
    BiDiMode = bdLeftToRight
    ParentBackground = False
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    Style.BorderColor = 12566463
    Style.BorderStyle = ebsNone
    Style.Color = 12566463
    Style.Edges = []
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleDisabled.BorderColor = 12566463
    TabOrder = 2
    Visible = False
    Height = 59
    Width = 816
  end
  object dxPanel1: TdxPanel [3]
    Left = 0
    Top = 40
    Width = 816
    Height = 56
    Align = alTop
    Frame.Borders = [bBottom]
    Color = 12566463
    TabOrder = 1
    object btnDel: TcxButton
      AlignWithMargins = True
      Left = 303
      Top = 3
      Width = 97
      Height = 49
      Margins.Left = 0
      Align = alLeft
      Action = actDelete
      Colors.Default = clGradientActiveCaption
      Colors.Normal = clGradientActiveCaption
      Colors.Hot = clGradientInactiveCaption
      Colors.Pressed = clGradientActiveCaption
      Colors.Disabled = clGradientActiveCaption
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmDefault
      LookAndFeel.ScrollMode = scmDefault
      OptionsImage.Images = cxImageList16
      OptionsImage.Layout = blGlyphTop
      TabOrder = 3
    end
    object btnEdit: TcxButton
      AlignWithMargins = True
      Left = 203
      Top = 3
      Width = 97
      Height = 49
      Margins.Left = 0
      Align = alLeft
      Action = actEdit
      Colors.Default = clGradientActiveCaption
      Colors.Normal = clGradientActiveCaption
      Colors.Hot = clGradientInactiveCaption
      Colors.Pressed = clGradientActiveCaption
      Colors.Disabled = clGradientActiveCaption
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmDefault
      LookAndFeel.ScrollMode = scmDefault
      OptionsImage.Images = cxImageList16
      OptionsImage.Layout = blGlyphTop
      TabOrder = 2
    end
    object btnAdd: TcxButton
      AlignWithMargins = True
      Left = 103
      Top = 3
      Width = 97
      Height = 49
      Margins.Left = 0
      Align = alLeft
      Action = actAdd
      Colors.Default = clGradientActiveCaption
      Colors.Normal = clGradientActiveCaption
      Colors.Hot = clGradientInactiveCaption
      Colors.Pressed = clGradientActiveCaption
      Colors.Disabled = clGradientActiveCaption
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmDefault
      LookAndFeel.ScrollMode = scmDefault
      OptionsImage.Images = cxImageList16
      OptionsImage.Layout = blGlyphTop
      TabOrder = 1
    end
    object btnShow: TcxButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 97
      Height = 49
      Align = alLeft
      Action = actShow
      Colors.Default = clGradientActiveCaption
      Colors.Normal = clGradientActiveCaption
      Colors.Hot = clGradientInactiveCaption
      Colors.Pressed = clGradientActiveCaption
      Colors.Disabled = clGradientActiveCaption
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.ScrollbarMode = sbmDefault
      LookAndFeel.ScrollMode = scmDefault
      OptionsImage.Images = cxImageList16
      OptionsImage.Layout = blGlyphTop
      TabOrder = 0
    end
  end
  inherited ActionList: TActionList
    Tag = 1
    Left = 648
    Top = 112
    inherited actShow: TAction
      Tag = 1
      OnExecute = actShowExecute
    end
    inherited actAdd: TAction
      Tag = 1
      OnExecute = actAddExecute
    end
    inherited actEdit: TAction
      Tag = 1
      OnExecute = actEditExecute
    end
    inherited actDelete: TAction
      Tag = 1
      OnExecute = actDeleteExecute
    end
    object actRefresh: TAction [4]
      Tag = 1
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 5
      OnExecute = actRefreshExecute
    end
    inherited actLookup: TAction
      OnExecute = actLookupExecute
    end
  end
  inherited PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 632
    Top = 168
    object N7: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Action = actRefresh
    end
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
    DesignInfo = 6946857
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  object Query: TFDQuery
    Connection = DM.FDConnection
    Left = 704
    Top = 96
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 696
    Top = 168
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 144
    Top = 72
    PixelsPerInch = 96
    object GridHeader: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14602694
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clBlack
    end
    object GridBaground: TcxStyle
      AssignedValues = [svColor]
      Color = 15527148
    end
    object GridRowSelect: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clBlack
    end
    object GridRow: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
  end
end
