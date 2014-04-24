unit frameCatalog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset,
  Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TCatalogListFrame = class(TFrame)
    tblCatalog: TZTable;
    dsCatalog: TDataSource;
    dbGridCatalog: TDBGrid;
    tblCatalogID: TIntegerField;
    tblCatalogNO_PR: TIntegerField;
    tblCatalogNO_PK: TIntegerField;
    tblCatalogX: TFloatField;
    tblCatalogY: TFloatField;
    tblCatalogH: TFloatField;
    tblCatalogFK_PLOSHAD_ID: TIntegerField;
    tblCatalogGRAV: TFloatField;
    procedure tblCatalogBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure open;
  end;

implementation

{$R *.dfm}

uses MainUnit, Database;

procedure TCatalogListFrame.open;
begin
  tblCatalog.Filter := 'FK_PLOSHAD_ID='+IntToStr(FormMain.PloshadId);
  tblCatalog.Filtered:=True;
  if (tblCatalog.Active) then
  begin
    dsCatalog.DataSet.Refresh;
  end else
  begin
    tblCatalog.Open;
  end;
  //tblReisPLOSHAD_NAME.LookupDataSet.Refresh;
end;

procedure TCatalogListFrame.tblCatalogBeforeOpen(DataSet: TDataSet);
var
  i: Integer;
begin
  for i:=0 to tblCatalog.Fields.Count-1 do
  begin
    if tblCatalog.Fields[i].DataType = ftFloat then
      TNumericField (tblCatalog.Fields[i]).DisplayFormat:= '#####0.###';
  end;
end;

end.
