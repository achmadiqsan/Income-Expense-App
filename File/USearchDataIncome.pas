unit USearchDataIncome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TFSearchDataIncome = class(TForm)
    Label1: TLabel;
    Shape1: TShape;
    GroupBox1: TGroupBox;
    Edit3: TEdit;
    RadioButton1: TRadioButton;
    DBGrid1: TDBGrid;
    RadioButton2: TRadioButton;
    procedure FormActivate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSearchDataIncome: TFSearchDataIncome;

implementation

uses
  UDM, UTransaksiLog;

{$R *.dfm}

procedure TFSearchDataIncome.FormActivate(Sender: TObject);
begin
RadioButton1.Checked := False;
RadioButton2.Checked := False;
Edit3.Clear;
DM.ADOQMasterExpense.Filtered := False;
end;

procedure TFSearchDataIncome.Edit3Change(Sender: TObject);
begin
  if RadioButton1.Checked = True then
  begin
    if Edit3.Text ='' then DM.ADOTMasterIncome.Filtered := False
    else
    begin
      DM.ADOTMasterIncome.Filtered := False;
      DM.ADOTMasterIncome.Filter :='kode_income LIKE '+Quotedstr('%'+Edit3.Text+'%');
      DM.ADOTMasterIncome.Filtered := True;
    end;
  end else
  if RadioButton2.Checked = True then
  begin
    if Edit3.Text ='' then DM.ADOTMasterIncome.Filtered := False
    else
    begin
      DM.ADOTMasterIncome.Filtered := False;
      DM.ADOTMasterIncome.Filter :='income_name LIKE '+Quotedstr('%'+Edit3.Text+'%');
      DM.ADOTMasterIncome.Filtered := True;
    end;
  end;
end;

procedure TFSearchDataIncome.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
if Key=#13 then
begin
  FTransaksiLog.Label6.Caption := DM.ADOTMasterIncome['kode_income'];
  FTransaksiLog.Edit2.Text := DM.ADOTMasterIncome['income_name'];
  FSearchDataIncome.Close;
  FTransaksiLog.Edit4.SetFocus;
end;
end;

end.
