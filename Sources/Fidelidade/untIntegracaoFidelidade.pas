unit untIntegracaoFidelidade;

interface

uses
  System.Classes, Data.Bind.Components, Data.Bind.ObjectScope,
  NetEncoding, System.Net.HttpClient, ScHttp, System.JSON, DBClient,
  System.Threading, generics.Collections, FireDAC.Comp.Client;

type

   TIntegracaoCoteFacil = class( TComponent )
   strict private
      function GetTokenAuth: String;
   public
      constructor Create( AOwner : TComponent ); override;
   end;

   TClientes = class
  private
    Fcpf_cnpj: string;
    Femail: string;
    Fid_funcionario: integer;
    Fdata_cadastro: tdate;
    Fid: integer;
    Fdata_nascimento: tdate;
    Fpontuacao: integer;
    Fnome: string;
    Fcelular: string;
    Fvalor_Disponivel: double;
    Fvalor_Ponto_Pagamento: double;
    Fperc_Utilizacao_Pontos: double;
    procedure Setvalor_Disponivel(const Value: double);
    procedure Setvalor_Ponto_Pagamento(const Value: double);
    procedure Setperc_Utilizacao_Pontos(const Value: double);

  public
    class function RetornarCliente(cpf, celular: String): TClientes;
    class function GravarCliente(cliente: TClientes): boolean;
    class function RetornarPontuacao(idCliente: String): TClientes;

    procedure Setcelular(const Value: string);
    procedure Setcpf_cnpj(const Value: string);
    procedure Setdata_cadastro(const Value: tdate);
    procedure Setdata_nascimento(const Value: tdate);
    procedure Setemail(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setid_funcionario(const Value: integer);
    procedure Setnome(const Value: string);
    procedure Setpontuacao(const Value: integer);
  published

      property id: integer read Fid write Setid;
      property cpf_cnpj: string read Fcpf_cnpj write Setcpf_cnpj;
      property nome: string read Fnome write Setnome;
      property celular: string read Fcelular write Setcelular;
      property email: string read Femail write Setemail;
      property data_cadastro: tdate read Fdata_cadastro write Setdata_cadastro;
      property pontuacao: integer read Fpontuacao write Setpontuacao;
      property data_nascimento: tdate read Fdata_nascimento write Setdata_nascimento;
      property id_funcionario: integer read Fid_funcionario write Setid_funcionario;
      property valor_Disponivel: double read Fvalor_Disponivel write Setvalor_Disponivel;
      property valor_Ponto_Pagamento: double read Fvalor_Ponto_Pagamento write Setvalor_Ponto_Pagamento;
      property perc_Utilizacao_Pontos: double read Fperc_Utilizacao_Pontos write Setperc_Utilizacao_Pontos;

   end;

   TLancamentos = class
  private
    Fvalor_compra: double;
    Fid_funcionario: integer;
    Fid_cliente: integer;
    Fid: integer;
    Fpontuacao: integer;
    Ftipo: string;
    Fdata_compra: TDateTime;
    Fvalor_ponto_venda: double;
    Fvalor_minimo_pontuacao: double;
    Fobservacao: string;

    procedure Setdata_compra(const Value: TDateTime);
    procedure Setid(const Value: integer);
    procedure Setid_cliente(const Value: integer);
    procedure Setid_funcionario(const Value: integer);
    procedure Setpontuacao(const Value: integer);
    procedure Settipo(const Value: string);
    procedure Setvalor_compra(const Value: double);
    procedure Setvalor_minimo_pontuacao(const Value: double);
    procedure Setvalor_ponto_venda(const Value: double);
    procedure Setobservacao(const Value: string);

  public
    class function GravarLancamento(lancamento: TLancamentos): boolean;
    class function RetornarConfiguracao: String;
    class function RetornarTodasConfiguracoes: TLancamentos;

  published

      property id: integer read Fid write Setid;
      property id_cliente: integer read Fid_cliente write Setid_cliente;
      property tipo: string read Ftipo write Settipo;
      property data_compra: TDateTime read Fdata_compra write Setdata_compra;
      property valor_compra: double read Fvalor_compra write Setvalor_compra;
      property pontuacao: integer read Fpontuacao write Setpontuacao;
      property id_funcionario: integer read Fid_funcionario write Setid_funcionario;
      property valor_ponto_venda: double read Fvalor_ponto_venda write Setvalor_ponto_venda;
      property valor_minimo_pontuacao: double read Fvalor_minimo_pontuacao write Setvalor_minimo_pontuacao;
      property observacao: string read Fobservacao write Setobservacao;


   end;

var FTokenAuth: String;


implementation

uses
  System.SysUtils, untPrincipal;

var
  TOKEN_USUARIO, TOKEN_SENHA, URL_API_COTE_FACIL: String;

{ TIntegracaoCoteFacil }
{
procedure TIntegracaoCoteFacil.GetCliente(CpfCnpj: string);
begin

end;
}
function TIntegracaoCoteFacil.GetTokenAuth: String;
var
  jsObj : TJsonObject;
  buf   : TBytes;
  AResponse: TScHttpWebResponse;
  WAuxQry: TFDQuery;
begin
 Try
   Result:= '';
   jsObj := TJsonObject.Create;

   try
      try
         WAuxQry := TFDQuery.Create(nil);
         WAuxQry.Connection := frmPrincipal.ConexaoLocal;
         WAuxQry.SQL.Add(' SELECT Des_APIFidelidade, Des_UsuFidelidade, Des_SnhFidelidade FROM configuracoes ');
         WAuxQry.Open;
         URL_API_COTE_FACIL := WAuxQry.FieldByName('Des_APIFidelidade').AsString;
         TOKEN_USUARIO      := WAuxQry.FieldByName('Des_UsuFidelidade').AsString;
         TOKEN_SENHA        := WAuxQry.FieldByName('Des_SnhFidelidade').AsString;
      except
         on E: Exception do
         begin
            raise Exception.Create(E.Message);
         end;
      end;
   finally
      WAuxQry.free;
   end;

   var ARequest := TScHttpWebRequest.Create(URL_API_COTE_FACIL+'recebeEmpresaBase');
   ARequest.Method     := rmPOST;
   ARequest.ContentType:= 'application/json';
   try
      Try
         jsObj.AddPair('cnpj',TOKEN_USUARIO);
         jsObj.AddPair('senha',TOKEN_SENHA);

         buf := TEncoding.UTF8.GetBytes(jsObj.ToString);
         ARequest.ContentLength := Length(buf);
         ARequest.WriteBuffer(buf);
         AResponse := ARequest.GetResponse;
         if AResponse.StatusCode in [scOK,scCreated] then
            Result := TJSonObject.ParseJSONValue(AResponse.ReadAsString).GetValue<String>('bdSchema');
      Except
         on e:exception do
         raise Exception.Create(e.Message);
      End;
   finally
      jsObj.Free;
      FreeAndNil(ARequest);
   end;
 Except
    on e:exception do
       raise Exception.Create('Não foi possível concetar o sistema de fidelidade.');
 End;
end;

constructor TIntegracaoCoteFacil.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTokenAuth := GetTokenAuth;
end;

{ TClientes }

class function TClientes.GravarCliente(cliente: TClientes): boolean;
var
  AResponse: TScHttpWebResponse;
  jsObj : TJsonObject;
  WAuxQry: TClientDataSet;
  buf   : TBytes;
  jsObjCliente: string;
begin
  result := false;
  jsObj  := TJsonObject.Create;
  jsObjCliente  := '';
  var ARequest := TScHttpWebRequest.Create(URL_API_COTE_FACIL+'cliente');
  ARequest.Method     := rmPOST;
  ARequest.ContentType:= 'application/json';
  try
    Try
      jsObj.AddPair('schema',FTokenAuth);
      jsObjCliente := '{"cpf": "' + cliente.Fcpf_cnpj + '"' +
                      ',"nome": "' + cliente.Fnome + '"' +
                      ',"celular": "' + cliente.Fcelular + '"' +
                      ',"email": "' + cliente.Femail + '"' +
                      ',"nascimento": "' + FormatDateTime('YYYY-MM-DD', cliente.Fdata_nascimento) + '"' +
                      ',"idfuncionario": ' + IntToStr(cliente.Fid_funcionario) + '}';
      jsObj.AddPair('cliente', TJSONObject.ParseJSONValue(jsObjCliente));

           buf := TEncoding.UTF8.GetBytes(jsObj.ToString);
           ARequest. ContentLength := Length(buf);
           ARequest.WriteBuffer(buf);
           AResponse := ARequest.GetResponse;
        if AResponse.StatusCode in [scOK,scCreated] then
           result := true;
    Except
      on e:exception do begin
        raise Exception.Create('Não foi possível concetar o sistema de fidelidade.');
        result := false;
      end;
    End;
  finally
    jsObj.Free;
    ARequest.Free;
  end;
end;

class function TClientes.RetornarCliente(cpf, celular: String): TClientes;
var
  jsObj : TJsonObject;
  buf   : TBytes;
  AResponse: TScHttpWebResponse;
  cliente : TClientes;
  JSonValue: TJSONValue;
begin
   cliente := TClientes.Create;
   jsObj := TJsonObject.Create;

   var ARequest := TScHttpWebRequest.Create(URL_API_COTE_FACIL+'RetornarCliente');
   ARequest.Method     := rmPOST;
   ARequest.ContentType:= 'application/json';
   try
      Try
         jsObj.AddPair('schema',FTokenAuth);
         jsObj.AddPair('celular',celular);
         jsObj.AddPair('cpf',cpf);

         buf := TEncoding.UTF8.GetBytes(jsObj.ToString);
         ARequest.ContentLength := Length(buf);
         ARequest.WriteBuffer(buf);
         AResponse := ARequest.GetResponse;
         if AResponse.StatusCode in [scOK,scCreated] then begin
            JSonValue := TJSonObject.ParseJSONValue(AResponse.ReadAsString);

            Try
               cliente.id             := JSonValue.GetValue<Integer>('id');
               cliente.cpf_cnpj          := JSonValue.GetValue<string>('cpfCnpj');
               cliente.email             := JSonValue.GetValue<string>('email');
               Try
                  cliente.Fid_funcionario := JSonValue.GetValue<Integer>('idFuncionario');
               except
               End;
               cliente.data_cadastro     := JSonValue.GetValue<TDate>('dataCadastro');
               cliente.data_nascimento   := JSonValue.GetValue<TDate>('dataNascimento');
               cliente.pontuacao         := JSonValue.GetValue<Integer>('pontuacao');
               cliente.nome              := JSonValue.GetValue<string>('nome');
               cliente.celular           := JSonValue.GetValue<string>('celular');

            except
               cliente.id             := 0;
            End;

            Result := cliente;

         end;

      Except
        on e:exception do begin
          raise Exception.Create('Não foi possível conectar o sistema de fidelidade.');
        end;
      End;
   finally
      jsObj.Free;
      FreeAndNil(ARequest);
   end;
end;

class function TClientes.RetornarPontuacao(idCliente: String): TClientes;
var
  jsObj : TJsonObject;
  buf   : TBytes;
  AResponse: TScHttpWebResponse;
  cliente : TClientes;
  JSonValue: TJSONValue;
begin
   cliente := TClientes.Create;
   jsObj := TJsonObject.Create;

   var ARequest := TScHttpWebRequest.Create(URL_API_COTE_FACIL+'RetornarPontuacao');
   ARequest.Method     := rmPOST;
   ARequest.ContentType:= 'application/json';
   try
      Try
         jsObj.AddPair('schema',FTokenAuth);
         jsObj.AddPair('id',idCliente);

         buf := TEncoding.UTF8.GetBytes(jsObj.ToString);
         ARequest.ContentLength := Length(buf);
         ARequest.WriteBuffer(buf);
         AResponse := ARequest.GetResponse;
         if AResponse.StatusCode in [scOK,scCreated] then begin
            JSonValue := TJSonObject.ParseJSONValue(AResponse.ReadAsString);

            Try
               cliente.cpf_cnpj               := JSonValue.GetValue<string>('cpf');
               cliente.pontuacao              := JSonValue.GetValue<Integer>('pontos');
               cliente.nome                   := JSonValue.GetValue<string>('nome');
               cliente.valor_Disponivel       := JSonValue.GetValue<Double>('valorDisponivel');
               cliente.valor_Ponto_Pagamento  := JSonValue.GetValue<Double>('valorPontoPagamento');
               cliente.perc_Utilizacao_Pontos := JSonValue.GetValue<Double>('percUtilizacaoPontos');
            except
               cliente.id := 0;
            End;

            Result := cliente;

         end;

      Except
        on e:exception do begin
          raise Exception.Create('Não foi possível conectar o sistema de fidelidade.');
        end;
      End;
   finally
      jsObj.Free;
      FreeAndNil(ARequest);
   end;
end;

procedure TClientes.Setcelular(const Value: string);
begin
  Fcelular := Value;
end;

procedure TClientes.Setcpf_cnpj(const Value: string);
begin
  Fcpf_cnpj := Value;
end;

procedure TClientes.Setdata_cadastro(const Value: tdate);
begin
  Fdata_cadastro := Value;
end;

procedure TClientes.Setdata_nascimento(const Value: tdate);
begin
  Fdata_nascimento := Value;
end;

procedure TClientes.Setemail(const Value: string);
begin
  Femail := Value;
end;

procedure TClientes.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TClientes.Setid_funcionario(const Value: integer);
begin
  Fid_funcionario := Value;
end;

procedure TClientes.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TClientes.Setperc_Utilizacao_Pontos(const Value: double);
begin
  Fperc_Utilizacao_Pontos := Value;
end;

procedure TClientes.Setpontuacao(const Value: integer);
begin
  Fpontuacao := Value;
end;

procedure TClientes.Setvalor_Disponivel(const Value: double);
begin
  Fvalor_Disponivel := Value;
end;

procedure TClientes.Setvalor_Ponto_Pagamento(const Value: double);
begin
  Fvalor_Ponto_Pagamento := Value;
end;

{ TLancamentos }

class function TLancamentos.GravarLancamento(lancamento: TLancamentos): boolean;
var
  AResponse: TScHttpWebResponse;
  jsObj : TJsonObject;
  WAuxQry: TClientDataSet;
  buf   : TBytes;
  jsObjCliente, valor: string;
begin
  result := false;
  jsObj  := TJsonObject.Create;
  jsObjCliente  := '';
  valor := ',';
  var ARequest := TScHttpWebRequest.Create(URL_API_COTE_FACIL+'movimentacao');
  ARequest.Method     := rmPOST;
  ARequest.ContentType:= 'application/json';
  try
    Try
      jsObj.AddPair('schema',FTokenAuth);
      jsObjCliente := '{"idCliente": ' + IntToStr(lancamento.Fid_cliente) +
                      ',"tipo": "' + lancamento.Ftipo + '"' +
                      ',"valor": ' + StringReplace(FormatFloat('0.00', lancamento.Fvalor_compra), valor ,'.', [rfReplaceAll, rfIgnoreCase]) +
                      ',"pontos": ' + IntToStr(lancamento.Fpontuacao) +
                      ',"dataCompra": "' + FormatDateTime('YYYY-MM-DD', lancamento.Fdata_compra) + '"' +
                      ',"horaCompra": "' + FormatDateTime('HH:MM:SS', now) + '"' +
                      ',"idFuncionario": ' + IntToStr(lancamento.Fid_funcionario) + '}';
      jsObj.AddPair('lancamento', TJSONObject.ParseJSONValue(jsObjCliente));

           buf := TEncoding.UTF8.GetBytes(jsObj.ToString);
           ARequest. ContentLength := Length(buf);
           ARequest.WriteBuffer(buf);
           AResponse := ARequest.GetResponse;
        if AResponse.StatusCode in [scOK,scCreated] then
           result := true;
    Except
        on e:exception do begin
          raise Exception.Create('Não foi possível concetar o sistema de fidelidade.');
          result := false;
        end;
    End;
  finally
    jsObj.Free;
    ARequest.Free;
  end;
end;

class function TLancamentos.RetornarConfiguracao: String;
var
  jsObj : TJsonObject;
  buf   : TBytes;
  AResponse: TScHttpWebResponse;
  JSonValue: TJSONValue;
begin
   jsObj := TJsonObject.Create;

   var ARequest := TScHttpWebRequest.Create(URL_API_COTE_FACIL+'RetornarConfiguracao');
   ARequest.Method     := rmPOST;
   ARequest.ContentType:= 'application/json';
   try
      Try
         jsObj.AddPair('schema',FTokenAuth);
         buf := TEncoding.UTF8.GetBytes(jsObj.ToString);
         ARequest.ContentLength := Length(buf);
         ARequest.WriteBuffer(buf);
         AResponse := ARequest.GetResponse;
         if AResponse.StatusCode in [scOK,scCreated] then begin
            JSonValue := TJSonObject.ParseJSONValue(AResponse.ReadAsString);

            Try
               Result := JSonValue.GetValue<string>('filtroPesquisa');
            except
               Result := 'C';
            End;

         end else
            Result := 'C';

      Except
        on e:exception do begin
          raise Exception.Create('Não foi possível conectar o sistema de fidelidade.');
        end;
      End;
   finally
      jsObj.Free;
      FreeAndNil(ARequest);
   end;
end;

class function TLancamentos.RetornarTodasConfiguracoes: TLancamentos;
var
  jsObj : TJsonObject;
  buf   : TBytes;
  AResponse: TScHttpWebResponse;
  JSonValue: TJSONValue;
  configuracao: TLancamentos;
begin
   jsObj := TJsonObject.Create;
   configuracao := TLancamentos.Create;

   var ARequest := TScHttpWebRequest.Create(URL_API_COTE_FACIL+'RetornarConfiguracao');
   ARequest.Method     := rmPOST;
   ARequest.ContentType:= 'application/json';
   try
      Try
         jsObj.AddPair('schema',FTokenAuth);
         buf := TEncoding.UTF8.GetBytes(jsObj.ToString);
         ARequest.ContentLength := Length(buf);
         ARequest.WriteBuffer(buf);
         AResponse := ARequest.GetResponse;
         if AResponse.StatusCode in [scOK,scCreated] then begin
            JSonValue := TJSonObject.ParseJSONValue(AResponse.ReadAsString);

            Try
               configuracao.valor_ponto_venda      := JSonValue.GetValue<Double>('valorPontoVenda');
               configuracao.valor_minimo_pontuacao := JSonValue.GetValue<Double>('valorMinimoPontuacao');
               configuracao.observacao             := JSonValue.GetValue<string>('msgImpressao');
            except
            End;

         end;

         Result := configuracao;

      Except
        on e:exception do begin
          raise Exception.Create('Não foi possível conectar o sistema de fidelidade.');
        end;
      End;
   finally
      jsObj.Free;
      FreeAndNil(ARequest);
   end;
end;

procedure TLancamentos.Setdata_compra(const Value: TDateTime);
begin
  Fdata_compra := Value;
end;

procedure TLancamentos.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TLancamentos.Setid_cliente(const Value: integer);
begin
  Fid_cliente := Value;
end;

procedure TLancamentos.Setid_funcionario(const Value: integer);
begin
  Fid_funcionario := Value;
end;

procedure TLancamentos.Setobservacao(const Value: string);
begin
  Fobservacao := Value;
end;

procedure TLancamentos.Setpontuacao(const Value: integer);
begin
  Fpontuacao := Value;
end;

procedure TLancamentos.Settipo(const Value: string);
begin
  Ftipo := Value;
end;

procedure TLancamentos.Setvalor_compra(const Value: double);
begin
  Fvalor_compra := Value;
end;

procedure TLancamentos.Setvalor_minimo_pontuacao(const Value: double);
begin
  Fvalor_minimo_pontuacao := Value;
end;

procedure TLancamentos.Setvalor_ponto_venda(const Value: double);
begin
  Fvalor_ponto_venda := Value;
end;

end.

