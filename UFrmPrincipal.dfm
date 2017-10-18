object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Desenho OO'
  ClientHeight = 406
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmDesenho
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmDesenho: TMainMenu
    Left = 216
    Top = 88
    object Desenho1: TMenuItem
      Caption = 'Iniciar'
      object Desenho2: TMenuItem
        Caption = 'Desenho'
        OnClick = Desenho2Click
      end
      object Estrutura1: TMenuItem
        Caption = 'Estrutura'
        OnClick = Estrutura1Click
      end
    end
  end
end
