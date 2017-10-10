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
    function CalcularArea: Double; override;
    function SolicitaParametros: Boolean; override;

  end;

implementation

uses
    SysUtils
  , Dialogs
  ;

{ Circulo }

function TCirculo.CalcularArea: Double;
var
  Raio: Double;
begin
  Raio   := FDiametro / 2;
  Result := PI * Power(Raio, 2);
end;

function TCirculo.SolicitaParametros: Boolean;
begin
  FDiametro := StrToIntDef(InputBox('Informe', 'Diametro do Circulo', ''), -1);
  Result    := FDiametro > -1;
end;

end.
