object Form1: TForm1
  Left = 0
  Top = 0
  BorderWidth = 2
  Caption = 'Form1'
  ClientHeight = 385
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object btnQuadrado: TButton
    Left = 40
    Top = 8
    Width = 161
    Height = 49
    Caption = 'Quadrado'
    TabOrder = 0
    OnClick = btnFormaGeometricaClick
  end
  object btnCirculo: TButton
    Tag = 2
    Left = 40
    Top = 118
    Width = 161
    Height = 49
    Caption = 'Circulo'
    TabOrder = 2
    OnClick = btnFormaGeometricaClick
  end
  object btnRetangulo: TButton
    Tag = 1
    Left = 40
    Top = 63
    Width = 161
    Height = 49
    Caption = 'Retangulo'
    TabOrder = 1
    OnClick = btnFormaGeometricaClick
  end
end
