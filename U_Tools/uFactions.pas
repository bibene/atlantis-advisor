unit uFactions;

{$MODE Delphi}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ImgList, DataStructs, StdCtrls, ComCtrls, ExtCtrls, PowerGrid,
  Buttons, ColorBtn, uKeys, Resources, uGameSubs;

const
  GridCols = 4;
  GridHeaders: array[0..GridCols-1] of string = ('Faction', 'Num', 'Attitude',
    'EMail');
  GridFormats: array[0..GridCols-1] of TColFormat = (cfString, cfNumber,
    cfString, cfString);

type
  TFactionForm = class(TForm)
    FactionBox: TGroupBox;
    lUnclaim: TLabel;
    Label2: TLabel;
    DefAttCombo: TComboBox;
    WarNum: TLabel;
    TradeNum: TLabel;
    MagicNum: TLabel;
    MagicTrack: TTrackBar;
    TradeTrack: TTrackBar;
    WarTrack: TTrackBar;
    WarLabel: TLabel;
    TradeLabel: TLabel;
    MagicLabel: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    AttCombo: TComboBox;
    Label4: TLabel;
    Button2: TButton;
    FactionGrid: TPowerGrid;
    ColorDialog: TColorDialog;
    ColorBtn: TColorBtn;
    LeaderBox: TComboBox;
    Label5: TLabel;
    btnRequest: TButton;
    Label6: TLabel;
    cbHideUnconfirmed: TCheckBox;
    btnRequestAll: TButton;
    lAlignment: TLabel;
    cmAlignment: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FactionGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure AttComboChange(Sender: TObject);
    procedure DefAttComboChange(Sender: TObject);
    procedure WarTrackChange(Sender: TObject);
    procedure TradeTrackChange(Sender: TObject);
    procedure MagicTrackChange(Sender: TObject);
    procedure LeaderBoxChange(Sender: TObject);
    procedure ColorBtnClick(Sender: TObject);
    procedure btnRequestClick(Sender: TObject);
    procedure FactionGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      var TxtRect: TRect; State: TGridDrawState);
    procedure cbHideUnconfirmedClick(Sender: TObject);
    procedure btnRequestAllClick(Sender: TObject);
    procedure cmAlignmentChange(Sender: TObject);
  private
    FOrders: string;
    MaxFP: integer;
    function GetWar: integer;
    procedure SetWar(w: integer);
    function GetTrade: integer;
    procedure SetTrade(t: integer);
    function GetMagic: integer;
    procedure SetMagic(m: integer);
    procedure FillFactions;
  public
    property War: integer read GetWar write SetWar;
    property Trade: integer read GetTrade write SetTrade;
    property Magic: integer read GetMagic write SetMagic;
    function GetOrders: string;
  end;

var
  FactionForm: TFactionForm;


implementation

{$R *.lfm}


procedure TFactionForm.FormCreate(Sender: TObject);
var i: integer;
    tarm: boolean;
begin
  tarm := (GameConfig.ReadInteger('Settings', 'Mod', modStandard) = modTarmellion);
  cmAlignment.Visible := tarm;
  lAlignment.Visible := tarm;

  // Setup grid
  for i := 0 to GridCols-1 do begin
    FactionGrid.Cells[i, 0] := GridHeaders[i];
    FactionGrid.Cols[i].Format := GridFormats[i];
  end;

  cbHideUnconfirmed.Checked := Config.ReadBool('Factions', 'HideUnconfirmed',
    False);
  FillFactions;

  FactionBox.Caption := ' ' + Game.VirtTurn.Factions[1].Name +
    ' ('+IntToStr(VFaction.Num)+') ';

  MaxFP := Length(Progress[0]) - 1;
  WarTrack.Max := MaxFP;
  TradeTrack.Max := MaxFP;
  MagicTrack.Max := MaxFP;

  War := VTurn.War;
  Trade := VTurn.Trade;
  Magic := VTurn.Magic;

  if GameConfig.ReadInteger('Settings', 'Mod', modStandard) = modMagicDeep then
    lUnclaim.Caption := 'Unclaimed: ' + IntToStr(VTurn.Unclaimed) +
      ', mana ' + IntToStr(Turn.Mana)
  else lUnclaim.Caption := 'Unclaimed silver: ' + IntToStr(VTurn.Unclaimed);

  DefAttCombo.ItemIndex := VFaction.Attitude - 1;

  // Leader
  for i := 0 to VFaction.Units.Count-1 do
    if VFaction.Units[i].Num > 0 then
      LeaderBox.AddItem(VFaction.Units[i].FullName, VFaction.Units[i]);
  LeaderBox.ItemIndex := LeaderBox.Items.IndexOfObject(FactionLeader);

  cmAlignment.ItemIndex := GameConfig.ReadInteger('Game', 'Alignment', alNeutral);
end;

procedure TFactionForm.FillFactions;
var row, i, j, t: integer;
    ATurn: TTurn;
begin
  FactionGrid.RowCount := 0;
  row := 1;
  for t := Game.Turns.Count-1 downto 0 do begin
    if Game.Turns[t].Num = Game.VirtTurn.Num then ATurn := Game.VirtTurn
    else ATurn := Game.Turns[t];
    with ATurn do
      for i := 0 to Factions.Count-1 do begin
        if cbHideUnconfirmed.Checked and (Factions[i].Data.TurnNum < Turn.Num)
          and (Factions[i].Num <> 0) then Continue;
        j := 1;
        while (j < FactionGrid.RowCount) and (StrToInt(FactionGrid.Cells[1, j])
          <> Factions[i].Num) do Inc(j);
        if j = FactionGrid.RowCount then begin
          FactionGrid.Cells[0, row] := Factions[i].Name;
          FactionGrid.Cells[1, row] := IntToStr(Factions[i].Num);
          if Factions[i].Num <> Faction.Num then begin
            if Factions[i].Attitude > 0 then
              FactionGrid.Cells[2, row] := GetKey(s_Hostile,
                Factions[i].Attitude - 1)
            else FactionGrid.Cells[2, row] := GetKey(s_Hostile,
              Faction.Attitude - 1);
          end;
          FactionGrid.Cells[3, row] := Factions[i].Data.EMail;
          FactionGrid.Rows[row].Data := Factions[i];
          FactionGrid.Rows[row].Color := FactionColor(Factions[i]);
          Inc(row);
        end;
      end;
  end;
  FactionGrid.Fixup;
end;

function TFactionForm.GetOrders: string;
begin
  Result := FOrders;
  if (War <> VTurn.War) or (Trade <> VTurn.Trade) or (Magic <> VTurn.Magic) then begin
    Result := Result + 'faction war ' + IntToStr(War) +
      ' trade ' + IntToStr(Trade) + ' magic ' + IntToStr(Magic);
  end;
end;

function AmountStr(s: string; amt: integer): string;
begin
  if amt <> 1 then Result := IntToStr(amt) + ' ' + s + 's'
  else Result := IntToStr(amt) + ' ' + s;
end;

function TFactionForm.GetWar: integer;
begin
  GetWar := WarTrack.Position;
end;

procedure TFactionForm.SetWar(w: integer);
begin
  WarTrack.Position := w;
  WarNum.Caption := AmountStr('Region', Progress[prWar, w]);
end;

function TFactionForm.GetTrade: integer;
begin
  GetTrade := TradeTrack.Position;
end;

procedure TFactionForm.SetTrade(t: integer);
begin
  TradeTrack.Position := t;
  TradeNum.Caption := AmountStr('Region', Progress[prTrade, t]);
end;

function TFactionForm.GetMagic: integer;
begin
  GetMagic := MagicTrack.Position;
end;

procedure TFactionForm.SetMagic(m: integer);
begin
  MagicTrack.Position := m;
  MagicNum.Caption := AmountStr('Mage', Progress[prMagic, m]);
end;

procedure TFactionForm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFactionForm.FactionGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var Fac: TFaction;
begin
  Fac := TFaction(FactionGrid.ImgRows[ARow].Data);
  btnRequest.Enabled := not Fac.Data.Requested and (Fac.Num > 2);
  if Fac.Data.ColorIndex = 0 then ColorBtn.Color := -1
  else ColorBtn.Color := FactionColor(Fac);
  if Fac.Attitude > 0 then AttCombo.ItemIndex := Fac.Attitude - 1
  else AttCombo.ItemIndex := Faction.Attitude - 1;
  if (Fac.Num = VFaction.Num) or (Fac.Num = 0) then begin
    AttCombo.ItemIndex := -1;
    AttCombo.Enabled := FALSE;
  end
  else AttCombo.Enabled := TRUE;
end;

procedure TFactionForm.AttComboChange(Sender: TObject);
var Fac: TFaction;
begin
  Fac := VTurn.Factions.Seek(TFaction(FactionGrid.ImgRows[FactionGrid.Row].Data).Num);
  Fac.Name := TFaction(FactionGrid.ImgRows[FactionGrid.Row].Data).Name;
  if AttCombo.ItemIndex + 1 = VFaction.Attitude then begin
    FOrders := FOrders + 'declare ' + IntToStr(Fac.Num) + #13#10;
    Fac.Attitude := 0;
  end
  else begin
    FOrders := FOrders + 'declare ' + IntToStr(Fac.Num) + ' ' +
      GetKey(s_Hostile, AttCombo.ItemIndex) + #13#10;
    Fac.Attitude := AttCombo.ItemIndex + 1;
  end;
  FactionGrid.ImgRows[FactionGrid.Row].Color := FactionColor(Fac);
  FactionGrid.ImgCells[2, FactionGrid.Row] := GetKey(s_Hostile,
    AttCombo.ItemIndex);
  FactionGrid.Fixup;
end;

procedure TFactionForm.DefAttComboChange(Sender: TObject);
var i: integer;
begin
  FOrders := FOrders + 'declare default ' + GetKey(s_Hostile,
    DefAttCombo.ItemIndex) + #13#10;
  VFaction.Attitude := DefAttCombo.ItemIndex + 1;
  for i := 1 to FactionGrid.RowCount-1 do begin
    if TFaction(FactionGrid.Rows[i].Data).Attitude <= 0 then begin
      FactionGrid.Cells[2, i] := GetKey(s_Hostile, DefAttCombo.ItemIndex);
      TFaction(FactionGrid.Rows[i].Data).Attitude := 0;
    end;
    FactionGrid.Rows[i].Color := FactionColor(TFaction(FactionGrid.Rows[i].Data));
  end;
  FactionGrid.Fixup;
end;

procedure TFactionForm.WarTrackChange(Sender: TObject);
begin
  War := WarTrack.Position;
  if War + Trade + Magic > MaxFP then begin
    if Trade > 0 then Trade := Trade - 1;
    if War + Trade + Magic > MaxFP then Magic := Magic - 1;
  end;
end;

procedure TFactionForm.TradeTrackChange(Sender: TObject);
begin
  Trade := TradeTrack.Position;
  if War + Trade + Magic > MaxFP then begin
    if War > 0 then War := War - 1;
    if War + Trade + Magic > MaxFP then
      Magic := Magic - 1;
  end;
end;

procedure TFactionForm.MagicTrackChange(Sender: TObject);
begin
  Magic := MagicTrack.Position;
  if War + Trade + Magic > MaxFP then begin
    if War > 0 then War := War - 1;
    if War + Trade + Magic > MaxFP then
      Trade := Trade - 1;
  end;
end;

procedure TFactionForm.LeaderBoxChange(Sender: TObject);
begin
  if LeaderBox.ItemIndex = -1 then Exit;
  GameConfig.WriteInteger('Game', 'Leader',
    TUnit(LeaderBox.Items.Objects[LeaderBox.ItemIndex]).Num);
end;

procedure TFactionForm.ColorBtnClick(Sender: TObject);
var Fac: TFaction;
begin
  Fac := TFaction(FactionGrid.ImgRows[FactionGrid.Row].Data);
  if ColorBtn.Color >= 0 then
    Fac.Data.ColorIndex := SeekColorExtra(ColorBtn.Color)
  else Fac.Data.ColorIndex := 0;
  FactionGrid.ImgRows[FactionGrid.Row].Color := FactionColor(Fac);
end;

procedure TFactionForm.btnRequestClick(Sender: TObject);
var Fac: TFaction;
begin
  Fac := TFaction(FactionGrid.ImgRows[FactionGrid.Row].Data);
  Fac.Data.Requested := True;
  btnRequest.Enabled := False;
  FOrders := FOrders + 'find ' + IntToStr(Fac.Num) + #13#10;
end;

procedure TFactionForm.btnRequestAllClick(Sender: TObject);
begin
  FOrders := FOrders + 'find all' + #13#10;
end;

procedure TFactionForm.FactionGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; var TxtRect: TRect; State: TGridDrawState);
var FData: TFactionData;
begin
  with TPowerGrid(Sender) do
    if (ACol = 3) and (ARow > 0) then begin
      FData := TFaction(ImgRows[ARow].Data).Data;
      if (FData.TurnNum < Turn.Num) and (FData.EMail <> '') then begin
        ResForm.Extras.Draw(Canvas, TxtRect.Right - 8, TxtRect.Top + 1,
           bmp_extUnknown);
        Dec(TxtRect.Right, 10);
      end;
    end;
end;

procedure TFactionForm.cbHideUnconfirmedClick(Sender: TObject);
begin
  Config.WriteBool('Factions', 'HideUnconfirmed', cbHideUnconfirmed.Checked);
  FillFactions;
end;

procedure TFactionForm.cmAlignmentChange(Sender: TObject);
begin
  GameConfig.WriteInteger('Game', 'Alignment', cmAlignment.ItemIndex);
end;

end.
