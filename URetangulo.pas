{
  @abstract(Essa classe é uma classe final)
}
unit URetangulo;

interface

uses
    UFormaGeometrica
  ;

type
  TRetangulo = class(TFormaGeometrica)
  private
    FBase: Integer;
    FLado: Integer;

  public
    constructor Create(const ciLado: Integer; const ciBase: Integer);
    function CalcularArea: Double; override;

    property LADO: Integer read FLado;
    property BASE: Integer read FBase;
  end;

implementation

{ TQuadrado }

function TRetangulo.CalcularArea: Double;
begin
  Result := FBase * FLado;
end;

constructor TRetangulo.Create(const ciLado: Integer; const ciBase: Integer);
begin
  FLado := ciLado;
  FBase := ciBase;
end;
end.


