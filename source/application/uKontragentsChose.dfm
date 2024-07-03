object KontragentsChose: TKontragentsChose
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 132
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 15
  object KType: TcxRadioGroup
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alClient
    Alignment = alTopCenter
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    Properties.Items = <
      item
        Caption = #1050#1083#1080#1077#1085#1090
        Value = '1'
      end
      item
        Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
        Value = '2'
      end
      item
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Value = '3'
      end>
    Properties.OnEditValueChanged = KTypePropertiesEditValueChanged
    Style.Edges = []
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    ExplicitLeft = 96
    ExplicitTop = 16
    ExplicitWidth = 185
    ExplicitHeight = 105
    Height = 126
    Width = 314
  end
end
