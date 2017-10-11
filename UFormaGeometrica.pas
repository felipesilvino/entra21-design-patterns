unit UFormaGeometrica;

interface

uses
    Graphics
  , ExtCtrls
  , Controls
  ;

type
  TTipoFormaGeometrica = (tfgQuadrado
                        , tfgRetangulo
                        , tfgCirculo);

  TFormaGeometrica = class abstract
  protected
    Cor: TColor;
    Shape: TShape;

  public
    constructor Create(const coCor: TColor);

    function CalculaArea: Double; virtual; abstract;
    function SolicitaParametros: Boolean; virtual; abstract;

    procedure Desenha(const ciX, ciY: Integer; const coParent: TWinControl); virtual;

    class function
      Fabrica(const ceTipoFormaGeometrica: TTipoFormaGeometrica;
              const coCor: TColor):
        TFormaGeometrica;
  end;

implementation

uses
    UQuadrado
  , URetangulo
  , UCirculo
  , Forms
  , SysUtils
  ;

{ TFormaGeometrica }

constructor TFormaGeometrica.Create(const coCor: TColor);
begin
  Shape             := TShape.Create(Application);
  Shape.Brush.Color := coCor;
end;

procedure TFormaGeometrica.Desenha(const ciX, ciY: Integer;
  const coParent: TWinControl);
begin
  Shape.Top      := ciY;
  Shape.Left     := ciX;
  Shape.Parent   := coParent;
  Shape.ShowHint := True;
  Shape.Hint     := Format('Área: %f', [CalculaArea]);
end;

class function TFormaGeometrica.Fabrica(
  const ceTipoFormaGeometrica: TTipoFormaGeometrica;
  const coCor: TColor)
  : TFormaGeometrica;
begin
  case ceTipoFormaGeometrica of
    tfgQuadrado : Result := TQuadrado.Create(coCor);
    tfgRetangulo: Result := TRetangulo.Create(coCor);
    tfgCirculo  : Result := TCirculo.Create(coCor);
  else
    Result := nil;
  end;
end;

end.
