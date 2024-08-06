inherited TransactionF: TTransactionF
  Caption = 'TransactionF'
  ClientHeight = 358
  ClientWidth = 627
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  ExplicitWidth = 643
  ExplicitHeight = 397
  TextHeight = 17
  inherited Panel: TdxPanel
    Top = 312
    Width = 627
    TabOrder = 18
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
  object edtTranType: TcxLookupComboBox [1]
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
    TabOrder = 3
    Width = 144
  end
  object edtOperation: TcxLookupComboBox [2]
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
    TabOrder = 5
    Width = 144
  end
  object edtOperDate: TcxDateEdit [3]
    Left = 152
    Top = 134
    Properties.DateButtons = [btnClear, btnNow, btnToday]
    Properties.UseNullString = True
    TabOrder = 13
    Width = 142
  end
  object edtAmount: TcxCurrencyEdit [4]
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
    TabOrder = 14
    Width = 142
  end
  object edtComment: TcxMemo [5]
    Left = 152
    Top = 207
    Anchors = [akLeft, akTop, akRight]
    Properties.MaxLength = 256
    TabOrder = 17
    Height = 81
    Width = 453
  end
  object edtKontragent: ALookupEdit [6]
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
    TabOrder = 9
    Visible = False
    Width = 447
  end
  object edtExpenseItem: ALookupEdit [7]
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
    TabOrder = 10
    Visible = False
    Width = 447
  end
  object edtCreditD: ALookupEdit [8]
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
    TabOrder = 11
    Visible = False
    Width = 447
  end
  object dxPanel2: TdxPanel [9]
    Left = 364
    Top = 0
    Width = 263
    Height = 37
    Frame.Borders = []
    TabOrder = 1
    object lblRest: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      Caption = 'lblRest'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clCrimson
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      ExplicitLeft = 114
      ExplicitTop = 3
      ExplicitWidth = 49
      ExplicitHeight = 24
      AnchorX = 132
      AnchorY = 19
    end
  end
  object dxPanel3: TdxPanel [10]
    Left = 20
    Top = -2
    Width = 317
    Height = 39
    Frame.Borders = []
    TabOrder = 0
    object lblKassa: TcxLabel
      Left = 0
      Top = 0
      Align = alLeft
      Caption = 'lblKassa'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clCrimson
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      ExplicitLeft = -2
      AnchorX = 31
      AnchorY = 20
    end
  end
  object cxLabel5: TcxLabel [11]
    Left = 20
    Top = 39
    Caption = #1058#1080#1087':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel3: TcxLabel [12]
    Left = 20
    Top = 70
    Caption = #1054#1087#1077#1088#1072#1094#1080#1103':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel4: TcxLabel [13]
    Left = 20
    Top = 133
    Caption = #1044#1072#1090#1072':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel6: TcxLabel [14]
    Left = 20
    Top = 171
    Caption = #1057#1091#1084#1084#1072':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel7: TcxLabel [15]
    Left = 20
    Top = 206
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object edtCreditDL: TcxLabel [16]
    Left = 20
    Top = 101
    Caption = #1050#1088#1077#1076#1080#1090':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object edtExpenseItemL: TcxLabel [17]
    Left = 20
    Top = 101
    Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object edtKontragentL: TcxLabel [18]
    Left = 20
    Top = 101
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090':'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
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
