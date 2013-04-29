object ProtocolFrame: TProtocolFrame
  Left = 0
  Top = 0
  Width = 748
  Height = 476
  TabOrder = 0
  DesignSize = (
    748
    476)
  object Label2: TLabel
    Left = 16
    Top = 22
    Width = 124
    Height = 13
    Caption = 'Scintrex AUTOGRAV CG-5'
  end
  object Label3: TLabel
    Left = 16
    Top = 41
    Width = 32
    Height = 13
    Caption = 'Ser No'
  end
  object Label4: TLabel
    Left = 16
    Top = 60
    Width = 23
    Height = 13
    Caption = 'Date'
  end
  object Label5: TLabel
    Left = 16
    Top = 79
    Width = 106
    Height = 13
    Caption = #1044#1083#1080#1085#1072' '#1088#1077#1081#1089#1072' ('#1095', '#1084', '#1089')'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 112
    Width = 713
    Height = 345
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
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FormDatabase.ZTableProtocol
    Enabled = False
    Left = 496
    Top = 48
  end
end
