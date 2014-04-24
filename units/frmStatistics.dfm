object FormStatistics: TFormStatistics
  Left = 0
  Top = 0
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
  ClientHeight = 396
  ClientWidth = 828
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    828
    396)
  PixelsPerInch = 96
  TextHeight = 13
  object btnPrint: TButton
    Left = 104
    Top = 368
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 0
  end
  object btnClose: TButton
    Left = 200
    Top = 367
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 831
    Height = 361
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    ExplicitWidth = 763
    DesignSize = (
      831
      361)
    object Label4: TLabel
      Left = 14
      Top = 12
      Width = 100
      Height = 13
      Anchors = []
      Caption = #1054#1073#1097#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
    end
    object GridPanel1: TGridPanel
      Left = 131
      Top = 12
      Width = 676
      Height = 45
      Anchors = [akLeft, akTop, akRight]
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 140.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 140.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 140.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 140.000000000000000000
        end
        item
          SizeStyle = ssAuto
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = Label5
          Row = 0
        end
        item
          Column = 1
          Control = Label1
          Row = 0
        end
        item
          Column = 2
          Control = Label2
          Row = 0
        end
        item
          Column = 3
          Control = Label6
          Row = 0
        end
        item
          Column = 4
          Control = Label7
          Row = 0
        end
        item
          Column = 3
          Control = lblEnd
          Row = 1
        end
        item
          Column = 4
          Control = lblComment
          Row = 1
        end
        item
          Column = 0
          Control = DBText1
          Row = 1
        end
        item
          Column = 1
          Control = DBText2
          Row = 1
        end
        item
          Column = 2
          Control = DBText3
          Row = 1
        end>
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 20.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 20.000000000000000000
        end>
      TabOrder = 0
      DesignSize = (
        676
        45)
      object Label5: TLabel
        Left = 22
        Top = 4
        Width = 97
        Height = 13
        Anchors = []
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1083#1086#1097#1072#1076#1080
        ExplicitLeft = 68
        ExplicitTop = 19
      end
      object Label1: TLabel
        Left = 196
        Top = 4
        Width = 30
        Height = 13
        Anchors = []
        Caption = #1056#1072#1081#1086#1085
        ExplicitLeft = 236
        ExplicitTop = 19
      end
      object Label2: TLabel
        Left = 302
        Top = 4
        Width = 98
        Height = 13
        Anchors = []
        Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1073#1086#1090
        ExplicitLeft = 249
        ExplicitTop = 19
      end
      object Label6: TLabel
        Left = 433
        Top = 4
        Width = 116
        Height = 13
        Anchors = []
        Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1088#1072#1073#1086#1090
        ExplicitLeft = 364
        ExplicitTop = 19
      end
      object Label7: TLabel
        Left = 561
        Top = 4
        Width = 65
        Height = 13
        Anchors = []
        Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        ExplicitLeft = 563
      end
      object lblEnd: TLabel
        Left = 475
        Top = 24
        Width = 31
        Height = 13
        Anchors = []
        Caption = 'Label1'
        ExplicitLeft = 458
        ExplicitTop = 23
      end
      object lblComment: TLabel
        Left = 578
        Top = 24
        Width = 31
        Height = 13
        Anchors = []
        Caption = 'Label1'
        ExplicitLeft = 561
        ExplicitTop = 23
      end
      object DBText1: TDBText
        Left = 38
        Top = 22
        Width = 65
        Height = 17
        Anchors = []
        DataField = 'NAME'
        DataSource = dsPloshad
      end
      object DBText2: TDBText
        Left = 178
        Top = 22
        Width = 65
        Height = 17
        Anchors = []
        DataField = 'REGION'
        DataSource = dsPloshad
      end
      object DBText3: TDBText
        Left = 318
        Top = 22
        Width = 65
        Height = 17
        Anchors = []
        DataField = 'START_DATE'
        DataSource = dsPloshad
      end
    end
  end
  object ZQuery1: TZQuery
    Connection = FormDatabase.ZConnection1
    Params = <>
    Left = 416
    Top = 192
  end
  object tblPloshad: TZTable
    Connection = FormDatabase.ZConnection1
    SortedFields = 'ID'
    TableName = 'PLOSHAD'
    IndexFieldNames = 'ID Asc'
    Left = 328
    Top = 208
    object tblPloshadID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
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
  end
  object dsPloshad: TDataSource
    AutoEdit = False
    DataSet = tblPloshad
    Left = 288
    Top = 144
  end
end
