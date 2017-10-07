program DesenhoOO;

uses
  Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {Form1},
  UFormaGeometrica in 'UFormaGeometrica.pas',
  UQuadrado in 'UQuadrado.pas',
  UCirculo in 'UCirculo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
