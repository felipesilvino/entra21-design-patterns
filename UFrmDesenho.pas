unit UFrmDesenho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls
  , UProjetoDesenho
  , UFormaGeometrica
  , Generics.Collections
  ;

type
  TFrmDesenho = class(TForm, IObservadorProjetoDesenho)
    gbFerramentas: TGroupBox;
    gbAreaDesenho: TGroupBox;
    rgTipoFormaGeometrica: TRadioGroup;
    shCor: TShape;
    cdSelecao: TColorDialog;
    cbxCorAleatoria: TCheckBox;
    procedure shCorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure gbAreaDesenhoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    function GeraCorAleatoria: TColor;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    procedure AtualizouProjeto(const coListaFormaGeometricas: TList<TFormaGeometrica>);
  end;

var
  FrmDesenho: TFrmDesenho;

implementation

uses
    UFrmValores
  , Math
  ;

{$R *.dfm}

procedure TFrmDesenho.AtualizouProjeto(
  const coListaFormaGeometricas: TList<TFormaGeometrica>);
begin
  //
end;

procedure TFrmDesenho.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDesenho.FormCreate(Sender: TObject);
var
  leTipoFormaGeometrica: TTipoFormaGeometrica;
begin
  for leTipoFormaGeometrica := Low(TTipoFormaGeometrica)
                            to High(TTipoFormaGeometrica) do
    rgTipoFormaGeometrica.Items.Add(CNT_DESCRICAO_FORMA[leTipoFormaGeometrica]);

  rgTipoFormaGeometrica.ItemIndex := 0;
  rgTipoFormaGeometrica.Columns   := Integer(High(TTipoFormaGeometrica)) + 1;
end;

procedure TFrmDesenho.gbAreaDesenhoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  loFormaGeometrica: TFormaGeometrica;
  leTipoFormaGeometrica: TTipoFormaGeometrica;
  loCor: TColor;
begin
  loCor := ifThen(cbxCorAleatoria.Checked, GeraCorAleatoria, shCor.Brush.Color);
  case Button of
    mbLeft:
      begin
        leTipoFormaGeometrica := TTipoFormaGeometrica(rgTipoFormaGeometrica.ItemIndex);
        loFormaGeometrica     := TFormaGeometrica.Fabrica(leTipoFormaGeometrica
                                                        , loCor);
        if Assigned(loFormaGeometrica) then
          begin
            if loFormaGeometrica.SolicitaParametros then
              begin
                loFormaGeometrica.Desenha(X, Y, gbAreaDesenho);
                TProjetoDesenho.RetornaUnico.AdicionaFormaGeometrica(loFormaGeometrica);
              end
            else
              FreeAndNil(loFormaGeometrica);
          end;
      end;
  end;
end;

function TFrmDesenho.GeraCorAleatoria: TColor;
begin
  Randomize;
  Result := RGB(Random(High(Byte)), Random(High(Byte)), Random(High(Byte)));
end;

procedure TFrmDesenho.shCorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if cdSelecao.Execute then
    shCor.Brush.Color := cdSelecao.Color;
end;

end.
