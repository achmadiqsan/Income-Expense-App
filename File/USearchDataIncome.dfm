object FSearchDataIncome: TFSearchDataIncome
  Left = 386
  Top = 137
  Width = 900
  Height = 389
  BorderIcons = [biSystemMenu]
  Caption = 'SEARCH DATA INCOME'
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
    Width = 284
    Height = 33
    Cursor = crHandPoint
    Caption = 'SEARCH DATA INCOME'
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
    Left = 10
    Top = 48
    Width = 864
    Height = 4
    Pen.Color = clWhite
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 64
    Width = 865
    Height = 81
    Caption = 'Pencarian :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Edit3: TEdit
      Left = 25
      Top = 45
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
      Left = 243
      Top = 20
      Width = 142
      Height = 17
      Caption = 'Code Income'
      TabOrder = 1
    end
    object RadioButton2: TRadioButton
      Left = 435
      Top = 20
      Width = 142
      Height = 17
      Caption = 'Income Name'
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 154
    Width = 865
    Height = 183
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
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
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
end
