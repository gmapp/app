unit framePloshad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TPloshadListFrame = class(TFrame)
    dbGridPloshad: TDBGrid;
    dsPloshad: TDataSource;
    tblPloshad: TZTable;
    tblPloshadNAME: TWideStringField;
    tblPloshadREGION: TWideStringField;
    tblPloshadSTART_DATE: TDateField;
    tblPloshadCOMMENT: TWideStringField;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    actSelect: TAction;
    N1: TMenuItem;
    actEdit: TAction;
    actDelete: TAction;
    actAdd: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    tblPloshadID: TIntegerField;
    procedure dbGridPloshadDblClick(Sender: TObject);
    procedure actSelectUpdate(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actSelectExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure open;
    procedure add;
  end;

implementation

{$R *.dfm}

uses dlgPloshad, MainUnit;

procedure TPloshadListFrame.actAddExecute(Sender: TObject);
begin
  FormPloshad.Show(tblPloshad, true);
  dsPloshad.DataSet.Refresh;
end;

procedure TPloshadListFrame.actAddUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=tblPloshad.Active;
end;

procedure TPloshadListFrame.actEditExecute(Sender: TObject);
begin
  if dbGridPloshad.DataSource.DataSet.RecNo>0 then
    FormPloshad.Show(tblPloshad, false);
  dsPloshad.DataSet.Refresh;
end;

procedure TPloshadListFrame.actSelectExecute(Sender: TObject);
var
  id: Integer;
  name: String;
begin
  id:=tblPloshad.FieldByName('ID').AsInteger;
  name:=tblPloshad.FieldByName('NAME').AsString;
  FormMain.selectPloshad(id, name);
end;

procedure TPloshadListFrame.actSelectUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=tblPloshad.Active AND (dbGridPloshad.DataSource.DataSet.RecNo>0);
end;

procedure TPloshadListFrame.dbGridPloshadDblClick(Sender: TObject);
begin
  actSelect.Execute;
  {if dbGridPloshad.DataSource.DataSet.RecNo>0 then
  begin
    FormPloshad.Show(tblPloshad, false)
  end else
  begin
    FormPloshad.Show(tblPloshad, true);
  end;
  dbGridPloshad.Refresh;}
end;

procedure TPloshadListFrame.open;
begin
  tblPloshad.Open;
end;

procedure TPloshadListFrame.add;
begin
  FormPloshad.Show(tblPloshad, true);
end;

end.
