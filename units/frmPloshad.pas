unit frmPloshad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, framePloshad, Vcl.Menus;

type
  TFormPloshadList = class(TForm)
    PloshadFrame1: TPloshadListFrame;
  private
    { Private declarations }
  public
    procedure open;
    procedure add;
  end;

var
  FormPloshadList: TFormPloshadList;

implementation

{$R *.dfm}

procedure TFormPloshadList.open;
begin
  Show;
  PloshadFrame1.Open;
end;

procedure TFormPloshadList.add;
begin
  Show;
  PloshadFrame1.add();
end;

end.
