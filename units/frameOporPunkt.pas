unit frameOporPunkt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TOporpunktListFrame = class(TFrame)
    dbGridPloshad: TDBGrid;
    DBGrid1: TDBGrid;
    tblOporPunkt: TZTable;
    dsOporPunkt: TDataSource;
    tblOporPunktID: TIntegerField;
    tblOporPunktNO_PR: TIntegerField;
    tblOporPunktNO_PK: TIntegerField;
    tblOporPunktGRAV: TFloatField;
    tblOporPunktOP_DATE: TDateField;
    tblOporPunktCOMMENT: TWideStringField;
    tblOporPunktNO_GRAV: TIntegerField;
    tblOporPunktOTKL2: TFloatField;
    tblOporPunktKRATN: TFloatField;
    tblOporPunktGsredn: TFloatField;
    tblOporPunktSKP: TFloatField;
    ActionList1: TActionList;
    actSelect: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actAdd: TAction;
    dbGridOporPunkt: TDBGrid;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    tblOporPunktFK_PLOSHAD_ID: TIntegerField;
    dsControl: TDataSource;
    queryControl: TZQuery;
    queryControlID: TIntegerField;
    queryControlNO_PR: TIntegerField;
    queryControlNO_PK: TIntegerField;
    queryControlGRAV: TIntegerField;
    queryControlNO_GRAV: TIntegerField;
    queryControlOP_DATE: TDateTimeField;
    queryControlCOMMENT: TStringField;
    queryControlOTKL2: TFloatField;
    queryControlKRATN: TIntegerField;
    procedure actAddUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure dbGridOporPunktDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure open(control: Boolean=False);
    procedure add;
  end;

implementation

{$R *.dfm}

uses dlgOporPunkt, MainUnit;

procedure TOporpunktListFrame.actAddExecute(Sender: TObject);
begin
  FormOporPunkt.Show(tblOporPunkt, true);
end;

procedure TOporpunktListFrame.actAddUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=tblOporPunkt.Active;
end;

procedure TOporpunktListFrame.actEditExecute(Sender: TObject);
begin
  if dbGridOporPunkt.DataSource.DataSet.RecNo>0 then
    FormOporPunkt.Show(tblOporPunkt, false);
end;

procedure TOporpunktListFrame.dbGridOporPunktDblClick(Sender: TObject);
begin
  if dbGridOporPunkt.DataSource.DataSet.RecNo>0 then
  begin
    FormOporPunkt.Show(tblOporPunkt, false)
  end else
  begin
    FormOporPunkt.Show(tblOporPunkt, true);
  end;
  dbGridOporPunkt.Refresh;
end;

procedure TOporpunktListFrame.open(control: Boolean=False);
begin
  if (control) then
  begin
    dbGridOporPunkt.DataSource:=dsControl;
    queryControl.SQL.Add('select *, 0 as OTKL2, 0 as KRATN from opor_punkt WHERE ');
    queryControl.Filter := 'FK_PLOSHAD_ID='+IntToStr(FormMain.PloshadId);
    tblOporPunkt.Filtered:=True;
    queryControl.Open;
  end else
  begin
    dbGridOporPunkt.DataSource:=dsOporPunkt;
    tblOporPunkt.Filter := 'FK_PLOSHAD_ID='+IntToStr(FormMain.PloshadId);
    tblOporPunkt.Filtered:=True;
    tblOporPunkt.Open;
  end;
end;

procedure TOporpunktListFrame.add;
begin
  open();
  actAdd.Execute;
end;

end.
