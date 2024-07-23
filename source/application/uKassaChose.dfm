object KassaChose: TKassaChose
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 107
  ClientWidth = 125
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
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1050#1072#1089#1089#1091
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    Properties.Items = <
      item
        Caption = #1050#1072#1089#1089#1072' 1'
        Value = '1'
      end
      item
        Caption = #1050#1072#1089#1089#1072' 2'
        Value = '2'
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
    Height = 101
    Width = 119
  end
end
