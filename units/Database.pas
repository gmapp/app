unit Database;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ZAbstractConnection, ZConnection,ZAbstractDataset, ZDataset,
  Data.DB, ZAbstractRODataset, ZAbstractTable;

type
  TFormDatabase = class(TForm)
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZTableProtocol: TZTable;
    ZTableProtocolID: TIntegerField;
    ZTableProtocolLINE: TFloatField;
    ZTableProtocolSTATION: TFloatField;
    ZTableProtocolALT: TFloatField;
    ZTableProtocolGRAV: TFloatField;
    ZTableProtocolSD: TFloatField;
    ZTableProtocolTILTX: TFloatField;
    ZTableProtocolTILTY: TFloatField;
    ZTableProtocolTEMP: TFloatField;
    ZTableProtocolTIDE: TFloatField;
    ZTableProtocolDUR: TFloatField;
    ZTableProtocolREJ: TFloatField;
    ZTableProtocolSTR_TIME: TWideStringField;
    ZTableProtocolDEC_TIME: TFloatField;
    ZTableProtocolTERRAIN: TFloatField;
    procedure FormCreate(Sender: TObject);
  private
    procedure initDatabase;
  public
    procedure test;
    function insertProtocolRecord(d: TDate; list:TStringList): boolean;
  end;

var
  FormDatabase: TFormDatabase;

implementation

{$R *.dfm}

procedure TFormDatabase.FormCreate(Sender: TObject);
begin
  initDatabase;
end;

procedure TFormDatabase.initDatabase;
var
  path: String;
begin
  //path:=ExtractFilePath(Application.ExeName);
  path:=GetCurrentDir;
  OutputDebugString(StringToOleStr('path '+path));
  ZConnection1.LibraryLocation:=path+'\fbclient.dll';
  ZConnection1.Database:='gmdb\GMDB.FDB';
  ZConnection1.Protocol:='firebirdd-2.5';
  ZConnection1.User:='GM';
  ZConnection1.Password:='GM';
  ZConnection1.Connect;
end;

procedure TFormDatabase.test;
var
  sql: String;
  ZQuery: TZQuery;
  i, rows: Integer;
  f1,f2: String;
begin
  sql:='select * from test';
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
  ZQuery.Open;
  rows:=ZQuery.RecordCount;

  if rows>0 then
  begin
    ZQuery.First;
    for i:=0 to rows-1 do
    begin
      f1:=ZQuery.FieldByName('f1').Value;
      f2:=ZQuery.FieldByName('f2').Value;
      OutputDebugString(StringToOleStr('database form test f1='+f1+' f2='+f2));
      ZQuery.Next;
    end;

  end;

  ZQuery.Close;
end;

function StringToTime(str: String): TTime;
	var
		FormatSettings: TFormatSettings;
	begin
		GetLocaleFormatSettings(SysLocale.DefaultLCID, FormatSettings);
		//FormatSettings.ShortDateFormat := 'yyyy/mm/dd';
		//FormatSettings.LongTimeFormat := '';
		//FormatSettings.DateSeparator := '-';
		FormatSettings.TimeSeparator := ':';
		Result := StrToTime(str, FormatSettings);
	end;

//PROTOCOL
function TFormDatabase.insertProtocolRecord(d: TDate; list:TStringList): boolean;
var
  sql: String;
  ZQuery: TZQuery;
  i,j: Integer;
  cols, vals, f: String;
  dt: TDateTime;
begin
  j:=0;
  cols:='';
  vals:='';
  for i := 0 to ZTableProtocol.FieldCount-1 do
  begin
    f:=ZTableProtocol.FieldDefList[i].Name;
    if 'ID'=f then
      continue;
    if (j>0) then
    begin
      cols:=cols+',';
      vals:=vals+',';
    end;
    cols:=cols+''+f;
    vals:=vals+':'+f;
    INC(j);
  end;

  sql:='insert into protocol('+cols+') values('+vals+')';
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);

  j:=0;
  for i := 0 to ZTableProtocol.FieldCount-1 do
  begin
    f:=ZTableProtocol.FieldDefList[i].Name;
    if 'ID'=f then
      continue;
    if list.Count>j then
    begin
      if Pos(':', list[j])>0 then
      begin
        dt:=d+StringToTime(list[j]);
        ZQuery.ParamByName(f).AsDateTime := dt;
      end else
      begin
        ZQuery.ParamByName(f).AsFloat := StrToFloat(list[j]);
      end;
    end else
    begin
      ZQuery.ParamByName(f).AsString := '';
    end;
    INC(j);
  end;
  ZQuery.ExecSQL;
  Result:=ZQuery.UpdatesPending;
end;

end.
