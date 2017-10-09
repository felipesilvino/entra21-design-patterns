program DesenhoOO;

uses
  Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {Form1},
  UFormaGeometrica in 'UFormaGeometrica.pas',
  UQuadrado in 'UQuadrado.pas',
  URetangulo in 'URetangulo.pas',
  UCirculo in 'UCirculo.pas',
  UFrmValores in 'UFrmValores.pas' {FrmValores};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmValores, FrmValores);
  Application.Run;
end.
