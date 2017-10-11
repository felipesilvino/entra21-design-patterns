{
  @abstract(Essa classe é uma classe final)
}
unit UQuadrado;

interface

uses
    UFormaGeometrica
  , Graphics
  , Controls
  ;

type
  TQuadrado = class(TFormaGeometrica)
  private
    FLado: Integer;

  public
    constructor Create(const coCor: TColor);

    function CalculaArea: Double; override;
    function SolicitaParametros: Boolean; override;

    procedure Desenha(const ciX, ciY: Integer;
                      const coParent: TWinControl); override;

    property LADO: Integer read FLado;
  end;

implementation

uses
    Dialogs
  , SysUtils
  , ExtCtrls
  ;

{ TQuadrado }

function TQuadrado.CalculaArea: Double;
begin
  Result := FLado * FLado;
end;

constructor TQuadrado.Create(const coCor: TColor);
begin
  Inherited;
  Shape.Shape := stSquare;
end;

procedure TQuadrado.Desenha(const ciX, ciY: Integer;
  const coParent: TWinControl);
begin
  Inherited;
  Shape.Width  := FLado;
  Shape.Height := FLado;
end;

function TQuadrado.SolicitaParametros: Boolean;
begin
  FLado := StrToIntDef(InputBox('Informe'
                              , 'Lado do Quadrado', ''), -1);
  Result := FLado > -1;
end;

end.
