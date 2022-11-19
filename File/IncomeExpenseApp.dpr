program IncomeExpenseApp;

uses
  Forms,
  login in 'login.pas' {Form1},
  USettingTahun in 'USettingTahun.pas' {FTahun},
  UDM in 'UDM.pas' {DM: TDataModule},
  UMasterIncome in 'UMasterIncome.pas' {FMasterIncome},
  UMasterExpense in 'UMasterExpense.pas' {FMasterExpense},
  UTransaksiLog in 'UTransaksiLog.pas' {FTransaksiLog},
  USearchDataIncome in 'USearchDataIncome.pas' {FSearchDataIncome},
  USearchDataExpense in 'USearchDataExpense.pas' {FSearchDataExpense};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFTahun, FTahun);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFTransaksiLog, FTransaksiLog);
  Application.CreateForm(TFMasterIncome, FMasterIncome);
  Application.CreateForm(TFMasterExpense, FMasterExpense);
  Application.CreateForm(TFSearchDataIncome, FSearchDataIncome);
  Application.CreateForm(TFSearchDataExpense, FSearchDataExpense);
  Application.Run;
end.
