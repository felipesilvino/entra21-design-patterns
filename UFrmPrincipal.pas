unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  , URetangulo
  , UCirculo
  ;

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  lsInput: String;
  loCirculo : TCirculo;
begin
  lsInput   := InputBox('Informe o diamentro', '','');
  loCirculo := TCirculo.Create(StrToInt(lsInput));
  ShowMessage(FloatToStr(loCirculo.CalcularArea));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  loQuadrado: TQuadrado;
begin
  loQuadrado := TQuadrado.Create(25);
  ShowMessage(FloatToStr(loQuadrado.CalcularArea));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  loRetangulo: TRetangulo;
begin
  loRetangulo := TRetangulo.Create(25, 10);
  ShowMessage(FloatToStr(loRetangulo.CalcularArea));
end;

end.
