object SelAmountForm: TSelAmountForm
  Left = 211
  Top = 102
  HelpContext = 6
  BorderStyle = bsDialog
  Caption = 'Sell'
  ClientHeight = 147
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object HavingLabel: TLabel
    Left = 4
    Top = 8
    Width = 42
    Height = 13
    Caption = 'Unit has:'
  end
  object HavingCountLabel: TLabel
    Left = 52
    Top = 8
    Width = 85
    Height = 13
    AutoSize = False
    Caption = '10 plainsmen'
  end
  object FundsWantedLabel: TLabel
    Left = 144
    Top = 8
    Width = 62
    Height = 13
    Caption = 'Wanted: 200'
  end
  object Button1: TButton
    Left = 36
    Top = 116
    Width = 75
    Height = 21
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 128
    Top = 116
    Width = 75
    Height = 21
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object TradeBox: TGroupBox
    Left = 4
    Top = 28
    Width = 229
    Height = 77
    Caption = ' Sell '
    TabOrder = 2
    object GoodsLabel: TLabel
      Left = 118
      Top = 24
      Width = 47
      Height = 13
      Caption = 'plainsmen'
    end
    object GoodsImage: TImage
      Left = 96
      Top = 22
      Width = 16
      Height = 16
      Picture.Data = {
        07544269746D617036040000424D360400000000000036000000280000001000
        0000100000000100200000000000000400000000000000000000000000000000
        0000FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0000000C0FF00
        FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0000000C0FF00FF00FF00FFC0FF00FFC0FF00FFC0000000C0000000000000
        0000FF00FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0FF00FFC0000000C0000000000000000000000000FFFF0000B5B500FF0000
        0000FF00FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0FF00FFC0000000C080FFFF0080FFFFFF000000FFFFFF0000B5B500FF0000
        0000FF00FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0000000C0000000000000000000000000FFFF0000FFFF0000FFFF00FFB5B5
        0000000000B5FF00FF00FF00FFC0FF00FFC0000000C0FF00FF00FF00FFC0FF00
        FFC0000000C0FFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF
        0000B5B500FF00000000000000000000000000000000FF00FF00FF00FFC0FF00
        FFC0000000C0FFFF0000FFFF00FFFFFF0000FFFF00FF00000000000000000000
        00000000000000000000FFFFFF00FFFFFFFFFFFFFFFF000000FFFF00FF00FF00
        FFC000000000FFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF
        0000000000FFFFFFFF00FFFFFFFFFFFFFFFF000000FF00000000FF00FF00FF00
        FFC000000000FFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF
        0000000000FFFFFFFF00FFFFFFFF000000FFFFFFFF00FFFFFFFF000000FF0000
        0000000000C0FFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF
        0000000000FF00000000FFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00FFFF00FFC0000000C000000000000000000000000000000000000000000000
        00000000000000000000FFFFFF00FFFFFFFF808080FF8080808000000080FF00
        FF00FF00FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC00000
        00C0000000000000000000000000FFFFFF00FFFFFFFFFFFFFFFF000000FFFF00
        FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC00000
        00C0000000000000000000000000000000000000000000000000000000000000
        0000FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0000000C0000000000000000000000000000000000000000000000000FF00
        FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0FF00FFC0000000C000000000000000000000000000000000FF00FF00FF00
        FFC0FF00FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0}
      Transparent = True
    end
    object CostLabel: TLabel
      Left = 118
      Top = 48
      Width = 24
      Height = 13
      Caption = '2000'
    end
    object Image1: TImage
      Left = 96
      Top = 46
      Width = 16
      Height = 16
      Picture.Data = {
        07544269746D617036040000424D360400000000000036000000280000001000
        0000100000000100200000000000000400000000000000000000000000000000
        0000FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0FF00FFC0000000C00000000000000000FF00FF00FF00FFC0FF00FFC0FF00
        FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0000000C000FFFF0000FFFFFF00FFFFFF000000FFFF00FF00FF00FFC0FF00
        FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0000000C000FFFF0000FFFFFF00FFFFFF000000FFFF00FF00FF00FFC0FF00
        FFC0FF00FFC0FF00FFC0FF00FFC0000000C00000000000000000FF00FF00FF00
        FFC0FF00FFC0000000C00000000000000000FF00FF00000000C0000000000000
        0000FF00FF00FF00FFC0000000C000FFFF0000FFFFFF00FFFFFF000000FFFF00
        FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0000000C0FFFFFF00FFFFFFFFFFFF
        FFFF000000FFFF00FF00000000C000000000000000000000000000000000FF00
        FF00FF00FFC0FF00FFC0FF00FFC0000000C000000000FFFFFF00FFFFFFFFFFFF
        FFFF000000FFFF00FF00000000C0FFFFFF00FFFFFFFFFFFFFFFF000000FFFF00
        FF00FF00FFC0FF00FFC0000000C000FFFF0000FFFFFF000000FF000000000000
        0000FF00FF00FF00FFC0000000C000000000000000000000000000000000FF00
        FF00FF00FFC0FF00FFC0000000C000FFFF0000FFFFFF00FFFFFF000000FFFF00
        FF00FF00FFC0FF00FFC0000000C000FFFF0000FFFFFF00FFFFFF000000FFFF00
        FF00FF00FFC0FF00FFC0FF00FFC0000000C00000000000000000FF00FF00FF00
        FFC0FF00FFC0FF00FFC0000000C000000000000000000000000000000000FF00
        FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0000000C0000000000000
        0000FF00FF00FF00FFC0000000C000FFFF0000FFFFFF00FFFFFF000000FFFF00
        FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0000000C000FFFF0000FFFFFF00FF
        FFFF000000FFFF00FF00FF00FFC0000000C00000000000000000FF00FF00FF00
        FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0000000C000000000000000000000
        000000000000FF00FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0000000C0FFFFFF00FFFFFFFFFFFF
        FFFF000000FFFF00FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0000000C0000000000000
        0000FF00FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0FF00FF00FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00FFC0FF00
        FFC0}
      Transparent = True
    end
    object AmountEdit: TIntEdit
      Left = 16
      Top = 20
      Width = 73
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnChange = AmountEditChange
    end
    object cbAll: TCheckBox
      Left = 16
      Top = 44
      Width = 41
      Height = 17
      Caption = 'all'
      TabOrder = 1
      OnClick = cbAllClick
    end
  end
end
