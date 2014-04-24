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
    ZTableProtocolBRACK: TSmallintField;
    ZTableProtocolBRACK_CALC: TBooleanField;
    dsTopograph: TZTable;
    dsTopographID: TIntegerField;
    dsTopographNO_PR: TIntegerField;
    dsTopographNO_PK: TIntegerField;
    dsTopographX: TFloatField;
    dsTopographY: TFloatField;
    dsTopographH: TFloatField;
    dsTopographFK_PLOSHAD_ID: TIntegerField;
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
    procedure ZTableProtocolBRACK_CALCChange(Sender: TField);
    procedure ZTableProtocolBRACK_CALCSetText(Sender: TField;
      const Text: string);
    procedure ZTableProtocolBRACK_CALCGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ZTableProtocolBeforeOpen(DataSet: TDataSet);
  private
    FPunktChecks :TDictionary<String, Boolean>;

    procedure initDatabase;
  public
    procedure test;

    function insertProtocolRecord(reis: Integer; d: TDate; list:TStringList): boolean;
    function insertReisRecord(aOperator, aFile: String; aDateIzmerenia: TDate; aNumPribora, aPloshad: Integer): Integer;
    function insertTopographRecord(ploshadId: Integer; list:TStringList): boolean;
    function removeTopographRecord(NO_PR,NO_PK,ploshadId: Integer): boolean;

    procedure setPunktCheck(check: Boolean);
    function clearProtocol(reis: Integer): Boolean;

    function StringToTime(str: String): TTime;
    function getSeconds: Integer;

    function getOporPunkt(pr,pk,ploshad_id: Integer; var op: TOporPunkt): Boolean;
    function getOporPunktByProtocol(protocolId: String; ploshad_id: Integer; var op: TOporPunkt): Boolean;
    function updateOporPunkt(id,no_pr,no_pk: Integer;grav: Double; no_grav: Integer;
      op_date: TDate;comment: String;ploshad_id: Integer): Boolean;
    function getReis(id: Integer; var reis: TReis; ploshad_id: Integer): Boolean;

    function getGravimeter(num: Integer; ploshad_id: Integer; var grav: TGravimeter): Boolean;
    function setGravimeter(num: Integer; c: Double; comment: String; ploshad_id: Integer): Boolean;

    property PunktChecks:TDictionary<String, Boolean> read FPunktChecks;

    procedure calcControl(ploshadId: Integer; reis: TReis; isOP: Boolean=False);
    procedure calcControlOP(ploshadId: Integer; reis: TReis);
    function updateControlComment(id: Integer; value: String): Boolean;
    procedure calcAllControl(ploshadId: Integer);

    function backup(dest: String): Boolean;
    function restore(dest: String): Boolean;

    procedure removeFrom(tbl, idField: String; id: Integer);

    procedure clearTopograph(ploshadId: Integer);
    procedure removeReis(Id: Integer);
    function getReisDuration(Id: Integer): TDateTime;
  end;

var
  FormDatabase: TFormDatabase;

implementation

{$R *.dfm}

uses MainUnit;

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

procedure TFormDatabase.ZTableProtocolBeforeOpen(DataSet: TDataSet);
var
  i: Integer;
begin
  for i:=0 to ZTableProtocol.Fields.Count-1 do
  begin
    if ZTableProtocol.Fields[i].DataType = ftFloat then
      TNumericField (ZTableProtocol.Fields[i]).DisplayFormat:= '#####0.###';
  end;
end;

procedure TFormDatabase.ZTableProtocolBRACK_CALCChange(Sender: TField);
var
  id: String;
  check: Boolean;
begin
  OutputDebugString(StringToOleStr('OnChange brack '+Sender.FieldName+' '+Sender.AsString));
  id:=ZTableProtocol.FieldByName('ID').AsString;
  // TODO FPunktBrack.AddOrSetValue(id, Sender.AsBoolean);
end;

procedure TFormDatabase.ZTableProtocolBRACK_CALCGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  id: String;
  check: Boolean;
begin
  //OutputDebugString(StringToOleStr('ZTableProtocolBRACK_CALCGetText: '+Sender.AsString));
  //Sender.AsString:=BoolToStr(ZTableProtocol.FieldByName('BRACK').AsInteger=1, True);
end;

procedure TFormDatabase.ZTableProtocolBRACK_CALCSetText(Sender: TField;
  const Text: string);
begin
  //OutputDebugString(StringToOleStr('ZTableProtocolBRACKSetText'));
  ZTableProtocol.FieldByName(Sender.FieldName).Value:=Text;
end;

procedure TFormDatabase.ZTableProtocolCalcFields(DataSet: TDataSet);
var
  id: String;
  tbl: TZTable;
  brack: Integer;
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

  brack:=ZTableProtocol.FieldByName('BRACK').AsInteger;
  //OutputDebugString(StringToOleStr('ZTableProtocolCalcFields brack '+IntToStr(brack)));
  if (brack=1) then
    tbl.FieldByName('BRACK_CALC').Value := 'True'
  else
    tbl.FieldByName('BRACK_CALC').Value := 'False';

  //tbl.FieldByName('G').Value := '';
end;

procedure TFormDatabase.ZTableProtocolPUNKTChange(Sender: TField);
var
  id: String;
  check: Boolean;
begin
  OutputDebugString(StringToOleStr('OnChange check '+Sender.FieldName+' '+Sender.AsString));
  id:=ZTableProtocol.FieldByName('ID').AsString;
  FPunktChecks.AddOrSetValue(id, Sender.AsBoolean);
end;

procedure TFormDatabase.ZTableProtocolPUNKTGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  id: String;
  check: Boolean;
begin
  //OutputDebugString(StringToOleStr('ZTableProtocolPUNKTGetText '+Sender.AsString));
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
//--LINE-----STATION-----ALT.------GRAV.---SD.--TILTX--TILTY-TEMP---TIDE---DUR-REJ-----TIME----DEC.TIME+DATE--TERRAIN
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
    if ('ID'=f) OR ('G'=f) then
      continue;
    if list.Count>j then
    begin
      if (Pos(':', list[j])>0) then
      begin
        dt:=d+StringToTime(list[j]);
        ZQuery.ParamByName(f).AsDateTime := dt;
      end else if (Pos('/', list[j])>0) then
      begin
        dt:=FormMain.StringToDate(list[j]);
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

    if (j>14) then
    begin
      // обработка описана тольок для 14 первых полей
      break;
    end;
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

function TFormDatabase.getOporPunkt(pr,pk,ploshad_id: Integer; var op: TOporPunkt): Boolean;
var
  sql: String;
  ZQuery: TZQuery;
  i, rows: Integer;
begin
  Result:=False;
  op.id:=-1;

  sql:='select * from opor_punkt where no_pr=:no_pr and no_pk=:no_pk'
    +' and FK_PLOSHAD_ID=:ploshad_id';
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
	ZQuery.ParamByName('no_pr').AsInteger := pr;
	ZQuery.ParamByName('no_pk').AsInteger := pk;
	ZQuery.ParamByName('ploshad_id').AsInteger := ploshad_id;
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

function TFormDatabase.getOporPunktByProtocol(protocolId: String; ploshad_id: Integer; var op: TOporPunkt): Boolean;
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
    Result:=getOporPunkt(no_pr, no_pk, ploshad_id, op);
  end;

  ZQuery.Close;
end;

function TFormDatabase.getGravimeter(num: Integer; ploshad_id: Integer; var grav: TGravimeter): Boolean;
var
  sql: String;
  ZQuery: TZQuery;
  i, rows: Integer;
begin
  Result:=False;
  grav.id:=-1;
  grav.num:=0;

  sql:='select * from gravimeter where num=:num and fk_ploshad_id=:ploshad_id';
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
	ZQuery.ParamByName('num').AsInteger := num;
	ZQuery.ParamByName('ploshad_id').AsInteger := ploshad_id;
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

function TFormDatabase.setGravimeter(num: Integer; c: Double; comment: String;
    ploshad_id: Integer): Boolean;
var
  sql: String;
  ZQuery: TZQuery;
  i, rows: Integer;
  isExist: Boolean;
  grav: TGravimeter;
begin
  Result:=False;

  isExist:=getGravimeter(num, ploshad_id, grav);
  if (not isExist) then
    sql:='insert into gravimeter(c,comment,num,fk_ploshad_id) values(:c,:comment,:num,:ploshad_id)'
  else
    sql:='update gravimeter set c=:c, comment=:comment where num=:num and fk_ploshad_id=:ploshad_id';


  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);

	ZQuery.ParamByName('c').AsFloat := c;
	ZQuery.ParamByName('comment').AsString := comment;
	ZQuery.ParamByName('num').AsInteger := num;
	ZQuery.ParamByName('ploshad_id').AsInteger := ploshad_id;

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

procedure TFormDatabase.calcAllControl(ploshadId: Integer);
var
  reis: TReis;
begin
  calcControl(ploshadId, reis);
end;

procedure TFormDatabase.calcControl(ploshadId: Integer; reis: TReis; isOP: Boolean=False);
var
  sql: String;
  ZQuery: TZQuery;
  ok: Boolean;
  tbl: String;
begin
  ZQuery:=ZQuery1;

  if isOP then tbl:='control_op'
  else tbl:='control';

  sql:='delete from '+tbl+' where FK_PLOSHAD_ID=:FK_PLOSHAD_ID AND FK_REIS_ID=:FK_REIS_ID';
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
  ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger:=ploshadId;
  ZQuery.ParamByName('FK_REIS_ID').AsInteger:=reis.id;
  ZQuery.ExecSQL;
  ok:=ZQuery.UpdatesPending;

  sql:='insert into '+tbl+'(no_pr,no_pk,no_grav,fk_ploshad_id,grav,op_date,fk_reis_id)'
    +' SELECT line as no_pr,station as no_pk,r.NOMER_PRIBORA,r.fk_ploshad_id,g as grav, r.date_izmerenia,r.id as fk_reis'
    +' FROM PROTOCOL p, reis r'
    +' where (brack is null or brack<>1) and p.FK_REIS=r.id and r.FK_PLOSHAD_ID=:FK_PLOSHAD_ID AND p.FK_REIS=:FK_REIS_ID'
    +' order by line,station';

  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
  ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger:=ploshadId;
  ZQuery.ParamByName('FK_REIS_ID').AsInteger:=reis.id;
  ZQuery.ExecSQL;

  sql:='update '+tbl+' set control=1'
    +' where id in (SELECT min(id) as id from '+tbl+' '
      +' WHERE FK_PLOSHAD_ID=:FK_PLOSHAD_ID group by no_pr,no_pk)';
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
  ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger:=ploshadId;
  ZQuery.ExecSQL;

  sql:='update '+tbl+' as c1 set'
    +' gsredn=(select sum(grav)/count(1) FROM '+tbl+' c2'
      +' WHERE c1.no_pr=c2.no_pr and c1.no_pk=c2.no_pk and c1.FK_PLOSHAD_ID=c2.FK_PLOSHAD_ID)'
    +' where c1.FK_PLOSHAD_ID=:FK_PLOSHAD_ID';
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
  ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger:=ploshadId;
  ZQuery.ExecSQL;

    sql:='update '+tbl+' as c1 set'
      +' kratn=(select count(1) FROM '+tbl+' c2'
      +' WHERE c1.no_pr=c2.no_pr and c1.no_pk=c2.no_pk and c1.FK_PLOSHAD_ID=c2.FK_PLOSHAD_ID)'
    +' where c1.control=1'
    +' and c1.FK_PLOSHAD_ID=:FK_PLOSHAD_ID';
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
  ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger:=ploshadId;
  ZQuery.ExecSQL;

  sql:='update '+tbl+' set otkl2=power((GSREDN-GRAV), 2) where FK_PLOSHAD_ID=:FK_PLOSHAD_ID';
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
  ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger:=ploshadId;
  ZQuery.ExecSQL;

  //SQRT((сумма откл^2)/(кратность*(кратность-1)))
  sql:='update '+tbl+' as c1 set skp=sqrt('
    +'(select sum(otkl2) FROM '+tbl+' c2'
      +' WHERE c1.no_pr=c2.no_pr and c1.no_pk=c2.no_pk and c1.FK_PLOSHAD_ID=c2.FK_PLOSHAD_ID)'
    +'/(kratn*(kratn-1))) '
    +' where FK_PLOSHAD_ID=:FK_PLOSHAD_ID and kratn>1';
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
  ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger:=ploshadId;
  ZQuery.ExecSQL;
end;

procedure TFormDatabase.calcControlOP(ploshadId: Integer; reis: TReis);
begin
  calcControl(ploshadId, reis, true);
end;

function TFormDatabase.updateControlComment(id: Integer; value: String): Boolean;
var
  ZQuery: TZQuery;
begin
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add('update control set comment=:comment where id=:id');
  ZQuery.ParamByName('comment').AsString:=value;
  ZQuery.ParamByName('id').AsInteger:=id;
  ZQuery.ExecSQL;
  Result:=ZQuery.UpdatesPending;
end;

function TFormDatabase.backup(dest: String): Boolean;
var
  ZQuery: TZQuery;
begin
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Text:='BACKUP TABLE protocol TO '''+dest+'''';
  ZQuery.ExecSQL;
  ZQuery.Close;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Text:=' protocol TO '''+dest+'''';
  ZQuery.ExecSQL;
  ShowMessage('Backup successful complete.');
end;

function TFormDatabase.restore(dest: String): Boolean;
begin
  Result:=False;

end;

procedure TFormDatabase.clearTopograph(ploshadId: Integer);
var
  sql: String;
  ZQuery: TZQuery;
begin
  ZQuery:=ZQuery1;

  sql:='delete from topograph where FK_PLOSHAD_ID=:FK_PLOSHAD_ID';
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
  ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger:=ploshadId;
  ZQuery.ExecSQL;
end;

function TFormDatabase.removeTopographRecord(NO_PR,NO_PK,ploshadId: Integer): boolean;
var
  sql: String;
  ZQuery: TZQuery;
begin
  Result:=False;

  sql:='delete FROM topograph a where NO_PR=:NO_PR AND NO_PK=:NO_PK AND FK_PLOSHAD_ID=:FK_PLOSHAD_ID';

  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);

  ZQuery.ParamByName('NO_PR').AsInteger := NO_PR;
  ZQuery.ParamByName('NO_PK').AsInteger := NO_PK;
  ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger := ploshadId;

  ZQuery.ExecSQL;
  Result:=ZQuery.UpdatesPending;
  ZQuery.Close;
end;

function TFormDatabase.insertTopographRecord(ploshadId: Integer; list:TStringList): boolean;
var
  sql: String;
  ZQuery: TZQuery;
  NO_PR,NO_PK: Integer;
begin
  NO_PR:=StrToInt(list[0]);
  NO_PK:=StrToInt(list[1]);

  removeTopographRecord(NO_PR,NO_PK,ploshadId);

  Result:=False;
  sql:='insert into topograph(NO_PR, NO_PK, X, Y, H, FK_PLOSHAD_ID)'
    + ' values(:NO_PR, :NO_PK, :X, :Y, :H, :FK_PLOSHAD_ID)'
    + ' returning ID;';

  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);

  ZQuery.ParamByName('NO_PR').AsInteger := NO_PR;
  ZQuery.ParamByName('NO_PK').AsInteger := NO_PK;
  ZQuery.ParamByName('X').AsFloat := StrToFloat(list[2]);
  ZQuery.ParamByName('Y').AsFloat := StrToFloat(list[3]);
  ZQuery.ParamByName('H').AsFloat := StrToFloat(list[4]);
  ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger := ploshadId;

  ZQuery.ExecSQL;
  Result:=ZQuery.UpdatesPending;
  ZQuery.Close;
end;

procedure TFormDatabase.removeFrom(tbl, idField: String; id: Integer);
var
  sql: String;
  ZQuery: TZQuery;
begin
  ZQuery:=ZQuery1;

  sql:='delete FROM '+tbl+' where '+idField+'=:ID';
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
  ZQuery.ParamByName('ID').AsInteger:=id;
  ZQuery.ExecSQL;
end;

procedure TFormDatabase.removeReis(Id: Integer);
begin
  removeFrom('control', 'fk_reis_id', Id);
  removeFrom('control_op', 'fk_reis_id', Id);
  removeFrom('protocol', 'fk_reis', Id);
  removeFrom('REIS', 'id', Id);
end;

function TFormDatabase.updateOporPunkt(id,no_pr,no_pk: Integer;grav: Double; no_grav: Integer;
  op_date: TDate;comment: String;ploshad_id: Integer): Boolean;
var
  sql: String;
  ZQuery: TZQuery;
begin
  ZQuery:=ZQuery1;

  if id>0 then sql:='update OPOR_PUNKT set no_pr=:NO_PR,no_pk=:NO_PK,grav=:GRAV,no_grav=:NO_GRAV'
    +',op_date=:OP_DATE,comment=:COMMENT where id=:ID'
  else sql:='insert into OPOR_PUNKT(no_pr,no_pk,grav,no_grav,op_date,comment,FK_PLOSHAD_ID)'
    +' VALUES(:NO_PR,:NO_PK,:GRAV,:NO_GRAV,:OP_DATE,:COMMENT,:FK_PLOSHAD_ID)';

  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);
  ZQuery.ParamByName('NO_PR').AsInteger:=no_pr;
  ZQuery.ParamByName('NO_PK').AsInteger:=no_pk;
  ZQuery.ParamByName('GRAV').AsFloat:=grav;
  ZQuery.ParamByName('NO_GRAV').AsInteger:=no_grav;
  ZQuery.ParamByName('OP_DATE').AsDate:=op_date;
  ZQuery.ParamByName('COMMENT').AsString:=comment;
  if id>0 then ZQuery.ParamByName('ID').AsInteger:=Id
  else ZQuery.ParamByName('FK_PLOSHAD_ID').AsInteger:=ploshad_id;
  ZQuery.ExecSQL;
  Result:=ZQuery.UpdatesPending;
  ZQuery.Close;
end;

function TFormDatabase.getReisDuration(Id: Integer): TDateTime;
var
  sql: String;
  ZQuery: TZQuery;
  i, rows: Integer;
  d: Double;
begin
  Result:=0;

  sql:='select (max(DEC_TIME)-min(DEC_TIME)) as duration from protocol where fk_reis=:FK_REIS_ID';
  ZQuery:=ZQuery1;
  ZQuery.SQL.Clear;
  ZQuery.SQL.Add(sql);

	ZQuery.ParamByName('FK_REIS_ID').AsInteger := Id;

  ZQuery.Open;
  rows:=ZQuery.RecordCount;

  if rows>0 then
  begin
    ZQuery.First;
    d:=ZQuery.FieldByName('duration').AsFloat;
    Result:=FloatToDateTime(d);
  end;

  ZQuery.Close;
end;

end.
