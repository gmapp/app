unit frmStatistics;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, ZAbstractTable;

type
  TFormStatistics = class(TForm)
    btnPrint: TButton;
    btnClose: TButton;
    Panel1: TPanel;
    Label4: TLabel;
    GridPanel1: TGridPanel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblEnd: TLabel;
    lblComment: TLabel;
    ZQuery1: TZQuery;
    tblPloshad: TZTable;
    DBText1: TDBText;
    dsPloshad: TDataSource;
    tblPloshadID: TIntegerField;
    tblPloshadNAME: TWideStringField;
    tblPloshadREGION: TWideStringField;
    tblPloshadSTART_DATE: TDateField;
    tblPloshadCOMMENT: TWideStringField;
    DBText2: TDBText;
    DBText3: TDBText;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure open;
  end;

var
  FormStatistics: TFormStatistics;

implementation

{$R *.dfm}

uses Database, MainUnit;

procedure TFormStatistics.btnCloseClick(Sender: TObject);
begin
  Close();
end;

procedure TFormStatistics.open;
begin
  tblPloshad.Filter := 'FK_PLOSHAD_ID='+IntToStr(FormMain.PloshadId);
  tblPloshad.Filtered:=True;
  if (tblPloshad.Active) then
  begin
    dsPloshad.DataSet.Refresh;
  end else
  begin
    tblPloshad.Open;
  end;
  ShowModal
end;

end.
