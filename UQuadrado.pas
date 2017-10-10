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
    function CalcularArea: Double; override;
    function SolicitaParametros: Boolean; override;

    property LADO: Integer read FLado;
  end;

implementation

uses
    Dialogs
  , SysUtils
  ;

{ TQuadrado }

function TQuadrado.CalcularArea: Double;
begin
  Result := FLado * FLado;
end;

function TQuadrado.SolicitaParametros: Boolean;
begin
  FLado := StrToIntDef(InputBox('Informe'
                              , 'Lado do Quadrado', ''), -1);
  Result := FLado > -1;
end;

end.
