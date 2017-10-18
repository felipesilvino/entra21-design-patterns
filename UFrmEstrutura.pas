unit UFrmEstrutura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls
  , UProjetoDesenho
  , UFormaGeometrica
  , Generics.Collections
  ;

type
  TFrmEstrutura = class(TForm, IObservadorProjetoDesenho)
    tvEstrutura: TTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  public
    NoRaiz: TTreeNode;

    procedure AtualizouProjeto(const coListaFormaGeometricas: TList<TFormaGeometrica>);
  end;

var
  FrmEstrutura: TFrmEstrutura;

implementation

{$R *.dfm}

procedure TFrmEstrutura.AtualizouProjeto(
  const coListaFormaGeometricas: TList<TFormaGeometrica>);
var
  loFormaGeometrica: TFormaGeometrica;
  loNoFormaGemetrica: TTreeNode;
begin
  NoRaiz.DeleteChildren;
  for loFormaGeometrica in coListaFormaGeometricas do
    begin
      loNoFormaGemetrica :=
        tvEstrutura.Items.AddChild(NoRaiz
                            , CNT_DESCRICAO_FORMA[loFormaGeometrica.TIPO]);

      tvEstrutura.Items.AddChild(loNoFormaGemetrica
                          , Format('Area: %f', [loFormaGeometrica.CalculaArea]));
    end;
  tvEstrutura.FullExpand;
end;

procedure TFrmEstrutura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEstrutura.FormCreate(Sender: TObject);
begin
  NoRaiz := tvEstrutura.Items.Add(nil, 'Projeto Desenho');

  TProjetoDesenho.RetornaUnico.RegistraObservador(Self);
end;

procedure TFrmEstrutura.FormDestroy(Sender: TObject);
begin
  TProjetoDesenho.RetornaUnico.RemoveObservador(Self);
end;

end.
