unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
    UQuadrado
  , UCirculo
  ;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  loCirculo : TCirculo;
begin
  loCirculo := TCirculo.Create(StrToInt(InputBox('Informe o diamentro', '','')));
  ShowMessage(FloatToStr(loCirculo.CalcularArea));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  loQuadrado: TQuadrado;
begin
  loQuadrado := TQuadrado.Create(25);
  ShowMessage(FloatToStr(loQuadrado.CalcularArea));
end;

end.
