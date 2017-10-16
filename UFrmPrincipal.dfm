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
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 23
  object gbFerramentas: TGroupBox
    Left = 0
    Top = 0
    Width = 594
    Height = 145
    Align = alTop
    Caption = ' Ferramentas'
    TabOrder = 0
    DesignSize = (
      594
      145)
    object shCor: TShape
      Left = 16
      Top = 87
      Width = 65
      Height = 50
      OnMouseDown = shCorMouseDown
    end
    object rgTipoFormaGeometrica: TRadioGroup
      Left = 16
      Top = 24
      Width = 561
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Tipo Forma Geometrica'
      TabOrder = 0
    end
    object cbxCorAleatoria: TCheckBox
      Left = 96
      Top = 104
      Width = 133
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Cor Aleat'#243'ria'
      TabOrder = 1
    end
  end
  object gbAreaDesenho: TGroupBox
    Left = 0
    Top = 145
    Width = 594
    Height = 240
    Align = alClient
    Caption = #193'rea de Desenho'
    TabOrder = 1
    OnMouseDown = gbAreaDesenhoMouseDown
  end
  object cdSelecao: TColorDialog
    Left = 528
    Top = 24
  end
end
