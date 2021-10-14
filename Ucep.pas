unit Ucep;

interface

uses
  Pkg.Json.DTO, Generics.Collections, REST.Json;

{$M+}

type
  TCep = class
  private
    FBairro: string;
    FCep: string;
    FComplemento: string;
    FDdd: Boolean;
    FGia: string;
    FIbge: Boolean;
    FLocalidade: string;
    FLogradouro: string;
    FSiafi: Boolean;
    FUf: string;
  Public
    property Bairro: string read FBairro write FBairro;
    property Cep: string read FCep write FCep;
    property Complemento: string read FComplemento write FComplemento;
    property Ddd: Boolean read FDdd write FDdd;
    property Gia: string read FGia write FGia;
    property Ibge: Boolean read FIbge write FIbge;
    property Localidade: string read FLocalidade write FLocalidade;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Siafi: Boolean read FSiafi write FSiafi;
    property Uf: string read FUf write FUf;
    function TojsonString: string;
    class function fromjsonString (AjsonString : string ) :  TCep;


  end;

implementation


{ TCep }

function TCep.TojsonString: string;
begin
  result := TJson.ObjectTojsonString(Self);
end;

class function TCep.fromjsonString(AjsonString: string): TCep;
begin
  Result := TJson.JsonToObject<TCep>(AjsonString)
end;

end.
