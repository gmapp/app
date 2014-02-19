unit frmControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameOporPunkt;

type
  TFormControl = class(TForm)
    OporpunktFrame1: TOporpunktListFrame;
  private
    { Private declarations }
  public
    procedure open;
  end;

var
  FormControl: TFormControl;

implementation

{$R *.dfm}

procedure TFormControl.open;
begin
  OporpunktFrame1.Open;
  ShowModal;
end;

end.
