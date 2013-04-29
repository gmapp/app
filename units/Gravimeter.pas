unit Gravimeter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormGravimeter = class(TForm)
    leName: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGravimeter: TFormGravimeter;

implementation

{$R *.dfm}

end.
