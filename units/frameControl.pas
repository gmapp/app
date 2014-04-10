unit frameControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset;

type
  TControlListFrame = class(TFrame)
    dbGridReis: TDBGrid;
    tblControl: TZTable;
    dsControl: TDataSource;
    tblControlID: TIntegerField;
    tblControlNO_PR: TFloatField;
    tblControlNO_PK: TFloatField;
    tblControlNO_GRAV: TIntegerField;
    tblControlGRAV: TFloatField;
    tblControlOP_DATE: TDateField;
    tblControlOTKL2: TFloatField;
    tblControlKRATN: TIntegerField;
    tblControlGSREDN: TFloatField;
    tblControlSKP: TFloatField;
    tblControlCOMMENT: TWideStringField;
    tblControlFK_PLOSHAD_ID: TIntegerField;
  private
    { Private declarations }
  public
    procedure open;
  end;

implementation

{$R *.dfm}

uses MainUnit;

procedure TControlListFrame.open;
begin
  tblControl.Filter := 'FK_PLOSHAD_ID='+IntToStr(FormMain.PloshadId);
  tblControl.Filtered:=True;
  if (tblControl.Active) then
  begin
    dsControl.DataSet.Refresh;
  end else
  begin
    tblControl.Open;
  end;
  //tblReisPLOSHAD_NAME.LookupDataSet.Refresh;
end;

end.
