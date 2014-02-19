object FormReis: TFormReis
  Left = 0
  Top = 0
  Caption = #1056#1077#1081#1089
  ClientHeight = 201
  ClientWidth = 331
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
    331
    201)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 100
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
  end
  object btnOk: TButton
    Left = 157
    Top = 158
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1082#1088#1099#1090#1100
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 238
    Top = 158
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object edFile: TLabeledEdit
    Left = 100
    Top = 16
    Width = 165
    Height = 21
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = #1060#1072#1081#1083
    LabelPosition = lpLeft
    LabelSpacing = 60
    ReadOnly = True
    TabOrder = 2
  end
  object edOperator: TLabeledEdit
    Left = 100
    Top = 43
    Width = 200
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103' '#1086#1087#1077#1088#1072#1090#1086#1088#1072
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 3
  end
  object edPribor: TLabeledEdit
    Left = 100
    Top = 70
    Width = 200
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072
    LabelPosition = lpLeft
    LabelSpacing = 10
    TabOrder = 4
  end
  object dtDate: TDateTimePicker
    Left = 100
    Top = 97
    Width = 200
    Height = 21
    Date = 41424.335648379630000000
    Time = 41424.335648379630000000
    TabOrder = 5
  end
  object btnSelectFile: TButton
    Left = 271
    Top = 12
    Width = 25
    Height = 25
    Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083
    Caption = '...'
    TabOrder = 6
    OnClick = btnSelectFileClick
  end
  object OpenDialog1: TOpenDialog
    Left = 47
    Top = 144
  end
end
