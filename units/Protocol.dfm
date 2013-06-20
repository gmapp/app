object FormProtocol: TFormProtocol
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1090#1086#1082#1086#1083' '#1086#1073#1088#1072#1073#1086#1090#1082#1080' '#1075#1088#1072#1074#1080#1084#1077#1090#1088#1080#1095#1077#1089#1082#1080#1093' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1081
  ClientHeight = 405
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline ProtocolFrame1: TProtocolFrame
    Left = 0
    Top = 0
    Width = 805
    Height = 405
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 73
    ExplicitTop = 17
    inherited DBGrid1: TDBGrid
      Width = 797
      Height = 290
    end
    inherited GridPanel1: TGridPanel
      ControlCollection = <
        item
          Column = 0
          Control = ProtocolFrame1.lbl0punktCaption
          Row = 0
        end
        item
          Column = 0
          Control = ProtocolFrame1.lblCoefCaption
          Row = 1
        end
        item
          Column = 2
          Control = ProtocolFrame1.lbl0punkt
          Row = 0
        end
        item
          Column = 2
          Control = ProtocolFrame1.lblCoef
          Row = 1
        end>
    end
  end
end
