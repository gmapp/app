object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1075#1088#1072#1074#1080#1084#1077#1090#1088#1072' CG-5'
  ClientHeight = 421
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 32
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Test database'
    TabOrder = 0
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 432
    Top = 48
    object p1: TMenuItem
      Caption = #1055#1083#1086#1097#1072#1076#1100
      object N1: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        OnClick = N1Click
      end
      object N2: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N2Click
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
      end
    end
    object p2: TMenuItem
      Caption = #1056#1077#1081#1089#1099
      object N10: TMenuItem
        Caption = #1042#1074#1086#1076
      end
      object N11: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object N13: TMenuItem
        Caption = #1043#1088#1072#1074#1080#1084#1077#1090#1088#1099
      end
      object N14: TMenuItem
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100
      end
      object N15: TMenuItem
        Caption = #1054#1087#1086#1088#1085#1099#1077
        object N16: TMenuItem
          Caption = #1057#1086#1079#1076#1072#1090#1100
        end
        object N17: TMenuItem
          Caption = #1055#1088#1086#1089#1084#1086#1090#1088
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
  object OpenDialog1: TOpenDialog
    Left = 392
    Top = 160
  end
end