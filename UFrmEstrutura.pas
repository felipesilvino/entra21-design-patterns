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
    procedure tvEstruturaCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
  public
    NoRaiz: TTreeNode;

    procedure AtualizouProjeto(const coListaFormaGeometricas: TList<TFormaGeometrica>);
  end;

var
  FrmEstrutura: TFrmEstrutura;

implementation

{$R *.dfm}

uses
    UUtilitarios
  ;

procedure TFrmEstrutura.AtualizouProjeto(
  const coListaFormaGeometricas: TList<TFormaGeometrica>);
var
  loFormaGeometrica: TFormaGeometrica;
  loNoFormaGeometrica: TTreeNode;
begin
  NoRaiz.DeleteChildren;
  for loFormaGeometrica in coListaFormaGeometricas do
    with tvEstrutura.Items do
    begin
      loNoFormaGeometrica := AddChildObject(NoRaiz
      , CNT_DESCRICAO_FORMA[loFormaGeometrica.TIPO]
      , loFormaGeometrica);

      AddChild(loNoFormaGeometrica, Format('Area: %f', [loFormaGeometrica.CalculaArea]));
      AddChild(loNoFormaGeometrica, Format('X: %d', [loFormaGeometrica.X]));
      AddChild(loNoFormaGeometrica, Format('Y: %d', [loFormaGeometrica.Y]));
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

procedure TFrmEstrutura.tvEstruturaCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  NoAtual: TTreeNode;
begin
  NoAtual := TUtilitarios.IfThen(Assigned(Node.Data), Node, Node.Parent);
  if Assigned(NoAtual) and Assigned(NoAtual.Data) then
    Sender.Canvas.Font.Color := TFormaGeometrica(NoAtual.Data).COR
end;

end.
