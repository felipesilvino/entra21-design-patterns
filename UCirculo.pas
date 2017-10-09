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

uses
    Graphics
  ;

{ Circulo }

function TCirculo.CalcularArea: Double;
var
  Raio: double;
begin
  Cor    := clRed;
  Raio   := FDiametro / 2;
  Result := PI * Power(Raio, 2);
end;

constructor TCirculo.Create(const ciDiametro: Integer);
begin
  FDiametro := ciDiametro;
end;

end.
