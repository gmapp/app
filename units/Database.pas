unit Database;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ZAbstractConnection, ZConnection,ZAbstractDataset, ZDataset,
  Data.DB, ZAbstractRODataset;

type
  TFormDatabase = class(TForm)
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure FormCreate(Sender: TObject);
  private
    procedure initDatabase;
  public
    procedure test;
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

end.
