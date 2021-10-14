unit GetCnpj;

interface

uses
  Pkg.Json.DTO, Generics.Collections, REST.Json;

{$M+}

type
  TRootDTO = class
 private
    Fcnpj: string;
    FAtividadePrincipal: string;
    FFantasia: string;
  Public
    property cnpj : string read Fcnpj write Fcnpj;
    property AtividadePrincipal: string read FAtividadePrincipal write FAtividadePrincipal;
    property Fantasia: string read FFantasia write FFantasia;

    function TojsonString: string;
    class function fromjsonString (AjsonString : string ) :  TRootDTO;





  end;
implementation

{ TRootDTO }

function TRootDTO.TojsonString: string;
begin
  result := TJson.ObjectTojsonString(Self);
end;

class function TRootDTO.fromjsonString(AjsonString: string): TRootDTO;
begin
  Result := TJson.JsonToObject<TRootDTO>(AjsonString)
end;

end.
