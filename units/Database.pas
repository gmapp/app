unit Database;
{$I Options.inc}

interface
//{$define APP_DEBUG}

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ZAbstractConnection, ZConnection,ZAbstractDataset, ZDataset,
  Data.DB, ZAbstractRODataset, ZAbstractTable, System.Generics.Collections;

type

  TReis = record
    id: Integer;
    oper: String;
    num: Integer;
    date: TDate;
    filename: String;
  end;

  TGravimeter = record
    id: Integer;
    num: Integer;
    c: double;
    comment: String;
  end;

  TOporPunkt = record
    id: Integer;
    no_pr: Integer;
    no_pk: Integer;
    grav: double;
    no_grav: Integer;
    op_date: TDate;
    comment: String;
  end;

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
    ZTableProtocolTIME: TStringField;
    ZTableProtocolPUNKT: TBooleanField;
    ZTableProtocolG: TFloatField;
    ZTableProtocolTIME_DUR: TIntegerField;
    ZTableProtocolFK_REIS: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure ZConnection1BeforeConnect(Sender: TObject);
    procedure ZTableProtocolCalcFields(DataSet: TDataSet);
    procedure ZTableProtocolTIMEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ZTableProtocolPUNKTSetText(Sender: TField; const Text: string);
    procedure ZTableProtocolPUNKTGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ZTableProtocolPUNKTChange(Sender: TField);
    procedure ZTableProtocolTIME_DURGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    FPunktChecks :TDictionary<String, Boolean>;

    procedure initDatabase;
  public
    procedure test;

    function insertProtocolRecord(reis: Integer; d: TDate; list:TStringList): boolean;
    function insertReisRecord(aOperator, aFile: String; aDateIzmerenia: TDate; aNumPribora, aPloshad: Integer): Integer;

    procedure setPunktCheck(check: Boolean);
    function clearProtocol(reis: Integer): Boolean;

    function StringToTime(str: String): TTime;
    function getSeconds: Integer;

    function getOporPunkt(pr,pk: Integer; var op: TOporPunkt): Boolean;
    function getOporPunktByProtocol(protocolId: String; var op: TOporPunkt): Boolean;
    function getReis(id: Integer; var reis: TReis; ploshad_id: Integer): Boolean;

    function getGravimeter(num: Integer; var grav: TGravimeter): Boolean;
    function setGravimeter(num: Integer; c: Double; comment: String): Boolean;

    property PunktChecks:TDictionary<String, Boolean> read FPunktChecks;
  end;

var
  FormDatabase: TFormDatabase;

implementation

{$R *.dfm}

function TFormDatabase.StringToTime(str: String): TTime;
	var
		FormatSettings: TFormatSettings;
    p: Integer;
	begin
		GetLocaleFormatSettings(SysLocale.DefaultLCID, FormatSettings);
		//FormatSettings.ShortDateFormat := 'yyyy/mm/dd';
		//FormatSettings.LongTimeFormat := '';
		//FormatSettings.DateSeparator := '-';
		FormatSettings.TimeSeparator := ':';
    p:=pos('.', str);
    if p>0 then
      str:=str.Substring(0, p-1);
		Result := StrToTime(str, FormatSettings);
	end;

procedure TFormDatabase.setPunktCheck(check: Boolean);
begin

end;

procedure TFormDatabase.FormCreate(Sender: TObject);
begin
  FPunktChecks := TDictionary<String, Boolean>.Create;
  initDatabase;
end;

procedure TFormDatabase.initDatabase;
var
  path: String;
begin
  //path:=ExtractFilePath(Application.ExeName);
  path:=GetCurrentDir;
  OutputDebugString(StringToOleStr('path '+path));
  ZConnection1.Protocol:='firebirdd-2.5';
  ZConnection1.User:='GM';
  ZConnection1.Password:='GM';

  ZConnection1.LibraryLocation:=path+'\fbclient.dll';

  {$Ifdef APP_DEBUG}
  //ZConnection1.LibraryLocation:='C:\workspace\gmapp\trunk\fbclient.dll';
  ZConnection1.Database:='gmdb\GMDB.FDB';
  {$Else}
  ZConnection1.HostName:='localhost';
  ZConnection1.Database:='GMDB';
  {$Endif}
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

procedure TFormDatabase.ZConnection1BeforeConnect(Sender: TObject);
begin
  OutputDebugString(StringToOleStr('ZConnection1BeforeConnect'));
end;

procedure TFormDatabase.ZTableProtocolCalcFields(DataSet: TDataSet);
var
  id: String;
  tbl: TZTable;
begin
  tbl:=ZTableProtocol;
  //tbl.FieldByName('TIME').Value := tbl.FieldByName('STR_TIME').AsString;
  id:=ZTableProtocol.FieldByName('ID').AsString;
  if FPunktChecks.ContainsKey(id) then
  begin
    tbl.FieldByName('PUNKT').Value:=BoolToStr(FPunktChecks.Items[id], true);
  end else
  begin
    tbl.FieldByName('PUNKT').Value := 'False';
  end;
  //tbl.FieldByName('G').Value := '';
end;

procedure TFormDatabase.ZTableProtocolPUNKTChange(Sender: TField);
var
  id: String;
  check: Boolean;
begin
  OutputDebugString(StringToOleStr('OnChange '+Sender.FieldName+' '+Sender.AsString));
  id:=ZTableProtocol.FieldByName('ID').AsString;
  FPunktChecks.AddOrSetValue(id, Sender.AsBoolean);
end;

procedure TFormDatabase.ZTableProtocolPUNKTGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  id: String;
  check: Boolean;
begin
  OutputDebugString(StringToOleStr('ZTableProtocolPUNKTGetText '+Sender.AsString));
  {Text:='False';
  //BoolToStr()
  id:=ZTableProtocol.FieldByName('ID').AsString;
  if FPunktChecks.ContainsKey(id) then
  begin
    check:=FPunktChecks.Items[id];
    Text:=BoolToStr(check, true);
  end;}
  //Text:=ZTableProtocol.FieldByName(Sender.FieldName).AsString;
  //Text:=ZTableProtocol.FieldByName(Sender.FieldName).Value;
end;

procedure TFormDatabase.ZTableProtocolPUNKTSetText(Sender: TField;
  const Text: string);
begin
  OutputDebugString(StringToOleStr('ZTableProtocolPUNKTSetText'));
  ZTableProtocol.FieldByName(Sender.FieldName).Value:=Text;
end;

procedure TFormDatabase.ZTableProtocolTIMEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  p: Integer;
begin
  Text:=ZTableProtocol.FieldByName('STR_TIME').AsString;
  p:=pos(' ', Text);
  if p>0 then
    Text:=Text.Substring(p);
  DisplayText:=True;
end;

function TFormDatabase.getSeconds: Integer;
var
  Text: String;
  p: Integer;
  dt: TDateTime;
begin
  Text:=ZTableProtocol.FieldByName('STR_TIME').AsString;
  p:=pos(' ', Text);
  if p>0 then
  begin
    Text:=Text.Substring(p);
  end;
  if (Text<>'') AND (Length(Text)>0) then
  begin
    dt:=StringToTime(Text);
    Result:=Trunc(dt*86400);
  end else
  begin
    Result:=0;
  end;
end;

procedure TFormDatabase.ZTableProtocolTIME_DURGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  dt: Double;
begin
  if (ZTableProtocol.RecordCount>0) then
  begin
    dt:=getSeconds;
    Text:=FloatToStr(dt);
    DisplayText:=True;
  end;
end;

//PROTOCOL
function TFormDatabase.insertProtocolRecord(reis: Integer; d: TDate; list:TStringList): boolean;
var
  sql: String;
  ZQuery: TZQuery;
  i,j: Integer;
  cols, vals, f: String;
  dt: TDateTime;
  fields: TFieldDefList;
begin
  j:=0;
  cols:='';
  vals:='';
  fields:=ZTableProtocol.FieldDefList;
  for i := 0 to fields.Count-1 do
  begin
    if fields[i].InternalCalcField then
      continue;
    f:=fields[i].Name;
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

  //cols:=cols+',FK_REIS';
  //vals:=vals+',:FK_REIS';

  sql:='insert into protocol('+cols+') values('+vals+')';
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);

  j:=0;
  for i := 0 to fields.Count-1 do
  begin

    if fields[i].InternalCalcField then
      continue;
    f:=fields[i].Name;
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
      if fields[i].DataType=ftFloat then ZQuery.ParamByName(f).AsFloat := 0
      else ZQuery.ParamByName(f).AsString := '';
    end;
    INC(j);
  end;
  ZQuery.ParamByName('FK_REIS').AsInteger:=reis;
  ZQuery.ExecSQL;
  Result:=ZQuery.UpdatesPending;
end;

function TFormDatabase.clearProtocol(reis: Integer): Boolean;
var
  ZQuery: TZQuery;
begin
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add('delete from protocol where FK_REIS=:FK_REIS');
  ZQuery.ParamByName('FK_REIS').AsInteger:=reis;
  ZQuery.ExecSQL;
  Result:=ZQuery.UpdatesPending;
end;

function TFormDatabase.getOporPunkt(pr,pk: Integer; var op: TOporPunkt): Boolean;
var
  sql: String;
  ZQuery: TZQuery;
  i, rows: Integer;
begin
  Result:=False;
  op.id:=-1;

  sql:='select * from opor_punkt where no_pr=:no_pr and no_pk=:no_pk';
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
	ZQuery.ParamByName('no_pr').AsInteger := pr;
	ZQuery.ParamByName('no_pk').AsInteger := pk;
  ZQuery.Open;
  rows:=ZQuery.RecordCount;

  if rows>0 then
  begin
    ZQuery.First;
    op.id:=ZQuery.FieldByName('ID').Value;
    op.no_pr:=ZQuery.FieldByName('NO_PR').Value;
    op.no_pk:=ZQuery.FieldByName('NO_PK').Value;
    op.grav:=ZQuery.FieldByName('GRAV').Value;
    op.op_date:=ZQuery.FieldByName('OP_DATE').Value;
    op.no_grav:=ZQuery.FieldByName('NO_GRAV').Value;
    op.comment:=ZQuery.FieldByName('COMMENT').Value;
    OutputDebugString(StringToOleStr('database get opor_punkt c='+FloatToStr(op.id)));
    Result:=True;
  end;

  ZQuery.Close;
end;

function TFormDatabase.getOporPunktByProtocol(protocolId: String; var op: TOporPunkt): Boolean;
var
  sql: String;
  ZQuery: TZQuery;
  i, rows: Integer;
  no_pr, no_pk: Integer;
begin
  Result:=False;
  op.id:=-1;

  sql:='select line,station from protocol where ID=:ID';
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
	ZQuery.ParamByName('ID').AsInteger := StrToInt(protocolId);
  ZQuery.Open;
  rows:=ZQuery.RecordCount;

  if rows>0 then
  begin
    ZQuery.First;
    no_pr:=ZQuery.FieldByName('line').Value;
    no_pk:=ZQuery.FieldByName('station').Value;
    Result:=getOporPunkt(no_pr, no_pk, op);
  end;

  ZQuery.Close;
end;

function TFormDatabase.getGravimeter(num: Integer; var grav: TGravimeter): Boolean;
var
  sql: String;
  ZQuery: TZQuery;
  i, rows: Integer;
begin
  Result:=False;
  grav.id:=-1;
  grav.num:=0;

  sql:='select * from gravimeter where num=:num';
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
	ZQuery.ParamByName('num').AsInteger := num;
  ZQuery.Open;
  rows:=ZQuery.RecordCount;

  if rows>0 then
  begin
    ZQuery.First;
    grav.id:=ZQuery.FieldByName('NUM').Value;
    grav.num:=ZQuery.FieldByName('NUM').Value;
    grav.c:=ZQuery.FieldByName('c').Value;
    grav.comment:=ZQuery.FieldByName('COMMENT').Value;
    OutputDebugString(StringToOleStr('database get gravimeter c='+FloatToStr(grav.num)));
    Result:=True;
  end;

  ZQuery.Close;
end;

function TFormDatabase.setGravimeter(num: Integer; c: Double; comment: String): Boolean;
var
  sql: String;
  ZQuery: TZQuery;
  i, rows: Integer;
  isExist: Boolean;
  grav: TGravimeter;
begin
  Result:=False;

  isExist:=getGravimeter(num, grav);
  if (isExist) then
    sql:='insert into gravimeter(c,comment,num) values(:c,:comment,:num)'
  else
    sql:='update gravimeter set c=:c, comment=:comment where num=:num';


  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);

	ZQuery.ParamByName('c').AsFloat := c;
	ZQuery.ParamByName('comment').AsString := comment;
	ZQuery.ParamByName('num').AsInteger := num;

  ZQuery.ExecSQL;
  Result:=ZQuery.UpdatesPending;

  ZQuery.Close;
end;

function TFormDatabase.getReis(id: Integer; var reis: TReis; ploshad_id: Integer): Boolean;
var
  sql: String;
  ZQuery: TZQuery;
  i, rows: Integer;
  isExist: Double;
begin
  Result:=False;
  reis.id:=-1;

  sql:='select * from reis where id=:id and fk_ploshad_id=:ploshad_id';
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);

	ZQuery.ParamByName('id').AsInteger := id;
	ZQuery.ParamByName('ploshad_id').AsInteger := ploshad_id;

  ZQuery.Open;
  rows:=ZQuery.RecordCount;

  if rows>0 then
  begin
    ZQuery.First;
    reis.id:=ZQuery.FieldByName('id').Value;
    reis.oper:=ZQuery.FieldByName('OPERATOR').Value;
    reis.num:=ZQuery.FieldByName('NOMER_PRIBORA').Value;
    reis.date:=ZQuery.FieldByName('DATE_IZMERENIA').Value;
    reis.filename:=ZQuery.FieldByName('FILE').Value;
    Result:=True;
  end;

  ZQuery.Close;
end;

function TFormDatabase.insertReisRecord(aOperator, aFile: String; aDateIzmerenia: TDate; aNumPribora, aPloshad: Integer): Integer;
var
  sql: String;
  ZQuery: TZQuery;
begin
  Result:=-1;
  sql:='insert into reis(OPERATOR, NOMER_PRIBORA, DATE_IZMERENIA, FILE, FK_PLOSHAD_ID)'
    + ' values(:OPERATOR, :NOMER_PRIBORA, :DATE_IZMERENIA, :FILE, :FK_PLOSHAD_ID)'
    + ' returning ID;';

  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);

  ZQuery.ParamByName('OPERATOR').AsString := aOperator;
  ZQuery.ParamByName('NOMER_PRIBORA').AsInteger := aNumPribora;
  ZQuery.ParamByName('DATE_IZMERENIA').AsDate := aDateIzmerenia;
  ZQuery.ParamByName('FILE').AsString := aFile;
  ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger := aPloshad;

  ZQuery.Open;

  Result:=ZQuery.Fields[0].Value;
end;

end.
