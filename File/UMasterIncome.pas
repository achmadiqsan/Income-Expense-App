unit UMasterIncome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TFMasterIncome = class(TForm)
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
  FMasterIncome: TFMasterIncome;

implementation

uses
  UDM;

{$R *.dfm}

procedure TFMasterIncome.Panel6Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Panel3.Enabled := False;
  Panel4.Enabled := False;
  Panel5.Enabled := False;
end;

procedure TFMasterIncome.Panel2Click(Sender: TObject);
var
  id : string;
begin
    // coding untuk memilih kode dengan nomor yg paling terbesar :
  DM.ADOQMasterIncome.Close;
  DM.ADOQMasterIncome.SQL.Clear;
  DM.ADOQMasterIncome.SQL.Add('SELECT TOP 1 income.kode_income FROM income');
  DM.ADOQMasterIncome.SQL.Add('ORDER BY income.kode_income DESC');
  DM.ADOQMasterIncome.Open;

  // coding untuk mengcopy nilai yang di seleksi :
  id := Copy(DM.ADOQMasterIncome.Fields[0].AsString, 5, 6);

  // coding jika seleksi = 0 maka id = 00001 jika tdk maka tambah 1 :
  if id <> '' then id := FormatFLoat('000000', StrtoInt(id) + 1)
  else id := '000001';

  // coding melakukan pengabungan kode string dan integer :
  FMasterIncome.Edit1.Text := 'KMI-' + id;
  panel3.enabled := True;
  Edit2.Clear;
  Edit3.Clear;
  Panel4.Enabled := False;
  Panel5.Enabled := False;
end;

procedure TFMasterIncome.Panel3Click(Sender: TObject);
begin
  if Edit1.Text = '' then MessageDlg('Kode Income Kosong',mtinformation,[mbok],0) else
  if Edit2.Text = '' then MessageDlg('Income Name Kosong',mtinformation,[mbok],0) else
  begin
    DM.ADOTMasterIncome.Append;
    DM.ADOTMasterIncome['kode_income'] := Edit1.Text;
    DM.ADOTMasterIncome['income_name'] := Edit2.Text;
    DM.ADOTMasterIncome.Post;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Panel3.Enabled := False;
  end;
end;

procedure TFMasterIncome.FormActivate(Sender: TObject);
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

procedure TFMasterIncome.DBGrid1CellClick(Column: TColumn);
begin
  if Dm.ADOTMasterIncome.IsEmpty then MessageDlg('Data Income Kosong',mtInformation,[mbok],0) else
    begin
      Edit1.Text := DM.ADOTMasterIncome['kode_income']  ;
      Edit2.Text := DM.ADOTMasterIncome['income_name']  ;
      Panel4.Enabled := True;
      Panel5.Enabled := True;
      Panel2.Enabled := False;
      Panel3.Enabled := False;
    end;
end;

procedure TFMasterIncome.Panel4Click(Sender: TObject);
begin
  if Edit1.Text = '' then MessageDlg('Kode Income Kosong',mtinformation,[mbok],0) else
  if Edit2.Text = '' then MessageDlg('Income Kosong',mtinformation,[mbok],0) else
  begin
    DM.ADOTMasterIncome.Edit;
    DM.ADOTMasterIncome['kode_income'] := Edit1.Text;
    DM.ADOTMasterIncome['income_name'] := Edit2.Text;
    DM.ADOTMasterIncome.Post;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Panel4.Enabled := False;
    Panel5.Enabled := False;
    Panel2.Enabled := True;
  end;
end;

procedure TFMasterIncome.Panel5Click(Sender: TObject);
begin
  if Dm.ADOTMasterIncome.IsEmpty then MessageDlg('Data Kosong',mtInformation,[mbok],0) else
  if Application.MessageBox('Yakin Hapus Data ??','Pesan',Mb_YesNo or Mb_IconQuestion)=MrYes then
   Begin
     Dm.ADOTMasterIncome.Delete;
     Edit1.Clear;
     Edit2.Clear;
     Edit3.Clear;
     Panel4.Enabled := False;
     Panel5.Enabled := False;
     Panel2.Enabled := True;
   End;
end;

procedure TFMasterIncome.Edit3Change(Sender: TObject);
begin
  if Edit3.Text ='' then DM.ADOTMasterIncome.Filtered := False
  else
  begin
    DM.ADOTMasterIncome.Filtered := False;
    DM.ADOTMasterIncome.Filter :='income_name LIKE '+Quotedstr('%'+Edit3.Text+'%');
    DM.ADOTMasterIncome.Filtered := True;
  end;
end;

end.
