unit UFormaGeometrica;

interface

uses
    Graphics
  ;

type
  TFormaGeometrica = class abstract
  protected
    Cor: TColor;

  public
    function CalcularArea: Double; virtual; abstract;

  end;

implementation

{ TFormaGeometrica }

end.
