inherited BaseFormDBF: TBaseFormDBF
  Caption = #1043#1088#1091#1087#1087#1072' '#1089#1090#1072#1090#1100#1080' '#1088#1072#1089#1093#1086#1076#1086#1074
  ClientHeight = 188
  ClientWidth = 593
  Font.Height = -13
  Position = poOwnerFormCenter
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  ExplicitWidth = 609
  ExplicitHeight = 227
  TextHeight = 17
  object Panel: TdxPanel
    Left = 0
    Top = 142
    Width = 593
    Height = 46
    Align = alBottom
    Frame.Borders = [bTop]
    Color = 12566463
    TabOrder = 0
    DesignSize = (
      593
      45)
    object dxPanel1: TdxPanel
      Left = 0
      Top = 0
      Width = 337
      Height = 45
      Align = alLeft
      Frame.Borders = []
      Color = 12566463
      ParentColor = True
      TabOrder = 0
      object edtInDate: TcxDateEdit
        Left = 3
        Top = 21
        Hint = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
        ParentColor = True
        ParentFont = False
        Properties.AllowDropDownWhenReadOnly = False
        Properties.Animation = False
        Properties.ArrowsForYear = False
        Properties.AutoSelect = False
        Properties.Kind = ckDateTime
        Properties.ReadOnly = True
        Style.BorderStyle = ebsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWhite
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.ReadOnly = True
        Style.ButtonStyle = btsFlat
        Style.IsFontAssigned = True
        TabOrder = 1
        Width = 126
      end
      object edtUser: ALookupEdit
        Left = 3
        Top = 2
        Hint = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1089#1086#1079#1076#1072#1074#1096#1080#1081' '#1086#1073#1098#1077#1082#1090
        LookupConnection = DM.FDConnection
        LookupSQL = 'select Name from tUser (nolock) where userid = :ID'
        LookupKey = 0
        ParentColor = True
        ParentFont = False
        ParentShowHint = False
        Properties.Buttons = <>
        Properties.ReadOnly = True
        ShowHint = True
        Style.BorderStyle = ebsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWhite
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 294
      end
    end
    object btnCancel: TcxButton
      Left = 390
      Top = 3
      Width = 90
      Height = 39
      Anchors = [akTop, akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = IM.IL
      TabOrder = 1
    end
    object btnOk: TcxButton
      Left = 486
      Top = 3
      Width = 104
      Height = 39
      Anchors = [akTop, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = IM.IL
      TabOrder = 2
    end
  end
  object FDQuery: TFDQuery
    Connection = DM.FDConnection
    Left = 420
    Top = 64
  end
  object DataSource: TDataSource
    Left = 372
    Top = 80
  end
end
