object ControlListFrame: TControlListFrame
  Left = 0
  Top = 0
  Width = 759
  Height = 372
  TabOrder = 0
  object dbGridReis: TDBGrid
    Left = 0
    Top = 0
    Width = 759
    Height = 372
    Align = alClient
    DataSource = dsControl
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
        Title.Caption = #1057#1050#1055
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMMENT'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Visible = True
      end>
  end
  object tblControl: TZTable
    Connection = FormDatabase.ZConnection1
    SortedFields = 'NO_PR,NO_PK,NO_GRAV,OP_DATE'
    TableName = 'CONTROL'
    IndexFieldNames = 'NO_PR Asc,NO_PK Asc,NO_GRAV Asc,OP_DATE Asc'
    Left = 368
    Top = 128
    object tblControlID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object tblControlNO_PR: TFloatField
      FieldName = 'NO_PR'
    end
    object tblControlNO_PK: TFloatField
      FieldName = 'NO_PK'
    end
    object tblControlNO_GRAV: TIntegerField
      FieldName = 'NO_GRAV'
      Required = True
    end
    object tblControlGRAV: TFloatField
      FieldName = 'GRAV'
    end
    object tblControlOP_DATE: TDateField
      FieldName = 'OP_DATE'
    end
    object tblControlOTKL2: TFloatField
      FieldName = 'OTKL2'
    end
    object tblControlKRATN: TIntegerField
      FieldName = 'KRATN'
    end
    object tblControlGSREDN: TFloatField
      FieldName = 'GSREDN'
    end
    object tblControlSKP: TFloatField
      FieldName = 'SKP'
    end
    object tblControlCOMMENT: TWideStringField
      FieldName = 'COMMENT'
      Size = 1024
    end
    object tblControlFK_PLOSHAD_ID: TIntegerField
      FieldName = 'FK_PLOSHAD_ID'
      Required = True
    end
  end
  object dsControl: TDataSource
    AutoEdit = False
    DataSet = tblControl
    Left = 288
    Top = 144
  end
end
