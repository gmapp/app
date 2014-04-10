unit frameReis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset,
  Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TReisListFrame = class(TFrame)
    dbGridReis: TDBGrid;
    tblReis: TZTable;
    dsReis: TDataSource;
    tblReisID: TIntegerField;
    tblReisOPERATOR: TWideStringField;
    tblReisNOMER_PRIBORA: TIntegerField;
    tblReisDATE_IZMERENIA: TDateField;
    tblReisFILE: TWideStringField;
    ActionList1: TActionList;
    actSelect: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actAdd: TAction;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N1: TMenuItem;
    N5: TMenuItem;
    tblReisFK_PLOSHAD_ID: TIntegerField;
    tblReisPLOSHAD_NAME: TStringField;
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure dbGridReisDblClick(Sender: TObject);
    procedure actSelectExecute(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure open;
    procedure add;
  end;

implementation

{$R *.dfm}

uses dlgReis, MainUnit;

procedure TReisListFrame.actAddExecute(Sender: TObject);
begin
  FormReis.Show(tblReis, true);
end;

procedure TReisListFrame.actDeleteUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled:=tblReis.Active;
end;

procedure TReisListFrame.actEditExecute(Sender: TObject);
begin
  if dbGridReis.DataSource.DataSet.RecNo>0 then
    FormReis.Show(tblReis, false);
end;

procedure TReisListFrame.actSelectExecute(Sender: TObject);
var
  id: Integer;
  name: String;
begin
  id:=tblReis.FieldByName('ID').AsInteger;
  name:=tblReis.FieldByName('NOMER_PRIBORA').AsString;
  FormMain.selectReis(id, name);
end;

procedure TReisListFrame.dbGridReisDblClick(Sender: TObject);
begin
  actSelect.Execute;
  {if dbGridReis.DataSource.DataSet.RecNo>0 then
  begin
    FormReis.Show(tblReis, false)
  end else
  begin
    FormReis.Show(tblReis, true);
  end;
  dbGridReis.Refresh;}
end;

procedure TReisListFrame.N4Click(Sender: TObject);
begin
  ShowMessage('Ошибка! Невозможно удалить рейс!');
end;

procedure TReisListFrame.open;
begin
  tblReis.Filter := 'FK_PLOSHAD_ID='+IntToStr(FormMain.PloshadId);
  tblReis.Filtered:=True;
  if (tblReis.Active) then
  begin
    dsReis.DataSet.Refresh;
  end else
  begin
    tblReis.Open;
  end;
  tblReisPLOSHAD_NAME.LookupDataSet.Refresh;
end;

procedure TReisListFrame.add;
begin
  open;
  actAdd.Execute;
end;

end.
