inherited TransactionF: TTransactionF
  Caption = 'TransactionF'
  ClientHeight = 358
  ClientWidth = 627
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  ExplicitWidth = 643
  ExplicitHeight = 397
  TextHeight = 17
  object SkLabel6: TSkLabel [0]
    Left = 20
    Top = 41
    Width = 27
    Height = 19
    Words = <
      item
        Caption = #1058#1080#1087':'
      end>
  end
  object SkLabel1: TSkLabel [1]
    Left = 20
    Top = 71
    Width = 68
    Height = 19
    Words = <
      item
        Caption = #1054#1087#1077#1088#1072#1094#1080#1103':'
      end>
  end
  object SkLabel7: TSkLabel [2]
    Left = 20
    Top = 137
    Width = 33
    Height = 19
    Words = <
      item
        Caption = #1044#1072#1090#1072':'
      end>
  end
  object SkLabel8: TSkLabel [3]
    Left = 20
    Top = 171
    Width = 50
    Height = 19
    TextSettings.Font.Weight = Bold
    Words = <
      item
        Caption = #1057#1091#1084#1084#1072':'
      end>
  end
  object SkLabel14: TSkLabel [4]
    Left = 20
    Top = 207
    Width = 92
    Height = 19
    Words = <
      item
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
      end>
  end
  object edtKontragentL: TSkLabel [5]
    Left = 20
    Top = 103
    Width = 76
    Height = 19
    Visible = False
    Words = <
      item
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090':'
      end>
  end
  object edtExpenseItemL: TSkLabel [6]
    Left = 20
    Top = 103
    Width = 108
    Height = 19
    Visible = False
    Words = <
      item
        Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074':'
      end>
  end
  object edtCreditDL: TSkLabel [7]
    Left = 20
    Top = 103
    Width = 49
    Height = 19
    Visible = False
    Words = <
      item
        Caption = #1050#1088#1077#1076#1080#1090':'
      end>
  end
  inherited Panel: TdxPanel
    Top = 312
    Width = 627
    TabOrder = 10
    ExplicitTop = 312
    ExplicitWidth = 627
    inherited btnCancel: TcxButton
      Left = 424
      ExplicitLeft = 424
    end
    inherited btnOk: TcxButton
      Left = 520
      OnClick = btnOkClick
      ExplicitLeft = 520
    end
  end
  object edtTranType: TcxLookupComboBox [9]
    Left = 152
    Top = 40
    Properties.KeyFieldNames = 'TranTypeID'
    Properties.ListColumns = <
      item
        FieldName = 'Name'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsTranType
    Properties.MaxLength = 256
    Properties.OnEditValueChanged = edtTranTypePropertiesEditValueChanged
    TabOrder = 2
    Width = 144
  end
  object edtOperation: TcxLookupComboBox [10]
    Left = 152
    Top = 71
    Properties.KeyFieldNames = 'OperationID'
    Properties.ListColumns = <
      item
        FieldName = 'OperationName'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dsOperation
    Properties.MaxLength = 256
    Properties.OnEditValueChanged = edtOperationPropertiesEditValueChanged
    TabOrder = 3
    Width = 144
  end
  object edtOperDate: TcxDateEdit [11]
    Left = 152
    Top = 134
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.UseNullString = True
    TabOrder = 7
    Width = 142
  end
  object edtAmount: TcxCurrencyEdit [12]
    Left = 152
    Top = 166
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0 '#8381';-,0 '#8381
    Properties.Nullstring = '0'
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 8
    Width = 142
  end
  object edtComment: TcxMemo [13]
    Left = 152
    Top = 207
    Anchors = [akLeft, akTop, akRight]
    Properties.MaxLength = 256
    TabOrder = 9
    Height = 81
    Width = 453
  end
  object edtKontragent: ALookupEdit [14]
    Left = 152
    Top = 102
    LookupConnection = DM.FDConnection
    LookupForm = 'TKontragentsT'
    LookupSQL = 'Select Name from tKontragents (nolock) where KontragentID = :ID'
    LookupKey = 0
    LookupFilter = 'and k.KontragentTypeID = 2'
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
    TabOrder = 4
    Visible = False
    Width = 447
  end
  object edtExpenseItem: ALookupEdit [15]
    Left = 152
    Top = 102
    LookupConnection = DM.FDConnection
    LookupForm = 'TExpenseItemsT'
    LookupSQL = 
      '  Select Name from [tExpenseItems] (nolock) where [ExpenseItemID' +
      '] = :ID'
    LookupKey = 0
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
    TabOrder = 6
    Visible = False
    Width = 447
  end
  object edtCreditD: ALookupEdit [16]
    Left = 152
    Top = 102
    LookupConnection = DM.FDConnection
    LookupForm = 'TCreditsT'
    LookupSQL = 
      '            select t.Name     '#13#10'              from tCredits c (n' +
      'olock)'#13#10'              left join tCreditTypes t (nolock)'#13#10'       ' +
      '              on t.CreditTypeID = c.CreditTypeID '#13#10'            w' +
      'here c.CreditID = :ID'
    LookupKey = 0
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
    TabOrder = 5
    Visible = False
    Width = 447
  end
  object dxPanel2: TdxPanel [17]
    Left = 364
    Top = -3
    Width = 263
    Height = 41
    Frame.Borders = []
    TabOrder = 0
    object lblRest: TSkLabel
      Left = 0
      Top = 0
      Width = 263
      Height = 41
      Align = alClient
      TextSettings.Font.Size = 15.000000000000000000
      TextSettings.Font.Weight = Bold
      TextSettings.FontColor = claCrimson
      TextSettings.HorzAlign = Center
      Words = <
        item
          Caption = 'lblRest'
        end>
      ExplicitLeft = 34
      ExplicitTop = 8
      ExplicitWidth = 64
      ExplicitHeight = 19
    end
  end
  object dxPanel3: TdxPanel [18]
    Left = 20
    Top = -2
    Width = 364
    Height = 39
    Frame.Borders = []
    TabOrder = 1
    object lblKassa: TSkLabel
      Left = 0
      Top = 0
      Width = 364
      Height = 39
      Align = alClient
      TextSettings.Font.Size = 15.000000000000000000
      TextSettings.Font.Weight = Bold
      TextSettings.FontColor = claCrimson
      TextSettings.HorzAlign = Justify
      Words = <
        item
          Caption = 'lblKassa'
        end>
      ExplicitHeight = 20
    end
  end
  inherited FDQuery: TFDQuery
    Left = 267
    Top = 331
  end
  inherited DataSource: TDataSource
    Left = 194
    Top = 335
  end
  object dsTranType: TDataSource
    DataSet = qTranType
    Left = 518
    Top = 251
  end
  object qTranType: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'select *'
      '  from tTranType (nolock)')
    Left = 502
    Top = 235
  end
  object dsOperation: TDataSource
    DataSet = qOperation
    Left = 370
    Top = 238
  end
  object qOperation: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      ''
      'select o.OperationID'
      '      ,ot.Name OperationName'
      '  from tOperation o (nolock)'
      ' inner join tOperationType ot (nolock)'
      '         on ot.OperationTypeID = o.OperationTypeID'
      'where o.TranTypeID = :TranTypeID'
      '  and o.KassaID= :KassaID'
      '')
    Left = 354
    Top = 222
    ParamData = <
      item
        Name = 'TRANTYPEID'
        ParamType = ptInput
      end
      item
        Name = 'KASSAID'
        ParamType = ptInput
      end>
  end
end
