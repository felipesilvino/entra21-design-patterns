unit UUtilitarios;

interface

type
  TUtilitarios = class
  public
    class function IfThen<T>(const cbValor: Boolean;
                             const coVerdadeiro: T;
                             const coFalso: T): T;

  end;

implementation


{ TUtilitarios }

class function TUtilitarios.IfThen<T>(const cbValor: Boolean;
  const coVerdadeiro, coFalso: T): T;
begin
  if cbValor then
    Result := coVerdadeiro
  else
    Result := coFalso
end;

end.
