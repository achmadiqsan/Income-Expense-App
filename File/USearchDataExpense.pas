unit USearchDataExpense;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TFSearchDataExpense = class(TForm)
    Label1: TLabel;
    Shape1: TShape;
    GroupBox1: TGroupBox;
    Edit3: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBGrid1: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSearchDataExpense: TFSearchDataExpense;

implementation

uses
  UDM, UTransaksiLog;

{$R *.dfm}

procedure TFSearchDataExpense.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
RadioButton1.Checked := False;
RadioButton2.Checked := False;
Edit3.Clear;
DM.ADOQMasterExpense.Filtered := False;
end;

procedure TFSearchDataExpense.Edit3Change(Sender: TObject);
begin
  if RadioButton1.Checked = True then
  begin
    if Edit3.Text ='' then DM.ADOTMasterExpense.Filtered := False
    else
    begin
      DM.ADOTMasterExpense.Filtered := False;
      DM.ADOTMasterExpense.Filter :='kode_expenses LIKE '+Quotedstr('%'+Edit3.Text+'%');
      DM.ADOTMasterExpense.Filtered := True;
    end;
  end else
  if RadioButton2.Checked = True then
  begin
    if Edit3.Text ='' then DM.ADOTMasterExpense.Filtered := False
    else
    begin
      DM.ADOTMasterExpense.Filtered := False;
      DM.ADOTMasterExpense.Filter :='expenses_name LIKE '+Quotedstr('%'+Edit3.Text+'%');
      DM.ADOTMasterExpense.Filtered := True;
    end;
  end;
end;

procedure TFSearchDataExpense.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
begin
  FTransaksiLog.Label6.Caption := DM.ADOTMasterExpense['kode_expenses'];
  FTransaksiLog.Edit2.Text := DM.ADOTMasterExpense['expenses_name'];
  FSearchDataExpense.Close;
  FTransaksiLog.Edit4.SetFocus;
end;

end;

procedure TFSearchDataExpense.FormActivate(Sender: TObject);
begin
RadioButton1.Checked := False;
RadioButton2.Checked := False;
Edit3.Clear;
DM.ADOQMasterExpense.Filtered := False;
DM.ADOTMasterExpense.Close;
DM.ADOTMasterExpense.Open;
end;

end.
