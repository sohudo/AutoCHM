object FrmFileList: TFrmFileList
  Left = 302
  Top = 227
  BorderStyle = bsDialog
  Caption = 'File List'
  ClientHeight = 297
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    384
    297)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 296
    Top = 198
    Width = 6
    Height = 13
    Caption = '0'
  end
  object btnOK: TButton
    Left = -69
    Top = 107
    Width = 65
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 9
    Top = 41
    Width = 272
    Height = 21
    TabOrder = 1
  end
  object BtnCancel: TButton
    Left = 291
    Top = 266
    Width = 85
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 2
    OnClick = BtnCancelClick
  end
  object ListView1: TListView
    Left = 9
    Top = 70
    Width = 272
    Height = 219
    Columns = <
      item
        Caption = 'Filename'
        Width = 265
      end>
    HideSelection = False
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    ParentShowHint = False
    ShowHint = True
    SortType = stText
    TabOrder = 3
    ViewStyle = vsReport
    OnClick = ListView1Click
    OnDblClick = ListView1DblClick
  end
  object BtnAdd: TButton
    Left = 290
    Top = 63
    Width = 86
    Height = 23
    Caption = 'Add'
    TabOrder = 4
  end
  object btnRemove: TButton
    Left = 290
    Top = 135
    Width = 86
    Height = 23
    Caption = 'Remove'
    TabOrder = 5
    OnClick = btnRemoveClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 5
    Width = 273
    Height = 21
    TabOrder = 6
  end
  object btnAddFolder: TButton
    Left = 290
    Top = 98
    Width = 86
    Height = 23
    Caption = 'Add Folder'
    TabOrder = 7
  end
  object Button1: TButton
    Left = 291
    Top = 234
    Width = 85
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'Select'
    TabOrder = 8
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'All files(*.*)|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 136
    Top = 184
  end
end
