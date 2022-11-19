object FTransaksiLog: TFTransaksiLog
  Left = 182
  Top = 135
  Width = 896
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'TRANSAKSI LOG'
  Color = 5911085
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 284
    Height = 33
    Cursor = crHandPoint
    Caption = 'FORM TRANSAKSI LOG'
    Color = 16309173
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16309173
    Font.Height = -27
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Shape1: TShape
    Left = 4
    Top = 48
    Width = 864
    Height = 4
    Pen.Color = clWhite
  end
  object Label10: TLabel
    Left = 9
    Top = 61
    Width = 29
    Height = 15
    Caption = 'Code'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 9
    Top = 235
    Width = 48
    Height = 15
    Caption = 'Account'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 9
    Top = 123
    Width = 28
    Height = 15
    Caption = 'Date'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 9
    Top = 179
    Width = 28
    Height = 15
    Caption = 'Type'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 9
    Top = 299
    Width = 45
    Height = 15
    Caption = 'Amount'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 97
    Top = 235
    Width = 77
    Height = 15
    Caption = 'KodeAccount'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object Panel2: TPanel
    Left = 404
    Top = 9
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = 'New'
    Color = 15773696
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Panel2Click
  end
  object Panel3: TPanel
    Left = 497
    Top = 9
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = 'Add'
    Color = 15773696
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Panel3Click
  end
  object Panel4: TPanel
    Left = 590
    Top = 9
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = 'Update'
    Color = 15773696
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Panel4Click
  end
  object Panel5: TPanel
    Left = 682
    Top = 9
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = 'Delete'
    Color = 15773696
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Panel5Click
  end
  object Panel6: TPanel
    Left = 775
    Top = 9
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = 'Clear'
    Color = 15773696
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Panel6Click
  end
  object DBGrid1: TDBGrid
    Left = 264
    Top = 82
    Width = 601
    Height = 263
    Color = 3282457
    DataSource = DM.DSLog
    FixedColor = 16309173
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'code'
        Title.Caption = 'CODE'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date'
        Title.Caption = 'DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bulan'
        Title.Caption = 'BULAN'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tahun'
        Title.Caption = 'TAHUN'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type'
        Title.Caption = 'TYPE'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kode_akun'
        Title.Caption = 'KODE AKUN'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'akun'
        Title.Caption = 'AKUN'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Title.Caption = 'AMOUNT'
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 9
    Top = 83
    Width = 249
    Height = 21
    Color = 3282457
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object Edit2: TEdit
    Left = 9
    Top = 257
    Width = 249
    Height = 21
    Color = 3282457
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnKeyPress = Edit2KeyPress
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 353
    Width = 865
    Height = 81
    Caption = ' Pencarian :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    object Edit3: TEdit
      Left = 25
      Top = 48
      Width = 816
      Height = 21
      Color = 3282457
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = Edit3Change
    end
    object RadioButton1: TRadioButton
      Left = 145
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Code'
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 241
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Bulan'
      TabOrder = 2
    end
    object RadioButton4: TRadioButton
      Left = 337
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Tahun'
      TabOrder = 3
    end
    object RadioButton5: TRadioButton
      Left = 433
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Type'
      TabOrder = 4
    end
    object RadioButton6: TRadioButton
      Left = 521
      Top = 24
      Width = 105
      Height = 17
      Caption = 'Kode Akun'
      TabOrder = 5
    end
    object RadioButton7: TRadioButton
      Left = 641
      Top = 24
      Width = 72
      Height = 17
      Caption = 'Akun'
      TabOrder = 6
    end
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 144
    Width = 249
    Height = 21
    Date = 44847.000000000000000000
    Format = 'dd-MMM-yyyy'
    Time = 44847.000000000000000000
    Color = 3282457
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnChange = DateTimePicker1Change
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 200
    Width = 249
    Height = 21
    Color = 3282457
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 10
    Text = '-- PILIH TYPE --'
    Items.Strings = (
      'INCOME'
      'EXPENSE')
  end
  object Edit4: TEdit
    Left = 9
    Top = 321
    Width = 249
    Height = 21
    Color = 3282457
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object Edit5: TEdit
    Left = 56
    Top = 112
    Width = 41
    Height = 21
    TabOrder = 12
    Visible = False
    OnChange = Edit5Change
  end
  object Edit6: TEdit
    Left = 104
    Top = 112
    Width = 41
    Height = 21
    TabOrder = 13
    Visible = False
  end
  object Edit7: TEdit
    Left = 152
    Top = 112
    Width = 41
    Height = 21
    TabOrder = 14
    Visible = False
  end
end
