object FrmValores: TFrmValores
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Informe'
  ClientHeight = 129
  ClientWidth = 266
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
  object Label1: TLabel
    Left = 43
    Top = 32
    Width = 23
    Height = 13
    Caption = 'Base'
  end
  object Label2: TLabel
    Left = 43
    Top = 64
    Width = 29
    Height = 13
    Caption = 'Altura'
  end
  object edBase: TEdit
    Left = 80
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edAltura: TEdit
    Left = 80
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyDown = edAlturaKeyDown
  end
  object btnCalcular: TBitBtn
    Left = 80
    Top = 83
    Width = 121
    Height = 25
    Caption = 'Calcular'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = btnCalcularClick
  end
end
