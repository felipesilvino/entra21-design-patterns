program DesenhoOO_10;

uses
  Forms,
  UFrmDesenho in 'UFrmDesenho.pas' {FrmDesenho},
  UFormaGeometrica in 'UFormaGeometrica.pas',
  UQuadrado in 'UQuadrado.pas',
  URetangulo in 'URetangulo.pas',
  UCirculo in 'UCirculo.pas',
  UFrmValores in 'UFrmValores.pas' {FrmValores},
  UQuadradoArredondado in 'UQuadradoArredondado.pas',
  UProjetoDesenho in 'UProjetoDesenho.pas',
  UFrmPrincipal in 'UFrmPrincipal.pas' {FrmPrincipal},
  UFrmEstrutura in 'UFrmEstrutura.pas' {FrmEstrutura},
  UUtilitarios in 'UUtilitarios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
