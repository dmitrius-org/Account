inherited SupplierClientF: TSupplierClientF
  Caption = 'SupplierClientF'
  ClientHeight = 339
  StyleElements = [seFont, seClient, seBorder]
  ExplicitHeight = 378
  TextHeight = 17
  inherited Panel: TdxPanel
    Top = 293
    ExplicitTop = 293
    inherited btnOk: TcxButton
      OnClick = btnOkClick
    end
  end
  object PageControl1: TPageControl [1]
    Left = 0
    Top = 0
    Width = 593
    Height = 293
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = TabCommon
    Align = alClient
    DoubleBuffered = True
    OwnerDraw = True
    ParentDoubleBuffered = False
    TabHeight = 30
    TabOrder = 1
    TabWidth = 110
    OnDrawTab = PageControl1DrawTab
    object TabCommon: TTabSheet
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = #1043#1083#1072#1074#1085#1072#1103
      ImageIndex = 1
      object dxPanel2: TdxPanel
        Left = 0
        Top = 0
        Width = 585
        Height = 253
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Frame.Borders = []
        Frame.Drag.DetectionAreaSize = 0
        Frame.Drag.Enabled = True
        Frame.Scale = True
        Color = 15527148
        TabOrder = 0
        object edtDiscount: TcxCurrencyEdit
          Left = 114
          Top = 139
          ParentFont = False
          Properties.DisplayFormat = ',0.00 %;-,0.00 %'
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 121
        end
        object cxLabel2: TcxLabel
          Left = 12
          Top = 143
          Caption = #1057#1082#1080#1076#1082#1072':'
          Transparent = True
        end
        object cxLabel1: TcxLabel
          Left = 12
          Top = 104
          Caption = #1044#1072#1090#1072' '#1089#1082#1080#1076#1082#1080':'
          Transparent = True
        end
        object edtDiscountDate: TcxDateEdit
          Left = 114
          Top = 100
          ParentFont = False
          Properties.DateButtons = [btnClear, btnNow, btnToday]
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 0
          Width = 121
        end
        object edtSupplier: ALookupEdit
          Left = 114
          Top = 23
          LookupConnection = DM.FDConnection
          LookupForm = 'TKontragentsT'
          LookupSQL = 'Select Name from tKontragents (nolock) where KontragentID = :ID'
          LookupKey = 0
          LookupFilter = 'and k.KontragentTypeID = 3'
          ParentFont = False
          ParentShowHint = False
          Properties.Buttons = <
            item
              Caption = '...'
              Default = True
              ImageIndex = 0
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
              Kind = bkText
              Width = 25
            end
            item
              ImageIndex = 4
              Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077
              Kind = bkGlyph
            end>
          Properties.Images = IM.IL
          ShowHint = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 450
        end
        object edtClient: ALookupEdit
          Left = 114
          Top = 61
          LookupConnection = DM.FDConnection
          LookupForm = 'TKontragentsT'
          LookupSQL = 'Select Name from tKontragents (nolock) where KontragentID = :ID'
          LookupKey = 0
          LookupFilter = 'and k.KontragentTypeID = 1'
          ParentFont = False
          ParentShowHint = False
          Properties.Buttons = <
            item
              Caption = '...'
              Default = True
              ImageIndex = 0
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
              Kind = bkText
              Width = 25
            end
            item
              ImageIndex = 4
              Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077
              Kind = bkGlyph
            end>
          Properties.Images = IM.IL
          ShowHint = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 5
          Width = 450
        end
        object cxLabel8: TcxLabel
          Left = 12
          Top = 22
          Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082':'
        end
        object cxLabel9: TcxLabel
          Left = 12
          Top = 65
          Caption = #1050#1083#1080#1077#1085#1090':'
        end
      end
    end
    object TabDiscount: TTabSheet
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1089#1082#1080#1076#1082#1080
      ImageIndex = 2
      object GridDiscount: TcxGrid
        Left = 0
        Top = 0
        Width = 585
        Height = 253
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object TableViewDiscount: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = dsDiscount
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
          object TableViewDiscountDiscountDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1089#1082#1080#1076#1082#1080
            DataBinding.FieldName = 'DiscountDate'
            HeaderAlignmentHorz = taCenter
            Width = 200
          end
          object TableViewDiscountDiscount: TcxGridDBColumn
            Caption = #1057#1082#1080#1076#1082#1072
            DataBinding.FieldName = 'Discount'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00 %;-,0.00 %'
            HeaderAlignmentHorz = taCenter
            Width = 189
          end
        end
        object GridLevelDiscount: TcxGridLevel
          GridView = TableViewDiscount
        end
      end
    end
  end
  object qDiscount: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      '    select     '
      '           ObjectTypeID '
      '          ,ObjectID     '
      '          ,Discount        '
      '          ,DiscountDate         '
      '          ,Comment      '
      '      from pDiscounts (nolock)'
      '     where Spid         = @@Spid'
      '       and ObjectTypeID = 4         '
      '     order by InDateTime desc'
      '       ')
    Left = 380
    Top = 200
    object qDiscountObjectTypeID: TIntegerField
      FieldName = 'ObjectTypeID'
      Origin = 'ObjectTypeID'
    end
    object qDiscountObjectID: TFMTBCDField
      FieldName = 'ObjectID'
      Origin = 'ObjectID'
      Precision = 15
      Size = 0
    end
    object qDiscountDiscount: TFloatField
      FieldName = 'Discount'
      Origin = 'Discount'
    end
    object qDiscountDiscountDate: TSQLTimeStampField
      FieldName = 'DiscountDate'
      Origin = 'DiscountDate'
    end
    object qDiscountComment: TStringField
      FieldName = 'Comment'
      Origin = 'Comment'
      Size = 256
    end
  end
  object dsDiscount: TDataSource
    DataSet = qDiscount
    Left = 308
    Top = 200
  end
end
