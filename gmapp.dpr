program gmapp;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {FormMain},
  PloshadUnit in 'PloshadUnit.pas' {FormPloshad};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormPloshad, FormPloshad);
  Application.Run;
end.
