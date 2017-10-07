{
  @abstract(Essa classe é uma classe final)
}
unit UQuadrado;

interface

uses
    UFormaGeometrica
  ;

type
  TQuadrado = class(TFormaGeometrica)
  private
    FLado: Integer;

  public
    constructor Create(const ciLado: Integer);
    function CalcularArea: Double; override;

    property LADO: Integer read FLado;
  end;

implementation

{ TQuadrado }

function TQuadrado.CalcularArea: Double;
begin
  Result := FLado * FLado;
end;

constructor TQuadrado.Create(const ciLado: Integer);
begin
  FLado := ciLado;
end;

end.
