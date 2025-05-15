unit BaseLocalVendaDetalheVO;

interface

Type
   TBaseLocalVendaDetalheVO = class
  private
    FVALOR_UNITARIO: double;
    FID_PRODUTO: integer;
    FVALOR_TOTAL: double;
    FGTIN: string;
    FID: integer;
    FITEM: integer;
    FQUANTIDADE: double;
    FID_VENDA_CABECALHO: integer;
    FDESCRICAO_PRODUTO: String;
    FOBSERVACAO: String;
    procedure SetGTIN(const Value: string);
    procedure SetID(const Value: integer);
    procedure SetID_PRODUTO(const Value: integer);
    procedure SetID_VENDA_CABECALHO(const Value: integer);
    procedure SetITEM(const Value: integer);
    procedure SetQUANTIDADE(const Value: double);
    procedure SetVALOR_TOTAL(const Value: double);
    procedure SetVALOR_UNITARIO(const Value: double);
    procedure SetDESCRICAO_PRODUTO(const Value: String);
    procedure SetOBSERVACAO(const Value: String);
  published

      property ID: integer read FID write SetID;
      property ID_PRODUTO: integer read FID_PRODUTO write SetID_PRODUTO;
      property ID_VENDA_CABECALHO: integer read FID_VENDA_CABECALHO write SetID_VENDA_CABECALHO;
      property GTIN: string read FGTIN write SetGTIN;
      property ITEM: integer read FITEM write SetITEM;
      property QUANTIDADE: double read FQUANTIDADE write SetQUANTIDADE;
      property VALOR_UNITARIO: double read FVALOR_UNITARIO write SetVALOR_UNITARIO;
      property VALOR_TOTAL: double read FVALOR_TOTAL write SetVALOR_TOTAL;
      property DESCRICAO_PRODUTO: String read FDESCRICAO_PRODUTO write SetDESCRICAO_PRODUTO;
      property OBSERVACAO: String read FOBSERVACAO write SetOBSERVACAO;

   end;

implementation

{ TBaseLocalVendaDetalhe }

procedure TBaseLocalVendaDetalheVO.SetDESCRICAO_PRODUTO(const Value: String);
begin
  FDESCRICAO_PRODUTO := Value;
end;

procedure TBaseLocalVendaDetalheVO.SetGTIN(const Value: string);
begin
  FGTIN := Value;
end;

procedure TBaseLocalVendaDetalheVO.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TBaseLocalVendaDetalheVO.SetID_PRODUTO(const Value: integer);
begin
  FID_PRODUTO := Value;
end;

procedure TBaseLocalVendaDetalheVO.SetID_VENDA_CABECALHO(const Value: integer);
begin
  FID_VENDA_CABECALHO := Value;
end;

procedure TBaseLocalVendaDetalheVO.SetITEM(const Value: integer);
begin
  FITEM := Value;
end;

procedure TBaseLocalVendaDetalheVO.SetOBSERVACAO(const Value: String);
begin
  FOBSERVACAO := Value;
end;

procedure TBaseLocalVendaDetalheVO.SetQUANTIDADE(const Value: double);
begin
  FQUANTIDADE := Value;
end;

procedure TBaseLocalVendaDetalheVO.SetVALOR_TOTAL(const Value: double);
begin
  FVALOR_TOTAL := Value;
end;

procedure TBaseLocalVendaDetalheVO.SetVALOR_UNITARIO(const Value: double);
begin
  FVALOR_UNITARIO := Value;
end;

end.
