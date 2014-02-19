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
    procedure actAddUpdate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure dbGridOporPunktDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure open;
  end;

implementation

{$R *.dfm}

uses dlgOporPunkt;

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
 if dbGridOporPunkt.SelectedIndex>0 then
    FormOporPunkt.Show(tblOporPunkt, false);
end;

procedure TOporpunktListFrame.dbGridOporPunktDblClick(Sender: TObject);
begin
  if dbGridOporPunkt.SelectedIndex>0 then
  begin
    FormOporPunkt.Show(tblOporPunkt, false)
  end else
  begin
    FormOporPunkt.Show(tblOporPunkt, true);
  end;
  dbGridOporPunkt.Refresh;
end;

procedure TOporpunktListFrame.open;
begin
  tblOporPunkt.Open;
end;

end.
