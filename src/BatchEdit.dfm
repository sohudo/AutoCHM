object FrmBatch: TFrmBatch
  Left = 356
  Top = 251
  BorderStyle = bsDialog
  Caption = 'Batch Edit'
  ClientHeight = 244
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 4
    Width = 289
    Height = 197
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'General'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 58
        Height = 13
        Caption = '&Title Include'
      end
      object Label2: TLabel
        Left = 11
        Top = 60
        Width = 55
        Height = 13
        Caption = '&Replace for'
      end
      object Edit1: TEdit
        Left = 8
        Top = 31
        Width = 257
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 8
        Top = 79
        Width = 257
        Height = 21
        TabOrder = 1
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 113
        Width = 97
        Height = 17
        Caption = 'Include Index'
        TabOrder = 2
      end
      object CheckBox2: TCheckBox
        Left = 10
        Top = 144
        Width = 263
        Height = 17
        Caption = 'Replace Select Node'
        TabOrder = 3
      end
    end
  end
  object BtnOK: TButton
    Left = 135
    Top = 211
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 1
    OnClick = BtnOKClick
  end
  object BtnClost: TButton
    Left = 219
    Top = 211
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = BtnClostClick
  end
end
