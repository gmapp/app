object FormPloshad: TFormPloshad
  Left = 0
  Top = 0
  Caption = #1055#1083#1086#1097#1072#1076#1100
  ClientHeight = 184
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  DesignSize = (
    333
    184)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 72
    Width = 37
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1086
  end
  object edName: TLabeledEdit
    Left = 90
    Top = 16
    Width = 200
    Height = 21
    EditLabel.Width = 19
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103
    LabelPosition = lpLeft
    LabelSpacing = 50
    TabOrder = 0
  end
  object edRaion: TLabeledEdit
    Left = 90
    Top = 43
    Width = 200
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = #1056#1072#1081#1086#1085
    LabelPosition = lpLeft
    LabelSpacing = 40
    TabOrder = 1
  end
  object edComment: TLabeledEdit
    Left = 90
    Top = 97
    Width = 200
    Height = 21
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object btnOk: TButton
    Left = 161
    Top = 135
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1082
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 242
    Top = 135
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object dtNachalo: TDateTimePicker
    Left = 90
    Top = 70
    Width = 200
    Height = 21
    Date = 41424.335648379630000000
    Time = 41424.335648379630000000
    TabOrder = 5
  end
end
