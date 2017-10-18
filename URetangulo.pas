{
  @abstract(Essa classe é uma classe final)
}
unit URetangulo;

interface

uses
    UFormaGeometrica
  , Graphics
  , Controls
  ;

type
  TRetangulo = class(TFormaGeometrica)
  private
    FBase: Integer;
    FAltura: Integer;

  public
    constructor Create(const coCor: TColor);

    function CalculaArea: Double; override;
    function SolicitaParametros: Boolean; override;

    procedure Desenha(const ciX: Integer; const ciY: Integer;
      const coParent: TWinControl); override;

    property ALTURA: Integer read FAltura;
    property BASE: Integer read FBase;
  end;

implementation

uses
    Dialogs
  , SysUtils
  , ExtCtrls
  ;

{ TRetangulo }

constructor TRetangulo.Create(const coCor: TColor);
begin
  Inherited Create(tfgRetangulo, coCor);
  FShape.Shape := stRectangle;
end;

function TRetangulo.CalculaArea: Double;
begin
  Result := FBase * FAltura;
end;

procedure TRetangulo.Desenha(const ciX, ciY: Integer;
  const coParent: TWinControl);
begin
  inherited;
  FShape.Width  := FBase;
  FShape.Height := FAltura;
end;

function TRetangulo.SolicitaParametros: Boolean;
begin
  FBase   := StrToIntDef(InputBox('Informe', 'Base do Retangulo', ''), -1);
  FAltura := StrToIntDef(InputBox('Informe', 'Altura do Retangulo', ''), -1);

  Result := (FBase > -1) and (FAltura > -1);
end;

end.
