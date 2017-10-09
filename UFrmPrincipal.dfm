object Form1: TForm1
  Left = 0
  Top = 0
  BorderWidth = 2
  Caption = 'Form1'
  ClientHeight = 294
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 40
    Top = 128
    Width = 161
    Height = 49
    Caption = 'Quadrado'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 56
    Width = 161
    Height = 49
    Caption = 'Circulo'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 232
    Top = 56
    Width = 161
    Height = 49
    Caption = 'Retangulo'
    TabOrder = 1
    OnClick = Button3Click
  end
end
