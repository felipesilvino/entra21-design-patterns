unit UFormaGeometrica;

interface

uses
    Graphics
  , ExtCtrls
  , Controls
  , Classes
  ;

type
  TTipoFormaGeometrica = (tfgQuadrado
                        , tfgRetangulo
                        , tfgCirculo
                        , tfgQuadradoArredondado);

  TFormaGeometrica = class abstract
  protected
    Cor: TColor;
    Shape: TShape;
    Selecionado: Boolean;

    procedure FazSelecao(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X: Integer; Y: Integer);

    procedure DesfazSelecao(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X: Integer; Y: Integer);

  public
    constructor Create(const coCor: TColor);
    destructor Destroy; override;

    function CalculaArea: Double; virtual; abstract;
    function SolicitaParametros: Boolean; virtual; abstract;

    procedure Desenha(const ciX, ciY: Integer; const coParent: TWinControl); virtual;

    class function Fabrica(const ceTipoFormaGeometrica: TTipoFormaGeometrica;
                           const coCor: TColor):
        TFormaGeometrica;
  end;

const
  CNT_DESCRICAO_FORMA: array[TTipoFormaGeometrica] of String =
    ('Square', 'Rectangle', 'Circle', 'Rounded Square');

implementation

uses
    UQuadrado
  , UQuadradoArredondado
  , URetangulo
  , UCirculo
  , Forms
  , SysUtils
  ;

{ TFormaGeometrica }

constructor TFormaGeometrica.Create(const coCor: TColor);
begin
  Shape             := TShape.Create(Application);
  Shape.Brush.Color := coCor;
  Shape.OnMouseDown := FazSelecao;
  Shape.OnMouseUp   := DesfazSelecao;

  Cor := coCor;
end;

destructor TFormaGeometrica.Destroy;
begin
  FreeAndNil(Shape);
  inherited;
end;

procedure TFormaGeometrica.Desenha(const ciX, ciY: Integer;
  const coParent: TWinControl);
begin
  Shape.Top         := ciY;
  Shape.Left        := ciX;
  Shape.Parent      := coParent;
  Shape.ShowHint    := True;
  Shape.Hint        := Format('Área: %f', [CalculaArea]);
end;

class function TFormaGeometrica.Fabrica(const ceTipoFormaGeometrica: TTipoFormaGeometrica;
                                        const coCor: TColor): TFormaGeometrica;
begin
  case ceTipoFormaGeometrica of
    tfgQuadrado           : Result := TQuadrado.Create(coCor);
    tfgRetangulo          : Result := TRetangulo.Create(coCor);
    tfgCirculo            : Result := TCirculo.Create(coCor);
    tfgQuadradoArredondado: Result := TQuadradoArredondado.Create(coCor);
  else
    Result := nil;
  end;
end;

procedure TFormaGeometrica.FazSelecao(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    mbLeft: Shape.Brush.Color := clBlue;
    mbRight: FreeAndNil(Self);
  end;
end;

procedure TFormaGeometrica.DesfazSelecao(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    mbLeft: Shape.Brush.Color := Cor;
  end;
end;

end.
