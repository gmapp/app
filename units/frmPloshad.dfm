object FormPloshadList: TFormPloshadList
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1083#1086#1097#1072#1076#1100
  ClientHeight = 292
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  inline PloshadFrame1: TPloshadListFrame
    Left = 0
    Top = 0
    Width = 566
    Height = 292
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 566
    ExplicitHeight = 292
    inherited dbGridPloshad: TDBGrid
      Width = 566
      Height = 292
    end
  end
end
