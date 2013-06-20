object ProtocolFrame: TProtocolFrame
  Left = 0
  Top = 0
  Width = 633
  Height = 426
  TabOrder = 0
  DesignSize = (
    633
    426)
  object DBGrid1: TDBGrid
    Left = 5
    Top = 144
    Width = 625
    Height = 279
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LINE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ALT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAV'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TILTX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TILTY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEMP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIDE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DUR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STR_TIME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEC_TIME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TERRAIN'
        Visible = True
      end>
  end
  object GridPanel1: TGridPanel
    Left = 384
    Top = 8
    Width = 185
    Height = 27
    ColumnCollection = <
      item
        Value = 22.540174795601920000
      end
      item
        Value = 37.003101212292080000
      end
      item
        Value = 40.456723992106010000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = lbl0punktCaption
        Row = 0
      end
      item
        Column = 0
        Control = lblCoefCaption
        Row = 1
      end
      item
        Column = 2
        Control = lbl0punkt
        Row = 0
      end
      item
        Column = 2
        Control = lblCoef
        Row = 1
      end>
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    TabOrder = 1
    DesignSize = (
      185
      27)
    object lbl0punktCaption: TLabel
      Left = 1
      Top = 1
      Width = 40
      Height = 12
      Anchors = []
      Caption = '0-'#1087#1091#1085#1082#1090
    end
    object lblCoefCaption: TLabel
      Left = 4
      Top = 13
      Width = 34
      Height = 13
      Anchors = []
      Caption = #1050#1086#1101#1092#1092
      ExplicitLeft = 33
    end
    object lbl0punkt: TLabel
      Left = 145
      Top = 1
      Width = 3
      Height = 12
      Anchors = []
    end
    object lblCoef: TLabel
      Left = 145
      Top = 13
      Width = 3
      Height = 13
      Anchors = []
      ExplicitLeft = 131
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 3
    Width = 364
    Height = 103
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 6
      Width = 124
      Height = 13
      Caption = 'Scintrex AUTOGRAV CG-5'
    end
    object lblSerNumCaption: TLabel
      Left = 16
      Top = 25
      Width = 32
      Height = 13
      Caption = 'Ser No'
    end
    object Label4: TLabel
      Left = 16
      Top = 44
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object Label5: TLabel
      Left = 16
      Top = 56
      Width = 106
      Height = 13
      Caption = #1044#1083#1080#1085#1072' '#1088#1077#1081#1089#1072' ('#1095', '#1084', '#1089')'
    end
    object lblSerNum: TLabel
      Left = 72
      Top = 25
      Width = 50
      Height = 13
    end
  end
  object btnProcess: TButton
    Left = 21
    Top = 112
    Width = 139
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1086#1073#1088#1072#1073#1086#1090#1082#1091
    TabOrder = 3
  end
  object btnSave: TButton
    Left = 166
    Top = 112
    Width = 83
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FormDatabase.ZTableProtocol
    Enabled = False
    Left = 496
    Top = 48
  end
end
