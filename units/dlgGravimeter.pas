unit dlgGravimeter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, Vcl.ComCtrls;

type
  TFormGravimeter = class(TForm)
    leNum: TLabeledEdit;
    leC: TLabeledEdit;
    btnOk: TButton;
    btnCancel: TButton;
    leComment: TLabeledEdit;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FTable: TZTable;
  public
    procedure show(tbl: TZTable; create: boolean);
    procedure clear;
    procedure open;
  end;

var
  FormGravimeter: TFormGravimeter;

implementation

{$R *.dfm}

uses Database;

procedure TFormGravimeter.btnOkClick(Sender: TObject);
var
  num: Integer;
  c: Double;
begin
  if Length(leNum.Text)<1 then
  begin
    ShowMessage('Необходимо указать номер прибора');
    ModalResult:=mrNone;
    Exit;
  end;

  if Length(leC.Text)<1 then
  begin
    ShowMessage('Необходимо указать цену деления');
    ModalResult:=mrNone;
    Exit;
  end;

  num:=StrToInt(leNum.Text);
  c:=StrToFloat(leC.Text);
  FormDatabase.setGravimeter(num,c,leComment.Text);
end;

procedure TFormGravimeter.clear;
begin
  leNum.Text:='';
  leC.Text:='';
  leComment.Text:='';
end;

procedure TFormGravimeter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FTable.ReadOnly:=True;
end;

procedure TFormGravimeter.open;
begin
  clear();
  ShowModal;
end;

procedure TFormGravimeter.btnCancelClick(Sender: TObject);
begin
  FTable.Cancel;
end;

procedure TFormGravimeter.show(tbl: TZTable; create: boolean);
begin
  Self.FTable:=tbl;
  FTable.ReadOnly:=False;
  if not FTable.CanModify then
    raise Exception.Create('Cant edit table '+FTable.Name);
  if (create) then
  begin
    clear;

    FTable.Insert();
    FTable.Edit;
  end else
  begin
    leNum.Text:=VarToStr(FTable.FieldByName('NUM').Value);
    leC.Text:=VarToStr(FTable.FieldByName('C').Value);
    leComment.Text:=VarToStr(FTable.FieldByName('COMMENT').Value);
    FTable.Edit;
  end;
  showModal;
end;

end.
