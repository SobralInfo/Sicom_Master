unit uIntegracaoBling;

interface

uses
  System.SysUtils, System.Classes, REST.Client, REST.Types, System.JSON, IdCoderMIME;


Type TIntegracaoBling = class
   public
     class procedure GetTokens(const AAuthorizationCode: string; out AAccessToken, ARefreshToken: string);
     class procedure RefreshAccessToken(const ARefreshToken: string; out AAccessToken: string);
     class function EncodeCredentials(AClientID, AClientSecret: string): string;
     const
       CLIENT_ID = '7c53f39fcda71a1fd69b5591e62e84f4a19dfaf5';
       CLIENT_SECRET = 'e82a796a762d560d03ff66c32d77934e8d012c1c46af7587df99d2c50e81';
       REDIRECT_URI = 'https://www.gprotech.com.br/';
       AUTHORIZE_URL = 'https://www.bling.com.br/Api/v3/oauth/authorize';
       TOKEN_URL = 'https://www.bling.com.br/Api/v3/oauth/token';

end;

implementation

{ TIntegracaoBling }

class function TIntegracaoBling.EncodeCredentials(AClientID, AClientSecret: string): string;
begin
   Result := TIdEncoderMIME.EncodeString(AClientID + ':' + AClientSecret);
end;

class procedure TIntegracaoBling.GetTokens(const AAuthorizationCode: string; out AAccessToken, ARefreshToken: string);
var
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse;
  JSONValue: TJSONValue;
  JSONObject: TJSONObject;
  JSONResponse: TJSONObject;
begin
  RESTClient := TRESTClient.Create('https://api.bling.com.br/Api/v3/oauth/token');
  RESTRequest := TRESTRequest.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);
  try
    RESTClient.ContentType := 'application/x-www-form-urlencoded';

    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;
    RESTRequest.Method := rmPOST;

    RESTRequest.AddParameter('grant_type', 'authorization_code', TRESTRequestParameterKind.pkREQUESTBODY, [TRESTRequestParameterOption.poDoNotEncode]);
    RESTRequest.AddParameter('code', '3c60be11944392f5145396dda7713fd99c744866', TRESTRequestParameterKind.pkREQUESTBODY, [TRESTRequestParameterOption.poDoNotEncode]);
    RESTRequest.AddParameter('Authorization', 'Basic N2M1M2YzOWZjZGE3MWExZmQ2OWI1NTkxZTYyZTg0ZjRhMTlkZmFmNTplODJhNzk2YTc2MmQ1NjBkMDNmZjY2YzMyZDc3OTM0ZThkMDEyYzFjNDZhZjc1ODdkZjk5ZDJjNTBlODE=', TRESTRequestParameterKind.pkHTTPHEADER, [TRESTRequestParameterOption.poDoNotEncode]);

    RESTRequest.Execute;

    // Verifica se a requisição foi bem-sucedida
    if RESTResponse.StatusCode = 200 then
    begin
      JSONResponse := TJSONObject.ParseJSONValue(RESTResponse.Content) as TJSONObject;
      try
        AAccessToken := JSONResponse.GetValue('access_token').Value;
        ARefreshToken := JSONResponse.GetValue('refresh_token').Value;
        Writeln('Access Token: ' + AAccessToken);
        Writeln('Refresh Token: ' + ARefreshToken);
      finally
        JSONResponse.Free;
      end;
    end
    else
    begin

      Writeln('Erro na requisição: ' + RESTResponse.StatusText);
    end;
  finally
    RESTResponse.Free;
    RESTRequest.Free;
    RESTClient.Free;
  end;
end;


class procedure TIntegracaoBling.RefreshAccessToken(const ARefreshToken: string; out AAccessToken: string);
var
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse;
  JSONResponse: TJSONObject;
begin
  RESTClient := TRESTClient.Create(nil);
  RESTRequest := TRESTRequest.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);
  try
    // Configura o RESTClient
    RESTClient.BaseURL := TOKEN_URL;

    // Associa os componentes
    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;

    // Configura a requisição
    RESTRequest.Method := TRESTRequestMethod.rmPOST;
    RESTRequest.AddAuthParameter('Authorization', 'Basic ' + EncodeCredentials(CLIENT_ID, CLIENT_SECRET), TRESTRequestParameterKind.pkHTTPHEADER, [TRESTRequestParameterOption.poDoNotEncode]);
    RESTRequest.AddParameter('grant_type', 'refresh_token', TRESTRequestParameterKind.pkGETorPOST);
    RESTRequest.AddParameter('refresh_token', ARefreshToken, TRESTRequestParameterKind.pkGETorPOST);

    // Executa a requisição
    RESTRequest.Execute;

    // Verifica se a requisição foi bem-sucedida
    if RESTResponse.StatusCode = 200 then
    begin
      JSONResponse := TJSONObject.ParseJSONValue(RESTResponse.Content) as TJSONObject;
      try
        AAccessToken := JSONResponse.GetValue('access_token').Value;
        Writeln('Novo Access Token: ' + AAccessToken);
      finally
        JSONResponse.Free;
      end;
    end
    else
    begin
      Writeln('Erro na requisição: ' + RESTResponse.StatusText);
    end;
  finally
    RESTResponse.Free;
    RESTRequest.Free;
    RESTClient.Free;
  end;
end;


end.
