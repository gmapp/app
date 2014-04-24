unit frmCatalog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameCatalog;

type
  TFormCatalog = class(TForm)
    CatalogListFrame1: TCatalogListFrame;
  private
  public
    procedure open;
  end;

var
  FormCatalog: TFormCatalog;

implementation

{$R *.dfm}

procedure TFormCatalog.open;
begin
  CatalogListFrame1.Open;
  ShowModal;
end;

end.
