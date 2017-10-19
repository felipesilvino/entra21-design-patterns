unit UFormaGeometrica;

interface

uses
    Graphics
  , ExtCtrls
  , Controls
  , Classes
  ;

type
  TFormaGeometrica = class;

  TTipoFormaGeometrica = (tfgQuadrado
                        , tfgRetangulo
                        , tfgCirculo
                        , tfgQuadradoArredondado);

  TOnRemoveFormaGeometrica = procedure(Sender: TObject;
                                       FormaGeometrica: TFormaGeometrica) of object;

  TFormaGeometrica = class abstract
  protected
    FTipo: TTipoFormaGeometrica;
    FCor: TColor;
    FShape: TShape;
    FSelecionado: Boolean;
    FXOriginal: Integer;
    FYOriginal: Integer;
    FX: Integer;
    FY: Integer;
    FOnRemoveFormaGeometrica: TOnRemoveFormaGeometrica;

    procedure FazSelecao(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X: Integer; Y: Integer);

    procedure DesfazSelecao(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X: Integer; Y: Integer);

    procedure MovimentaSelecao(Sender: TObject; Shift: TShiftState;
      X: Integer; Y: Integer);

  public
    constructor Create(const ceTipoFormaGeometrica: TTipoFormaGeometrica;
                       const coCor: TColor);
    destructor Destroy; override;

    function CalculaArea: Double; virtual; abstract;
    function SolicitaParametros: Boolean; virtual; abstract;

    procedure Desenha(const ciX, ciY: Integer; const coParent: TWinControl); virtual;

    class function Fabrica(const ceTipoFormaGeometrica: TTipoFormaGeometrica;
                           const coCor: TColor):
        TFormaGeometrica;

    property TIPO: TTipoFormaGeometrica read FTipo;
    property COR: TColor read FCor;
    property X: Integer read FX;
    property Y: Integer read FY;
    property OnRemoveFormaGeometrica: TOnRemoveFormaGeometrica read FOnRemoveFormaGeometrica write FOnRemoveFormaGeometrica;
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

constructor TFormaGeometrica.Create(const ceTipoFormaGeometrica: TTipoFormaGeometrica;
                                    const coCor: TColor);
begin
  FShape             := TShape.Create(Application);
  FShape.Brush.Color := coCor;
  FShape.OnMouseDown := FazSelecao;
  FShape.OnMouseUp   := DesfazSelecao;
  FShape.OnMouseMove := MovimentaSelecao;

  FCor  := coCor;
  FTipo := ceTipoFormaGeometrica;
end;

destructor TFormaGeometrica.Destroy;
begin
  FreeAndNil(FShape);
  inherited;
end;

procedure TFormaGeometrica.Desenha(const ciX, ciY: Integer;
  const coParent: TWinControl);
begin
  FShape.Top         := ciY;
  FShape.Left        := ciX;
  FShape.Parent      := coParent;
  FShape.ShowHint    := True;
  FShape.Hint        := Format('Área: %f', [CalculaArea]);

  FX := ciX;
  FY := ciY;
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
     mbLeft:
     begin
       FShape.Brush.Color := clBlue;
       FXOriginal         := X;
       FYOriginal         := Y;
       FSelecionado       := True;
     end;
    mbRight:
     begin
       if Assigned(FOnRemoveFormaGeometrica) then
         FOnRemoveFormaGeometrica(Sender, Self);

       FreeAndNil(Self);
     end;
  end;
end;

procedure TFormaGeometrica.MovimentaSelecao(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if FSelecionado then
    begin
      FShape.Top  := FShape.Top  + (Y - FYOriginal);
      FShape.left := FShape.Left + (X - FXOriginal);
    end;
end;

procedure TFormaGeometrica.DesfazSelecao(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    mbLeft:
      begin
        FShape.Brush.Color := FCor;
        FSelecionado       := False;
      end;
  end;
end;

end.
