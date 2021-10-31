unit uManagerAPIRestFull;

interface

uses
  REST.Client, System.SysUtils, System.Variants, System.Classes, REST.Types;

type
  TManagerAPIRestFull = class
  strict private
    FRestRequest: TRESTRequest;
    FRestClient: TRESTClient;
    FRestResponse: TRESTResponse;
    procedure CriarComponentesRest;
    procedure DestruirComponentesRest;
    procedure ConfigurarComponentesRest(const UrlBase: string; const TimeOut: integer);
  public
    constructor Create(const UrlBase: string; const TimeOut: integer = 120000);
    destructor Destroy; override;
    property RestRequest: TRESTRequest read FRestRequest write FRestRequest;
    property RestClient: TRESTClient read FRestClient write FRestClient;
    property RestResponse: TRESTResponse read FRestResponse write FRestResponse;
end;

implementation

procedure TManagerAPIRestFull.ConfigurarComponentesRest(const UrlBase: string; const TimeOut: integer);
begin
  FRestRequest.ResetToDefaults;
  FRestRequest.Params.Clear;
  FRestRequest.Timeout := TimeOut;
  FRestClient.ResetToDefaults;
  FRestClient.BaseURL := UrlBase;
end;

constructor TManagerAPIRestFull.Create(const UrlBase: string; const TimeOut: integer = 120000);
begin
  CriarComponentesRest;
  ConfigurarComponentesRest(UrlBase, TimeOut);
end;

procedure TManagerAPIRestFull.CriarComponentesRest;
begin
  FRestRequest := TRESTRequest.Create(nil);
  FRestClient := TRESTClient.Create(nil);
  FRestResponse := TRESTResponse.Create(nil);
  FRestRequest.Client := FRestClient;
  FRestRequest.Response := FRestResponse;
end;

destructor TManagerAPIRestFull.Destroy;
begin
  DestruirComponentesRest;
  inherited;
end;

procedure TManagerAPIRestFull.DestruirComponentesRest;
begin
  FreeAndNil(FRestRequest);
  FreeAndNil(FRestClient);
  FreeAndNil(FRestResponse);
end;

end.

