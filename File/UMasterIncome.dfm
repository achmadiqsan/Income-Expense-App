object FMasterIncome: TFMasterIncome
  Left = 309
  Top = 223
  Width = 891
  Height = 321
  BorderIcons = [biSystemMenu]
  Caption = 'MASTER INCOME'
  Color = 5911085
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 317
    Height = 32
    Cursor = crHandPoint
    Caption = 'FORM MASTER INCOME'
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
    Left = 1
    Top = 48
    Width = 864
    Height = 4
    Pen.Color = clWhite
  end
  object Label10: TLabel
    Left = 9
    Top = 61
    Width = 84
    Height = 16
    Caption = 'Kode Income'
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
    Top = 130
    Width = 88
    Height = 16
    Caption = 'Income Name'
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
    Height = 103
    Color = 3282457
    DataSource = DM.DSMasterIncome
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
        FieldName = 'kode_income'
        Title.Caption = 'KODE INCOME'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'income_name'
        Title.Caption = 'INCOME NAME'
        Width = 300
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 9
    Top = 83
    Width = 249
    Height = 22
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
    Top = 152
    Width = 249
    Height = 22
    Color = 3282457
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 193
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
      Top = 35
      Width = 816
      Height = 22
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
  end
end
