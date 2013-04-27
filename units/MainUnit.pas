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
    procedure Button1Click(Sender: TObject);
  private
    procedure loadFile(filename: String);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses PloshadUnit,System.StrUtils, Database;

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

procedure TFormMain.Button1Click(Sender: TObject);
begin
  FormDatabase.test;
end;

procedure TFormMain.loadFile(filename: String);
var
  myFile : TextFile;
  text   : string;
  pwc: PWideChar;
begin
  AssignFile(myFile, filename);
  Reset(myFile);
  try
    while not Eof(myFile) do
    begin
      ReadLn(myFile, text);
      if (Length(text)>0) AND Not AnsiStartsStr('/', text) then
      begin
        pwc:=StringToOleStr(text);
        OutputDebugString(pwc);
      end;
    end;
  finally
    CloseFile(myFile);
  end;
end;


end.
