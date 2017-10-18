{
  Esta classe implementa o padrão de projeto singleton.
  Objetos desta desta classe são o sujeito observado.
}

unit UProjetoDesenho;

interface

uses
    UFormaGeometrica
  , Generics.Collections
  ;

type
  IObservadorProjetoDesenho = interface
    ['{677DA492-08E8-4164-9AF9-F187C0A603B1}']
    procedure AtualizouProjeto(const coListaFormaGeometricas: TList<TFormaGeometrica>);
  end;

  TProjetoDesenho = class
  private
    FListaFormaGeometricas: TList<TFormaGeometrica>;
    FListaObservadores: TList<IObservadorProjetoDesenho>;

    procedure AvisaObservadores;

  public
    constructor Create;
    destructor Destroy; override;

    procedure RegistraObservador(const coObservador: IObservadorProjetoDesenho);
    procedure RemoveObservador(const coObservador: IObservadorProjetoDesenho);

    procedure AdicionaFormaGeometrica(const coFormaGeometrica: TFormaGeometrica);
    procedure RemoveFormaGeometrica(const coFormaGeometrica: TFormaGeometrica);

    class function RetornaUnico: TProjetoDesenho;
  end;

implementation

uses
    SysUtils
  ;

var
  ProjetoDesenho: TProjetoDesenho = nil;

{ TProjetoDesenho }

procedure TProjetoDesenho.AdicionaFormaGeometrica(
  const coFormaGeometrica: TFormaGeometrica);
begin
  FListaFormaGeometricas.Add(coFormaGeometrica);
  AvisaObservadores;
end;

procedure TProjetoDesenho.RegistraObservador(
  const coObservador: IObservadorProjetoDesenho);
begin
  FListaObservadores.Add(coObservador);
  coObservador.AtualizouProjeto(FListaFormaGeometricas);
end;

procedure TProjetoDesenho.AvisaObservadores;
var
  loObservador:  IObservadorProjetoDesenho;
begin
  for loObservador in FListaObservadores do
    loObservador.AtualizouProjeto(FListaFormaGeometricas);
end;

constructor TProjetoDesenho.Create;
begin
  FListaObservadores     := TList<IObservadorProjetoDesenho>.Create;
  FListaFormaGeometricas := TList<TFormaGeometrica>.Create;
end;

destructor TProjetoDesenho.Destroy;
begin
  FreeAndNil(FListaObservadores);
  FreeAndNil(FListaFormaGeometricas);
  inherited;
end;

procedure TProjetoDesenho.RemoveFormaGeometrica(
  const coFormaGeometrica: TFormaGeometrica);
begin
  FListaFormaGeometricas.Remove(coFormaGeometrica);
  AvisaObservadores;
end;

procedure TProjetoDesenho.RemoveObservador(
  const coObservador: IObservadorProjetoDesenho);
begin
  FListaObservadores.Remove(coObservador);
end;

class function TProjetoDesenho.RetornaUnico: TProjetoDesenho;
begin
  if not Assigned(ProjetoDesenho) then
    ProjetoDesenho := TProjetoDesenho.Create;

  Result := ProjetoDesenho;
end;

end.
