object CatalogListFrame: TCatalogListFrame
  Left = 0
  Top = 0
  Width = 759
  Height = 372
  TabOrder = 0
  object dbGridCatalog: TDBGrid
    Left = 0
    Top = 0
    Width = 759
    Height = 372
    Align = alClient
    DataSource = dsCatalog
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
        FieldName = 'X'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Y'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'H'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRAV'
        Title.Caption = 'G'#1085#1072#1073#1083
        Width = 127
        Visible = True
      end>
  end
  object tblCatalog: TZTable
    Connection = FormDatabase.ZConnection1
    SortedFields = 'ID'
    BeforeOpen = tblCatalogBeforeOpen
    TableName = 'VIEW_CATALOG'
    IndexFieldNames = 'ID Asc'
    Left = 368
    Top = 128
    object tblCatalogID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object tblCatalogNO_PR: TIntegerField
      FieldName = 'NO_PR'
    end
    object tblCatalogNO_PK: TIntegerField
      FieldName = 'NO_PK'
    end
    object tblCatalogX: TFloatField
      FieldName = 'X'
    end
    object tblCatalogY: TFloatField
      FieldName = 'Y'
    end
    object tblCatalogH: TFloatField
      FieldName = 'H'
    end
    object tblCatalogGRAV: TFloatField
      FieldName = 'GRAV'
    end
    object tblCatalogFK_PLOSHAD_ID: TIntegerField
      FieldName = 'FK_PLOSHAD_ID'
      Required = True
    end
  end
  object dsCatalog: TDataSource
    AutoEdit = False
    DataSet = tblCatalog
    Left = 288
    Top = 144
  end
end
