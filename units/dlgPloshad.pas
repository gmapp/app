unit dlgPloshad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, Database, Datasnap.DBClient, SimpleDS,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, Vcl.ComCtrls;

type
  TFormPloshad = class(TForm)
    edName: TLabeledEdit;
    edRaion: TLabeledEdit;
    edComment: TLabeledEdit;
    btnOk: TButton;
    btnCancel: TButton;
    dtNachalo: TDateTimePicker;
    Label1: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FTable: TZTable;
  public
    procedure show(tbl: TZTable; create: boolean);
  end;

var
  FormPloshad: TFormPloshad;

implementation

{$R *.dfm}

procedure TFormPloshad.btnOkClick(Sender: TObject);
begin
  if Length(edName.Text)<1 then
  begin
    ShowMessage('Необходимо указать Имя');
    ModalResult:=mrNone;
    Exit;
  end;

  FTable.FieldByName('NAME').Value:=edName.Text;
  FTable.FieldByName('REGION').Value:=edRaion.Text;
  FTable.FieldByName('START_DATE').Value:=dtNachalo.Date;
  FTable.FieldByName('COMMENT').Value:=edComment.Text;
  FTable.Post;
end;

procedure TFormPloshad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FTable.ReadOnly:=True;
end;

procedure TFormPloshad.btnCancelClick(Sender: TObject);
begin
  FTable.Cancel;
end;

procedure TFormPloshad.show(tbl: TZTable; create: boolean);
begin
  Self.FTable:=tbl;
  FTable.ReadOnly:=False;
  if not FTable.CanModify then
    raise Exception.Create('Cant edit table '+FTable.Name);
  if (create) then
  begin
    edName.Text:='';
    edRaion.Text:='';
    dtNachalo.Date:=Now();
    edComment.Text:='';

    FTable.Insert();
    FTable.Edit;
  end else
  begin
    edName.Text:=VarToStr(FTable.FieldByName('NAME').Value);
    edRaion.Text:=VarToStr(FTable.FieldByName('REGION').Value);
    if FTable.FieldByName('START_DATE').Value=Null then
      dtNachalo.Date:=Now()
    else
      dtNachalo.Date:=VarToDateTime(FTable.FieldByName('START_DATE').Value);
    edComment.Text:=VarToStr(FTable.FieldByName('COMMENT').Value);
    FTable.Edit;
  end;
  showModal;
end;

end.
