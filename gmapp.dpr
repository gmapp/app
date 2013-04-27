program gmapp;







uses
  Vcl.Forms,
  Database in 'units\Database.pas' {FormDatabase},
  MainUnit in 'units\MainUnit.pas' {FormMain},
  PloshadUnit in 'units\PloshadUnit.pas' {FormPloshad};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormDatabase, FormDatabase);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormPloshad, FormPloshad);
  Application.Run;
end.
