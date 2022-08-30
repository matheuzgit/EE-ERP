unit UnFunc;


interface

  uses System.SysUtils;

type

Valida = class

public
  procedure validacamponum(Sender: TObject; var Key: Char);

private





end;

implementation

{ Valida }


{ Valida }

procedure Valida.validacamponum(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#8,#9,#13]) then
    raise Exception.Create('Esse campo aceita apenas númeross');
end;



end.
