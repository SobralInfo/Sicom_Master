unit PedidoFormaPagamentoVO;

interface

Type TPedidoFormaPagamentoVO = class
  private
    FDESCRICAO: String;
    FID: integer;
    FID_FORMA_PAGAMENTO: integer;
    FSTATUS: String;
    FID_EMPRESA: integer;
    FPERMITE_TROCO: String;
    procedure SetDESCRICAO(const Value: String);
    procedure SetID(const Value: integer);
    procedure SetID_FORMA_PAGAMENTO(const Value: integer);
    procedure SetSTATUS(const Value: String);
    procedure SetID_EMPRESA(const Value: integer);
    procedure SetPERMITE_TROCO(const Value: String);

   public
      property ID: integer read FID write SetID;
      property ID_EMPRESA: integer read FID_EMPRESA write SetID_EMPRESA;
      property ID_FORMA_PAGAMENTO: integer read FID_FORMA_PAGAMENTO write SetID_FORMA_PAGAMENTO;
      property DESCRICAO: String read FDESCRICAO write SetDESCRICAO;
      property STATUS: String read FSTATUS write SetSTATUS;
      property PERMITE_TROCO: String read FPERMITE_TROCO write SetPERMITE_TROCO;

end;

implementation

{ TPedidoFormaPagamentoVO }

procedure TPedidoFormaPagamentoVO.SetDESCRICAO(const Value: String);
begin
  FDESCRICAO := Value;
end;

procedure TPedidoFormaPagamentoVO.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TPedidoFormaPagamentoVO.SetID_EMPRESA(const Value: integer);
begin
  FID_EMPRESA := Value;
end;

procedure TPedidoFormaPagamentoVO.SetID_FORMA_PAGAMENTO(const Value: integer);
begin
  FID_FORMA_PAGAMENTO := Value;
end;

procedure TPedidoFormaPagamentoVO.SetPERMITE_TROCO(const Value: String);
begin
  FPERMITE_TROCO := Value;
end;

procedure TPedidoFormaPagamentoVO.SetSTATUS(const Value: String);
begin
  FSTATUS := Value;
end;

end.
