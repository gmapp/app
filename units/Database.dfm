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
    ClientCodepage = 'WIN1251'
    Catalog = ''
    Properties.Strings = (
      'codepage=WIN1251')
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
  object ZTableProtocol: TZTable
    Connection = ZConnection1
    TableName = 'PROTOCOL'
    Left = 312
    Top = 96
    object ZTableProtocolID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object ZTableProtocolLINE: TFloatField
      FieldName = 'LINE'
    end
    object ZTableProtocolSTATION: TFloatField
      FieldName = 'STATION'
    end
    object ZTableProtocolALT: TFloatField
      FieldName = 'ALT'
    end
    object ZTableProtocolGRAV: TFloatField
      FieldName = 'GRAV'
    end
    object ZTableProtocolSD: TFloatField
      FieldName = 'SD'
    end
    object ZTableProtocolTILTX: TFloatField
      FieldName = 'TILTX'
    end
    object ZTableProtocolTILTY: TFloatField
      FieldName = 'TILTY'
    end
    object ZTableProtocolTEMP: TFloatField
      FieldName = 'TEMP'
    end
    object ZTableProtocolTIDE: TFloatField
      FieldName = 'TIDE'
    end
    object ZTableProtocolDUR: TFloatField
      FieldName = 'DUR'
    end
    object ZTableProtocolREJ: TFloatField
      FieldName = 'REJ'
    end
    object ZTableProtocolSTR_TIME: TWideStringField
      FieldName = 'STR_TIME'
      Size = 30
    end
    object ZTableProtocolDEC_TIME: TFloatField
      FieldName = 'DEC_TIME'
    end
    object ZTableProtocolTERRAIN: TFloatField
      FieldName = 'TERRAIN'
    end
  end
end
