unit UnFunc;


interface

  uses System.SysUtils;

type

Valida = class

public
  function validacao (var campo : string; var Key: Char) : string;

private





end;

implementation

{ Valida }


{ Valida }

function Valida.validacao(var campo: string; var Key: Char): string;
begin
  if not  (Key in['0'..'9']) then
    raise Exception.Create('Esse campo aceita apenas númeross');
end;

end.
