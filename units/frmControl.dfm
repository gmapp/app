object FormControl: TFormControl
  Left = 0
  Top = 0
  Caption = #1050#1086#1085#1090#1088#1086#1083#1100
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
  inline OporpunktFrame1: TOporpunktListFrame
    Left = 0
    Top = 0
    Width = 720
    Height = 428
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 720
    ExplicitHeight = 428
    inherited dbGridPloshad: TDBGrid
      Width = 720
      Height = 428
    end
    inherited DBGrid1: TDBGrid
      Width = 720
      Height = 428
    end
    inherited dbGridOporPunkt: TDBGrid
      Width = 720
      Height = 428
    end
  end
end
