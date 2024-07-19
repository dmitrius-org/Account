inherited CreditPaymentT: TCreditPaymentT
  Caption = #1042#1099#1087#1083#1072#1090#1099' '#1087#1086' '#1082#1088#1077#1076#1080#1090#1091
  ClientWidth = 880
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 896
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 880
    DoubleBuffered = True
    ExplicitWidth = 880
  end
  inherited Grid: TcxGrid
    Width = 880
    ExplicitWidth = 880
    inherited TableView: TcxGridDBTableView
      DataController.KeyFieldNames = 'TransactionID'
      object TableViewTransactionID: TcxGridDBColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        DataBinding.FieldName = 'TransactionID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 128
      end
      object TableViewOperDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1074#1099#1087#1083#1072#1090#1099
        DataBinding.FieldName = 'OperDate'
        HeaderAlignmentHorz = taCenter
        Width = 109
      end
      object TableViewAmount: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072
        DataBinding.FieldName = 'Amount'
        HeaderAlignmentHorz = taCenter
        Width = 137
      end
      object TableViewComment: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        DataBinding.FieldName = 'Comment'
        HeaderAlignmentHorz = taCenter
        Width = 458
      end
    end
  end
  inherited FilterPanel: TcxGroupBox
    Visible = True
    ExplicitWidth = 880
    Width = 880
    object SkLabel7: TSkLabel
      Left = 10
      Top = 18
      Width = 44
      Height = 19
      Words = <
        item
          Caption = #1044#1072#1090#1072' '#1089':'
        end>
    end
    object SkLabel4: TSkLabel
      Left = 167
      Top = 18
      Width = 20
      Height = 19
      Words = <
        item
          Caption = #1087#1086':'
        end>
    end
    object SkLabel1: TSkLabel
      Left = 307
      Top = 18
      Width = 92
      Height = 19
      Words = <
        item
          Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
        end>
    end
    object edtPaymentDate: TcxDateEdit
      Left = 60
      Top = 16
      Properties.ClearKey = 46
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.UseNullString = True
      TabOrder = 0
      OnKeyDown = edtPaymentDateKeyDown
      Width = 104
    end
    object edtPaymentDateE: TcxDateEdit
      Left = 193
      Top = 16
      Properties.ClearKey = 46
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.UseNullString = True
      TabOrder = 1
      OnKeyDown = edtPaymentDateKeyDown
      Width = 104
    end
    object btnFilterOk: TcxButton
      Left = 688
      Top = 16
      Width = 94
      Height = 25
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = IM.IL
      TabOrder = 4
      OnClick = btnFilterOkClick
    end
    object btnFilterClear: TcxButton
      Left = 783
      Top = 16
      Width = 86
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = IM.IL
      TabOrder = 5
      OnClick = btnFilterClearClick
    end
    object edtComment: TcxTextEdit
      Left = 413
      Top = 16
      Properties.MaxLength = 255
      TabOrder = 2
      OnKeyDown = edtPaymentDateKeyDown
      Width = 236
    end
    object cxButton3: TcxButton
      Left = 650
      Top = 16
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
      TabOrder = 3
      OnClick = cxButton3Click
    end
  end
  inherited ActionList: TActionList
    Tag = 51
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      'SELECT t.TransactionID, '
      '       t.OperDate, '
      '       t.Amount, '
      '       t.Comment'
      ' FROM tTransaction t (nolock)'
      'WHERE 1=1'
      '  and t.CreditID = :CreditID'
      '  '
      '  !Comment'
      '  '
      '  !DateB'
      '  '
      '  !DateE'
      '  '
      'Order by t.OperDate')
    Top = 111
    ParamData = <
      item
        Name = 'CREDITID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = Null
        Name = 'COMMENT'
      end
      item
        Value = Null
        Name = 'DATEB'
      end
      item
        Value = Null
        Name = 'DATEE'
      end>
    object QueryTransactionID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'TransactionID'
      Origin = 'TransactionID'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Precision = 15
      Size = 0
    end
    object QueryOperDate: TSQLTimeStampField
      FieldName = 'OperDate'
      Origin = 'OperDate'
    end
    object QueryAmount: TCurrencyField
      FieldName = 'Amount'
      Origin = 'Amount'
    end
    object QueryComment: TStringField
      FieldName = 'Comment'
      Origin = 'Comment'
      Size = 256
    end
  end
  inherited cxStyleRepository: TcxStyleRepository
    Left = 138
    Top = 199
    PixelsPerInch = 96
  end
end
