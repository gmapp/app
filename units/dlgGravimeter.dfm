object FormGravimeter: TFormGravimeter
  Left = 0
  Top = 0
  Caption = #1043#1088#1072#1074#1080#1084#1077#1090#1088
  ClientHeight = 157
  ClientWidth = 329
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
    329
    157)
  PixelsPerInch = 96
  TextHeight = 13
  object leNum: TLabeledEdit
    Left = 96
    Top = 16
    Width = 200
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object leC: TLabeledEdit
    Left = 96
    Top = 43
    Width = 200
    Height = 21
    EditLabel.Width = 72
    EditLabel.Height = 13
    EditLabel.Caption = #1062#1077#1085#1072' '#1076#1077#1083#1077#1085#1080#1103
    LabelPosition = lpLeft
    LabelSpacing = 6
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 154
    Top = 116
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1082
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 235
    Top = 116
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object leComment: TLabeledEdit
    Left = 96
    Top = 70
    Width = 200
    Height = 21
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    LabelPosition = lpLeft
    LabelSpacing = 28
    TabOrder = 4
  end
end
