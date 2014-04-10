unit frameProtocol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Database, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TProtocolListFrame = class(TFrame)
    Label2: TLabel;
    lblSerialCaption: TLabel;
    lblDateCaption: TLabel;
    lblDlinaCaption: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    btnProcess: TButton;
    btnSave: TButton;
    Label1: TLabel;
    lblSerial: TLabel;
    lblDate: TLabel;
    lblDlina: TLabel;
    lblCCaption: TLabel;
    lblC: TLabel;
    lblOperatorCaption: TLabel;
    lblOperator: TLabel;
    lblPunktCaption: TLabel;
    lblPunkt: TLabel;
    lblDriftCaption: TLabel;
    lblDrift: TLabel;
    chbPunkt: TDBCheckBox;
    ProgressBar1: TProgressBar;
    linkC: TLinkLabel;
    chbBrack: TDBCheckBox;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure chbPunktClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnProcessClick(Sender: TObject);
    procedure chbPunktMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chbBrackMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chbBrackClick(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
  private
    FOporPunk1: TOporPunkt;
    FOporPunk2: TOporPunkt;

    procedure DrawGridCheckBox(Canvas: TCanvas; Rect: TRect; Checked: boolean);
  public
    procedure open(reis: Integer);
    procedure calc(C: Double);
    procedure reset;
    procedure loadGrav(Reis: TReis; Grav: TGravimeter);
  end;

implementation

{$R *.dfm}

uses MainUnit, System.Generics.Collections, System.Math;

procedure TProtocolListFrame.chbBrackClick(Sender: TObject);
var
  ds: TDataSource;
begin
  OutputDebugString(StringToOleStr('chbBrackClick '+BoolToStr(chbBrack.Checked)));
end;

procedure TProtocolListFrame.chbBrackMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DBGrid1.DataSource.DataSet.Edit;
  chbBrack.Checked:=Not chbBrack.Checked;
  if chbBrack.Checked then
  begin
    DBGrid1.DataSource.DataSet.FieldByName('BRACK').Value:=1;
    DBGrid1.DataSource.DataSet.FieldByName(chbBrack.DataField).Value:=1;
  end else
  begin
    DBGrid1.DataSource.DataSet.FieldByName('BRACK').Value:=0;
    DBGrid1.DataSource.DataSet.FieldByName(chbBrack.DataField).Value:=0;
  end;
  DBGrid1.DataSource.DataSet.Post;
  OutputDebugString(StringToOleStr('chbBrackMouseUp '+BoolToStr(chbBrack.Checked)));
end;

procedure TProtocolListFrame.chbPunktClick(Sender: TObject);
var
  ds: TDataSource;
  id: String;
  value: Boolean;
begin
  OutputDebugString(StringToOleStr('chbPunktClick '+BoolToStr(chbPunkt.Checked)));
  id:=DBGrid1.DataSource.DataSet.FieldByName('ID').AsString;
  value:=chbPunkt.Checked;//DBGrid1.DataSource.DataSet.FieldByName(chbPunkt.DataField).AsBoolean;
  formDatabase.PunktChecks.AddOrSetValue(id, value);

  {if chbPunkt.Checked then
     chbPunkt.Caption := chbPunkt.ValueChecked
  else
     chbPunkt.Caption := chbPunkt.ValueUnChecked;
  }
  //DBGrid1.DataSource.DataSet.FieldByName(chbPunkt.DataField).Value:=chbPunkt.Checked

    {ds:=DataSource1;
  if ds.Enabled then
  begin
    ds.DataSet.Edit;
    ds.DataSet.FieldByName(chbPunkt.DataField).Value:= chbPunkt.Checked;
    ds.DataSet.Post;
  end;}
end;

procedure TProtocolListFrame.chbPunktMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  chbPunkt.Checked:=Not chbPunkt.Checked;
  OutputDebugString(StringToOleStr('chbPunktMouseUp '+BoolToStr(chbPunkt.Checked)));
end;

procedure TProtocolListFrame.DBGrid1CellClick(Column: TColumn);
begin
  if Column.FieldName = chbPunkt.DataField then
  begin
    OutputDebugString(StringToOleStr('DBGrid1CellClick '+BoolToStr(chbPunkt.Checked)));
    Column.Grid.DataSource.DataSet.Edit;
    Column.Field.Value:= not Column.Field.AsBoolean;
    Column.Grid.DataSource.DataSet.Post;
  end;
  if Column.FieldName = chbBrack.DataField then
  begin
    OutputDebugString(StringToOleStr('DBGrid1CellClick '+BoolToStr(chbBrack.Checked)));
    Column.Grid.DataSource.DataSet.Edit;
    Column.Field.Value:= not Column.Field.AsBoolean;
    if (Column.Field.Value) then
      Column.Grid.DataSource.DataSet.FieldByName('BRACK').Value:=1
    else
      Column.Grid.DataSource.DataSet.FieldByName('BRACK').Value:=0;
    Column.Grid.DataSource.DataSet.Post;
  end;
end;

procedure TProtocolListFrame.DBGrid1ColEnter(Sender: TObject);
begin
  OutputDebugString(StringToOleStr('DBGrid1ColEnter'));
end;

procedure TProtocolListFrame.DBGrid1ColExit(Sender: TObject);
begin
  if DBGrid1.SelectedField.FieldName = chbPunkt.DataField then
    chbPunkt.Visible := False;
  if DBGrid1.SelectedField.FieldName = chbBrack.DataField then
    chbBrack.Visible := False;
end;

procedure TProtocolListFrame.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
  brack: Integer;
begin
  if (Column.Grid.DataSource.DataSet.RecordCount>0) then
  begin
    if (gdFocused in State) then
    begin
      if (Column.Field.FieldName = chbPunkt.DataField) then
      begin
       with DBGrid1.Canvas do
        begin
          Brush.Color := clWhite;
          //Font.Style := Font.Style + [fsBold];
          Font.Color := clWhite;

        end;
       DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

       chbPunkt.Left := Rect.Left + DBGrid1.Left + 42;
       chbPunkt.Top := Rect.Top + DBGrid1.top + 3;
       //chbPunkt.Width := Rect.Right - Rect.Left;
       chbPunkt.Height := Rect.Bottom - Rect.Top - 2;

       chbPunkt.Visible := True;
      end
      else if (Column.Field.FieldName = chbBrack.DataField) then
      begin
       with DBGrid1.Canvas do
        begin
          Brush.Color := clWhite;
          //Font.Style := Font.Style + [fsBold];
          Font.Color := clWhite;

        end;
       DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

       chbBrack.Left := Rect.Left + DBGrid1.Left + 8;
       chbBrack.Top := Rect.Top + DBGrid1.top + 3;
       //chbBrack.Width := Rect.Right - Rect.Left;
       chbBrack.Height := Rect.Bottom - Rect.Top - 2;

       chbBrack.Visible := True;

       OutputDebugString(StringToOleStr('chbBrack Checked '+BoolToStr(chbBrack.Checked)));
      end
    end else
    begin
      brack:=Column.Grid.DataSource.DataSet.FieldByName('BRACK').AsInteger;
      if (brack=1) then
         with DBGrid1.Canvas do
          begin
            Brush.Color := clRed;
            //Font.Style := Font.Style + [fsBold];
            Font.Color := clWhite;
          end;
         DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      if (Column.Field.FieldName = chbPunkt.DataField) then
      begin
        DrawRect:=Rect;
        InflateRect(DrawRect,-1,-1);

        DrawState := ISChecked[Column.Field.AsBoolean];

        DBGrid1.Canvas.FillRect(Rect);
        DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
      end
      else if (Column.Field.FieldName = chbBrack.DataField) then
      begin
        DrawRect:=Rect;
        InflateRect(DrawRect,-1,-1);

        if Column.Field.AsBoolean=True then
          DrawState := ISChecked[true]
        else
          DrawState := ISChecked[False];

        //OutputDebugString(StringToOleStr('chbBrack DrawState'+IntToStr(DrawState)));

        DBGrid1.Canvas.FillRect(Rect);
        DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect, DFC_BUTTON, DrawState);
      end;
    end;
  end;
end;

procedure TProtocolListFrame.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = Chr(9)) then Exit;

  if (DBGrid1.SelectedField.FieldName = chbPunkt.DataField) then
  begin
    chbPunkt.SetFocus;
    SendMessage(chbPunkt.Handle, WM_Char, word(Key), 0);
  end;

  if (DBGrid1.SelectedField.FieldName = chbBrack.DataField) then
  begin
    chbBrack.SetFocus;
    SendMessage(chbBrack.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TProtocolListFrame.DrawGridCheckBox(Canvas: TCanvas; Rect: TRect; Checked: boolean);
var
  DrawFlags: Integer;
begin
  {Canvas.TextRect(Rect, Rect.Left + 1, Rect.Top + 1, ' ');
  DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DFCS_BUTTONPUSH or DFCS_ADJUSTRECT);
  DrawFlags := DFCS_BUTTONCHECK or DFCS_ADJUSTRECT;// DFCS_BUTTONCHECK
  if Checked then
    DrawFlags := DrawFlags or DFCS_CHECKED;
  DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DrawFlags);}
end;

procedure TProtocolListFrame.open(reis: Integer);
begin
  reset;

  chbPunkt.DataSource := DataSource1;
  chbPunkt.DataField  := 'PUNKT';
  chbPunkt.Visible    := False;
  chbPunkt.Color      := DBGrid1.Color;
  chbPunkt.Caption    := '';

  //explained later in the article
  chbPunkt.ValueChecked := '';
  chbPunkt.ValueUnChecked := '';

  chbBrack.DataSource := DataSource1;
  chbBrack.DataField  := 'BRACK_CALC';
  chbBrack.Visible    := False;
  chbBrack.Color      := DBGrid1.Color;
  chbBrack.Caption    := '';

  chbBrack.ValueChecked := '';
  chbBrack.ValueUnChecked := '';

  formDatabase.PunktChecks.Clear;
  formDatabase.ZTableProtocol.Active:=False;

  formDatabase.ZTableProtocol.Filter:='FK_REIS='+IntToStr(reis);
    formDatabase.ZTableProtocol.Filtered:=True;
  formDatabase.ZTableProtocol.Active:=True;
  DataSource1.Enabled:=true;
end;

procedure TProtocolListFrame.btnProcessClick(Sender: TObject);
var
  C: Double;
begin
  C:=FormMain.Grav.c;//0.99992;//1.00027;
  calc(C);
end;

procedure TProtocolListFrame.calc(C: Double);
var
  ds: TDataSet;
  opZ1, opZ2: Double;
  i, p, opCount: Integer;
  dic: TDictionary<String, Boolean>;
  arr: TArray<TPair<String, Boolean>>;
  opX1, opX2, X, G: Double;
  opS1, opS2, S: Integer;
  F, Q: Double;
  id, opId1, opId2: String;
  brack: Integer;
  Key1, Key2: String;
begin
  dic:=FormDatabase.PunktChecks;
  arr:=dic.ToArray;

  opCount:=0;
  for i := 0 to dic.Count-1 do
  begin
    if (arr[i].Key<>'') and (arr[i].Value) then
    begin
      INC(opCount);
      if (opCount=1) then Key1:=arr[i].Key
      else if (opCount=2) then Key2:=arr[i].Key;
    end;
  end;

  if (opCount<2) then
  begin
    ShowMessage('Выберите два опорных пункта!');
    Exit;
  end;


  formDatabase.getOporPunktByProtocol(Key1, FormMain.PloshadId, FOporPunk1);
  formDatabase.getOporPunktByProtocol(Key2, FormMain.PloshadId, FOporPunk2);
  if FOporPunk1.id<=0 then
  begin
    ShowMessage('Ошибка! Нет данных по первому опорному пункту, требуется настройка!');
    Exit;
  end;
  if FOporPunk2.id<=0 then
  begin
    ShowMessage('Ошибка! Нет данных по второму опорному пункту, требуется настройка!');
    Exit;
  end;
  opZ1:=FOporPunk1.grav;
  opZ2:=FOporPunk2.grav;

  try
    ds:=DataSource1.DataSet;
    ds.DisableControls;
    ProgressBar1.Min:=0;
    ProgressBar1.Max:=ds.RecordCount;
    p:=0;
    opCount:=0;
    try
      ds.First;
      while (not ds.Eof) do
      begin
        INC(p);
        id:=ds.FieldByName('ID').AsString;
        if (dic.ContainsKey(id) AND dic.Items[id]) then
        begin
          if (opCount=0) then
          begin
            opId1:=id;
            opX1:=ds.FieldByName('GRAV').AsFloat;
            opS1:=FormDatabase.getSeconds;
            ds.Edit;
            ds.FieldByName('G').AsFloat:=opZ1;
            ds.Post;
          end
          else if (opCount=1) then
          begin
            opId2:=id;
            opX2:=ds.FieldByName('GRAV').AsFloat;
            opS2:=FormDatabase.getSeconds;
            ds.Edit;
            ds.FieldByName('G').AsFloat:=opZ2;
            ds.Post;
          end;
          INC(opCount);
        end;

        //ds.Edit;
        //ds.FieldByName('G').AsFloat:=1;
        //ds.Post;

        ds.Next;
        ProgressBar1.Position:=p;
        Application.ProcessMessages;
      end;

      F:=(opX2-opX1)*C+(opZ1-opZ2);
      //F:=RoundTo(F, -4);
      //Q:=RoundTo(F/(opS2-opS1), -4);
      Q:=F/(opS2-opS1);
      lblPunkt.Caption:=FloatToStr(F);
      lblDrift.Caption:=FloatToStr(Q);
      lblc.Caption:=FloatToStr(C);

      p:=0;
      ProgressBar1.Position:=p;
      ds.First;
      while (not ds.Eof) do
      begin
        id:=ds.FieldByName('ID').AsString;
        brack:=ds.FieldByName('BRACK').AsInteger;

        INC(p);

        if (brack<>1) then
        begin
          ds.Edit;

          if (id<>opId1) AND (id<>opId2) then
          begin
            X:=ds.FieldByName('GRAV').AsFloat;
            S:=FormDatabase.getSeconds;

            G:=C*(X-opX1)-(Q*(S-opS1))+opZ1;
            ds.FieldByName('G').AsFloat:=RoundTo(G, -4);
          end;

          ds.Post;
        end;
        ds.Next;
        ProgressBar1.Position:=p;
        Application.ProcessMessages;
      end;
      ds.First;
    finally
      ds.EnableControls;
    end;
    FormDatabase.calcControl(FormMain.PloshadId, FormMain.Reis);
  except
    On E: Exception do
      OutputDebugString(StringToOleStr(E.Message));
  end;
end;

procedure TProtocolListFrame.reset;
begin
  lblSerial.Caption:='';
  lblDate.Caption:='';
  lblDlina.Caption:='';

  lblC.Caption:='';
  lblOperator.Caption:='';

  lblPunkt.Caption:='';
  lblDrift.Caption:='';
end;

procedure TProtocolListFrame.loadGrav(Reis: TReis; Grav: TGravimeter);
begin
  lblSerial.Caption:=IntToStr(Grav.num);
  lblC.Caption:=FloatToStr(Grav.c);
  lblDate.Caption:=DateToStr(Reis.date);
  lblOperator.Caption:=Reis.oper;
end;

end.
