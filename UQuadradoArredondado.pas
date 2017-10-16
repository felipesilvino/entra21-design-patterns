unit UQuadradoArredondado;

interface

uses
    UQuadrado
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
  Inherited;
  Shape.Shape := stRoundSquare;
end;

end.
