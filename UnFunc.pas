unit UnFunc;


interface

  uses System.SysUtils;

type

TValida = class

private
  Fvalor : char;
public
  function validanumero : string;
  property valor :char  read Fvalor write Fvalor;

end;

implementation

{ Valida }


{ Valida }



{ Valida }



{ Valida }

function TValida.validanumero : string;
begin
  if not (Fvalor in['0'..'9',#8,#9,#13]) then
    raise Exception.Create('Esse campo aceita apenas n�meross');
end;

{ Valida }




end.
