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
                        , tfgCirculo
                        , tfgQuadradoArredondado);

  TFormaGeometrica = class abstract
  protected
    Cor: TColor;
    Shape: TShape;

  public
    constructor Create(const coCor: TColor);

    function CalculaArea: Double; virtual; abstract;
    function SolicitaParametros: Boolean; virtual; abstract;

    procedure Desenha(const ciX, ciY: Integer; const coParent: TWinControl); virtual;

    class function Fabrica(const ceTipoFormaGeometrica: TTipoFormaGeometrica;
                           const coCor: TColor):
        TFormaGeometrica;
  end;

const
  CNT_DESCRICAO_FORMA: array[TTipoFormaGeometrica] of String =
    ('Square', 'Rectangle', 'Circle', 'Rounded Square');

implementation

uses
    UQuadrado
  , UQuadradoArredondado
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

class function TFormaGeometrica.Fabrica(const ceTipoFormaGeometrica: TTipoFormaGeometrica;
                                        const coCor: TColor): TFormaGeometrica;
begin
  case ceTipoFormaGeometrica of
    tfgQuadrado           : Result := TQuadrado.Create(coCor);
    tfgRetangulo          : Result := TRetangulo.Create(coCor);
    tfgCirculo            : Result := TCirculo.Create(coCor);
    tfgQuadradoArredondado: Result := TQuadradoArredondado.Create(coCor);
  else
    Result := nil;
  end;
end;

end.
