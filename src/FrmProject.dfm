object FrmPro: TFrmPro
  Left = 243
  Top = 177
  BorderStyle = bsDialog
  Caption = 'Project'
  ClientHeight = 377
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    387
    377)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 387
    Height = 329
    ActivePage = TabSheet1
    Align = alTop
    MultiLine = True
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Files'
      object Label_TITLE: TLabel
        Left = 9
        Top = 18
        Width = 20
        Height = 13
        Caption = '&Title'
      end
      object Label_HOME: TLabel
        Left = 9
        Top = 90
        Width = 28
        Height = 13
        Caption = '&Home'
      end
      object Label_DEF: TLabel
        Left = 9
        Top = 57
        Width = 34
        Height = 13
        Caption = '&Default'
      end
      object Label_lang: TLabel
        Left = 9
        Top = 241
        Width = 48
        Height = 13
        Caption = '&Language'
      end
      object Label4: TLabel
        Left = 9
        Top = 127
        Width = 59
        Height = 13
        Caption = 'Compiled file'
      end
      object Label5: TLabel
        Left = 9
        Top = 164
        Width = 53
        Height = 13
        Caption = 'Content file'
      end
      object Label6: TLabel
        Left = 9
        Top = 199
        Width = 42
        Height = 13
        Caption = 'Index file'
      end
      object SpeedButton1: TSpeedButton
        Left = 336
        Top = 48
        Width = 23
        Height = 22
        Hint = 'Select Html File'
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C5922391A7A2A1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C9B2A171E1F7C1F7C7A2AF61D4D194D194D194D194D191F7C1F7C
          1F7C1F7C1F7CBD22F5211F7C1F7C4D19F8195B1EBD22DE2ADB32BD224D194D19
          1F7C1F7C1F7CDD26F5211F7C4D197C1A7E1E5D1A7D1A9E1EFE2A5F3B3D47F61D
          4D191F7C1F7CBC327B164D199E1A7D1A5C165C164E194E19D615DE225F375E4B
          F61D1F7C1F7C1F7CDE1EBE1A9D165C163B1650151F7C1F7C1F7CD615BE1E5F37
          DB3EF61D1F7C1F7CDC32DE1A9D165C12940D4D194D194D194D194D194D194D19
          4D194D191F7C1F7C1F7CFE1EBD167C12FA15FA15FA15FA15FA15FA15FA15FA15
          FA15F61D1F7C1F7C1F7C1F7C1E23BD167C125B125C165C165C165C165D1A7E1E
          9D22F61D1F7C1F7C3D4B1F7C1E231E2317162D111F7C1F7CD615391A5D167D1A
          7D1AF61D1F7C1F7C1F7C3D4B1F7C1E23BC1E4D150B154E19D6157C165C169E1E
          F61D1F7C1F7C1F7C1F7CFA463C471F7C7E47DC1E161239129C167C129D169D1E
          F61D1F7C1F7C1F7C1F7C1F7CFA46FA465C335C335E23DE1ABD16BD169D1AF61D
          1F7CFA461F7C1F7C1F7C1F7C1F7C1F7CFA46FA46FA46DB2A3F27F61DF61D1F7C
          1F7CFA461F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CFA463C471F7C1F7C
          1F7CFA461F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C3C473C47
          FA461F7C1F7C}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 336
        Top = 80
        Width = 23
        Height = 22
        Hint = 'Select Html File'
        Flat = True
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C5922391A7A2A1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C9B2A171E1F7C1F7C7A2AF61D4D194D194D194D194D191F7C1F7C
          1F7C1F7C1F7CBD22F5211F7C1F7C4D19F8195B1EBD22DE2ADB32BD224D194D19
          1F7C1F7C1F7CDD26F5211F7C4D197C1A7E1E5D1A7D1A9E1EFE2A5F3B3D47F61D
          4D191F7C1F7CBC327B164D199E1A7D1A5C165C164E194E19D615DE225F375E4B
          F61D1F7C1F7C1F7CDE1EBE1A9D165C163B1650151F7C1F7C1F7CD615BE1E5F37
          DB3EF61D1F7C1F7CDC32DE1A9D165C12940D4D194D194D194D194D194D194D19
          4D194D191F7C1F7C1F7CFE1EBD167C12FA15FA15FA15FA15FA15FA15FA15FA15
          FA15F61D1F7C1F7C1F7C1F7C1E23BD167C125B125C165C165C165C165D1A7E1E
          9D22F61D1F7C1F7C3D4B1F7C1E231E2317162D111F7C1F7CD615391A5D167D1A
          7D1AF61D1F7C1F7C1F7C3D4B1F7C1E23BC1E4D150B154E19D6157C165C169E1E
          F61D1F7C1F7C1F7C1F7CFA463C471F7C7E47DC1E161239129C167C129D169D1E
          F61D1F7C1F7C1F7C1F7C1F7CFA46FA465C335C335E23DE1ABD16BD169D1AF61D
          1F7CFA461F7C1F7C1F7C1F7C1F7C1F7CFA46FA46FA46DB2A3F27F61DF61D1F7C
          1F7CFA461F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7CFA463C471F7C1F7C
          1F7CFA461F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C3C473C47
          FA461F7C1F7C}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object Edit1: TEdit
        Left = 77
        Top = 17
        Width = 280
        Height = 21
        MaxLength = 50
        TabOrder = 0
      end
      object ComboBoxlang: TComboBox
        Left = 77
        Top = 240
        Width = 280
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = '0x804 '#20013#25991'('#20013#22269')'
        Items.Strings = (
          '0x804 '#20013#25991'('#20013#22269')')
      end
      object btnDefault: TButton
        Left = 285
        Top = 272
        Width = 73
        Height = 25
        Caption = 'Default'
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 77
        Top = 83
        Width = 252
        Height = 21
        MaxLength = 50
        TabOrder = 3
      end
      object Edit2: TEdit
        Left = 77
        Top = 49
        Width = 252
        Height = 21
        MaxLength = 50
        TabOrder = 4
      end
      object Edit4: TEdit
        Left = 77
        Top = 121
        Width = 280
        Height = 21
        MaxLength = 50
        TabOrder = 5
      end
      object Edit5: TEdit
        Left = 77
        Top = 161
        Width = 280
        Height = 21
        MaxLength = 50
        TabOrder = 6
      end
      object Edit6: TEdit
        Left = 77
        Top = 197
        Width = 280
        Height = 21
        MaxLength = 50
        TabOrder = 7
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'other'
      ImageIndex = 5
      object GroupBox5: TGroupBox
        Left = 2
        Top = 9
        Width = 119
        Height = 208
        Caption = 'Tabs'
        TabOrder = 0
        object ChkPane2: TCheckBox
          Left = 15
          Top = 59
          Width = 87
          Height = 19
          Caption = 'Index'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object ChkPane3: TCheckBox
          Left = 15
          Top = 93
          Width = 87
          Height = 19
          Caption = 'Search'
          TabOrder = 1
        end
        object ChkPane5: TCheckBox
          Left = 15
          Top = 159
          Width = 82
          Height = 19
          Caption = 'Favorites'
          TabOrder = 2
        end
        object ChkPane1: TCheckBox
          Left = 15
          Top = 25
          Width = 87
          Height = 19
          Caption = 'Contents'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object ChkPane4: TCheckBox
          Left = 15
          Top = 127
          Width = 90
          Height = 19
          Caption = 'Advanced'
          TabOrder = 4
        end
      end
      object GroupBox1: TGroupBox
        Left = 144
        Top = 8
        Width = 225
        Height = 209
        Caption = 'Compiled'
        TabOrder = 1
        object Chkhhp1: TCheckBox
          Left = 11
          Top = 14
          Width = 145
          Height = 25
          Caption = 'Create a binary index'
          TabOrder = 0
        end
        object Chkhhp2: TCheckBox
          Left = 11
          Top = 39
          Width = 153
          Height = 25
          Caption = 'Create a binary TOC'
          TabOrder = 1
        end
        object Chkhhp4: TCheckBox
          Left = 10
          Top = 103
          Width = 193
          Height = 25
          Caption = 'Compile full-text search information'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object Chkhhp5: TCheckBox
          Left = 10
          Top = 133
          Width = 185
          Height = 25
          Caption = 'Support enhanced decompilation'
          TabOrder = 3
        end
        object Chkhhp6: TCheckBox
          Left = 9
          Top = 161
          Width = 194
          Height = 25
          Caption = 'Don'#39't include folders in compiled file'
          TabOrder = 4
        end
        object Chkhhp3: TCheckBox
          Left = 11
          Top = 68
          Width = 153
          Height = 25
          Caption = 'Create a CHI'
          TabOrder = 5
        end
      end
    end
  end
  object btnClose: TButton
    Left = 295
    Top = 339
    Width = 70
    Height = 23
    Anchors = [akTop, akRight]
    BiDiMode = bdLeftToRight
    Caption = 'Close'
    ParentBiDiMode = False
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object Button1: TButton
    Left = 215
    Top = 339
    Width = 70
    Height = 23
    Anchors = [akTop, akRight]
    BiDiMode = bdLeftToRight
    Caption = '&OK'
    ParentBiDiMode = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object FontDialog2: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Options = []
    Left = 16
    Top = 336
  end
end
