object DM: TDM
  OldCreateOrder = False
  Left = 89
  Top = 135
  Height = 347
  Width = 995
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Income-Expense-A' +
      'pp\Database\DatabaseIncomeAndExpensesApp.mdb;Persist Security In' +
      'fo=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 24
  end
  object ADOTahun: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'tahun'
    Left = 32
    Top = 80
  end
  object DSTahun: TDataSource
    DataSet = ADOTahun
    Left = 95
    Top = 81
  end
  object ADOQTahun: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tahun')
    Left = 32
    Top = 144
  end
  object ADOTMasterIncome: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'income'
    Left = 176
    Top = 80
  end
  object ADOQMasterIncome: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM income')
    Left = 176
    Top = 144
  end
  object DSMasterIncome: TDataSource
    DataSet = ADOTMasterIncome
    Left = 280
    Top = 80
  end
  object ADOTMasterExpense: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'expenses'
    Left = 176
    Top = 200
  end
  object DSMasterExpense: TDataSource
    DataSet = ADOTMasterExpense
    Left = 280
    Top = 200
  end
  object ADOQMasterExpense: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM expenses')
    Left = 176
    Top = 248
  end
  object ADOTLog: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'log'
    Left = 368
    Top = 80
    object ADOTLogcode: TWideStringField
      FieldName = 'code'
      Size = 255
    end
    object ADOTLogdate: TDateTimeField
      FieldName = 'date'
      DisplayFormat = 'dd-MMM-yyyy'
    end
    object ADOTLogbulan: TWideStringField
      FieldName = 'bulan'
      Size = 255
    end
    object ADOTLogtahun: TWideStringField
      FieldName = 'tahun'
      Size = 255
    end
    object ADOTLogtype: TWideStringField
      FieldName = 'type'
      Size = 255
    end
    object ADOTLogkode_akun: TWideStringField
      FieldName = 'kode_akun'
      Size = 255
    end
    object ADOTLogakun: TWideStringField
      FieldName = 'akun'
      Size = 255
    end
    object ADOTLogamount: TBCDField
      FieldName = 'amount'
      DisplayFormat = '#,#0.00;(#,#0.00);#,#0.00'
      Precision = 19
    end
  end
  object ADOQLog: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 368
    Top = 128
  end
  object DSLog: TDataSource
    DataSet = ADOTLog
    Left = 432
    Top = 88
  end
  object Income: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 424
    Top = 208
  end
  object Expense: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 496
    Top = 208
  end
  object JAN: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 480
    Top = 16
  end
  object FEB: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 520
    Top = 16
  end
  object MAR: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 560
    Top = 16
  end
  object APR: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 600
    Top = 16
  end
  object MEI: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 640
    Top = 16
  end
  object JUN: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 680
    Top = 16
  end
  object JUL: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 720
    Top = 16
  end
  object AGUS: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 760
    Top = 16
  end
  object SEP: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 800
    Top = 16
  end
  object OKT: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 840
    Top = 16
  end
  object NOV: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 880
    Top = 16
  end
  object DES: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 920
    Top = 16
  end
  object JAN1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 488
    Top = 72
  end
  object FEB1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 536
    Top = 72
  end
  object MAR1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 584
    Top = 80
  end
  object APR1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 632
    Top = 80
  end
  object MEI1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 680
    Top = 80
  end
  object JUN1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 728
    Top = 80
  end
  object JUL1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 776
    Top = 80
  end
  object AGUS1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 824
    Top = 80
  end
  object SEP1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 872
    Top = 88
  end
  object OKT1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 920
    Top = 88
  end
  object NOV1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 520
    Top = 136
  end
  object DES1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 584
    Top = 144
  end
  object GrafikIncome: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 640
    Top = 216
  end
  object GrafikExpense: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM log')
    Left = 728
    Top = 216
  end
end
