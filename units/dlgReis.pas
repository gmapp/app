unit dlgReis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, Vcl.ComCtrls;

type
  TFormReis = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    edFile: TLabeledEdit;
    edOperator: TLabeledEdit;
    edPribor: TLabeledEdit;
    dtDate: TDateTimePicker;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    btnSelectFile: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSelectFileClick(Sender: TObject);
  private
    FTable: TZTable;
    FFilename: String;
    FInitialDir: String;
  public
    procedure show(tbl: TZTable; create: boolean);
    property Filename: String read FFilename;
    property InitialDir: String read FInitialDir;
  end;

var
  FormReis: TFormReis;

implementation

{$R *.dfm}

uses MainUnit, Data.DB, Database;

procedure TFormReis.btnOkClick(Sender: TObject);
var
  id, num: Integer;
  name: String;
  idField:TField;
  aDate: TDate;
begin
  if Length(edOperator.Text)<1 then
  begin
    ShowMessage('Необходимо указать Оператора');
    ModalResult:=mrNone;
    Exit;
  end;

  if Length(FFilename)<1 then
  begin
    ShowMessage('Необходимо указать файл');
    ModalResult:=mrNone;
    Exit;
  end;

  try
    num:=StrToInt(edPribor.Text);
  except
    on E:Exception do
      begin
        ShowMessage('Введите номер прибора');
        Exit;
      end;
  end;

  aDate:=dtDate.Date;
  idField:=FTable.FieldByName('ID');
  if (idField<>nil) AND (NOT idField.IsNull) then
  begin
    if (FTable.ReadOnly) then FTable.ReadOnly:=False;
    FTable.Edit;

    FTable.FieldByName('OPERATOR').Value:=edOperator.Text;
    FTable.FieldByName('NOMER_PRIBORA').Value:=edPribor.Text;
    FTable.FieldByName('DATE_IZMERENIA').Value:=aDate;
    FTable.FieldByName('FILE').Value:=edFile.Text;
    FTable.FieldByName('FK_PLOSHAD_ID').Value:=FormMain.PloshadId;
    FTable.Post;
    id:=idField.Value;
  end else
  begin
    id:=FormDatabase.insertReisRecord(edOperator.Text, edFile.Text, aDate, num, FormMain.PloshadId);
  end;

  name:=edPribor.Text;
  FormMain.selectReis(id, name);
  Hide;
  FormMain.loadFile(id, aDate, FFileName);
end;

procedure TFormReis.btnSelectFileClick(Sender: TObject);
begin
  OpenDialog1.Filter:='txt-files|*.txt|All Files|*.*';
  OpenDialog1.FilterIndex := 1;
  if FInitialDir='' then
    FInitialDir:=ExtractFilePath(Application.ExeName);
  OpenDialog1.InitialDir:=FInitialDir;
  if OpenDialog1.Execute then
  begin
    if FileExists(OpenDialog1.FileName) then
    begin
      edFile.Text:=OpenDialog1.FileName;
      FFilename:=OpenDialog1.FileName;
    end else
     raise Exception.Create('Файл не существует '+OpenDialog1.FileName);
  end;
end;

procedure TFormReis.btnCancelClick(Sender: TObject);
begin
  FTable.Cancel;
end;

procedure TFormReis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //FTable.ReadOnly:=True;
end;

procedure TFormReis.show(tbl: TZTable; create: boolean);
begin
  FFilename:='';
  Self.FTable:=tbl;
  FTable.ReadOnly:=False;
  if not FTable.CanModify then
    raise Exception.Create('Cant edit table '+FTable.Name);
  if (create) then
  begin
    edOperator.Text:='';
    edPribor.Text:='';
    dtDate.Date:=Now();
    edFile.Text:='';

    FTable.Insert();
    FTable.Edit;
  end else
  begin
    edOperator.Text:=VarToStr(FTable.FieldByName('OPERATOR').Value);
    edPribor.Text:=VarToStr(FTable.FieldByName('NOMER_PRIBORA').Value);
    if FTable.FieldByName('DATE_IZMERENIA').Value=Null then
      dtDate.Date:=Now()
    else
      dtDate.Date:=VarToDateTime(FTable.FieldByName('DATE_IZMERENIA').Value);
    //edFile.Text:=VarToStr(FTable.FieldByName('FILE').Value);
    FTable.Edit;
  end;
  showModal;
end;

end.
