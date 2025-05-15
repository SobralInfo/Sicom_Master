unit BaseLocalPedidoDetalheVO;

interface

uses BaseLocalProdutosVO;

Type TBaseLocalPedidoDetalheVO = class
  private
    Fvalor_unitario: double;
    Fobservacao: String;
    Fid_produto: integer;
    Fid_pedido: integer;
    Fid: integer;
    Fquantidade: double;
    FBaseLocalProdutosVO: TBaseLocalProdutosVO;
    Fdescricao: String;
    Funidade: String;
    Ffator_unidade: double;
    Fvalor_total: double;
    Fdesconto_item: double;
    Fimpresso_cozinha: String;
    Fsequencia: integer;
    procedure Setid(const Value: integer);
    procedure Setid_pedido(const Value: integer);
    procedure Setid_produto(const Value: integer);
    procedure Setobservacao(const Value: String);
    procedure Setquantidade(const Value: double);
    procedure Setvalor_unitario(const Value: double);
    procedure SetBaseLocalProdutosVO(const Value: TBaseLocalProdutosVO);
    procedure Setdescricao(const Value: String);
    procedure Setfator_unidade(const Value: double);
    procedure Setunidade(const Value: String);
    procedure Setdesconto_item(const Value: double);
    procedure Setvalor_total(const Value: double);
    procedure Setimpresso_cozinha(const Value: String);
    procedure Setsequencia(const Value: integer);
  published

   property id: integer read Fid write Setid;
   property id_pedido: integer read Fid_pedido write Setid_pedido;
   property id_produto: integer read Fid_produto write Setid_produto;
   property quantidade: double read Fquantidade write Setquantidade;
   property valor_unitario: double read Fvalor_unitario write Setvalor_unitario;
   property observacao: String read Fobservacao write Setobservacao;
   property BaseLocalProdutosVO: TBaseLocalProdutosVO read FBaseLocalProdutosVO write SetBaseLocalProdutosVO;
   property descricao: String read Fdescricao write Setdescricao;
   property unidade: String read Funidade write Setunidade;
   property fator_unidade: double read Ffator_unidade write Setfator_unidade;
   property desconto_item: double read Fdesconto_item write Setdesconto_item;
   property valor_total: double read Fvalor_total write Setvalor_total;
   property impresso_cozinha: String read Fimpresso_cozinha write Setimpresso_cozinha;
   property sequencia: integer read Fsequencia write Setsequencia;

end;

implementation

{ TBaseLocalPedidoDetalheVO }

procedure TBaseLocalPedidoDetalheVO.SetBaseLocalProdutosVO(
  const Value: TBaseLocalProdutosVO);
begin
  FBaseLocalProdutosVO := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setdesconto_item(const Value: double);
begin
  Fdesconto_item := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setdescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setfator_unidade(const Value: double);
begin
  Ffator_unidade := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setid_pedido(const Value: integer);
begin
  Fid_pedido := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setid_produto(const Value: integer);
begin
  Fid_produto := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setimpresso_cozinha(const Value: String);
begin
  Fimpresso_cozinha := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setobservacao(const Value: String);
begin
  Fobservacao := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setquantidade(const Value: double);
begin
  Fquantidade := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setsequencia(const Value: integer);
begin
  Fsequencia := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setunidade(const Value: String);
begin
  Funidade := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setvalor_total(const Value: double);
begin
  Fvalor_total := Value;
end;

procedure TBaseLocalPedidoDetalheVO.Setvalor_unitario(const Value: double);
begin
  Fvalor_unitario := Value;
end;

end.
