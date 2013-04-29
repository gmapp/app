unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ZAbstractConnection,
  ZConnection, Vcl.StdCtrls;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    p1: TMenuItem;
    p2: TMenuItem;
    p3: TMenuItem;
    p4: TMenuItem;
    p5: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
  private
    procedure loadFile(filename: String);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses PloshadUnit,System.StrUtils, Database, Protocol;

procedure TFormMain.N14Click(Sender: TObject);
begin
  FormProtocol.ShowModal;
end;

procedure TFormMain.N1Click(Sender: TObject);
begin
  FormPloshad.ShowModal;
end;

procedure TFormMain.N2Click(Sender: TObject);
begin
  OpenDialog1.Filter:='txt-files|*.txt|All Files|*.*';
  OpenDialog1.FilterIndex := 1;
  if OpenDialog1.InitialDir='' then
    OpenDialog1.InitialDir:='c:\workspace\gmapp';
  if OpenDialog1.Execute then
  begin
    if FileExists(OpenDialog1.FileName) then
      loadFile(OpenDialog1.FileName)
    else
     raise Exception.Create('File does not exist.');
  end;
end;

function StringToDate(str: String): TDate;
	var
		//FormatSettings: TFormatSettings;
    sl:TStringList;
    d: TDate;
    myYear, myMonth, myDay : Word;
	begin
    sl := TStringList.Create;
    try
      sl.Delimiter     := '/';
      sl.DelimitedText := str;
      myYear:=StrToInt(sl.Strings[0]);
      myMonth:=StrToInt(sl.Strings[1]);
      myDay:=StrToInt(sl.Strings[2]);
      d:=EncodeDate(myYear, myMonth, myDay);
      Result:=d;
    finally
      FreeAndNil(sl);
    end;
		{GetLocaleFormatSettings(SysLocale.DefaultLCID, FormatSettings);
		FormatSettings.ShortDateFormat := 'yyyy/mm/d';
		FormatSettings.TimeSeparator := ':';
		Result := StrToDate(str, FormatSettings);}
	end;

procedure TFormMain.loadFile(filename: String);
var
  myFile : TextFile;
  text, tmp : string;
  pwc: PWideChar;
  arr: array of TVarRec;
  list:TStringList;
  i, amount, p: Integer;
  protocolDate: TDate;
begin
  AssignFile(myFile, filename);
  Reset(myFile);
  list := TStringList.create;
  list.StrictDelimiter := false;
  list.Delimiter := #9; //TAB
  amount:=0;
  try
    FormDatabase.ZTableProtocol.Active:=True;
    while not Eof(myFile) do
    begin
      ReadLn(myFile, text);

      if (AnsiStartsStr('/', text)) then
      begin
        p:=Pos('Date:', text);
        if (p>0) then
        begin
          tmp:=Copy(text, p+6);
          tmp:=Trim(tmp);
          tmp:=ReplaceStr(tmp,#9,'');
          //tmp:=ReplaceStr(tmp,' ','');
          protocolDate:=StringToDate(tmp);
        end;

      end;

      if (Length(text)>0) AND Not AnsiStartsStr('/', text) then
      begin
        pwc:=StringToOleStr(text);
        OutputDebugString(pwc);

        text:=ReplaceStr(text,'.',',');

        list.DelimitedText:=text;

        if list.Count<4 then continue;

        Setlength(arr, list.Count+1);
        arr[0].VInteger:=0;
        for i := 0 to list.Count-1 do
          arr[i+1].VAnsiString:=PAnsiString(list[i]);
        //FormDatabase.ZTable1.InsertRecord(arr);
        //FormDatabase.ZTable1.AppendRecord(arr);
        FormDatabase.insertProtocolRecord(protocolDate, list);
        INC(amount);
      end;
      //FormDatabase.ZTableProtocol.ApplyUpdates;
    end;
    ShowMessage('Загрузка выполнена: '+IntToStr(amount));
  finally
    CloseFile(myFile);
    FreeAndNil(list);
  end;
end;


end.
