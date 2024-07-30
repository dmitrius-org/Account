inherited StatisticT: TStatisticT
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
  ClientHeight = 321
  ClientWidth = 651
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 667
  ExplicitHeight = 360
  TextHeight = 17
  inherited ToolBar: TToolBar
    Width = 651
    DoubleBuffered = True
    Visible = False
    ExplicitWidth = 651
  end
  inherited Grid: TcxGrid
    Top = 81
    Width = 651
    Height = 240
    ExplicitTop = 82
    ExplicitWidth = 651
    ExplicitHeight = 239
    inherited TableView: TcxGridDBTableView
      object TableViewName: TcxGridDBColumn
        Caption = #1055#1086#1082#1072#1079#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'Name'
        HeaderAlignmentHorz = taCenter
        Width = 280
      end
      object TableViewCnt: TcxGridDBColumn
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        DataBinding.FieldName = 'Cnt'
        HeaderAlignmentHorz = taCenter
        Width = 162
      end
      object TableViewRest: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072
        DataBinding.FieldName = 'Rest'
        HeaderAlignmentHorz = taCenter
        Width = 169
      end
    end
  end
  inherited FilterPanel: TcxGroupBox
    Visible = True
    ExplicitWidth = 651
    ExplicitHeight = 41
    Height = 41
    Width = 651
    object edtType: TcxLookupComboBox
      Left = 77
      Top = 43
      Properties.ClearKey = 46
      Properties.KeyFieldNames = 'KassaID'
      Properties.ListColumns = <
        item
          FieldName = 'Name'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.MaxLength = 256
      TabOrder = 6
      Visible = False
      OnKeyDown = edtDateBKeyDown
      Width = 234
    end
    object edtDateE: TcxDateEdit
      Left = 207
      Top = 13
      Properties.ClearKey = 46
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.UseNullString = True
      TabOrder = 1
      OnKeyDown = edtDateBKeyDown
      Width = 104
    end
    object btnFilterOk: TcxButton
      Left = 326
      Top = 13
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
      Left = 431
      Top = 13
      Width = 99
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = IM.IL
      TabOrder = 3
      OnClick = btnFilterClearClick
    end
    object edtDateB: TcxDateEdit
      Left = 77
      Top = 13
      Properties.ClearKey = 46
      Properties.DateButtons = [btnClear, btnNow, btnToday]
      Properties.UseNullString = True
      TabOrder = 0
      OnKeyDown = edtDateBKeyDown
      Width = 104
    end
    object cxLabel1: TcxLabel
      Left = 26
      Top = 15
      Caption = #1044#1072#1090#1072' '#1089':'
    end
    object cxLabel2: TcxLabel
      Left = 183
      Top = 15
      Caption = #1087#1086':'
    end
  end
  inherited ActionList: TActionList
    Left = 405
    Top = 165
    inherited actShow: TAction
      Tag = -1
    end
    inherited actAdd: TAction
      Tag = -1
    end
    inherited actEdit: TAction
      Tag = -1
    end
    inherited actDelete: TAction
      Tag = -1
    end
  end
  inherited PopupMenu: TPopupMenu
    Left = 330
    Top = 187
  end
  inherited cxImageList32: TcxImageList
    FormatVersion = 1
    DesignInfo = 14418012
  end
  inherited cxImageList16: TcxImageList
    FormatVersion = 1
  end
  inherited Query: TFDQuery
    SQL.Strings = (
      ' exec Statistic'
      '        @Type  '#9'   = :Type      '
      '       ,@DateBegin = :DateBegin    '
      '       ,@DateEnd   = :DateEnd    '
      '')
    Left = 492
    Top = 170
    ParamData = <
      item
        Name = 'TYPE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATEBEGIN'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATEEND'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end>
    object QueryID: TFMTBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Precision = 15
      Size = 0
    end
    object QuerySpid: TFMTBCDField
      FieldName = 'Spid'
      Origin = 'Spid'
      Precision = 15
      Size = 0
    end
    object QueryName: TStringField
      FieldName = 'Name'
      Origin = 'Name'
      Size = 60
    end
    object QueryRest: TCurrencyField
      FieldName = 'Rest'
      Origin = 'Rest'
    end
    object QueryCnt: TIntegerField
      FieldName = 'Cnt'
      Origin = 'Cnt'
    end
  end
  inherited DataSource: TDataSource
    Left = 417
    Top = 198
  end
  inherited cxStyleRepository: TcxStyleRepository
    Left = 167
    Top = 242
    PixelsPerInch = 96
  end
end
