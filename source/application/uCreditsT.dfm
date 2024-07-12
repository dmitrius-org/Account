inherited CreditsT: TCreditsT
  Caption = #1050#1088#1077#1076#1080#1090#1099
  ClientWidth = 944
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  ExplicitWidth = 960
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 944
    DoubleBuffered = True
    ExplicitWidth = 944
  end
  inherited Grid: TcxGrid
    Top = 131
    Width = 944
    Height = 359
    ExplicitTop = 143
    ExplicitWidth = 944
    ExplicitHeight = 347
    inherited TableView: TcxGridDBTableView
      DataController.KeyFieldNames = 'CreditID'
      object TableViewCreditID: TcxGridDBColumn
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
        DataBinding.FieldName = 'CreditID'
        Visible = False
        HeaderAlignmentHorz = taCenter
      end
      object TableViewCreditDate: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'CreditDate'
        HeaderAlignmentHorz = taCenter
        Width = 105
      end
      object TableViewCreditType: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1088#1077#1076#1080#1090#1072
        DataBinding.FieldName = 'CreditType'
        HeaderAlignmentHorz = taCenter
        Width = 212
      end
      object TableViewAmount: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072', '#1088#1091#1073'.'
        DataBinding.FieldName = 'Amount'
        HeaderAlignmentHorz = taCenter
        Width = 104
      end
      object TableViewPayAmount: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072
        DataBinding.FieldName = 'PayAmount'
        HeaderAlignmentHorz = taCenter
        Width = 115
      end
      object TableViewRest: TcxGridDBColumn
        Caption = #1054#1089#1090#1072#1090#1086#1082', '#1088#1091#1073'.'
        DataBinding.FieldName = 'Rest'
        HeaderAlignmentHorz = taCenter
        Width = 117
      end
      object TableViewComment: TcxGridDBColumn
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        DataBinding.FieldName = 'Comment'
        HeaderAlignmentHorz = taCenter
        Width = 245
      end
    end
  end
  inherited FilterPanel: TcxGroupBox
    Visible = True
    ExplicitWidth = 944
    ExplicitHeight = 91
    Height = 91
    Width = 944
    object SkLabel7: TSkLabel
      Left = 11
      Top = 17
      Width = 44
      Height = 19
      Words = <
        item
          Caption = #1044#1072#1090#1072' '#1089':'
        end>
    end
    object SkLabel4: TSkLabel
      Left = 168
      Top = 17
      Width = 20
      Height = 19
      Words = <
        item
          Caption = #1087#1086':'
        end>
    end
    object edtCreditL: TSkLabel
      Left = 304
      Top = 13
      Width = 132
      Height = 34
      AutoSize = False
      Words = <
        item
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1088#1077#1076#1080#1090#1072':'
        end>
    end
    object edtDateB: TcxDateEdit
      Left = 60
      Top = 15
      Properties.ClearKey = 46
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.UseNullString = True
      TabOrder = 0
      OnKeyDown = edtDateBKeyDown
      Width = 104
    end
    object edtDateE: TcxDateEdit
      Left = 190
      Top = 15
      Properties.ClearKey = 46
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.UseNullString = True
      TabOrder = 1
      OnKeyDown = edtDateBKeyDown
      Width = 104
    end
    object btnFilterOk: TcxButton
      Left = 649
      Top = 15
      Width = 99
      Height = 25
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = IM.IL
      TabOrder = 3
    end
    object btnFilterClear: TcxButton
      Left = 754
      Top = 15
      Width = 99
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = IM.IL
      TabOrder = 4
    end
    object edtCredit: ALookupEdit
      Left = 411
      Top = 15
      LookupConnection = DM.FDConnection
      LookupForm = 'TCreditTypesT'
      LookupSQL = 'select name from tCreditTypes (nolock) where CreditTypeID = :ID'
      LookupKey = 0
      Anchors = [akLeft, akTop, akRight]
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
      TabOrder = 2
      OnKeyDown = edtDateBKeyDown
      Width = 232
    end
    object edtState: TcxRadioGroup
      Left = 11
      Top = 40
      Alignment = alTopCenter
      Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1082#1088#1077#1076#1080#1090#1072
      Properties.Columns = 3
      Properties.DefaultValue = 1
      Properties.Items = <
        item
          Caption = #1054#1090#1082#1088#1099#1090
          Value = '1'
        end
        item
          Caption = #1047#1072#1082#1088#1099#1090
          Value = '2'
        end
        item
          Caption = #1042#1089#1077
          Value = '3'
        end>
      Properties.OnEditValueChanged = edtStatePropertiesEditValueChanged
      ItemIndex = 0
      TabOrder = 5
      Height = 51
      Width = 283
    end
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
    DesignInfo = 11010132
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      '            select c.CreditID'
      '                  ,t.Name        CreditType'
      '                  ,c.CreditDate'
      '                  ,c.Amount'
      '                  ,c.PayAmount'
      '                  ,0.00 as Rest'
      '                  ,c.Comment'
      '              from tCredits c (nolock)'
      '             inner join tCreditTypes t (nolock)'
      '                     on t.CreditTypeID = c.CreditTypeID   '
      '             where 1=1'
      '             '
      '             !Credit'
      '             '
      '             !DateB'
      '             '
      '             !DateE'
      '             '
      '             !CloseDate'
      '                     '
      '            order by c.CreditDate')
    Left = 761
    Top = 186
    MacroData = <
      item
        Value = Null
        Name = 'CREDIT'
      end
      item
        Value = Null
        Name = 'DATEB'
      end
      item
        Value = Null
        Name = 'DATEE'
      end
      item
        Value = Null
        Name = 'CLOSEDATE'
      end>
    object QueryCreditID: TFMTBCDField
      AutoGenerateValue = arAutoInc
      FieldName = 'CreditID'
      Origin = 'CreditID'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
      Precision = 15
      Size = 0
    end
    object QueryCreditType: TStringField
      FieldName = 'CreditType'
      Origin = 'CreditType'
      Size = 256
    end
    object QueryCreditDate: TSQLTimeStampField
      FieldName = 'CreditDate'
      Origin = 'CreditDate'
    end
    object QueryAmount: TFloatField
      FieldName = 'Amount'
      Origin = 'Amount'
    end
    object QueryRest: TBCDField
      FieldName = 'Rest'
      Origin = 'Rest'
      ReadOnly = True
      Required = True
      Precision = 2
      Size = 2
    end
    object QueryComment: TStringField
      FieldName = 'Comment'
      Origin = 'Comment'
      Size = 1024
    end
    object QueryPayAmount: TFloatField
      FieldName = 'PayAmount'
      Origin = 'PayAmount'
    end
  end
  inherited cxStyleRepository: TcxStyleRepository
    Left = 168
    Top = 144
    PixelsPerInch = 96
  end
end
