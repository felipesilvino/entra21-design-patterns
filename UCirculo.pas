unit UCirculo;

interface

uses
    UFormaGeometrica
  , Math
  , Graphics
  , Controls
  ;

type
  TCirculo = class(TFormaGeometrica)
  private
    FDiametro: Integer;

  public
    constructor Create(const coCor: TColor);

    function CalculaArea: Double; override;
    function SolicitaParametros: Boolean; override;

    procedure Desenha(const ciX: Integer; const ciY: Integer;
      const coParent: TWinControl); override;
  end;

implementation

uses
    SysUtils
  , Dialogs
  , ExtCtrls
  ;

{ Circulo }

constructor TCirculo.Create(const coCor: TColor);
begin
  Inherited Create(tfgCirculo, coCor);
  FShape.Shape := stCircle;
end;

function TCirculo.CalculaArea: Double;
var
  ldRaio: Double;
begin
  ldRaio := FDiametro / 2;
  Result := PI * Power(ldRaio, 2);
end;

procedure TCirculo.Desenha(const ciX, ciY: Integer;
  const coParent: TWinControl);
begin
  inherited;
  FShape.Width  := FDiametro;
  FShape.Height := FDiametro;
end;

function TCirculo.SolicitaParametros: Boolean;
begin
  FDiametro := StrToIntDef(InputBox('Informe', 'Diametro do Circulo', ''), -1);
  Result    := FDiametro > -1;
end;

end.
