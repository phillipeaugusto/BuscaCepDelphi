unit uCepConsumidor;

interface

uses uICEP, uCep, REST.Types, REST.Json, System.SysUtils, System.Variants, System.Classes, StrUtils;
type
  TCepConsumidor = class(TInterfacedObject, ICep)
private
  FUrl: string;
public
  constructor Create(const Url: string);
  function Obter(Cep: string): TCep;
end;

implementation

uses uManagerAPIRestFull;

constructor TCepConsumidor.Create(const Url: string);
begin
  FUrl := Url;
end;

function TCepConsumidor.Obter(Cep: string): TCep;
var
  oManagerApi: TManagerAPIRestFull;
begin
  Result := nil;
  oManagerApi := TManagerAPIRestFull.Create(FUrl);
  try
    oManagerApi.RestRequest.Method := TRESTRequestMethod.rmGET;
    oManagerApi.RestRequest.Resource := 'ws/' + Cep + '/json/';
    oManagerApi.RestRequest.Execute;

    if (oManagerApi.RestResponse.StatusCode = 200) then
      Result := TJson.JsonToObject<TCep>(oManagerApi.RestResponse.Content)
  finally
    FreeAndNil(oManagerApi);
  end;
end;

end.
