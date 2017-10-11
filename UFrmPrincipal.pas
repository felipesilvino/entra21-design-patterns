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
    procedure shCorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure gbAreaDesenhoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
    UFrmValores
  , UFormaGeometrica
  ;

{$R *.dfm}

procedure TFrmPrincipal.gbAreaDesenhoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  loFormaGeometrica: TFormaGeometrica;
  leTipoFormaGeometrica: TTipoFormaGeometrica;
begin
  leTipoFormaGeometrica := TTipoFormaGeometrica(rgTipoFormaGeometrica.ItemIndex);
  loFormaGeometrica     := TFormaGeometrica.Fabrica(leTipoFormaGeometrica
                                                  , shCor.Brush.Color);
  if Assigned(loFormaGeometrica) then
    begin
      if loFormaGeometrica.SolicitaParametros then
        loFormaGeometrica.Desenha(X, Y, gbAreaDesenho);

      FreeAndNil(loFormaGeometrica);
    end;
end;

procedure TFrmPrincipal.shCorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if cdSelecao.Execute then
    shCor.Brush.Color := cdSelecao.Color;
end;

end.
