unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TFrmPrincipal = class(TForm)
    mmDesenho: TMainMenu;
    Desenho1: TMenuItem;
    Desenho2: TMenuItem;
    Estrutura1: TMenuItem;
    procedure Desenho2Click(Sender: TObject);
    procedure Estrutura1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses
    UFrmDesenho
  , UFrmEstrutura
  ;

procedure TFrmPrincipal.Desenho2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmDesenho, FrmDesenho);
end;

procedure TFrmPrincipal.Estrutura1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmEstrutura, FrmEstrutura);
end;

end.
