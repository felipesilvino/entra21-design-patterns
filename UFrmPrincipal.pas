unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmPrincipal = class(TForm)
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
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
    UFrmValores
  , UFormaGeometrica
  , Math
  ;

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  leTipoFormaGeometrica: TTipoFormaGeometrica;
begin
  for leTipoFormaGeometrica := Low(TTipoFormaGeometrica)
                            to High(TTipoFormaGeometrica) do
    rgTipoFormaGeometrica.Items.Add(CNT_DESCRICAO_FORMA[leTipoFormaGeometrica]);

  rgTipoFormaGeometrica.ItemIndex := 0;
  rgTipoFormaGeometrica.Columns   := Integer(High(TTipoFormaGeometrica)) + 1;
end;

procedure TFrmPrincipal.gbAreaDesenhoMouseDown(Sender: TObject;
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
              end
            else
              FreeAndNil(loFormaGeometrica);
          end;
      end;
  end;
end;

function TFrmPrincipal.GeraCorAleatoria: TColor;
begin
  Randomize;
  Result := RGB(Random(High(Byte)), Random(High(Byte)), Random(High(Byte)));
end;

procedure TFrmPrincipal.shCorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if cdSelecao.Execute then
    shCor.Brush.Color := cdSelecao.Color;
end;

end.
