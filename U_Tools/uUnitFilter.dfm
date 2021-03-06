object UnitFilterForm: TUnitFilterForm
  Left = 209
  Top = 103
  BorderStyle = bsDialog
  Caption = 'Unit Filter'
  ClientHeight = 389
  ClientWidth = 286
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    286
    389)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TButton
    Left = 124
    Top = 363
    Width = 75
    Height = 21
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOkClick
  end
  object Button2: TButton
    Left = 204
    Top = 363
    Width = 75
    Height = 21
    Anchors = [akLeft, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 4
    Top = 4
    Width = 277
    Height = 349
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label2: TLabel
      Left = 12
      Top = 20
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object Label1: TLabel
      Left = 12
      Top = 52
      Width = 40
      Height = 13
      Caption = 'Number:'
    end
    object Label3: TLabel
      Left = 12
      Top = 84
      Width = 38
      Height = 13
      Caption = 'Faction:'
    end
    object Label4: TLabel
      Left = 12
      Top = 144
      Width = 27
      Height = 13
      Caption = 'Skills:'
    end
    object Label5: TLabel
      Left = 12
      Top = 236
      Width = 28
      Height = 13
      Caption = 'Items:'
    end
    object lbItems: TListBox
      Left = 60
      Top = 232
      Width = 205
      Height = 57
      Style = lbOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 8
      OnDrawItem = lbItemsDrawItem
    end
    object cmItem: TComboBox
      Left = 60
      Top = 292
      Width = 165
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 9
      OnDrawItem = cmItemDrawItem
    end
    object ToolBar4: TToolBar
      Left = 228
      Top = 294
      Width = 43
      Height = 19
      Align = alNone
      ButtonHeight = 18
      ButtonWidth = 19
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = ResForm.SmallBtnList
      TabOrder = 10
      object btnAddItem: TToolButton
        Left = 0
        Top = 0
        Caption = 'ToolButton1'
        ImageIndex = 0
        OnClick = btnAddItemClick
      end
      object btnDelItem: TToolButton
        Left = 19
        Top = 0
        Caption = 'ToolButton3'
        ImageIndex = 1
        OnClick = btnDelItemClick
      end
    end
    object cmSkill: TComboBox
      Left = 60
      Top = 200
      Width = 129
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 5
      OnDrawItem = cmSkillDrawItem
    end
    object eSkillLv: TIntEdit
      Left = 192
      Top = 200
      Width = 33
      Height = 22
      MaxValue = 5
      MinValue = 1
      TabOrder = 6
      Value = 1
    end
    object ToolBar3: TToolBar
      Left = 228
      Top = 202
      Width = 45
      Height = 19
      Align = alNone
      ButtonHeight = 18
      ButtonWidth = 19
      Caption = 'ToolBar1'
      EdgeBorders = []
      Flat = True
      Images = ResForm.SmallBtnList
      TabOrder = 7
      object btnAddSkill: TToolButton
        Left = 0
        Top = 0
        Caption = 'ToolButton1'
        ImageIndex = 0
        OnClick = btnAddSkillClick
      end
      object btnDelSkill: TToolButton
        Left = 19
        Top = 0
        Caption = 'btnDelSkill'
        ImageIndex = 1
        OnClick = btnDelSkillClick
      end
    end
    object lbSkills: TListBox
      Left = 60
      Top = 140
      Width = 205
      Height = 57
      Style = lbOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 4
      OnDrawItem = lbSkillsDrawItem
    end
    object cbMage: TCheckBox
      Left = 60
      Top = 112
      Width = 57
      Height = 17
      Caption = 'Mages'
      TabOrder = 3
    end
    object cmFaction: TComboBox
      Left = 60
      Top = 80
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
    end
    object ToolBar1: TToolBar
      Left = 240
      Top = 78
      Width = 29
      Height = 29
      Align = alNone
      Caption = 'ToolBar1'
      EdgeBorders = []
      Images = ResForm.BtnImages
      TabOrder = 11
      object btnMyFaction: TToolButton
        Left = 0
        Top = 2
        Caption = 'btnMyFaction'
        ImageIndex = 11
        OnClick = btnMyFactionClick
      end
    end
    object eName: TEdit
      Left = 60
      Top = 16
      Width = 205
      Height = 21
      TabOrder = 0
    end
    object eNumber: TEdit
      Left = 60
      Top = 48
      Width = 205
      Height = 21
      TabOrder = 1
    end
    object cbOr: TCheckBox
      Left = 152
      Top = 324
      Width = 105
      Height = 17
      Caption = 'Any of items/skills'
      TabOrder = 12
    end
  end
  object ToolBar2: TToolBar
    Left = 8
    Top = 360
    Width = 37
    Height = 29
    Align = alNone
    Caption = 'ToolBar2'
    EdgeBorders = []
    Images = ResForm.BtnImages
    TabOrder = 3
    object btnClear: TToolButton
      Left = 0
      Top = 2
      Caption = 'btnClear'
      ImageIndex = 60
      OnClick = btnClearClick
    end
  end
end
