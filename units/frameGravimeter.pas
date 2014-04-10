unit frameGravimeter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions,
  Vcl.ActnList, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, Vcl.Menus, Vcl.Grids, Vcl.DBGrids;

type
  TGravimeterFrame = class(TFrame)
    dbGridGrav: TDBGrid;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    dsGrav: TDataSource;
    tblGrav: TZTable;
    ActionList1: TActionList;
    actSelect: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actAdd: TAction;
    tblGravNUM: TIntegerField;
    tblGravC: TFloatField;
    tblGravCOMMENT: TWideStringField;
    tblGravID: TIntegerField;
    tblGravFK_PLOSHAD_ID: TIntegerField;
    procedure actAddExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actSelectExecute(Sender: TObject);
    procedure actSelectUpdate(Sender: TObject);
    procedure dbGridGravDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure open;
    procedure add;
  end;

implementation

{$R *.dfm}

uses dlgGravimeter, MainUnit;

procedure TGravimeterFrame.actAddExecute(Sender: TObject);
begin
  FormGravimeter.Show(tblGrav, true);
  dbGridGrav.DataSource.DataSet.Refresh;
end;

procedure TGravimeterFrame.actAddUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=tblGrav.Active;
end;

procedure TGravimeterFrame.actEditExecute(Sender: TObject);
begin
  if dbGridGrav.DataSource.DataSet.RecNo>0 then
    FormGravimeter.Show(tblGrav, false);
  dbGridGrav.DataSource.DataSet.Refresh;
end;

procedure TGravimeterFrame.actSelectExecute(Sender: TObject);
var
  num: Integer;
  comment: String;
begin
  num:=tblGrav.FieldByName('NUM').AsInteger;
  comment:=tblGrav.FieldByName('COMMENT').AsString;
  //FormMain.selectGravimeter(id, name);
end;

procedure TGravimeterFrame.actSelectUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=tblGrav.Active AND (dbGridGrav.DataSource.DataSet.RecNo>0);
end;

procedure TGravimeterFrame.dbGridGravDblClick(Sender: TObject);
begin
  //actSelect.Execute;
  if dbGridGrav.DataSource.DataSet.RecNo>0 then
  begin
    FormGravimeter.Show(tblGrav, false)
  end else
  begin
    FormGravimeter.Show(tblGrav, true);
  end;
  dbGridGrav.DataSource.DataSet.Refresh;
end;

procedure TGravimeterFrame.open;
begin
  tblGrav.Filter := 'FK_PLOSHAD_ID='+IntToStr(FormMain.PloshadId);
  tblGrav.Filtered:=True;
  if (tblGrav.Active) then
  begin
    dsGrav.DataSet.Refresh;
  end else
  begin
    tblGrav.Open;
  end;
end;

procedure TGravimeterFrame.add;
begin
  FormGravimeter.Show(tblGrav, true);
  dbGridGrav.DataSource.DataSet.Refresh;
end;

end.
