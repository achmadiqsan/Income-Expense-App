unit USettingTahun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TFTahun = class(TForm)
    Label1: TLabel;
    Shape1: TShape;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Label10: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    Edit3: TEdit;
    procedure Panel6Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTahun: TFTahun;

implementation

uses
  UDM;

{$R *.dfm}

procedure TFTahun.Panel6Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Panel3.Enabled := False;
  Panel4.Enabled := False;
  Panel5.Enabled := False;
end;

procedure TFTahun.Panel2Click(Sender: TObject);
var
  id : string;
begin
    // coding untuk memilih kode dengan nomor yg paling terbesar :
  DM.ADOQTahun.Close;
  DM.ADOQTahun.SQL.Clear;
  DM.ADOQTahun.SQL.Add('SELECT TOP 1 tahun.id FROM tahun');
  DM.ADOQTahun.SQL.Add('ORDER BY tahun.id DESC');
  DM.ADOQTahun.Open;

  // coding untuk mengcopy nilai yang di seleksi :
  id := Copy(DM.ADOQTahun.Fields[0].AsString, 5, 6);

  // coding jika seleksi = 0 maka id = 00001 jika tdk maka tambah 1 :
  if id <> '' then id := FormatFLoat('000000', StrtoInt(id) + 1)
  else id := '000001';

  // coding melakukan pengabungan kode string dan integer :
  FTahun.Edit1.Text := 'KDT-' + id;
  panel3.enabled := True;
  Edit2.Clear;
  Edit3.Clear;
  Panel4.Enabled := False;
  Panel5.Enabled := False;
end;

procedure TFTahun.Panel3Click(Sender: TObject);
begin
  if Edit1.Text = '' then MessageDlg('Kode Tahun Kosong',mtinformation,[mbok],0) else
  if Edit2.Text = '' then MessageDlg('Tahun Kosong',mtinformation,[mbok],0) else
  begin
    DM.ADOTahun.Append;
    DM.ADOTahun['id'] := Edit1.Text;
    DM.ADOTahun['tahun'] := Edit2.Text;
    DM.ADOTahun.Post;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Panel3.Enabled := False;
  end;
end;

procedure TFTahun.FormActivate(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Panel2.Enabled := True;
  Panel3.Enabled := False;
  Panel4.Enabled := False;
  Panel5.Enabled := False;
  Panel6.Enabled := True;
end;

procedure TFTahun.DBGrid1CellClick(Column: TColumn);
begin
  if Dm.ADOTahun.IsEmpty then MessageDlg('Data Tahun Kosong',mtInformation,[mbok],0) else
    begin
      Edit1.Text := DM.ADOTahun['id']  ;
      Edit2.Text := DM.ADOTahun['tahun']  ;
      Panel4.Enabled := True;
      Panel5.Enabled := True;
      Panel2.Enabled := False;
      Panel3.Enabled := False;
    end;
end;

procedure TFTahun.Panel4Click(Sender: TObject);
begin
  if Edit1.Text = '' then MessageDlg('Kode Tahun Kosong',mtinformation,[mbok],0) else
  if Edit2.Text = '' then MessageDlg('Tahun Kosong',mtinformation,[mbok],0) else
  begin
    DM.ADOTahun.Edit;
    DM.ADOTahun['id'] := Edit1.Text;
    DM.ADOTahun['tahun'] := Edit2.Text;
    DM.ADOTahun.Post;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Panel4.Enabled := False;
    Panel5.Enabled := False;
    Panel2.Enabled := True;
  end;
end;

procedure TFTahun.Panel5Click(Sender: TObject);
begin
  if Dm.ADOTahun.IsEmpty then MessageDlg('Data Kosong',mtInformation,[mbok],0) else
  if Application.MessageBox('Yakin Hapus Data ??','Pesan',Mb_YesNo or Mb_IconQuestion)=MrYes then
   Begin
     Dm.ADOTahun.Delete;
     Edit1.Clear;
     Edit2.Clear;
     Edit3.Clear;
     Panel4.Enabled := False;
     Panel5.Enabled := False;
    Panel2.Enabled := True;
   End;
end;

procedure TFTahun.Edit3Change(Sender: TObject);
begin
  if Edit3.Text ='' then DM.ADOTahun.Filtered := False
  else
  begin
    DM.ADOTahun.Filtered := False;
    DM.ADOTahun.Filter :='tahun LIKE '+Quotedstr('%'+Edit3.Text+'%');
    DM.ADOTahun.Filtered := True;
  end;
end;

end.
