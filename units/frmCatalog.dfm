object FormCatalog: TFormCatalog
  Left = 0
  Top = 0
  Caption = #1050#1072#1090#1072#1083#1086#1075
  ClientHeight = 428
  ClientWidth = 720
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
  inline CatalogListFrame1: TCatalogListFrame
    Left = 0
    Top = 0
    Width = 720
    Height = 428
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -39
    ExplicitTop = 56
    inherited dbGridCatalog: TDBGrid
      Width = 720
      Height = 428
    end
  end
end
