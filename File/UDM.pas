unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOTahun: TADOTable;
    DSTahun: TDataSource;
    ADOQTahun: TADOQuery;
    ADOTMasterIncome: TADOTable;
    ADOQMasterIncome: TADOQuery;
    DSMasterIncome: TDataSource;
    ADOTMasterExpense: TADOTable;
    DSMasterExpense: TDataSource;
    ADOQMasterExpense: TADOQuery;
    ADOTLog: TADOTable;
    ADOQLog: TADOQuery;
    DSLog: TDataSource;
    ADOTLogcode: TWideStringField;
    ADOTLogdate: TDateTimeField;
    ADOTLogbulan: TWideStringField;
    ADOTLogtahun: TWideStringField;
    ADOTLogtype: TWideStringField;
    ADOTLogkode_akun: TWideStringField;
    ADOTLogakun: TWideStringField;
    ADOTLogamount: TBCDField;
    Income: TADOQuery;
    Expense: TADOQuery;
    JAN: TADOQuery;
    FEB: TADOQuery;
    MAR: TADOQuery;
    APR: TADOQuery;
    MEI: TADOQuery;
    JUN: TADOQuery;
    JUL: TADOQuery;
    AGUS: TADOQuery;
    SEP: TADOQuery;
    OKT: TADOQuery;
    NOV: TADOQuery;
    DES: TADOQuery;
    JAN1: TADOQuery;
    FEB1: TADOQuery;
    MAR1: TADOQuery;
    APR1: TADOQuery;
    MEI1: TADOQuery;
    JUN1: TADOQuery;
    JUL1: TADOQuery;
    AGUS1: TADOQuery;
    SEP1: TADOQuery;
    OKT1: TADOQuery;
    NOV1: TADOQuery;
    DES1: TADOQuery;
    GrafikIncome: TADOQuery;
    GrafikExpense: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
