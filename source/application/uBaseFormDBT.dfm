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
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 810
    Height = 56
    ButtonHeight = 56
    ButtonWidth = 87
    Color = 14671839
    Ctl3D = False
    Customizable = True
    DoubleBuffered = True
    DockSite = True
    GradientEndColor = 12566463
    GradientStartColor = 12566463
    ParentColor = False
    ParentDoubleBuffered = False
    StyleElements = []
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 810
    ExplicitHeight = 56
    inherited tbShow: TToolButton
      ExplicitWidth = 87
      ExplicitHeight = 56
    end
    inherited tbAdd: TToolButton
      Left = 87
      ExplicitLeft = 87
      ExplicitWidth = 87
      ExplicitHeight = 56
    end
    inherited tbEdit: TToolButton
      Left = 174
      ExplicitLeft = 174
      ExplicitWidth = 87
      ExplicitHeight = 56
    end
    inherited tbDelete: TToolButton
      Left = 261
      ExplicitLeft = 261
      ExplicitWidth = 87
      ExplicitHeight = 56
    end
  end
  object Grid: TcxGrid [1]
    Left = 0
    Top = 121
    Width = 816
    Height = 369
    Align = alClient
    PopupMenu = PopupMenu
    TabOrder = 1
    ExplicitTop = 62
    ExplicitHeight = 350
    object TableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
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
      OptionsView.DataRowHeight = 22
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      OptionsView.Indicator = True
      OptionsView.RowSeparatorColor = clBlack
      Styles.Background = GridBaground
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
    Top = 62
    Align = alTop
    Caption = #1060#1080#1083#1100#1090#1088
    Style.Color = clBtnFace
    TabOrder = 2
    Visible = False
    Height = 59
    Width = 816
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
      Tag = 1
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
      Color = clGold
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clBlack
    end
  end
end
