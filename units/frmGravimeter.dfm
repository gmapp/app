object FormGravimeterList: TFormGravimeterList
  Left = 0
  Top = 0
  Caption = #1043#1088#1072#1074#1080#1084#1077#1090#1077#1088
  ClientHeight = 427
  ClientWidth = 780
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
  inline GravimeterFrame1: TGravimeterFrame
    Left = 0
    Top = 0
    Width = 780
    Height = 427
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 12
    ExplicitTop = -3
    inherited dbGridGrav: TDBGrid
      Width = 780
      Height = 427
    end
  end
end
