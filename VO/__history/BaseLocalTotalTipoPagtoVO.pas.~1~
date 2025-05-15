unit BaseLocalTotalTipoPagtoVO;

interface

Type
   TBaseLocalTotalTipoPagtoVO = class
  private
    FVALOR: double;
    FID: integer;
    FID_VENDA_CABECALHO: integer;
    FID_FORMA_PAGAMENTO: integer;
    procedure SetID(const Value: integer);
    procedure SetID_FORMA_PAGAMENTO(const Value: integer);
    procedure SetID_VENDA_CABECALHO(const Value: integer);
    procedure SetVALOR(const Value: double);
  published

      property ID: integer read FID write SetID;
      property ID_VENDA_CABECALHO: integer read FID_VENDA_CABECALHO write SetID_VENDA_CABECALHO;
      property ID_FORMA_PAGAMENTO: integer read FID_FORMA_PAGAMENTO write SetID_FORMA_PAGAMENTO;
      property VALOR: double read FVALOR write SetVALOR;

   end;

implementation

{ TBaseLocalTotalTipoPagtoVO }

procedure TBaseLocalTotalTipoPagtoVO.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TBaseLocalTotalTipoPagtoVO.SetID_FORMA_PAGAMENTO(
  const Value: integer);
begin
  FID_FORMA_PAGAMENTO := Value;
end;

procedure TBaseLocalTotalTipoPagtoVO.SetID_VENDA_CABECALHO(
  const Value: integer);
begin
  FID_VENDA_CABECALHO := Value;
end;

procedure TBaseLocalTotalTipoPagtoVO.SetVALOR(const Value: double);
begin
  FVALOR := Value;
end;

end.
