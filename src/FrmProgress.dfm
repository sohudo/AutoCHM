object FormPro: TFormPro
  Left = 251
  Top = 256
  BorderStyle = bsNone
  Caption = #28040#24687#26174#31034#31383#20307
  ClientHeight = 85
  ClientWidth = 315
  Color = clWhite
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object lblTitle: TLabel
    Left = 80
    Top = 18
    Width = 6
    Height = 12
    Transparent = True
  end
  object Gauge: TGauge
    Left = 15
    Top = 56
    Width = 284
    Height = 17
    Color = clWhite
    ParentColor = False
    Progress = 0
  end
end
