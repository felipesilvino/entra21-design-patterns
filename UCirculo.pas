unit UCirculo;

interface

uses
    UFormaGeometrica
  , Math
  , Graphics
  ;

type
  TCirculo = class(TFormaGeometrica)
  private
    FDiametro: Integer;

  public
    constructor Create(const coCor: TColor);

    function CalculaArea: Double; override;
    function SolicitaParametros: Boolean; override;

  end;

implementation

uses
    SysUtils
  , Dialogs
  , ExtCtrls
  ;

{ Circulo }

function TCirculo.CalculaArea: Double;
var
  Raio: Double;
begin
  Raio   := FDiametro / 2;
  Result := PI * Power(Raio, 2);
end;

constructor TCirculo.Create(const coCor: TColor);
begin
  Inherited;
  Shape.Shape := stCircle;
end;

function TCirculo.SolicitaParametros: Boolean;
begin
  FDiametro := StrToIntDef(InputBox('Informe', 'Diametro do Circulo', ''), -1);
  Result    := FDiametro > -1;
end;

end.
