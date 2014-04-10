unit dlgOporPunkt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, Vcl.ComCtrls;

type
  TFormOporPunkt = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    edProfil: TLabeledEdit;
    edPiket: TLabeledEdit;
    edGnabl: TLabeledEdit;
    dtDate: TDateTimePicker;
    Label1: TLabel;
    edPribor: TLabeledEdit;
    edComment: TLabeledEdit;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    FTable: TZTable;
  public
    procedure show(tbl: TZTable; create: boolean);
  end;

var
  FormOporPunkt: TFormOporPunkt;

implementation

{$R *.dfm}

uses MainUnit;

procedure TFormOporPunkt.btnOkClick(Sender: TObject);
begin
  if Length(edProfil.Text)<1 then
  begin
    ShowMessage('Необходимо указать Профиль');
    ModalResult:=mrNone;
    Exit;
  end;

  FTable.FieldByName('NO_PR').Value:=edProfil.Text;
  FTable.FieldByName('NO_PK').Value:=edPiket.Text;
  FTable.FieldByName('GRAV').Value:=edGnabl.Text;
  FTable.FieldByName('NO_GRAV').Value:=edPribor.Text;
  FTable.FieldByName('OP_DATE').Value:=dtDate.Date;
  FTable.FieldByName('COMMENT').Value:=edComment.Text;
  FTable.FieldByName('FK_PLOSHAD_ID').Value:=FormMain.PloshadId;
  FTable.Post;
end;

procedure TFormOporPunkt.btnCancelClick(Sender: TObject);
begin
  FTable.Cancel;
end;

procedure TFormOporPunkt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FTable.ReadOnly:=True;
end;

procedure TFormOporPunkt.show(tbl: TZTable; create: boolean);
begin
  Self.FTable:=tbl;
  FTable.ReadOnly:=False;
  if not FTable.CanModify then
    raise Exception.Create('Cant edit table '+FTable.Name);
  if (create) then
  begin
    edProfil.Text:='';
    edPiket.Text:='';
    edGnabl.Text:='';
    edPribor.Text:='';
    dtDate.Date:=Now();
    edComment.Text:='';

    FTable.Insert();
    FTable.Edit;
  end else
  begin
    edProfil.Text:=VarToStr(FTable.FieldByName('NO_PR').Value);
    edPiket.Text:=VarToStr(FTable.FieldByName('NO_PK').Value);
    edGnabl.Text:=VarToStr(FTable.FieldByName('GRAV').Value);
    edPribor.Text:=VarToStr(FTable.FieldByName('NO_GRAV').Value);
    if FTable.FieldByName('OP_DATE').Value=Null then
      dtDate.Date:=Now()
    else
      dtDate.Date:=VarToDateTime(FTable.FieldByName('OP_DATE').Value);
    edComment.Text:=VarToStr(FTable.FieldByName('COMMENT').Value);
    FTable.Edit;
  end;
  showModal;
end;

end.
