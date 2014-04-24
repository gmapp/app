object ProtocolListFrame: TProtocolListFrame
  Left = 0
  Top = 0
  Width = 928
  Height = 454
  TabOrder = 0
  DesignSize = (
    928
    454)
  object Label2: TLabel
    Left = 16
    Top = 22
    Width = 142
    Height = 13
    Caption = 'Scintrex AUTOGRAV CG-5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSerialCaption: TLabel
    Left = 16
    Top = 41
    Width = 32
    Height = 13
    Caption = 'Ser No'
  end
  object lblDateCaption: TLabel
    Left = 16
    Top = 60
    Width = 23
    Height = 13
    Caption = 'Date'
  end
  object lblDlinaCaption: TLabel
    Left = 16
    Top = 79
    Width = 106
    Height = 13
    Caption = #1044#1083#1080#1085#1072' '#1088#1077#1081#1089#1072' ('#1095', '#1084', '#1089')'
  end
  object Label1: TLabel
    Left = 16
    Top = 3
    Width = 310
    Height = 13
    Caption = #1055#1088#1086#1090#1086#1082#1086#1083' '#1086#1073#1088#1072#1073#1086#1090#1082#1080' '#1075#1088#1072#1074#1080#1084#1077#1090#1088#1080#1095#1077#1089#1082#1080#1093' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1081
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSerial: TLabel
    Left = 192
    Top = 41
    Width = 18
    Height = 13
    Caption = '402'
  end
  object lblDate: TLabel
    Left = 192
    Top = 60
    Width = 47
    Height = 13
    Caption = '12 '#1089#1077#1085' 12'
  end
  object lblDlina: TLabel
    Left = 192
    Top = 79
    Width = 38
    Height = 13
    Caption = '4:00:22'
  end
  object lblCCaption: TLabel
    Left = 272
    Top = 41
    Width = 15
    Height = 13
    Caption = #1057'='
  end
  object lblC: TLabel
    Left = 328
    Top = 41
    Width = 64
    Height = 13
    Caption = '1,000270019'
  end
  object lblOperatorCaption: TLabel
    Left = 272
    Top = 60
    Width = 44
    Height = 13
    Caption = 'Operator'
  end
  object lblOperator: TLabel
    Left = 328
    Top = 60
    Width = 63
    Height = 13
    Caption = #1048#1074#1072#1085#1086#1074' '#1048'.'#1054'.'
  end
  object lblPunktCaption: TLabel
    Left = 448
    Top = 41
    Width = 40
    Height = 13
    Caption = '0-'#1087#1091#1085#1082#1090
  end
  object lblPunkt: TLabel
    Left = 536
    Top = 41
    Width = 32
    Height = 13
    Caption = '-0,156'
  end
  object lblDriftCaption: TLabel
    Left = 448
    Top = 60
    Width = 70
    Height = 13
    Caption = #1050#1086#1101#1092#1092' '#1076#1088#1080#1092#1090
  end
  object lblDrift: TLabel
    Left = 536
    Top = 60
    Width = 28
    Height = 13
    Caption = '0,000'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 112
    Width = 893
    Height = 295
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnColEnter = DBGrid1ColEnter
    OnColExit = DBGrid1ColExit
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'LINE'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1092#1080#1083#1100
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATION'
        Title.Alignment = taCenter
        Title.Caption = #1055#1080#1082#1077#1090
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAV'
        Title.Alignment = taCenter
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD'
        Title.Alignment = taCenter
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TILTX'
        Title.Alignment = taCenter
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TILTY'
        Title.Alignment = taCenter
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEMP'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIDE'
        Title.Alignment = taCenter
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DUR'
        Title.Alignment = taCenter
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REJ'
        Title.Alignment = taCenter
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIME'
        Title.Alignment = taCenter
        Title.Caption = 'Time'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIME_DUR'
        Title.Alignment = taCenter
        Title.Caption = #1089#1077#1082
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PUNKT'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1086#1087#1086#1088#1085#1099#1077' '#1087#1091#1085#1082#1090#1099
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'G'
        Title.Alignment = taCenter
        Title.Caption = 'G'#1085#1072#1073#1083
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BRACK_CALC'
        Title.Caption = #1041#1088#1072#1082
        Width = 28
        Visible = True
      end>
  end
  object btnProcess: TButton
    Left = 16
    Top = 413
    Width = 145
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1086#1073#1088#1072#1073#1086#1090#1082#1091
    TabOrder = 1
    OnClick = btnProcessClick
  end
  object btnSave: TButton
    Left = 184
    Top = 413
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Enabled = False
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object chbPunkt: TDBCheckBox
    Left = 432
    Top = 18
    Width = 16
    Height = 16
    DataField = 'PUNKT'
    DataSource = DataSource1
    TabOrder = 3
    Visible = False
    OnClick = chbPunktClick
    OnMouseUp = chbPunktMouseUp
  end
  object ProgressBar1: TProgressBar
    Left = 693
    Top = 413
    Width = 216
    Height = 16
    Anchors = [akRight, akBottom]
    TabOrder = 4
  end
  object linkC: TLinkLabel
    Left = 322
    Top = 41
    Width = 4
    Height = 4
    TabOrder = 5
    Visible = False
  end
  object chbBrack: TDBCheckBox
    Left = 502
    Top = 18
    Width = 16
    Height = 16
    DataField = 'BRACK_CALC'
    DataSource = DataSource1
    TabOrder = 6
    Visible = False
    OnClick = chbBrackClick
    OnMouseUp = chbBrackMouseUp
  end
  object chbSaveAsOP: TCheckBox
    Left = 448
    Top = 413
    Width = 193
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' '#1086#1087#1086#1088#1085#1091#1102' '#1089#1077#1090#1100
    TabOrder = 7
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FormDatabase.ZTableProtocol
    Enabled = False
    Left = 136
    Top = 48
  end
end
