unit UFrmValores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmValores = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edBase: TEdit;
    edAltura: TEdit;
    btnCalcular: TBitBtn;
    procedure btnCalcularClick(Sender: TObject);
    procedure edAlturaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
      valor1: integer;
      valor2: integer;
  end;

var
  FrmValores: TFrmValores;


implementation

{$R *.dfm}

procedure TFrmValores.btnCalcularClick(Sender: TObject);
begin
  valor1 := StrToIntDef(edBase.Text, 0);
  valor2 := StrToIntDef(edAltura.Text, 0);
  close;
end;

procedure TFrmValores.edAlturaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) then
    begin
      btnCalcular.Click;
    end;
end;

end.
