object OporpunktListFrame: TOporpunktListFrame
  Left = 0
  Top = 0
  Width = 736
  Height = 427
  TabOrder = 0
  object dbGridPloshad: TDBGrid
    Left = 0
    Top = 0
    Width = 736
    Height = 427
    Align = alClient
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REGION'
        Title.Caption = #1056#1072#1081#1086#1085
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'START_DATE'
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMMENT'
        Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        Width = 200
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 736
    Height = 427
    Align = alClient
    DataSource = dsOporPunkt
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NO_PR'
        Title.Caption = #8470' '#1087#1088
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_PK'
        Title.Caption = #8470' '#1087#1082
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAV'
        Title.Caption = 'G '#1085#1072#1073#1083
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_GRAV'
        Title.Caption = #8470' '#1075#1088#1072#1074
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OP_DATE'
        Title.Caption = #1044#1072#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTKL2'
        Title.Caption = #1086#1090#1082#1083'^2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KRATN'
        Title.Caption = #1050#1088#1072#1090#1085
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GSREDN'
        Title.Caption = 'G'#1089#1088#1077#1076#1085
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKP'
        Title.Caption = #1057#1050#1055' '#1087#1091#1085#1082#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMMENT'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Visible = True
      end>
  end
  object dbGridOporPunkt: TDBGrid
    Left = 0
    Top = 0
    Width = 736
    Height = 427
    Align = alClient
    DataSource = dsOporPunkt
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbGridOporPunktDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NO_PR'
        Title.Caption = #8470' '#1087#1088
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_PK'
        Title.Caption = #8470' '#1087#1082
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAV'
        Title.Caption = 'G '#1085#1072#1073#1083
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NO_GRAV'
        Title.Caption = #8470' '#1075#1088#1072#1074
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OP_DATE'
        Title.Caption = #1044#1072#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTKL2'
        Title.Caption = #1086#1090#1082#1083'^2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KRATN'
        Title.Caption = #1050#1088#1072#1090#1085
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GSREDN'
        Title.Caption = 'G'#1089#1088#1077#1076#1085
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKP'
        Title.Caption = #1057#1050#1056' '#1087#1091#1085#1082#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMMENT'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 100
        Visible = True
      end>
  end
  object tblOporPunkt: TZTable
    Connection = FormDatabase.ZConnection1
    BeforeOpen = tblOporPunktBeforeOpen
    ReadOnly = True
    TableName = 'VIEW_OPOR_PUNKT'
    Left = 376
    Top = 88
    object tblOporPunktID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object tblOporPunktNO_PR: TIntegerField
      FieldName = 'NO_PR'
      Required = True
    end
    object tblOporPunktNO_PK: TIntegerField
      FieldName = 'NO_PK'
      Required = True
    end
    object tblOporPunktGRAV: TFloatField
      FieldName = 'GRAV'
    end
    object tblOporPunktNO_GRAV: TIntegerField
      FieldName = 'NO_GRAV'
      Required = True
    end
    object tblOporPunktOP_DATE: TDateField
      FieldName = 'OP_DATE'
    end
    object tblOporPunktCOMMENT: TWideStringField
      FieldName = 'COMMENT'
      Size = 1024
    end
    object tblOporPunktFK_PLOSHAD_ID: TIntegerField
      FieldName = 'FK_PLOSHAD_ID'
    end
    object tblOporPunktOTKL2: TFloatField
      FieldName = 'OTKL2'
    end
    object tblOporPunktKRATN: TIntegerField
      FieldName = 'KRATN'
    end
    object tblOporPunktGSREDN: TFloatField
      FieldName = 'GSREDN'
    end
    object tblOporPunktSKP: TFloatField
      FieldName = 'SKP'
    end
  end
  object dsOporPunkt: TDataSource
    AutoEdit = False
    DataSet = tblOporPunkt
    Left = 304
    Top = 88
  end
  object ActionList1: TActionList
    Left = 560
    Top = 72
    object actSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
    end
    object actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actEditExecute
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object actAdd: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnExecute = actAddExecute
      OnUpdate = actAddUpdate
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 536
    Top = 160
    object N2: TMenuItem
      Action = actAdd
    end
    object N3: TMenuItem
      Action = actEdit
    end
    object N4: TMenuItem
      Action = actDelete
    end
  end
  object dsControl: TDataSource
    AutoEdit = False
    DataSet = queryControl
    Left = 320
    Top = 208
  end
  object queryControl: TZQuery
    Connection = FormDatabase.ZConnection1
    SQL.Strings = (
      'select *, 0 as OTKL2, 0 as KRATN from opor_punkt')
    Params = <>
    Left = 456
    Top = 232
    object queryControlID: TIntegerField
      FieldName = 'ID'
    end
    object queryControlNO_PR: TIntegerField
      FieldName = 'NO_PR'
    end
    object queryControlNO_PK: TIntegerField
      FieldName = 'NO_PK'
    end
    object queryControlGRAV: TIntegerField
      FieldName = 'GRAV'
    end
    object queryControlNO_GRAV: TIntegerField
      FieldName = 'NO_GRAV'
    end
    object queryControlOP_DATE: TDateTimeField
      FieldName = 'OP_DATE'
    end
    object queryControlCOMMENT: TStringField
      FieldName = 'COMMENT'
    end
    object queryControlOTKL2: TFloatField
      FieldName = 'OTKL2'
    end
    object queryControlKRATN: TIntegerField
      FieldName = 'KRATN'
    end
  end
end
