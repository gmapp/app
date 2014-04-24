object ReisListFrame: TReisListFrame
  Left = 0
  Top = 0
  Width = 759
  Height = 468
  TabOrder = 0
  object dbGridReis: TDBGrid
    Left = 0
    Top = 0
    Width = 759
    Height = 468
    Align = alClient
    DataSource = dsReis
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbGridReisDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'OPERATOR'
        Title.Caption = #1054#1087#1077#1088#1072#1090#1086#1088
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMER_PRIBORA'
        Title.Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_IZMERENIA'
        Title.Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLOSHAD_NAME'
        Title.Caption = #1055#1083#1086#1097#1072#1076#1100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FILE'
        Title.Caption = #1060#1072#1081#1083
        Width = 246
        Visible = True
      end>
  end
  object tblReis: TZTable
    Connection = FormDatabase.ZConnection1
    TableName = 'REIS'
    Left = 408
    Top = 144
    object tblReisID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object tblReisOPERATOR: TWideStringField
      FieldName = 'OPERATOR'
      Required = True
      Size = 1024
    end
    object tblReisNOMER_PRIBORA: TIntegerField
      FieldName = 'NOMER_PRIBORA'
      Required = True
    end
    object tblReisDATE_IZMERENIA: TDateField
      FieldName = 'DATE_IZMERENIA'
    end
    object tblReisFILE: TWideStringField
      FieldName = 'FILE'
      Size = 2048
    end
    object tblReisFK_PLOSHAD_ID: TIntegerField
      FieldName = 'FK_PLOSHAD_ID'
    end
    object tblReisPLOSHAD_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'PLOSHAD_NAME'
      LookupDataSet = tblPloshad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'FK_PLOSHAD_ID'
      Lookup = True
    end
  end
  object dsReis: TDataSource
    AutoEdit = False
    DataSet = tblReis
    Left = 288
    Top = 144
  end
  object ActionList1: TActionList
    Left = 560
    Top = 72
    object actSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      OnExecute = actSelectExecute
    end
    object actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actEditExecute
      OnUpdate = actEditUpdate
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
      OnUpdate = actDeleteUpdate
    end
    object actAdd: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnExecute = actAddExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 536
    Top = 160
    object N1: TMenuItem
      Action = actSelect
    end
    object N5: TMenuItem
      Caption = '-'
    end
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
  object tblPloshad: TZTable
    Connection = FormDatabase.ZConnection1
    TableName = 'PLOSHAD'
    Left = 408
    Top = 88
  end
end
