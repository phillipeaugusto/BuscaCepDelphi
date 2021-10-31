unit uEntidadeBase;

interface

uses Generics.Collections, Rest.Json;

type
  TEntidadeBase = class
public
  function ToJsonString: string;
  class function FromJsonString(AJsonString: string): TEntidadeBase;
end;

implementation

class function TEntidadeBase.FromJsonString(AJsonString: string): TEntidadeBase;
begin
  result := TJson.JsonToObject<TEntidadeBase>(AJsonString)
end;

function TEntidadeBase.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(Self);
end;

end.
