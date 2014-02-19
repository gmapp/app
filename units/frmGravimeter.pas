unit frmGravimeter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameGravimeter, Vcl.Menus;

type
  TFormGravimeterList = class(TForm)
    GravimeterFrame1: TGravimeterFrame;
  private
    { Private declarations }
  public
    procedure open;
    procedure add;
  end;

var
  FormGravimeterList: TFormGravimeterList;

implementation

{$R *.dfm}

procedure TFormGravimeterList.open;
begin
  Show;
  GravimeterFrame1.Open;
end;

procedure TFormGravimeterList.add;
begin
  Show;
  GravimeterFrame1.add();
end;

end.
