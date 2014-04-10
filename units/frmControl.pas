unit frmControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameOporPunkt, frameControl;

type
  TFormControl = class(TForm)
    ControlListFrame1: TControlListFrame;
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
  ControlListFrame1.Open;
  ShowModal;
end;

end.
