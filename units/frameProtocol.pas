unit frameProtocol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Database, Vcl.ExtCtrls;

type
  TProtocolFrame = class(TFrame)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    GridPanel1: TGridPanel;
    lbl0punktCaption: TLabel;
    lblCoefCaption: TLabel;
    lbl0punkt: TLabel;
    lblCoef: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    lblSerNumCaption: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnProcess: TButton;
    btnSave: TButton;
    lblSerNum: TLabel;
  private
  public
  end;

implementation

{$R *.dfm}

end.
