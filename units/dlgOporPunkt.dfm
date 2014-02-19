object FormOporPunkt: TFormOporPunkt
  Left = 0
  Top = 0
  Caption = #1054#1087#1086#1088#1085#1099#1081' '#1087#1091#1085#1082#1090
  ClientHeight = 234
  ClientWidth = 303
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
    303
    234)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 18
    Top = 116
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object btnOk: TButton
    Left = 129
    Top = 191
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1082
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 210
    Top = 191
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object edProfil: TLabeledEdit
    Left = 92
    Top = 8
    Width = 200
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = #8470' '#1087#1088
    LabelPosition = lpLeft
    LabelSpacing = 46
    TabOrder = 2
  end
  object edPiket: TLabeledEdit
    Left = 92
    Top = 35
    Width = 200
    Height = 21
    EditLabel.Width = 28
    EditLabel.Height = 13
    EditLabel.Caption = #8470' '#1087#1082
    LabelPosition = lpLeft
    LabelSpacing = 46
    TabOrder = 3
  end
  object edGnabl: TLabeledEdit
    Left = 92
    Top = 62
    Width = 200
    Height = 21
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = 'G '#1085#1072#1073#1083
    LabelPosition = lpLeft
    LabelSpacing = 42
    TabOrder = 4
  end
  object dtDate: TDateTimePicker
    Left = 92
    Top = 116
    Width = 200
    Height = 21
    Date = 41424.335648379630000000
    Time = 41424.335648379630000000
    TabOrder = 5
  end
  object edPribor: TLabeledEdit
    Left = 92
    Top = 89
    Width = 200
    Height = 21
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = #8470' '#1075#1088#1072#1074
    LabelPosition = lpLeft
    LabelSpacing = 36
    TabOrder = 6
  end
  object edComment: TLabeledEdit
    Left = 92
    Top = 143
    Width = 200
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    LabelPosition = lpLeft
    LabelSpacing = 16
    TabOrder = 7
  end
end
