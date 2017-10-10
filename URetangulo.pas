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
    FAltura: Integer;

  public
    function CalcularArea: Double; override;
    function SolicitaParametros: Boolean; override;

    property ALTURA: Integer read FAltura;
    property BASE: Integer read FBase;
  end;

implementation

uses
    Dialogs
  , SysUtils
  ;

{ TQuadrado }

function TRetangulo.CalcularArea: Double;
begin
  Result := FBase * FAltura;
end;

function TRetangulo.SolicitaParametros: Boolean;
begin
  FBase   := StrToIntDef(InputBox('Informe', 'Base do Retangulo', ''), -1);
  FAltura := StrToIntDef(InputBox('Informe', 'Altura do Retangulo', ''), -1);

  Result := (FBase > -1) and (FAltura > -1);
end;

end.


