unit frameProtocol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Database;

type
  TProtocolFrame = class(TFrame)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
  public
  end;

implementation

{$R *.dfm}

end.
