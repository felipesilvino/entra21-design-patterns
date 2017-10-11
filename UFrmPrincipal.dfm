object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderWidth = 2
  Caption = 'FrmPrincipal'
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
  PixelsPerInch = 96
  TextHeight = 13
  object gbFerramentas: TGroupBox
    Left = 0
    Top = 0
    Width = 594
    Height = 105
    Align = alTop
    Caption = ' Ferramentas'
    TabOrder = 0
    ExplicitLeft = 176
    ExplicitTop = 88
    ExplicitWidth = 185
    object shCor: TShape
      Left = 303
      Top = 30
      Width = 65
      Height = 50
      OnMouseDown = shCorMouseDown
    end
    object rgTipoFormaGeometrica: TRadioGroup
      Left = 16
      Top = 24
      Width = 281
      Height = 57
      Caption = 'Tipo Forma Geometrica'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Quadrado'
        'Retangulo'
        'Circulo')
      TabOrder = 0
    end
  end
  object gbAreaDesenho: TGroupBox
    Left = 0
    Top = 105
    Width = 594
    Height = 280
    Align = alClient
    Caption = #193'rea de Desenho'
    TabOrder = 1
    OnMouseDown = gbAreaDesenhoMouseDown
    ExplicitTop = 111
  end
  object cdSelecao: TColorDialog
    Left = 528
    Top = 24
  end
end
