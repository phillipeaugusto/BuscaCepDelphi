unit uApiCep;

interface

uses System.SysUtils, System.Variants, System.Classes, StrUtils, uCepConsumidor, uICEP;

type
  TApiCep = class
private
  FCep: ICep;
public
  constructor Create;
  property Cep: ICep read FCep write FCep;
end;

implementation

const
  cURL = 'https://viacep.com.br/';

constructor TApiCep.Create;
begin
  FCep := TCepConsumidor.Create(cURL);
end;


end.

