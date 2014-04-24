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
    procedure FormCreate(Sender: TObject);
  private
    FTable: TZTable;
    FId: Integer;
  public
    procedure show(tbl: TZTable; create: boolean);
  end;

var
  FormOporPunkt: TFormOporPunkt;

implementation

{$R *.dfm}

uses MainUnit, Database;

procedure TFormOporPunkt.btnOkClick(Sender: TObject);
var
  no_pr,no_pk,no_grav: Integer;
  grav: Double;
  op_date: TDate;
begin
  if Length(edProfil.Text)<1 then
  begin
    ShowMessage('Необходимо указать Профиль');
    ModalResult:=mrNone;
    Exit;
  end;

  no_pr:=StrToInt(edProfil.Text);
  no_pk:=StrToInt(edPiket.Text);
  grav:=StrToFloat(edGnabl.Text);
  no_grav:=StrToInt(edPribor.Text);
  op_date:=dtDate.Date;
  FormDatabase.updateOporPunkt(FId,no_pr,no_pk,grav,no_grav,op_date,edComment.Text,FormMain.PloshadId);
end;

procedure TFormOporPunkt.btnCancelClick(Sender: TObject);
begin
  FTable.Cancel;
end;

procedure TFormOporPunkt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FTable.ReadOnly:=True;
end;

procedure TFormOporPunkt.FormCreate(Sender: TObject);
begin
  FId:=-1;
end;

procedure TFormOporPunkt.show(tbl: TZTable; create: boolean);
begin
  Self.FTable:=tbl;
  if (create) then
  begin
    FId:=-1;
    edProfil.Text:='';
    edPiket.Text:='';
    edGnabl.Text:='';
    edPribor.Text:='';
    dtDate.Date:=Now();
    edComment.Text:='';
  end else
  begin
    FId:=FTable.FieldByName('ID').Value;
    edProfil.Text:=VarToStr(FTable.FieldByName('NO_PR').Value);
    edPiket.Text:=VarToStr(FTable.FieldByName('NO_PK').Value);
    edGnabl.Text:=VarToStr(FTable.FieldByName('GRAV').Value);
    edPribor.Text:=VarToStr(FTable.FieldByName('NO_GRAV').Value);
    if FTable.FieldByName('OP_DATE').Value=Null then
      dtDate.Date:=Now()
    else
      dtDate.Date:=VarToDateTime(FTable.FieldByName('OP_DATE').Value);
    edComment.Text:=VarToStr(FTable.FieldByName('COMMENT').Value);
  end;
  showModal;
end;

end.
