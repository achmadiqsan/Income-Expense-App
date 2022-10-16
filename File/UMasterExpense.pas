unit UMasterExpense;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TFMasterExpense = class(TForm)
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
  FMasterExpense: TFMasterExpense;

implementation

uses
  UDM;

{$R *.dfm}

procedure TFMasterExpense.Panel6Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Panel3.Enabled := False;
  Panel4.Enabled := False;
  Panel5.Enabled := False;
end;

procedure TFMasterExpense.Panel2Click(Sender: TObject);
var
  id : string;
begin
    // coding untuk memilih kode dengan nomor yg paling terbesar :
  DM.ADOQMasterExpense.Close;
  DM.ADOQMasterExpense.SQL.Clear;
  DM.ADOQMasterExpense.SQL.Add('SELECT TOP 1 expenses.kode_expenses FROM expenses');
  DM.ADOQMasterExpense.SQL.Add('ORDER BY expenses.kode_expenses DESC');
  DM.ADOQMasterExpense.Open;

  // coding untuk mengcopy nilai yang di seleksi :
  id := Copy(DM.ADOQMasterExpense.Fields[0].AsString, 5, 6);

  // coding jika seleksi = 0 maka id = 00001 jika tdk maka tambah 1 :
  if id <> '' then id := FormatFLoat('000000', StrtoInt(id) + 1)
  else id := '000001';

  // coding melakukan pengabungan kode string dan integer :
  FMasterExpense.Edit1.Text := 'KME-' + id;
  panel3.enabled := True;
  Edit2.Clear;
  Edit3.Clear;
  Panel4.Enabled := False;
  Panel5.Enabled := False;
end;

procedure TFMasterExpense.Panel3Click(Sender: TObject);
begin
  if Edit1.Text = '' then MessageDlg('Kode Expense Kosong',mtinformation,[mbok],0) else
  if Edit2.Text = '' then MessageDlg('Expense Name Kosong',mtinformation,[mbok],0) else
  begin
    DM.ADOTMasterExpense.Append;
    DM.ADOTMasterExpense['kode_expenses'] := Edit1.Text;
    DM.ADOTMasterExpense['expenses_name'] := Edit2.Text;
    DM.ADOTMasterExpense.Post;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Panel3.Enabled := False;
  end;
end;

procedure TFMasterExpense.FormActivate(Sender: TObject);
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

procedure TFMasterExpense.DBGrid1CellClick(Column: TColumn);
begin
  if Dm.ADOTMasterExpense.IsEmpty then MessageDlg('Data Expense Kosong',mtInformation,[mbok],0) else
    begin
      Edit1.Text := DM.ADOTMasterExpense['kode_expenses']  ;
      Edit2.Text := DM.ADOTMasterExpense['expenses_name']  ;
      Panel4.Enabled := True;
      Panel5.Enabled := True;
      Panel2.Enabled := False;
      Panel3.Enabled := False;
    end;
end;

procedure TFMasterExpense.Panel4Click(Sender: TObject);
begin
  if Edit1.Text = '' then MessageDlg('Kode Expense Kosong',mtinformation,[mbok],0) else
  if Edit2.Text = '' then MessageDlg('Expense Kosong',mtinformation,[mbok],0) else
  begin
    DM.ADOTMasterExpense.Edit;
    DM.ADOTMasterExpense['kode_expenses'] := Edit1.Text;
    DM.ADOTMasterExpense['expenses_name'] := Edit2.Text;
    DM.ADOTMasterExpense.Post;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    Panel4.Enabled := False;
    Panel5.Enabled := False;
    Panel2.Enabled := True;
  end;
end;

procedure TFMasterExpense.Panel5Click(Sender: TObject);
begin
  if Dm.ADOTMasterExpense.IsEmpty then MessageDlg('Data Kosong',mtInformation,[mbok],0) else
  if Application.MessageBox('Yakin Hapus Data ??','Pesan',Mb_YesNo or Mb_IconQuestion)=MrYes then
   Begin
     Dm.ADOTMasterExpense.Delete;
     Edit1.Clear;
     Edit2.Clear;
     Edit3.Clear;
     Panel4.Enabled := False;
     Panel5.Enabled := False;
     Panel2.Enabled := True;
   End;
end;

procedure TFMasterExpense.Edit3Change(Sender: TObject);
begin
  if Edit3.Text ='' then DM.ADOTMasterExpense.Filtered := False
  else
  begin
    DM.ADOTMasterExpense.Filtered := False;
    DM.ADOTMasterExpense.Filter :='expenses_name LIKE '+Quotedstr('%'+Edit3.Text+'%');
    DM.ADOTMasterExpense.Filtered := True;
  end;
end;

end.
