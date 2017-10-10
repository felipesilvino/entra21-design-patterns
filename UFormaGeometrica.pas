unit UFormaGeometrica;

interface

uses
    Graphics
  ;

type
  TTipoFormaGeometrica = (tfgQuadrado
                        , tfgRetangulo
                        , tfgCirculo);

  TFormaGeometrica = class abstract
  protected
    Cor: TColor;

  public
    function CalcularArea: Double; virtual; abstract;
    function SolicitaParametros: Boolean; virtual; abstract;

    class function
      Fabrica(const ceTipoFormaGeometrica: TTipoFormaGeometrica):
        TFormaGeometrica;
  end;

implementation

uses
    UQuadrado
  , URetangulo
  , UCirculo
  ;

{ TFormaGeometrica }

class function TFormaGeometrica.Fabrica(
  const ceTipoFormaGeometrica: TTipoFormaGeometrica)
  : TFormaGeometrica;
begin
  case ceTipoFormaGeometrica of
    tfgQuadrado : Result := TQuadrado.Create;
    tfgRetangulo: Result := TRetangulo.Create;
    tfgCirculo  : Result := TCirculo.Create;
  else
    Result := nil;
  end;
end;

end.
