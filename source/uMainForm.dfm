object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 523
  ClientWidth = 1092
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  OnCreate = FormCreate
  TextHeight = 15
  object MainActionList: TActionList
    Left = 168
    Top = 56
    object actExpenseItems: TAction
      Caption = #1057#1090#1072#1090#1100#1080' '#1088#1072#1089#1093#1086#1076#1086#1074
    end
    object actExpenseGroups: TAction
      Caption = #1043#1088#1091#1087#1087#1099' '#1088#1072#1089#1093#1086#1076#1086#1074
    end
  end
  object MainMenu: TMainMenu
    Left = 272
    Top = 56
  end
end
