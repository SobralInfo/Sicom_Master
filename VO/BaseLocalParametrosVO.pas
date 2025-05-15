unit BaseLocalParametrosVO;

interface

Type TBaseLocalParametrosVO = class
  private
     FBASE_LOCAL: String;
     FCAIXA: String;
     FID: integer;
    FTIPO_DESCONTO_PEDIDO: String;
    FCERTIFICADO: String;
    FCRITICAR_ESTOQUE: String;
    FMENSAGEM_IMPRIMIR: String;
    FVALIDAR_CPF_CAD_CLIENTE: String;
    Fnumero_nfce: integer;
    Fid_csc_nfce: string;
    Fserie_nfce: integer;
    Fcsc_nfce: string;
    Fforma_emissao: string;
    Ftipo_ambiente: string;
    FidContaPadraoFinanceiro: integer;
    FidClientePadraoFinanceiro: integer;
     procedure SetBASE_LOCAL(const Value: String);
     procedure SetCAIXA(const Value: String);
     procedure SetID(const Value: integer);
    procedure SetTIPO_DESCONTO_PEDIDO(const Value: String);
    procedure SetCERTIFICADO(const Value: String);
    procedure SetCRITICAR_ESTOQUE(const Value: String);
    procedure SetMENSAGEM_IMPRIMIR(const Value: String);
    procedure SetVALIDAR_CPF_CAD_CLIENTE(const Value: String);
    procedure Setnumero_nfce(const Value: integer);
    procedure Setid_csc_nfce(const Value: string);
    procedure Setserie_nfce(const Value: integer);
    procedure Setcsc_nfce(const Value: string);
    procedure Setforma_emissao(const Value: string);
    procedure Settipo_ambiente(const Value: string);
    procedure SetidClientePadraoFinanceiro(const Value: integer);
    procedure SetidContaPadraoFinanceiro(const Value: integer);
  published
     property ID: integer read FID write SetID;
     property BASE_LOCAL: String read FBASE_LOCAL write SetBASE_LOCAL;
     property CAIXA: String read FCAIXA write SetCAIXA;
     property TIPO_DESCONTO_PEDIDO: String read FTIPO_DESCONTO_PEDIDO write SetTIPO_DESCONTO_PEDIDO;
     property CERTIFICADO: String read FCERTIFICADO write SetCERTIFICADO;
     property CRITICAR_ESTOQUE: String read FCRITICAR_ESTOQUE write SetCRITICAR_ESTOQUE;
     property MENSAGEM_IMPRIMIR: String read FMENSAGEM_IMPRIMIR write SetMENSAGEM_IMPRIMIR;
     property VALIDAR_CPF_CAD_CLIENTE: String read FVALIDAR_CPF_CAD_CLIENTE write SetVALIDAR_CPF_CAD_CLIENTE;
     property numero_nfce: integer read Fnumero_nfce write Setnumero_nfce;
     property id_csc_nfce: string read Fid_csc_nfce write Setid_csc_nfce;
     property serie_nfce: integer read Fserie_nfce write Setserie_nfce;
     property csc_nfce: string read Fcsc_nfce write Setcsc_nfce;
     property forma_emissao: string read Fforma_emissao write Setforma_emissao;
     property tipo_ambiente: string read Ftipo_ambiente write Settipo_ambiente;
     property idClientePadraoFinanceiro: integer read FidClientePadraoFinanceiro write SetidClientePadraoFinanceiro;
     property idContaPadraoFinanceiro: integer read FidContaPadraoFinanceiro write SetidContaPadraoFinanceiro;

end;

implementation

{ TBaseLocalParametrosVO }

procedure TBaseLocalParametrosVO.SetBASE_LOCAL(const Value: String);
begin
  FBASE_LOCAL := Value;
end;

procedure TBaseLocalParametrosVO.SetCAIXA(const Value: String);
begin
  FCAIXA := Value;
end;

procedure TBaseLocalParametrosVO.SetCERTIFICADO(const Value: String);
begin
  FCERTIFICADO := Value;
end;

procedure TBaseLocalParametrosVO.SetCRITICAR_ESTOQUE(const Value: String);
begin
  FCRITICAR_ESTOQUE := Value;
end;

procedure TBaseLocalParametrosVO.Setcsc_nfce(const Value: string);
begin
  Fcsc_nfce := Value;
end;

procedure TBaseLocalParametrosVO.Setforma_emissao(const Value: string);
begin
  Fforma_emissao := Value;
end;

procedure TBaseLocalParametrosVO.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TBaseLocalParametrosVO.SetidClientePadraoFinanceiro(
  const Value: integer);
begin
  FidClientePadraoFinanceiro := Value;
end;

procedure TBaseLocalParametrosVO.SetidContaPadraoFinanceiro(
  const Value: integer);
begin
  FidContaPadraoFinanceiro := Value;
end;

procedure TBaseLocalParametrosVO.Setid_csc_nfce(const Value: string);
begin
  Fid_csc_nfce := Value;
end;

procedure TBaseLocalParametrosVO.SetMENSAGEM_IMPRIMIR(const Value: String);
begin
  FMENSAGEM_IMPRIMIR := Value;
end;

procedure TBaseLocalParametrosVO.Setnumero_nfce(const Value: integer);
begin
  Fnumero_nfce := Value;
end;

procedure TBaseLocalParametrosVO.Setserie_nfce(const Value: integer);
begin
  Fserie_nfce := Value;
end;

procedure TBaseLocalParametrosVO.Settipo_ambiente(const Value: string);
begin
  Ftipo_ambiente := Value;
end;

procedure TBaseLocalParametrosVO.SetTIPO_DESCONTO_PEDIDO(const Value: String);
begin
  FTIPO_DESCONTO_PEDIDO := Value;
end;

procedure TBaseLocalParametrosVO.SetVALIDAR_CPF_CAD_CLIENTE(
  const Value: String);
begin
  FVALIDAR_CPF_CAD_CLIENTE := Value;
end;

end.

