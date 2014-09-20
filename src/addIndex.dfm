object FrmIndex: TFrmIndex
  Left = 373
  Top = 276
  BorderStyle = bsDialog
  Caption = 'Add Index'
  ClientHeight = 226
  ClientWidth = 301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 4
    Width = 289
    Height = 181
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'General'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Entry &title'
      end
      object Label2: TLabel
        Left = 11
        Top = 106
        Width = 53
        Height = 13
        Caption = '&Files/URLs'
      end
      object SpeedButton1: TSpeedButton
        Left = 248
        Top = 126
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
      object Label3: TLabel
        Left = 8
        Top = 56
        Width = 41
        Height = 13
        Caption = '&Keyword'
      end
      object Edit1: TEdit
        Left = 8
        Top = 28
        Width = 257
        Height = 21
        TabOrder = 0
        OnChange = Edit1Change
      end
      object Edit3: TEdit
        Left = 8
        Top = 126
        Width = 233
        Height = 21
        Color = clScrollBar
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 8
        Top = 78
        Width = 257
        Height = 21
        TabOrder = 2
      end
    end
  end
  object BtnOK: TButton
    Left = 135
    Top = 195
    Width = 75
    Height = 25
    Caption = '&OK'
    TabOrder = 1
    OnClick = BtnOKClick
  end
  object BtnClost: TButton
    Left = 219
    Top = 195
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 2
    OnClick = BtnClostClick
  end
end
