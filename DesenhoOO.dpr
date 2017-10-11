program DesenhoOO;

uses
  Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {FrmPrincipal},
  UFormaGeometrica in 'UFormaGeometrica.pas',
  UQuadrado in 'UQuadrado.pas',
  URetangulo in 'URetangulo.pas',
  UCirculo in 'UCirculo.pas',
  UFrmValores in 'UFrmValores.pas' {FrmValores};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmValores, FrmValores);
  Application.Run;
end.
