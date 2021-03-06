unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ZAbstractConnection,
  ZConnection, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, frameProtocol,
  framePloshad, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, frameOporPunkt,
  frameReis, Database;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    p1: TMenuItem;
    p2: TMenuItem;
    p3: TMenuItem;
    p4: TMenuItem;
    p5: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    Panel1: TPanel;
    actListMain: TActionList;
    actOporPunktTable: TAction;
    actOporPunktAdd: TAction;
    OporpunktFrame1: TOporpunktListFrame;
    actReisEnter: TAction;
    actReisEdit: TAction;
    actPlohadAdd: TAction;
    actPloshadOpen: TAction;
    actGravimeter: TAction;
    ProtocolFrame1: TProtocolListFrame;
    linkPloshad: TLinkLabel;
    FlowPanel1: TFlowPanel;
    linkReis: TLinkLabel;
    ReisFrame1: TReisListFrame;
    actControl: TAction;
    actCatalog: TAction;
    actBackup: TAction;
    actImportTopograph: TAction;
    OpenDialog1: TOpenDialog;
    actControlOpor: TAction;
    N19: TMenuItem;
    N20: TMenuItem;
    actStat: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N17Click(Sender: TObject);
    procedure actOporPunktTableExecute(Sender: TObject);
    procedure actReisEditExecute(Sender: TObject);
    procedure actPlohadAddExecute(Sender: TObject);
    procedure actPloshadOpenExecute(Sender: TObject);
    procedure actGravimeterExecute(Sender: TObject);
    procedure actReisEnterExecute(Sender: TObject);
    procedure linkPloshadLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure linkReisLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure actOporPunktAddExecute(Sender: TObject);
    procedure actControlExecute(Sender: TObject);
    procedure actCatalogUpdate(Sender: TObject);
    procedure actCatalogExecute(Sender: TObject);
    procedure actBackupExecute(Sender: TObject);
    procedure actImportTopographUpdate(Sender: TObject);
    procedure actImportTopographExecute(Sender: TObject);
    procedure actControlOporExecute(Sender: TObject);
    procedure actStatExecute(Sender: TObject);
  private
    FPloshadId: Integer;
    FPloshad: String;
    FReis: TReis;
    FGrav: TGravimeter;
    //FOporPunk1: TOporPunkt;
    //FOporPunk2: TOporPunkt;

    FInitialDir: String;

    procedure switchFrame(showProtocol: Boolean);

    procedure updateMainLabel;
  public
    procedure selectPloshad(id: Integer; name: String);
    procedure selectReis(id: Integer; name: String);

    procedure loadFile(id: Integer; aDate: TDate; filename: String);

    property PloshadId: Integer read FPloshadId;
    property Reis: TReis read FReis;
    property Grav: TGravimeter read FGrav;
    //property OporPunk1: TOporPunkt read FOporPunk1;
    //property OporPunk2: TOporPunkt read FOporPunk2;

    function StringToDate(str: String): TDate;

    procedure log(msg: String);

    procedure importTopograph(filename: String);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses dlgPloshad,System.StrUtils, System.DateUtils, frmProtocol, dlgGravimeter, frmPloshad,
  frmControl, frmGravimeter, frmCatalog, frmStatistics;

procedure TFormMain.log(msg: String);
begin
  OutputDebugString(StringToOleStr(msg));
end;

procedure TFormMain.N17Click(Sender: TObject);
begin
  //todo
end;

procedure TFormMain.N9Click(Sender: TObject);
begin
  Close;
end;

function TFormMain.StringToDate(str: String): TDate;
	var
		//FormatSettings: TFormatSettings;
    sl:TStringList;
    d: TDate;
    myYear, myMonth, myDay : Word;
	begin
    sl := TStringList.Create;
    try
      sl.Delimiter     := '/';
      sl.DelimitedText := str;
      myYear:=StrToInt(sl.Strings[0]);
      myMonth:=StrToInt(sl.Strings[1]);
      myDay:=StrToInt(sl.Strings[2]);
      d:=EncodeDate(myYear, myMonth, myDay);
      Result:=d;
    finally
      FreeAndNil(sl);
    end;
		{GetLocaleFormatSettings(SysLocale.DefaultLCID, FormatSettings);
		FormatSettings.ShortDateFormat := 'yyyy/mm/d';
		FormatSettings.TimeSeparator := ':';
		Result := StrToDate(str, FormatSettings);}
	end;

procedure checkMenuItems(item: TMenuItem);
var
  i: Integer;
  subItem: TMenuItem;
begin
  for i:=0 to item.Count-1 do
  begin
    subItem:=item.Items[i];
    if (subItem.Count=0) AND (subItem.Action=nil) AND Not Assigned(subItem.OnClick) then
      subItem.Enabled:=False;
  end;
end;

procedure TFormMain.actBackupExecute(Sender: TObject);
begin
  //FormDatabase.backup('/backups');
end;

procedure TFormMain.actCatalogExecute(Sender: TObject);
begin
  FormCatalog.open;
end;

procedure TFormMain.actCatalogUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:=FPloshad<>'';
end;

procedure TFormMain.actControlExecute(Sender: TObject);
begin
  FormControl.Open;
end;

procedure TFormMain.actControlOporExecute(Sender: TObject);
begin
  FormControl.Open(True);
end;

procedure TFormMain.actGravimeterExecute(Sender: TObject);
begin
  FormGravimeterList.open;
  //FormGravimeter.open;
end;

procedure TFormMain.actImportTopographExecute(Sender: TObject);
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
      importTopograph(OpenDialog1.FileName);
    end else
     raise Exception.Create('���� �� ���������� '+OpenDialog1.FileName);
  end;
end;

procedure TFormMain.importTopograph(filename: String);
var
  myFile : TextFile;
  text, tmp : string;
  pwc: PWideChar;
  arr: array of TVarRec;
  list:TStringList;
  i, amount, p, amountSkip: Integer;
  ds: TZTable;
begin
  AssignFile(myFile, filename);
  Reset(myFile);
  list := TStringList.create;
  list.StrictDelimiter := false;
  list.Delimiter := #9; //TAB
  amount:=0;
  amountSkip:=0;
  try
    ds:=FormDatabase.dsTopograph;
    ds.Active:=True;
    ds.DisableControls;
    try
      FormDatabase.clearTopograph(FPloshadId);
      ds.Refresh;
    finally
      ds.EnableControls
    end;

    ds.DisableControls;
    try
      while not Eof(myFile) do
      begin
        ReadLn(myFile, text);

        if (Length(text)>0) AND Not AnsiStartsStr('/', text) then
        begin
          log((text));
          try
            text:=ReplaceStr(text,'.',',');

            list.DelimitedText:=text;

            if list.Count<5 then
            begin
              log(('ignore short line '+text));
              continue;
            end;
            if list[2]='X' then
              continue;

            Setlength(arr, list.Count+1);
            arr[0].VInteger:=0;
            for i := 0 to list.Count-1 do
              arr[i+1].VAnsiString:=PAnsiString(list[i]);
            FormDatabase.insertTopographRecord(FPloshadId, list);
            INC(amount);
          except
            on E:Exception do
              begin
                log('Error '+E.Message+' on process line '+text)
              end;
          end;
          Application.ProcessMessages;
        end;
        //FormDatabase.ZTableProtocol.ApplyUpdates;
      end;
    finally
      ds.EnableControls
    end;
    ds.First;
    ds.Refresh;
    if (amount<1) then
      ShowMessage('������! ������ �� �������� ���� �� �������.')
    else
      ShowMessage('�������� ���������: '+IntToStr(amount)+' (�� '+IntToStr(amountSkip)+')');
  finally
    CloseFile(myFile);
    FreeAndNil(list);
  end;
end;

procedure TFormMain.actImportTopographUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:=FPloshad<>'';
end;

procedure TFormMain.actOporPunktAddExecute(Sender: TObject);
begin
  OporpunktFrame1.Visible:=True;
  OporpunktFrame1.BringToFront;
  OporpunktFrame1.add;
end;

procedure TFormMain.actOporPunktTableExecute(Sender: TObject);
begin
  OporpunktFrame1.Visible:=True;
  OporpunktFrame1.BringToFront;
  OporpunktFrame1.open;
end;

procedure TFormMain.actPlohadAddExecute(Sender: TObject);
begin
  FormPloshadList.add;
end;

procedure TFormMain.actPloshadOpenExecute(Sender: TObject);
begin
  {TODO move it to reis load
  if (FReis.id<=0) then
  begin
    ShowMessage('������! ����� ��������� ������ ������� ����!');
    Exit;
  end;}
  FormPloshadList.open
end;

procedure TFormMain.actReisEditExecute(Sender: TObject);
begin
  ReisFrame1.Visible:=True;
  ReisFrame1.BringToFront;
  ReisFrame1.open;
end;

procedure TFormMain.actReisEnterExecute(Sender: TObject);
begin
  ReisFrame1.Visible:=True;
  ReisFrame1.BringToFront;
  ReisFrame1.add;
end;

procedure TFormMain.actStatExecute(Sender: TObject);
begin
  FormStatistics.open;
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (MessageDlg('�������, ��� ������ ������� ���������?',
									mtConfirmation, [mbYes, mbNo], mrNo) = mrYes) then
	begin
    CanClose:=True;
  end else
  begin
    CanClose:=False;
  end;
end;

procedure TFormMain.switchFrame(showProtocol: Boolean);
begin
  ProtocolFrame1.Visible:=showProtocol;
  updateMainLabel;
  if ProtocolFrame1.Visible then
  begin
    ProtocolFrame1.BringToFront;
    ProtocolFrame1.open(FReis.id);
  end;
  //else PloshadFrame1.open;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  i: Integer;
  item: TMenuItem;
begin
  FPloshad:='';
  switchFrame(false);
  for i:=0 to MainMenu1.Items.Count-1 do
  begin
    item:=MainMenu1.Items[i];
    if (item.Count>0) then
      checkMenuItems(item)
    //else if (item.Action=nil) AND Not Assigned(item.OnClick) then
    //  item.Enabled:=False;
  end;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  if ProtocolFrame1.Visible then ProtocolFrame1.open(1)
  else FormPloshadList.Open;
end;

procedure TFormMain.linkPloshadLinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  FormPloshadList.open;
end;

procedure TFormMain.linkReisLinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  actReisEdit.Execute;
  //FormReisList.open;
end;

procedure TFormMain.loadFile(id: Integer; aDate: TDate; filename: String);
var
  myFile : TextFile;
  text, tmp : string;
  pwc: PWideChar;
  arr: array of TVarRec;
  list:TStringList;
  i, amount, p, amountSkip: Integer;
  protocolDate: TDate;
  ds: TZTable;
begin
  if (FReis.id<=0) then
  begin
    ShowMessage('������! ����� ��������� ������ ������� ����!');
    Exit;
  end;

  AssignFile(myFile, filename);
  Reset(myFile);
  list := TStringList.create;
  list.StrictDelimiter := false;
  list.Delimiter := #9; //TAB
  amount:=0;
  amountSkip:=0;
  try
    ds:=FormDatabase.ZTableProtocol;
    ds.Active:=True;

    ds.DisableControls;
    try
      FormDatabase.clearProtocol(FReis.id);
      ds.Refresh;
    finally
      ds.EnableControls
    end;

    ds.DisableControls;
    try
      while not Eof(myFile) do
      begin
        ReadLn(myFile, text);

        if (AnsiStartsStr('/', text)) then
        begin
          p:=Pos('Date:', text);
          if (p>0) then
          begin
            tmp:=Copy(text, p+6);
            tmp:=Trim(tmp);
            tmp:=ReplaceStr(tmp,#9,'');
            //tmp:=ReplaceStr(tmp,' ','');
            protocolDate:=StringToDate(tmp);
          end;

        end;

        if CompareDate(protocolDate,aDate)<>0 then
        begin
          INC(amountSkip);
          Application.ProcessMessages;
          Continue;
        end;

        if (Length(text)>0) AND Not AnsiStartsStr('/', text) then
        begin
          log((text));
          try
            text:=ReplaceStr(text,'.',',');

            list.DelimitedText:=text;

            if list.Count<10 then
            begin
              log(('ignore short line '+text));
              continue;
            end;

            Setlength(arr, list.Count+1);
            arr[0].VInteger:=0;
            for i := 0 to list.Count-1 do
              arr[i+1].VAnsiString:=PAnsiString(list[i]);
            //FormDatabase.ZTable1.InsertRecord(arr);
            //FormDatabase.ZTable1.AppendRecord(arr);
            FormDatabase.insertProtocolRecord(FReis.id, protocolDate, list);
            INC(amount);
          except
            on E:Exception do
              begin
                log('Error '+E.Message+' on process line '+text)
              end;
          end;
          Application.ProcessMessages;
        end;
        //FormDatabase.ZTableProtocol.ApplyUpdates;
      end;
    finally
      ds.EnableControls
    end;
    ds.First;
    ds.Refresh;
    if (amount<1) then
      ShowMessage('������! ������ �� �������� ���� �� �������.')
    else
      ShowMessage('�������� ���������: '+IntToStr(amount)+' (�� '+IntToStr(amountSkip)+')');
  finally
    CloseFile(myFile);
    FreeAndNil(list);
  end;
end;

procedure TFormMain.selectPloshad(id: Integer; name: String);
begin
  FPloshad:=name;
  FPloshadId:=Id;
  FormPloshadList.Hide;
  switchFrame(true);
  if (FReis.id>0) then
  begin
    FReis.id:=0;
    FReis.oper:='';
    FReis.num:=0;
  end;
  updateMainLabel;
end;

procedure TFormMain.selectReis(id: Integer; name: String);
begin
  if (FormDatabase.getReis(id, FReis, PloshadId)) then
  begin
    FormDatabase.getGravimeter(FReis.num, PloshadId, FGrav);
  end;
  switchFrame(true);
  updateMainLabel;
end;

procedure TFormMain.updateMainLabel;
begin
  if (FPloshad<>'') then
  begin
    linkPloshad.Caption:='<a href="">�������: '+FPloshad+'</a>';
    linkPloshad.Hint:=FPloshad;
  end
  else linkPloshad.Caption:='<a href="">�������� �������</a>';

  if FReis.id>0 then
  begin
    linkReis.Caption := ' <a href="">����: '+FReis.oper+' '+IntToStr(FReis.num)
      +' '+DateToStr(FReis.date)+'</a>';
    ProtocolFrame1.loadGrav(FReis, FGrav);
  end else
  begin
    linkReis.Caption := ' <a href="">�������� ����</a>';
  end;
end;

end.
