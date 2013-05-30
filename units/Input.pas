unit Input;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormInput = class(TForm)
    Button1: TButton;
    Button2: TButton;
    leName: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInput: TFormInput;

implementation

{$R *.dfm}

end.