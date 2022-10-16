unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, frxpngimage, Menus, TeeProcs, TeEngine, Chart, Series,
  StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Image1: TImage;
    Panel6: TPanel;
    MainMenu1: TMainMenu;
    m1: TMenuItem;
    I1: TMenuItem;
    E1: TMenuItem;
    T1: TMenuItem;
    L1: TMenuItem;
    E2: TMenuItem;
    Y1: TMenuItem;
    N1: TMenuItem;
    Chart1: TChart;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Image2: TImage;
    Panel13: TPanel;
    Panel14: TPanel;
    Chart2: TChart;
    Series1: TLineSeries;
    Series2: TPieSeries;
    Panel15: TPanel;
    Chart3: TChart;
    Series3: TBarSeries;
    S1: TMenuItem;
    T2: TMenuItem;
    Label1: TLabel;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    Series4: TLineSeries;
    procedure N1Click(Sender: TObject);
    procedure T2Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure pilihan;
    procedure FormActivate(Sender: TObject);
    procedure income;
    procedure ComboBox1Change(Sender: TObject);
    procedure expense;
    procedure chartpie;
    procedure grafik;
    procedure SpeedButton1Click(Sender: TObject);
    procedure kosongkan;
    procedure grafik2;
    procedure kosongkan2;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses USettingTahun, UMasterIncome, UMasterExpense, UTransaksiLog, UDM;

{$R *.dfm}

procedure TForm1.N1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.T2Click(Sender: TObject);
begin
  FTahun.show;
end;

procedure TForm1.I1Click(Sender: TObject);
begin
  FMasterIncome.show;
end;

procedure TForm1.E1Click(Sender: TObject);
begin
  FMasterExpense.show;
end;

procedure TForm1.L1Click(Sender: TObject);
begin
  FTransaksiLog.Show;
end;

procedure TForm1.pilihan;
begin
combobox1.Clear;
     DM.ADOTahun.Close;
     Dm.ADOTahun.Open;
     //combobox1.Items.Add('-- PILIH TAHUN --');
     ComboBox1.Text := '-- PILIH TAHUN --';
     While not Dm.ADOTahun.Eof do
        begin
          combobox1.Items.Add(DM.ADOTahun['tahun']);
          Dm.ADOTahun.Next;
        end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  pilihan;
  income;
  Panel6.Caption := 'Rp. ' + FormatFloat('#,#0;(#,#0);#,#0',DM.Income['Total']);
  expense;
  Panel13.Caption := 'Rp. ' + FormatFloat('#,#0;(#,#0);#,#0',DM.Expense['Total']);
  chartpie;
  Panel9.Caption := 'Rp. ' + FormatFloat('#,#0;(#,#0);#,#0',DM.Income['Total'] - DM.Expense['Total']);
end;

procedure TForm1.income;
begin
  with DM.Income do
  begin
    close;
    sql.Clear;
    // SELECT SUM(amount) AS Total FROM log WHERE type = 'EXPENSE' AND tahun = '2021'
    // sql.Add('SELECT SUM(amount) AS Total FROM log WHERE type = "INCOME" AND tahun = "'+ComboBox1.Text+'"');
    sql.Add('SELECT SUM(amount) AS Total FROM log WHERE type = "INCOME"');
    open;
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
//  if (ComboBox1.Text <> '') or (ComboBox1.Text <> '-- PILIH TAHUN --') then
//  begin
//    grafik;
//  end;
//grafik;
end;

procedure TForm1.expense;
begin
with DM.Expense do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS Total FROM log WHERE type = "EXPENSE"');
    open;
  end;
end;

procedure TForm1.chartpie;
var
  total_chart_Income, total_chart_Expense : Real;
begin
  total_chart_Income := DM.Income['Total'];
  total_chart_Expense := DM.Expense['Total'];
  Chart2.Series[0].Clear;
  Chart2.Series[0].Add(total_chart_Expense,'Expense',$00EBE5EA);
  Chart2.Series[0].Add(total_chart_Income,'Income',$00262626);
end;

procedure TForm1.grafik;
var
    JM,JS,JA,FEBM,FEBS,FEBA,MARM,MARS,MARA,APRM,APRS,APRA,MEIM,MEIS,MEIA : Real;
    JUNM,JUNS,JUNA,JULM,JULS,JULA,AGUSM,AGUSS,AGUSA,SEPM,SEPS,SEPA : Real;
    OKTM,OKTS,OKTA,NOVM,NOVS,NOVA,DESM,DESS,DESA : Real;
begin
  //  JAN :
  with DM.JAN do
  begin
    close;
    sql.Clear;
    // SELECT SUM(amount) AS expense FROM log WHERE type = 'EXPENSE' AND bulan = 'JANUARI' AND tahun = '2020';
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "JANUARI" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.JAN1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "JANUARI" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.JAN['expense'] = null then JM := 0 else JM := DM.JAN['expense'];
  if DM.JAN1['income'] = null then JS := 0 else JS := DM.JAN1['income'];
  Chart1.Series[0].Add(JM,'JANUARI');
  Chart1.Series[1].Add(JS,'JANUARI');

  // FEB :
  with DM.FEB do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "FEBRUARI" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.FEB1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "FEBRUARI" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.FEB['expense'] = null then FEBM := 0 else FEBM := DM.FEB['expense'];
  if DM.FEB1['income'] = null then FEBS := 0 else FEBS := DM.FEB1['income'];
  Chart1.Series[0].Add(FEBM,'FEBRUARI');
  Chart1.Series[1].Add(FEBS,'FEBRUARI');

  // MAR :
  with DM.MAR do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "MARET" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.MAR1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "MARET" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.MAR['expense'] = null then MARM := 0 else MARM := DM.MAR['expense'];
  if DM.MAR1['income'] = null then MARS := 0 else MARS := DM.MAR1['income'];
  Chart1.Series[0].Add(MARM,'MARET');
  Chart1.Series[1].Add(MARS,'MARET');

  // APR :
  with DM.APR do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "APRIL" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.APR1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "APRIL" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.APR['expense'] = null then APRM := 0 else APRM := DM.APR['expense'];
  if DM.APR1['income'] = null then APRS := 0 else APRS := DM.APR1['income'];
  Chart1.Series[0].Add(APRM,'APRIL');
  Chart1.Series[1].Add(APRS,'APRIL');

  // MEI :
  with DM.MEI do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "MEI" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.MEI1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "MEI" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.MEI['expense'] = null then MEIM := 0 else MEIM := DM.MEI['expense'];
  if DM.MEI1['income'] = null then MEIS := 0 else MEIS := DM.MEI1['income'];
  Chart1.Series[0].Add(MEIM,'MEI');
  Chart1.Series[1].Add(MEIS,'MEI');

  // JUN :
  with DM.JUN do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "JUNI" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.JUN1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "JUNI" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.JUN['expense'] = null then JUNM := 0 else JUNM := DM.JUN['expense'];
  if DM.JUN1['income'] = null then JUNS := 0 else JUNS := DM.JUN1['income'];
  Chart1.Series[0].Add(JUNM,'JUN');
  Chart1.Series[1].Add(JUNS,'JUNI');

  // JUL :
  with DM.JUL do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "JULI" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.JUL1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "JULI" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.JUL['expense'] = null then JULM := 0 else JULM := DM.JUL['expense'];
  if DM.JUL1['income'] = null then JULS := 0 else JULS := DM.JUL1['income'];
  Chart1.Series[0].Add(JULM,'JULI');
  Chart1.Series[1].Add(JULS,'JULI');

  // AGUS :
  with DM.AGUS do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "AGUSTUS" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.AGUS1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "AGUSTUS" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.AGUS['expense'] = null then AGUSM := 0 else AGUSM := DM.AGUS['expense'];
  if DM.AGUS1['income'] = null then AGUSS := 0 else AGUSS := DM.AGUS1['income'];
  Chart1.Series[0].Add(AGUSM,'AGUSTUS');
  Chart1.Series[1].Add(AGUSS,'AGUSTUS');

  // SEP :
  with DM.SEP do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "SEPTEMBER" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.SEP1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "SEPTEMBER" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.SEP['expense'] = null then SEPM := 0 else SEPM := DM.SEP['expense'];
  if DM.SEP1['income'] = null then SEPS := 0 else SEPS := DM.SEP1['income'];
  Chart1.Series[0].Add(SEPM,'SEPTEMBER');
  Chart1.Series[1].Add(SEPS,'SEPTEMBER');

  //OKT :
  with DM.OKT do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "OKTOBER" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.OKT1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "OKTOBER" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.OKT['expense'] = null then OKTM := 0 else OKTM := DM.OKT['expense'];
  if DM.OKT1['income'] = null then OKTS := 0 else OKTS := DM.OKT1['income'];
  Chart1.Series[0].Add(OKTM,'OKTOBER');
  Chart1.Series[1].Add(OKTS,'OKTOBER');

  // NOV :
  with DM.NOV do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "NOVEMBER" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.NOV1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "NOVEMBER" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.NOV['expense'] = null then NOVM := 0 else NOVM := DM.NOV['expense'];
  if DM.NOV1['income'] = null then NOVS := 0 else NOVS := DM.NOV1['income'];
  Chart1.Series[0].Add(NOVM,'NOVEMBER');
  Chart1.Series[1].Add(NOVS,'NOVEMBER');

  // DES :
  with DM.DES do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND bulan = "DESEMBER" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.DES1 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND bulan = "DESEMBER" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.DES['expense'] = null then DESM := 0 else DESM := DM.DES['expense'];
  if DM.DES1['income'] = null then DESS := 0 else DESS := DM.DES1['income'];
  Chart1.Series[0].Add(DESM,'DESEMBER');
  Chart1.Series[1].Add(DESM,'DESEMBER');
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  data,JM,JS : Real;
begin
  kosongkan;
  grafik;
  kosongkan2;
  grafik2;
  if DM.GrafikExpense['expense'] = null then JM := 0 else JM := DM.GrafikExpense['expense'];
  if DM.GrafikIncome['income'] = null then JS := 0 else JS := DM.GrafikIncome['income'];
  data := JS - JM;
  Panel12.Caption := 'Rp. ' + FormatFloat('#,#0;(#,#0);#,#0',data);
end;

procedure TForm1.kosongkan;
begin
  Chart1.Series[0].Clear;
  Chart1.Series[1].Clear;
end;

procedure TForm1.grafik2;
var
  JM,JS : Real;
begin
  with DM.GrafikExpense do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS expense FROM log WHERE type = "EXPENSE" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  with DM.GrafikIncome do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(amount) AS income FROM log WHERE type = "INCOME" AND tahun ="'+ComboBox1.Text+'"');
    open;
  end;
  if DM.GrafikExpense['expense'] = null then JM := 0 else JM := DM.GrafikExpense['expense'];
  if DM.GrafikIncome['income'] = null then JS := 0 else JS := DM.GrafikIncome['income'];
  Chart3.Series[0].Add(JS,'INCOME');
  Chart3.Series[0].Add(JM,'EXPENSE');
end;

procedure TForm1.kosongkan2;
begin
    Chart3.Series[0].Clear;
end;

end.
