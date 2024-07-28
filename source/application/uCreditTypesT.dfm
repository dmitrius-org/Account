inherited CreditTypesT: TCreditTypesT
  Caption = #1042#1080#1076#1099' '#1082#1088#1077#1076#1080#1090#1086#1074
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 17
  inherited ToolBar: TToolBar
    DoubleBuffered = True
  end
  inherited Grid: TcxGrid
    Top = 88
    Height = 402
    ExplicitTop = 88
    ExplicitHeight = 402
    inherited TableView: TcxGridDBTableView
      DataController.KeyFieldNames = 'CreditTypeID'
      object TableViewCreditTypeID: TcxGridDBColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        DataBinding.FieldName = 'CreditTypeID'
        HeaderAlignmentHorz = taCenter
      end
      object TableViewName: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'Name'
        HeaderAlignmentHorz = taCenter
        Width = 641
      end
    end
  end
  inherited FilterPanel: TcxGroupBox
    Visible = True
    ExplicitHeight = 48
    Height = 48
    object SkLabel1: TSkLabel
      Left = 175
      Top = 18
      Width = 100
      Height = 19
      Words = <
        item
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        end>
    end
    object edtName: TcxTextEdit
      Left = 281
      Top = 15
      Properties.MaxLength = 255
      TabOrder = 0
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      OnKeyDown = edtNameKeyDown
      Width = 298
    end
    object btnFilterClear: TcxButton
      Left = 711
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
    object btnFilterOk: TcxButton
      Left = 610
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
    object cxButton3: TcxButton
      Left = 580
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
  end
  inherited ActionList: TActionList
    Tag = 50
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      'select *'
      '  from tCreditTypes (nolock)'
      ' where 1=1'
      ' '
      '   !Name'
      '     '
      ' order by indatetime')
    MacroData = <
      item
        Value = Null
        Name = 'NAME'
      end>
    object QueryCreditTypeID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'CreditTypeID'
      Origin = 'CreditTypeID'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Precision = 15
      Size = 0
    end
    object QueryName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Size = 256
    end
    object QueryisActive: TBooleanField
      FieldName = 'isActive'
      Origin = 'isActive'
    end
    object QueryInDateTime: TSQLTimeStampField
      FieldName = 'InDateTime'
      Origin = 'InDateTime'
    end
  end
  inherited cxStyleRepository: TcxStyleRepository
    PixelsPerInch = 96
  end
end
