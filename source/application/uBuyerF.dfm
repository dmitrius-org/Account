inherited BuyerF: TBuyerF
  Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
  ClientHeight = 411
  ClientWidth = 654
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 670
  ExplicitHeight = 450
  TextHeight = 17
  inherited Panel: TdxPanel
    Top = 365
    Width = 654
    Frame.Borders = []
    TabOrder = 1
    ExplicitTop = 365
    ExplicitWidth = 654
    inherited dxPanel1: TdxPanel
      Height = 46
      TabOrder = 0
      ExplicitHeight = 46
      inherited edtInDate: TcxDateEdit
        TabOrder = 1
      end
      inherited edtUser: ALookupEdit
        TabOrder = 0
      end
    end
    inherited btnCancel: TcxButton
      Left = 451
      Height = 40
      ExplicitLeft = 451
      ExplicitHeight = 40
    end
    inherited btnOk: TcxButton
      Left = 546
      Height = 40
      TabOrder = 2
      OnClick = btnOkClick
      ExplicitLeft = 546
      ExplicitHeight = 40
    end
  end
  object PageControl1: TPageControl [1]
    Left = 0
    Top = 0
    Width = 654
    Height = 365
    ActivePage = TabCommon
    Align = alClient
    DoubleBuffered = True
    OwnerDraw = True
    ParentDoubleBuffered = False
    TabHeight = 30
    TabOrder = 0
    TabWidth = 110
    OnDrawTab = PageControl1DrawTab
    object TabCommon: TTabSheet
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = #1043#1083#1072#1074#1085#1072#1103
      ImageIndex = 1
      DesignSize = (
        646
        325)
      object SkLabel1: TSkLabel
        Left = 6
        Top = 97
        Width = 100
        Height = 19
        Words = <
          item
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
          end>
      end
      object SkLabel2: TSkLabel
        Left = 6
        Top = 163
        Width = 81
        Height = 19
        Words = <
          item
            Caption = #1044#1072#1090#1072' '#1089#1082#1080#1076#1082#1080':'
          end>
      end
      object SkLabel3: TSkLabel
        Left = 306
        Top = 163
        Width = 49
        Height = 19
        Words = <
          item
            Caption = #1057#1082#1080#1076#1082#1072':'
          end>
      end
      object SkLabel4: TSkLabel
        Left = 6
        Top = 35
        Width = 30
        Height = 19
        Words = <
          item
            Caption = #1048#1085#1085':'
          end>
      end
      object SkLabel5: TSkLabel
        Left = 6
        Top = 66
        Width = 58
        Height = 19
        Words = <
          item
            Caption = #1055#1072#1088#1090#1085#1077#1088':'
          end>
      end
      object SkLabel6: TSkLabel
        Left = 6
        Top = 124
        Width = 143
        Height = 34
        AutoSize = False
        Words = <
          item
            Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
          end>
      end
      object SkLabel7: TSkLabel
        Left = 6
        Top = 196
        Width = 72
        Height = 19
        Words = <
          item
            Caption = #1070#1088'. '#1040#1076#1088#1077#1089':'
          end>
      end
      object SkLabel8: TSkLabel
        Left = 6
        Top = 220
        Width = 143
        Height = 37
        AutoSize = False
        Words = <
          item
            Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089':'
          end>
      end
      object SkLabel9: TSkLabel
        Left = 6
        Top = 251
        Width = 100
        Height = 37
        AutoSize = False
        Words = <
          item
            Caption = #1069#1044#1054':'
          end>
      end
      object edtEdoIDL: TSkLabel
        Left = 3
        Top = 278
        Width = 143
        Height = 37
        AutoSize = False
        Words = <
          item
            Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1069#1044#1054':'
          end>
      end
      object edtName: TcxTextEdit
        Left = 155
        Top = 97
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 484
      end
      object edtDiscountDate: TcxDateEdit
        Left = 155
        Top = 160
        Properties.DateButtons = [btnClear, btnNow, btnToday]
        TabOrder = 6
        Width = 121
      end
      object edtSignPartner: TcxCheckBox
        Left = 155
        Top = 6
        Caption = #1055#1072#1088#1090#1085#1077#1088
        Properties.OnChange = edtSignPartnerPropertiesChange
        Style.TransparentBorder = False
        TabOrder = 0
      end
      object edtINN: TcxTextEdit
        Left = 155
        Top = 35
        TabOrder = 1
        TextHint = #1048#1085#1085
        Width = 178
      end
      object edtPartner: TcxLookupComboBox
        Left = 155
        Top = 66
        Anchors = [akLeft, akTop, akRight]
        Properties.KeyFieldNames = 'KontragentID'
        Properties.ListColumns = <
          item
            FieldName = 'Name'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DM.dsKontragent
        Properties.MaxLength = 256
        TabOrder = 3
        Width = 484
      end
      object edtFullName: TcxTextEdit
        Left = 155
        Top = 128
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1087#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 484
      end
      object edtlegalAaddress: TcxTextEdit
        Left = 155
        Top = 193
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        Width = 484
      end
      object edtPostAddress: TcxTextEdit
        Left = 155
        Top = 224
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 9
        Width = 484
      end
      object edtEdo: TcxTextEdit
        Left = 155
        Top = 255
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 10
        Width = 484
      end
      object edtEdoID: TcxTextEdit
        Left = 155
        Top = 286
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 11
        Width = 484
      end
      object btnAuutoFillByInn: TcxButton
        Left = 388
        Top = 35
        Width = 251
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1087#1086' '#1048#1053#1053
        TabOrder = 2
        OnClick = btnAuutoFillByInnClick
      end
      object edtDiscount: TcxCurrencyEdit
        Left = 388
        Top = 160
        Properties.DisplayFormat = ',0.00 %;-,0.00 %'
        TabOrder = 7
        Width = 121
      end
    end
    object TabContact: TTabSheet
      Caption = #1050#1086#1085#1090#1072#1082#1090#1099
      ImageIndex = 1
      object Grid: TcxGrid
        Left = 0
        Top = 37
        Width = 646
        Height = 288
        Align = alClient
        TabOrder = 1
        object TableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          ScrollbarAnnotations.CustomAnnotations = <>
          OnUpdateEdit = TableViewUpdateEdit
          DataController.DataSource = dsContact
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.OnDataChanged = TableViewDataControllerDataChanged
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.ColumnsQuickCustomizationSorted = True
          OptionsData.Appending = True
          OptionsSelection.HideSelection = True
          OptionsView.NoDataToDisplayInfoText = #1053#1077#1090' '#1076#1072#1085#1085#1099#1093
          OptionsView.DataRowHeight = 22
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          OptionsView.Indicator = True
          OptionsView.RowSeparatorColor = clBlack
          object TableViewPhone: TcxGridDBColumn
            Caption = #1058#1077#1083#1077#1092#1086#1085
            DataBinding.FieldName = 'Phone'
            HeaderAlignmentHorz = taCenter
            Width = 200
          end
          object TableViewMail: TcxGridDBColumn
            Caption = #1055#1086#1095#1090#1072
            DataBinding.FieldName = 'Mail'
            HeaderAlignmentHorz = taCenter
            Width = 200
          end
          object TableViewComment: TcxGridDBColumn
            Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
            DataBinding.FieldName = 'Comment'
            HeaderAlignmentHorz = taCenter
            Width = 200
          end
        end
        object GridLevel: TcxGridLevel
          GridView = TableView
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 646
        Height = 37
        ButtonHeight = 40
        ButtonWidth = 70
        Caption = 'ToolBar1'
        Images = cxImageList
        ShowCaptions = True
        TabOrder = 0
        object ToolButton5: TToolButton
          Left = 0
          Top = 0
          AutoSize = True
        end
        object ToolButton1: TToolButton
          Left = 15
          Top = 0
          Action = acContactAdd
        end
        object ToolButton2: TToolButton
          Left = 85
          Top = 0
          Action = acContactEdit
        end
        object ToolButton3: TToolButton
          Left = 155
          Top = 0
          Action = acContactDelete
        end
        object ToolButton4: TToolButton
          Left = 225
          Top = 0
          Action = acContactSave
        end
      end
    end
    object TabDiscount: TTabSheet
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1089#1082#1080#1076#1082#1080
      ImageIndex = 2
      object GridDiscount: TcxGrid
        Left = 0
        Top = 0
        Width = 646
        Height = 325
        Align = alClient
        TabOrder = 0
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
            Width = 128
          end
          object TableViewDiscountDiscount: TcxGridDBColumn
            Caption = #1057#1082#1080#1076#1082#1072
            DataBinding.FieldName = 'Discount'
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
  inherited FDQuery: TFDQuery
    Left = 452
    Top = 80
  end
  object dsContact: TDataSource
    DataSet = qContact
    Left = 308
    Top = 264
  end
  object qContact: TFDQuery
    Active = True
    Connection = DM.FDConnection
    UpdateOptions.KeyFields = 'ID'
    UpdateOptions.AutoIncFields = 'ID'
    UpdateObject = qContactUpdate
    SQL.Strings = (
      'select *'
      '  from pContacts (nolock)'
      ' where Spid = @@spid ')
    Left = 380
    Top = 264
    object qContactID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Precision = 15
      Size = 0
    end
    object qContactSpid: TFMTBCDField
      FieldName = 'Spid'
      Origin = 'Spid'
      Precision = 15
      Size = 0
    end
    object qContactContactID: TFMTBCDField
      FieldName = 'ContactID'
      Origin = 'ContactID'
      Precision = 15
      Size = 0
    end
    object qContactObjectTypeID: TIntegerField
      FieldName = 'ObjectTypeID'
      Origin = 'ObjectTypeID'
    end
    object qContactObjectID: TFMTBCDField
      FieldName = 'ObjectID'
      Origin = 'ObjectID'
      Precision = 15
      Size = 0
    end
    object qContactPhone: TStringField
      FieldName = 'Phone'
      Origin = 'Phone'
      Size = 256
    end
    object qContactMail: TStringField
      FieldName = 'Mail'
      Origin = 'Mail'
      Size = 256
    end
    object qContactComment: TStringField
      FieldName = 'Comment'
      Origin = 'Comment'
      Size = 256
    end
    object qContactInDateTime: TSQLTimeStampField
      FieldName = 'InDateTime'
      Origin = 'InDateTime'
    end
    object qContactUpDateTime: TSQLTimeStampField
      FieldName = 'UpDateTime'
      Origin = 'UpDateTime'
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
      '       and ObjectTypeID = 2          '
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
  object qContactUpdate: TFDUpdateSQL
    Connection = DM.FDConnection
    ConnectionName = 'Connection'
    InsertSQL.Strings = (
      '    insert pContacts'
      '          ('
      '           Spid'
      '          ,ObjectTypeID '
      '          ,ObjectID     '
      '          ,Phone        '
      '          ,Mail         '
      '          ,Comment         '
      '          )'
      '    VALUES (@@Spid   '
      '          ,2--ObjectTypeID '
      '          ,null --ObjectID     '
      '          ,:New_Phone        '
      '          ,:New_Mail         '
      '          ,:New_Comment      '
      '          )'
      ''
      ''
      'SELECT SCOPE_IDENTITY() AS ID')
    ModifySQL.Strings = (
      'Update p'
      '       set p.Phone   = :New_Phone'
      '            ,p.Mail       = :New_Mail   '
      '            ,p.Comment =:New_Comment   '
      '     from pContacts p'
      '  where p.Spid = @@Spid'
      '      and p.ID    = :ID')
    DeleteSQL.Strings = (
      'delete'
      '  from pContacts'
      ' where Spid = @@spid '
      '     and ID = :ID')
    FetchRowSQL.Strings = (
      'select *'
      '  from pContacts (nolock)'
      ' where Spid = @@spid '
      '     and ID = :ID')
    Left = 460
    Top = 264
  end
  object cxImageList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 13893734
    ImageInfo = <
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554
          462D38223F3E0D0A3C7376672076657273696F6E3D22312E31222069643D224C
          617965725F312220786D6C6E733D22687474703A2F2F7777772E77332E6F7267
          2F323030302F7376672220786D6C6E733A786C696E6B3D22687474703A2F2F77
          77772E77332E6F72672F313939392F786C696E6B2220783D223070782220793D
          22307078222076696577426F783D2230203020333220333222207374796C653D
          22656E61626C652D6261636B67726F756E643A6E657720302030203332203332
          3B2220786D6C3A73706163653D227072657365727665223E262331333B262331
          303B3C7374796C6520747970653D22746578742F637373223E2E477265656E7B
          66696C6C3A233033394332333B7D3C2F7374796C653E0D0A3C7061746820636C
          6173733D22477265656E2220643D224D31362C3236632D332E332C302D362E32
          2D312E362D382D346C342D3448362E32682D3448327631306C332E322D332E32
          43372E372C32382C31312E362C33302C31362C333063372E312C302C31322E39
          2D352E322C31332E382D3132682D3420202623393B4332342E392C32322E362C
          32302E382C32362C31362C32367A222F3E0D0A3C7061746820636C6173733D22
          477265656E2220643D224D32362E382C372E324332342E332C342C32302E342C
          322C31362C3243382E392C322C332E312C372E322C322E322C3134683463302E
          392D342E362C352D382C392E382D3863332E332C302C362E322C312E362C382C
          346C2D342C3468352E386834483330563420202623393B4C32362E382C372E32
          7A222F3E0D0A3C2F7376673E0D0A}
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000023744558745469746C65004164643B46696C653B41646446696C653B
          426172733B526962626F6E3B15DCAA0A000002E049444154785E65927F689555
          18C73FE7BDEFBDCDFD52BBCAC6AC3FC67E68615830DB168DB491DBAC086566B8
          612B35D655D141121B42E48FFE501B28669BD860FB4316CE864284DA2854C28A
          A9685413993437595DC7D6DDDAEEDEF73DE7E9EECD3B821D78CEF71C9E733E7C
          9F874701EAD0A99F7A14AC061004115080117F4766540C82C218F7FBBD91B272
          11310036A0C4C8EA0FB63D0F0002B387B9570E9EF86115A00066019E18109876
          34028800BE26210A0152420AED19E600B4A301D02290FC0C042C0502CA02E3E7
          66201680DADF550180E5033C0D08227E801226E27F71E9D6715A7BDEE6F0F9B5
          B47E5BC737D78FF1F4B22040A0697D37C6083EC0D506010C0AA5147F446FD0F6
          5D84901DA0BAE4431AD79D65434283B6CDCDE801229F9656D98134CB73CDFF1D
          8018884DFE49F7B583BCF94223E52B6A387FB593C6935B3877A583179757B0B1
          AC81F9E194F6773E2ECA3B50DBA32CC0725C8D08584AB8FA6B27CFE5AE21279C
          C368FC37EEDEEF636BE58984DE233A758B507A8CA2C2F28CB405A13D40C0F64B
          987560B8DD7F859AAA77F9BCFB10030F1E20C092AC4C3C2D34B79D263B2B8392
          E26C8C31AF033BFF2B41FB0E40C1586C84096ED27F7F906DAFB5B06FEB693C23
          EC4FE8F186AF181A1C6378FA471C47870165270188F85DB55506A3B128E90B27
          3976760B087C12F992A6CF3622C0FCC57146C727884FE991E41C589E0101DF66
          414E31BFDFF985C295634C7B717ABF7E824599F3F05CCDCA37061081A1BE2013
          31E722602C00ED6904782C6853595C4B6FEF20EEDFA96871487B7C92CD1F5591
          16FE07573B8C465DFAAE3B93C3F7C69B010D90FAD6FB1D976B779F914DBBCEC8
          919397E5687B8754EF79561ABE7846F65DCC97E69FF3129A27DB5B0A645DC372
          5DB2FEC95A20F4EA8EC2D9694C0516000B813090BDB464D14B2FD7E57655D6E7
          3FAC8C14C89AFAFC91559B73BB9E2A5B5C0ACC0354457D3E4A4448AEC44310B8
          D072573D0207937D0204701F8579E5BD3C01F817E1E75F4F0B44B2A300000000
          49454E44AE426082}
        FileName = 'Images\Actions\AddFile_16x16.png'
        Keywords = 'Actions;AddFile'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000005A744558745469746C650044656C6574653B44656C6574654974656D
          3B52656D6F76653B52656D6F76654974656D3B44656C6574654C6973743B4C69
          73743B52656D6F76654C6973743B4974656D3B4C6973743B436C6561723B4572
          61736558E2170B0000025A49444154785E75514D68135110FEDE26246DB45A25
          956890A6554B4CD14320280A9A6A405B7F5A512A4A5BF1E045AC41AB3978E925
          15A445945E04ED45F1A7880729A4C550C1A306AA3DB40715C5D2B4B056441375
          93ECBEE7CE23592236B3CC0E3BF3ED3733DF3021041863CADDD1B7934C616190
          0980F20220B75E020CBCA0BF3ADF1DDA6FD60DCADA210DECE7AF42F8F2D910CA
          F0CBDAD0C89BBD84A74439010C43400840CBE9B22E2C16062A0806B8AAEC268E
          633902661806C89E25DFCB6139ADC1CD683A3DD98C86DEEE100C5E81205F30E4
          DEC7224DB231B7F6A6202791B97C4EAF4090D7256074625676169244AA29F399
          AC86E8991D205C050DB89CE078C40FABB760148B9A48D29206F86F024E04009E
          2466A8A32562F366371ABCABF0FD8706FFA63A9C68F563F01AEC747A005CF9E7
          0A1CE86C0DE024795B003DEDDBB0DDF60D467F0C6B934F51D07EC335F608EF0E
          B47D4886F7450028D6043AE7A0191E8ECD94DAE370B8117F6E0FC377AE03D9D9
          8FF87CA117753B035879A9CB938DDF1B01D06069205710C0A943CDE045826AA7
          822FF5F5584ABE803BE887AFB3054A46C562621C69F5EB64B906746FF9A3D369
          A384A581371AC5D4E91E93CCACAD7621935E422A3195BEB930D757AE012FE4B4
          97B1F804AE163D161F476A7A0ED3FDD7E1DB1580DD6143E6D33C1C5536048FEE
          F15E746F1C0260A3F394EEEA00E002B0A2CCD73C6F0AAAEA4054A43A5AC41D4F
          E3C2EB83BBC5FC952E71ABD6BB08C04904159D3A0CAFDF72E4B177AB3A58BBE1
          BEDFEE5C3750E37970A3C6A3F655BBDB490246C04AC64C03A014B522A041A4C5
          9C4EDF7F01B0BA3D657982DCCC0000000049454E44AE426082}
        FileName = 'Images\Actions\DeleteList2_16x16.png'
        Keywords = 'Actions;DeleteList2'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000020744558745469746C6500456469743B426172733B526962626F6E3B
          5374616E646172643B3013C3DB0000028449444154785E5D515D48145114FEEE
          CE9AA662FE942B1499246108D94B106588D24B461914843DD443500FF590D81F
          F550D443692F86A1A084AB581AD90F124260A4596AB14A96B556AC6192FDA045
          AEB3BBCE9DB9B77BE732BBEA99F9CEB9C39CEF3BDF9C219C731042B496CEB167
          9AA6157170C89045BE53C758A286D177F4C0A69D826700801B2A5C42A4E85069
          2E9CE08B12711EE07DFC6907004DD16202C4B254834119B823C2559297BA092C
          66D9FD4B05603135832D602BBEE348C134B923B0D40175BE3B4A8AED80280191
          2D93D9FDAF6E6C4744A70B05542B63311224513A23CA8D26EAE6BC3400482C3C
          DB6F00A02E47C0A41694650E0680896AC933E1F699886ACCCF636EB419DD97B6
          FC6A3ABEB10A4092E300865A22989CCA17FF46108648288C89170DC84D1B41CE
          E17BF0B7579CBAFE3DE88E3A60A6691319531305D462B920EB3AC69FD7211583
          C8D9530DFAB5067F3E04A045CC93D11D50CA94804CB610E0727184F520023DF5
          58A5F9B07E5F0DC21FABF1A6B907C8F4E0CBCFC9A69880A5044489EE7D6EF61F
          C67BEA904986B0E1602D667D573174A70FD64A0FDA6E0FB77AC782179C25C2B2
          991CC9091A92E25D6086B47D0B19F435F2CA6B31DD7BD19E1C4E4E87D7FBB65D
          90CF0198761C987A48EFBD7CB3BF880358E34900D7032808FA905F598FA9AE4A
          8C3E194638291D775BDFDFEF98089F01F0BBDCB3CC74362D9D2C1748115821B0
          2E6FEB91879D0DD7B83E39C8BB8E65F3F613F9BC6C75FC0300D902EE40DB2EEC
          CF888314588497D5DB00606D4149C58F77034F794BD5797EA538979766C53F02
          902310E76F2C81BFB1187B5335B8B12422212A0BF9F67924ABB0AC6F8646FE0E
          249A531D33A1F96E697B778A464F57F6AA8100FE037C7D7091F11B3976000000
          0049454E44AE426082}
        FileName = 'Images\Edit\Edit_16x16.png'
        Keywords = 'Edit;Edit'
      end
      item
        ImageClass = 'TdxSmartImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000021744558745469746C65004170706C793B4F4B3B436865636B3B4261
          72733B526962626F6E3B6463C8680000037D49444154785E4D8E7F4C94051CC6
          3FEF7B77E02073EA92742577579B684891E62AB6C4526B6013696BC9DC5A0B33
          D0322DA716D3CA94A21A8E96E976AEB654688E409B46B859CC249500E3F81588
          234EE0F875DC1DF7A3BB7BDFF7DBC16AEBD9F3D9BEFF3CCFF7C13555CB58A801
          40014CC5E5696BF638D24FBEF7EDF2D683550F7B0E5666B4969C5A5EBBEBCB65
          2F0209803A116E6438F82377A66A60385007A0E4EFB2A5BC51B1B4AEF4EC5AB9
          D476583A87AA642C7055BA47CE4A43F72752713157F67D93DE54B0DFBE04308D
          867E9E290050725F4BBDB7F8E8B29EAA86B7C4E5BF203DDEE3D23E71585AC6F6
          48E7E4C7D2E777C870A05E7E68DE277B4F668C6EDE6BCF00D4017F350A607EF5
          48DAB99CECBC9CF4343BC3E1264CAA60C282AAA8288A028A30313E852DE509EE
          0C4D72EEF26967CD17FD4F0EDE0A064DF9BBEDEB6CD6C51F3C9DF5382EFF1540
          104014216E500C2ED6DDA4F67C3BEDB79BC9C95EC3E8F8784AD28288BBADC1D3
          6C4E98652A7C2C7D2543816674430304C4885B0755E1CC99EBCC51D750F14E35
          DBCB32E91DF98DCCA5ABE8FCB36733E0500D3132EF9EAB108C7AE9ED1BA6B4AC
          969F2E39896A11CE5F68212529975D5B4A395A59C40B79CF6049D0489AAD81AA
          3C0A9854436741140FE148809AEA16CA8AAEA34C65F1E9E7F524EBEBD99A7F80
          53751FB2707118EB836642311F31C63174497C286BEE6C55D3F48971DF2088C1
          A60D6BF9BAB6849D0547D8FD520D2F3F5F822FD8C7AFCEEF58B16A11FEC82831
          3DC6A87F8868C488745C9D0C9AF5A8D2E51EF15BE72FD248B127E2F5FE8DE3FB
          FDEC28280755E1FDCFB691BF310B6FC48566C4C030F08D458984B40E4057837E
          ADAAA7CB87A0E2090EB2E491594C1A4DD45C2EC779AB0E53B287C4399384A353
          718288A8F4767B09F8F4F380069094BBDD7AB3E474869CB8B1428E5DCB90AAB6
          0DB2E59055B2B621C72EAF93134D99723C8EE3F79572A83A5336EEB439EF9A67
          990FA82A1071F7855EF9E35AC0D3EB0C010A9EF000799B56F1EEDBAFC7BF87D0
          0D411185BEEE30AD8DFE88AB2B501CF0C4FC5706DE34CC0D7F15E9AB53BF6A17
          784ED78C4AB72BF6803DDD82B6B013D5A420064CB875FABB628CB8A21DEEDBA1
          A2D6FAB11B8066480C7EE92F045000737CD6BCA736DFB77F7D616A63EE769BCC
          B0C326CF6E4D6D5B5D70FF47C9732CF700164099CE4D3373FCA76CAB43052CFF
          62065440001D884E130F19FC4FFF00FE20CB5D5DF1FFF30000000049454E44AE
          426082}
        FileName = 'Images\Actions\Apply_16x16.png'
        Keywords = 'Actions;Apply'
      end>
  end
  object ActionList: TActionList
    Images = cxImageList
    Left = 104
    Top = 150
    object acContactAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      OnExecute = acContactAddExecute
    end
    object acContactEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 3
      OnExecute = acContactEditExecute
    end
    object acContactDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      OnExecute = acContactDeleteExecute
    end
    object acContactRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = acContactRefreshExecute
    end
    object acContactSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      ImageIndex = 4
      OnExecute = acContactSaveExecute
    end
  end
end
