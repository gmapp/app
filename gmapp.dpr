program gmapp;







uses
  Vcl.Forms,
  Database in 'units\Database.pas' {FormDatabase},
  MainUnit in 'units\MainUnit.pas' {FormMain},
  PloshadUnit in 'units\PloshadUnit.pas' {FormPloshad},
  Gravimeter in 'units\Gravimeter.pas' {FormGravimeter},
  Reis in 'units\Reis.pas' {FormReis},
  frameProtocol in 'units\frameProtocol.pas' {ProtocolFrame: TFrame},
  Protocol in 'units\Protocol.pas' {FormProtocol};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormDatabase, FormDatabase);
  Application.CreateForm(TFormPloshad, FormPloshad);
  Application.CreateForm(TFormGravimeter, FormGravimeter);
  Application.CreateForm(TFormReis, FormReis);
  Application.CreateForm(TFormProtocol, FormProtocol);
  Application.Run;
end.
