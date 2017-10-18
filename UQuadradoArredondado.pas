unit UQuadradoArredondado;

interface

uses
    UFormaGeometrica
  , UQuadrado
  , ExtCtrls
  , Graphics
  ;

type
  TQuadradoArredondado = class(TQuadrado)
  public
    constructor Create(const coCor: TColor);
  end;

implementation

{ TQuadradoArredondado }

constructor TQuadradoArredondado.Create(const coCor: TColor);
begin
  Inherited Create(tfgQuadradoArredondado, coCor);
  FShape.Shape := stRoundSquare;
end;

end.
