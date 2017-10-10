unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnQuadrado: TButton;
    btnCirculo: TButton;
    btnRetangulo: TButton;
    procedure btnFormaGeometricaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
    UFrmValores
  , UFormaGeometrica
  ;

{$R *.dfm}

procedure TForm1.btnFormaGeometricaClick(Sender: TObject);
var
  loFormaGeometrica: TFormaGeometrica;
  liTag: Integer;
begin
  liTag             := (Sender as TButton).Tag;
  loFormaGeometrica := TFormaGeometrica.Fabrica(TTipoFormaGeometrica(liTag));
  if Assigned(loFormaGeometrica) then
    begin
      if loFormaGeometrica.SolicitaParametros then
        ShowMessage(Format('Area: %f', [loFormaGeometrica.CalcularArea]));

      FreeAndNil(loFormaGeometrica);
    end;
end;

end.
