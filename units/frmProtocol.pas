unit frmProtocol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameProtocol;

type
  TFormProtocol = class(TForm)
    ProtocolFrame1: TProtocolListFrame;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProtocol: TFormProtocol;

implementation

{$R *.dfm}

uses Database;

procedure TFormProtocol.FormShow(Sender: TObject);
begin
  formDatabase.ZTableProtocol.Active:=True;
  ProtocolFrame1.DataSource1.Enabled:=true;
end;

end.
