unit UCirculo;

interface

uses
    UFormaGeometrica
  , math
  ;

type
  TCirculo = class(TFormaGeometrica)
  private
    FDiametro: Integer;
  public
    constructor Create(const ciDiametro: Integer);
    function CalcularArea: Double; override;

  end;

implementation

{ Circulo }

function TCirculo.CalcularArea: Double;
var
  Raio: double;
  Teste: double;
begin
  Raio := FDiametro / 2;
  result := pi*Power(Raio, 2);

end;

constructor TCirculo.Create(const ciDiametro: Integer);
begin
  FDiametro := ciDiametro;
end;

end.
