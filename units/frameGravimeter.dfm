object GravimeterFrame: TGravimeterFrame
  Left = 0
  Top = 0
  Width = 768
  Height = 430
  TabOrder = 0
  object dbGridGrav: TDBGrid
    Left = 0
    Top = 0
    Width = 768
    Height = 430
    Align = alClient
    DataSource = dsGrav
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbGridGravDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM'
        Title.Caption = #1053#1086#1084#1077#1088' '#1087#1088#1080#1073#1086#1088#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'C'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMMENT'
        Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        Visible = True
      end>
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
  object dsGrav: TDataSource
    AutoEdit = False
    DataSet = tblGrav
    Left = 288
    Top = 144
  end
  object tblGrav: TZTable
    Connection = FormDatabase.ZConnection1
    TableName = 'GRAVIMETER'
    Left = 408
    Top = 128
    object tblGravNUM: TIntegerField
      FieldName = 'NUM'
      Required = True
    end
    object tblGravC: TFloatField
      FieldName = 'C'
      Required = True
    end
    object tblGravCOMMENT: TWideStringField
      FieldName = 'COMMENT'
      Size = 1024
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
end
