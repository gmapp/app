object PloshadListFrame: TPloshadListFrame
  Left = 0
  Top = 0
  Width = 710
  Height = 438
  TabOrder = 0
  object dbGridPloshad: TDBGrid
    Left = 0
    Top = 0
    Width = 710
    Height = 438
    Align = alClient
    DataSource = dsPloshad
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbGridPloshadDblClick
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
  object dsPloshad: TDataSource
    AutoEdit = False
    DataSet = tblPloshad
    Left = 288
    Top = 144
  end
  object tblPloshad: TZTable
    Connection = FormDatabase.ZConnection1
    TableName = 'PLOSHAD'
    Left = 408
    Top = 128
    object tblPloshadNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object tblPloshadREGION: TWideStringField
      FieldName = 'REGION'
      Size = 255
    end
    object tblPloshadSTART_DATE: TDateField
      FieldName = 'START_DATE'
    end
    object tblPloshadCOMMENT: TWideStringField
      FieldName = 'COMMENT'
      Size = 1024
    end
    object tblPloshadID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 536
    Top = 160
    object N1: TMenuItem
      Action = actSelect
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
  object ActionList1: TActionList
    Left = 560
    Top = 72
    object actSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      OnExecute = actSelectExecute
      OnUpdate = actSelectUpdate
    end
    object actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actEditExecute
      OnUpdate = actSelectUpdate
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnUpdate = actSelectUpdate
    end
    object actAdd: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnExecute = actAddExecute
      OnUpdate = actAddUpdate
    end
  end
end
