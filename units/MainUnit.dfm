object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1075#1088#1072#1074#1080#1084#1077#1090#1088#1072' CG-5'
  ClientHeight = 443
  ClientWidth = 929
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 32
    Width = 929
    Height = 411
    Align = alBottom
    TabOrder = 0
    inline OporpunktFrame1: TOporpunktListFrame
      Left = 1
      Top = 1
      Width = 927
      Height = 409
      Align = alClient
      TabOrder = 0
      Visible = False
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 927
      ExplicitHeight = 409
      inherited dbGridPloshad: TDBGrid
        Width = 927
        Height = 409
      end
      inherited DBGrid1: TDBGrid
        Width = 927
        Height = 409
      end
      inherited dbGridOporPunkt: TDBGrid
        Width = 927
        Height = 409
      end
    end
    inline ProtocolFrame1: TProtocolListFrame
      Left = 1
      Top = 1
      Width = 927
      Height = 409
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 927
      ExplicitHeight = 409
      inherited DBGrid1: TDBGrid
        Width = 892
        Height = 250
      end
      inherited btnProcess: TButton
        Top = 368
        ExplicitTop = 368
      end
      inherited btnSave: TButton
        Top = 368
        ExplicitTop = 368
      end
      inherited ProgressBar1: TProgressBar
        Left = 692
        Top = 368
        ExplicitLeft = 692
        ExplicitTop = 368
      end
    end
    inline ReisFrame1: TReisListFrame
      Left = 1
      Top = 1
      Width = 927
      Height = 409
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 927
      ExplicitHeight = 409
      inherited dbGridReis: TDBGrid
        Width = 927
        Height = 409
      end
    end
  end
  object FlowPanel1: TFlowPanel
    Left = 1
    Top = 3
    Width = 808
    Height = 27
    BevelOuter = bvNone
    TabOrder = 1
    object linkPloshad: TLinkLabel
      Left = 0
      Top = 0
      Width = 103
      Height = 17
      Caption = '<a href="">'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1083#1086#1097#1072#1076#1100'</a>'
      TabOrder = 0
      UseVisualStyle = True
      OnLinkClick = linkPloshadLinkClick
    end
    object linkReis: TLinkLabel
      Left = 103
      Top = 0
      Width = 74
      Height = 17
      Caption = '<a href="">'#1042#1099#1073#1088#1080#1090#1077' '#1088#1077#1081#1089'</a>'
      TabOrder = 1
      UseVisualStyle = True
      OnLinkClick = linkReisLinkClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 432
    object p1: TMenuItem
      Caption = #1055#1083#1086#1097#1072#1076#1100
      object N1: TMenuItem
        Action = actPlohadAdd
      end
      object N2: TMenuItem
        Action = actPloshadOpen
      end
      object N3: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N5: TMenuItem
        Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
      end
      object N6: TMenuItem
        Caption = #1055#1077#1095#1072#1090#1100
      end
      object N7: TMenuItem
        Caption = #1069#1082#1089#1087#1086#1088#1090
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N9Click
      end
    end
    object p2: TMenuItem
      Caption = #1056#1077#1081#1089#1099
      object N10: TMenuItem
        Action = actReisEnter
      end
      object N11: TMenuItem
        Action = actReisEdit
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object N13: TMenuItem
        Action = actGravimeter
      end
      object N14: TMenuItem
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #1054#1087#1086#1088#1085#1099#1077
        object N16: TMenuItem
          Action = actOporPunktAdd
        end
        object N17: TMenuItem
          Action = actOporPunktTable
        end
      end
    end
    object p3: TMenuItem
      Caption = #1058#1086#1087#1086#1075#1088#1072#1092#1080#1103
      object N18: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090
      end
    end
    object p4: TMenuItem
      Caption = #1050#1072#1090#1072#1083#1086#1075
    end
    object p5: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
    end
  end
  object ActionList1: TActionList
    Left = 568
    Top = 8
    object actOporPunktTable: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      OnExecute = actOporPunktTableExecute
    end
    object actOporPunktAdd: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100
    end
    object actReisEnter: TAction
      Caption = #1042#1074#1086#1076
      OnExecute = actReisEnterExecute
    end
    object actReisEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      OnExecute = actReisEditExecute
    end
    object actPlohadAdd: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnExecute = actPlohadAddExecute
    end
    object actPloshadOpen: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnExecute = actPloshadOpenExecute
    end
    object actGravimeter: TAction
      Caption = #1043#1088#1072#1074#1080#1084#1077#1090#1088#1099
      OnExecute = actGravimeterExecute
    end
  end
end
