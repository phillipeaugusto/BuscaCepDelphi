unit uCep;

interface

uses Generics.Collections, Rest.Json, uEntidadeBase;

type

TCep = class(TEntidadeBase)
private
  FBairro: String;
  FCep: String;
  FComplemento: String;
  FDdd: String;
  FGia: String;
  FIbge: String;
  FLocalidade: String;
  FLogradouro: String;
  FSiafi: String;
  FUf: String;
public
  property bairro: String read FBairro write FBairro;
  property cep: String read FCep write FCep;
  property complemento: String read FComplemento write FComplemento;
  property ddd: String read FDdd write FDdd;
  property gia: String read FGia write FGia;
  property ibge: String read FIbge write FIbge;
  property localidade: String read FLocalidade write FLocalidade;
  property logradouro: String read FLogradouro write FLogradouro;
  property siafi: String read FSiafi write FSiafi;
  property uf: String read FUf write FUf;
end;

implementation

end.

