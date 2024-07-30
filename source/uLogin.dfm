object LoginForm: TLoginForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 206
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  StyleName = 'Windows'
  OnShow = FormShow
  TextHeight = 15
  object edtLogin: TcxTextEdit
    Left = 56
    Top = 41
    Properties.Alignment.Horz = taLeftJustify
    TabOrder = 1
    Width = 225
  end
  object cxLabel1: TcxLabel
    Left = 56
    Top = 16
    Caption = #1051#1086#1075#1080#1085':'
  end
  object edtPassword: TcxTextEdit
    Left = 56
    Top = 97
    Properties.Alignment.Horz = taLeftJustify
    Properties.PasswordChar = #8226
    Properties.ShowPasswordRevealButton = True
    TabOrder = 3
    Width = 225
  end
  object cxLabel2: TcxLabel
    Left = 56
    Top = 72
    Caption = #1055#1072#1088#1086#1083#1100':'
  end
  object btnOK: TcxButton
    Left = 175
    Top = 144
    Width = 90
    Height = 34
    Caption = #1042#1086#1081#1090#1080
    OptionsImage.ImageIndex = 0
    OptionsImage.Images = IM.IL
    TabOrder = 5
    OnClick = btnOKClick
  end
  object btnCancel: TcxButton
    Left = 70
    Top = 144
    Width = 88
    Height = 34
    Caption = #1047#1072#1082#1088#1099#1090#1100
    OptionsImage.ImageIndex = 1
    OptionsImage.Images = IM.IL
    TabOrder = 4
    OnClick = btnCancelClick
  end
end
