object FormProtocol: TFormProtocol
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1090#1086#1082#1086#1083' '#1086#1073#1088#1072#1073#1086#1090#1082#1080' '#1075#1088#1072#1074#1080#1084#1077#1090#1088#1080#1095#1077#1089#1082#1080#1093' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1081
  ClientHeight = 446
  ClientWidth = 828
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
  inline ProtocolFrame1: TProtocolListFrame
    Left = 0
    Top = 0
    Width = 828
    Height = 446
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 828
    ExplicitHeight = 446
    inherited DBGrid1: TDBGrid
      Width = 793
      Height = 287
    end
    inherited btnProcess: TButton
      Top = 405
      ExplicitTop = 405
    end
    inherited btnSave: TButton
      Top = 405
      ExplicitTop = 405
    end
  end
end
