unit UTransaksiLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, ExtCtrls,DateUtils;

type
  TFTransaksiLog = class(TForm)
    Label1: TLabel;
    Shape1: TShape;
    Label10: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    Edit3: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    RadioButton1: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label6: TLabel;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Panel5Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure refresh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTransaksiLog: TFTransaksiLog;

implementation

uses
  UDM, USearchDataIncome, USearchDataExpense;

{$R *.dfm}

procedure TFTransaksiLog.DateTimePicker1Change(Sender: TObject);
begin
  Edit5.Text := DateToStr(DateTimePicker1.Date);
end;

procedure TFTransaksiLog.Edit5Change(Sender: TObject);
var
  formattanggal : TDate;
  {hari,} bln, thn : Word;
begin
  formattanggal := DateTimePicker1.Date;
//  hari := DayOf(formattanggal);
  bln := MonthOf(formattanggal);
  thn := YearOf(formattanggal);

//  Edit3.Text := IntToStr(hari);
  case bln of
    1 : Edit6.Text := 'JANUARI';
    2 : Edit6.Text := 'FEBRUARI';
    3 : Edit6.Text := 'MARET';
    4 : Edit6.Text := 'APRIL';
    5 : Edit6.Text := 'MEI';
    6 : Edit6.Text := 'JUNI';
    7 : Edit6.Text := 'JULI';
    8 : Edit6.Text := 'AGUSTUS';
    9 : Edit6.Text := 'SEPTEMBER';
    10 : Edit6.Text := 'OKTOBER';
    11 : Edit6.Text := 'NOVEMBER';
    12 : Edit6.Text := 'DESEMBER';
  end;
  Edit7.Text := IntToStr(thn);
end;

procedure TFTransaksiLog.Panel2Click(Sender: TObject);
var
  id : string;
begin
    // coding untuk memilih kode dengan nomor yg paling terbesar :
  DM.ADOQLog.Close;
  DM.ADOQLog.SQL.Clear;
  DM.ADOQLog.SQL.Add('SELECT TOP 1 log.code FROM log');
  DM.ADOQLog.SQL.Add('ORDER BY log.code DESC');
  DM.ADOQLog.Open;

  // coding untuk mengcopy nilai yang di seleksi :
  id := Copy(DM.ADOQLog.Fields[0].AsString, 8, 6);

  // coding jika seleksi = 0 maka id = 00001 jika tdk maka tambah 1 :
  if id <> '' then id := FormatFLoat('000000', StrtoInt(id) + 1)
  else id := '000001';

  // coding melakukan pengabungan kode string dan integer :
  FTransaksiLog.Edit1.Text := 'NO-LOG-' + id;
  panel3.enabled := True;
    DateTimePicker1.Date := Now;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  ComboBox1.Text := '-- PILIH TYPE --';
  Panel4.Enabled := False;
  Panel5.Enabled := False;
  RadioButton1.Checked := False;
  RadioButton3.Checked := False;
  RadioButton4.Checked := False;
  RadioButton5.Checked := False;
  RadioButton6.Checked := False;
  RadioButton7.Checked := False;
  refresh;
end;

procedure TFTransaksiLog.Panel3Click(Sender: TObject);
begin
  if Edit1.Text = '' then MessageDlg('Code Kosong',mtinformation,[mbok],0) else
  if Edit2.Text = '' then MessageDlg('Account Kosong',mtinformation,[mbok],0) else
  if ComboBox1.Text = '-- PILIH TYPE --' then MessageDlg('Silahkan Pilih Type',mtinformation,[mbok],0) else
  if Edit4.Text = '' then MessageDlg('Amount Kosong',mtinformation,[mbok],0) else
  if Edit6.Text = '' then MessageDlg('Silahkan Pilih Tinggal Terlebih Dahulu',mtinformation,[mbok],0) else
  begin
    DM.ADOTLog.Append;
    DM.ADOTLog['code'] := Edit1.Text;
    DM.ADOTLog['date'] := DateTimePicker1.Date;
    DM.ADOTLog['bulan'] := Edit6.Text;
    DM.ADOTLog['tahun'] := Edit7.Text;
    DM.ADOTLog['type'] := ComboBox1.Text;
    DM.ADOTLog['kode_akun'] := label6.Caption;
    DM.ADOTLog['akun'] := Edit2.Text;
    DM.ADOTLog['amount'] := Edit4.Text;
    DM.ADOTLog.Post;
    Edit1.Clear;
    Edit5.Clear;
    Edit6.Clear;
    Edit7.Clear;
    DateTimePicker1.Date := Now;
    Label6.Caption := 'KodeAccount';
    Edit2.Clear;
    Edit4.Clear;
    Edit3.Clear;
    Panel3.Enabled := False;
    ComboBox1.Text := '-- PILIH TYPE --';
    refresh;
  end;
end;

procedure TFTransaksiLog.Panel4Click(Sender: TObject);
begin
  RadioButton4.Checked := False;
  Edit3.Clear;
  if Edit1.Text = '' then MessageDlg('Code Kosong',mtinformation,[mbok],0) else
  if Edit2.Text = '' then MessageDlg('Account Kosong',mtinformation,[mbok],0) else
  if ComboBox1.Text = '-- PILIH TYPE --' then MessageDlg('Silahkan Pilih Type',mtinformation,[mbok],0) else
  if Edit4.Text = '' then MessageDlg('Amount Kosong',mtinformation,[mbok],0) else
  begin
    DM.ADOTLog.Edit;
    DM.ADOTLog['code'] := Edit1.Text;
    DM.ADOTLog['date'] := DateTimePicker1.Date;
    DM.ADOTLog['bulan'] := Edit6.Text;
    DM.ADOTLog['tahun'] := Edit7.Text;
    DM.ADOTLog['type'] := ComboBox1.Text;
    DM.ADOTLog['kode_akun'] := label6.Caption;
    DM.ADOTLog['akun'] := Edit2.Text;
    DM.ADOTLog['amount'] := Edit4.Text;
    DM.ADOTLog.Post;
    Edit1.Clear;
    Edit5.Clear;
    Edit6.Clear;
    Edit7.Clear;
    DateTimePicker1.Date := Now;
    Label6.Caption := 'KodeAccount';
    Edit2.Clear;
    Edit4.Clear;
    Panel3.Enabled := False;
    //
    Panel4.Enabled := False;
    Panel5.Enabled := False;
    Panel2.Enabled := True;
    ComboBox1.Text := '-- PILIH TYPE --';
    DM.ADOTLog.Filtered := False;
    refresh;
  end;
end;

procedure TFTransaksiLog.DBGrid1CellClick(Column: TColumn);
begin
  if Dm.ADOTLog.IsEmpty then MessageDlg('Data Log Kosong',mtInformation,[mbok],0) else
    begin
      Edit1.Text := DM.ADOTLog['code']  ;
      DateTimePicker1.Date := DM.ADOTLog['date']  ;
      Edit6.Text := DM.ADOTLog['bulan']  ;
      Edit7.Text := DM.ADOTLog['tahun']  ;
      ComboBox1.Text := DM.ADOTLog['type']  ;
      label6.Caption := DM.ADOTLog['kode_akun']  ;
      Edit2.Text := DM.ADOTLog['akun']  ;
      Edit4.Text := DM.ADOTLog['amount']  ;
      Panel4.Enabled := True;
      Panel5.Enabled := True;
      Panel2.Enabled := False;
      Panel3.Enabled := False;
    end;
end;

procedure TFTransaksiLog.Panel5Click(Sender: TObject);
begin
  if Dm.ADOTLog.IsEmpty then MessageDlg('Data Kosong',mtInformation,[mbok],0) else
  if Application.MessageBox('Yakin Hapus Data ??','Pesan',Mb_YesNo or Mb_IconQuestion)=MrYes then
   Begin
     Dm.ADOTLog.Delete;
     Edit1.Clear;
    Edit5.Clear;
    Edit6.Clear;
    Edit7.Clear;
    DateTimePicker1.Date := Now;
    Label6.Caption := 'KodeAccount';
    Edit2.Clear;
    Edit4.Clear;
    Edit3.Clear;
    Panel3.Enabled := False;
    Panel4.Enabled := False;
    Panel5.Enabled := False;
    Panel2.Enabled := True;
    ComboBox1.Text := '-- PILIH TYPE --';
    refresh;
   End;
end;

procedure TFTransaksiLog.Edit3Change(Sender: TObject);
begin
  if RadioButton1.Checked = True then
  begin
    if Edit3.Text ='' then DM.ADOTLog.Filtered := False
    else
    begin
      DM.ADOTLog.Filtered := False;
      DM.ADOTLog.Filter :='code LIKE '+Quotedstr('%'+Edit3.Text+'%');
      DM.ADOTLog.Filtered := True;
    end;
  end else
  if RadioButton3.Checked = True then
  begin
    if Edit3.Text ='' then DM.ADOTLog.Filtered := False
    else
    begin
      DM.ADOTLog.Filtered := False;
      DM.ADOTLog.Filter :='bulan LIKE '+Quotedstr('%'+Edit3.Text+'%');
      DM.ADOTLog.Filtered := True;
    end;
  end else
  if RadioButton4.Checked = True then
  begin
    if Edit3.Text ='' then DM.ADOTLog.Filtered := False
    else
    begin
      DM.ADOTLog.Filtered := False;
      DM.ADOTLog.Filter :='tahun LIKE '+Quotedstr('%'+Edit3.Text+'%');
      DM.ADOTLog.Filtered := True;
    end;
  end else
  if RadioButton5.Checked = True then
  begin
    if Edit3.Text ='' then DM.ADOTLog.Filtered := False
    else
    begin
      DM.ADOTLog.Filtered := False;
      DM.ADOTLog.Filter :='type LIKE '+Quotedstr('%'+Edit3.Text+'%');
      DM.ADOTLog.Filtered := True;
    end;
  end else
  if RadioButton6.Checked = True then
  begin
    if Edit3.Text ='' then DM.ADOTLog.Filtered := False
    else
    begin
      DM.ADOTLog.Filtered := False;
      DM.ADOTLog.Filter :='kode_akun LIKE '+Quotedstr('%'+Edit3.Text+'%');
      DM.ADOTLog.Filtered := True;
    end;
  end else
  if RadioButton7.Checked = True then
  begin
    if Edit3.Text ='' then DM.ADOTLog.Filtered := False
    else
    begin
      DM.ADOTLog.Filtered := False;
      DM.ADOTLog.Filter :='akun LIKE '+Quotedstr('%'+Edit3.Text+'%');
      DM.ADOTLog.Filtered := True;
    end;
  end;
end;

procedure TFTransaksiLog.Panel6Click(Sender: TObject);
begin
  DateTimePicker1.Date := Now;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  ComboBox1.Text := '-- PILIH TYPE --';
  Panel2.Enabled := True;
  Panel3.Enabled := False;
  Panel4.Enabled := False;
  Panel5.Enabled := False;
  RadioButton1.Checked := False;
  RadioButton3.Checked := False;
  RadioButton4.Checked := False;
  RadioButton5.Checked := False;
  RadioButton6.Checked := False;
  RadioButton7.Checked := False;
  refresh;
end;

procedure TFTransaksiLog.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date := Now;
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  ComboBox1.Text := '-- PILIH TYPE --';
  Panel3.Enabled := False;
  Panel4.Enabled := False;
  Panel5.Enabled := False;
  RadioButton1.Checked := False;
  RadioButton3.Checked := False;
  RadioButton4.Checked := False;
  RadioButton5.Checked := False;
  RadioButton6.Checked := False;
  RadioButton7.Checked := False;
end;

procedure TFTransaksiLog.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  begin
    if ComboBox1.Text = 'INCOME' then
    begin
      FSearchDataIncome.Show;
    end
    else
    if ComboBox1.Text = 'EXPENSE' then
    begin
      FSearchDataExpense.Show;
    end
    else
    if (ComboBox1.Text = '-- PILIH TYPE --') or (ComboBox1.Text = '') then
    begin
      MessageDlg('SILAHKAN PILIH TYPE TERLEBIH DAHULU',mtInformation,[mbok],0);
    end
  end;
end;

procedure TFTransaksiLog.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TFTransaksiLog.refresh;
begin
  DM.ADOTLog.Close;
  DM.ADOTLog.Open;
  DM.ADOTLog.Sort := 'code ASC';
end;

end.
