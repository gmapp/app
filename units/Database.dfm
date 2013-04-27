object FormDatabase: TFormDatabase
  Left = 0
  Top = 0
  Caption = 'FormDatabase'
  ClientHeight = 224
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    UTF8StringsAsWideField = True
    Catalog = ''
    HostName = ''
    Port = 0
    Database = 'C:\workspace\gmapp\trunk\gmdb\GMDB.FDB'
    User = 'GM'
    Password = ''
    Protocol = 'firebirdd-2.5'
    LibraryLocation = 'C:\workspace\gmapp\trunk\fbclient.dll'
    Left = 80
    Top = 24
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 152
    Top = 48
  end
end
