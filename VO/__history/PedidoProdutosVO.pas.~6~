
unit PedidoProdutosVO;

interface

Type
   TPedidoProdutosVO = class
  private
    Fvalor_unitario: double;
    Fid_produto: string;
    Fdescricao: string;
    Fid: integer;
    Fstatus: string;
    Fqtde_estoque: double;
    Funidade: string;
    Fid_empresa: integer;
    Fid_produto_original: string;
    Ffator_unidade: double;
    Fgtin: string;
    procedure Setdescricao(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setid_empresa(const Value: integer);
    procedure Setid_produto(const Value: string);
    procedure Setqtde_estoque(const Value: double);
    procedure Setstatus(const Value: string);
    procedure Setunidade(const Value: string);
    procedure Setvalor_unitario(const Value: double);
    procedure Setfator_unidade(const Value: double);
    procedure Setgtin(const Value: string);

   public
      property id: integer read Fid write Setid;
      property id_empresa: integer read Fid_empresa write Setid_empresa;
      property id_produto: string read Fid_produto write Setid_produto;
      property status: string read Fstatus write Setstatus;
      property descricao: string read Fdescricao write Setdescricao;
      property unidade: string read Funidade write Setunidade;
      property valor_unitario: double read Fvalor_unitario write Setvalor_unitario;
      property qtde_estoque: double read Fqtde_estoque write Setqtde_estoque;
      property fator_unidade: double read Ffator_unidade write Setfator_unidade;
      property gtin: string read Fgtin write Setgtin;

   end;

implementation

{ TPedidoProdutosVO }

procedure TPedidoProdutosVO.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TPedidoProdutosVO.Setfator_unidade(const Value: double);
begin
  Ffator_unidade := Value;
end;

procedure TPedidoProdutosVO.Setgtin(const Value: string);
begin
  Fgtin := Value;
end;

procedure TPedidoProdutosVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TPedidoProdutosVO.Setid_empresa(const Value: integer);
begin
  Fid_empresa := Value;
end;

procedure TPedidoProdutosVO.Setid_produto(const Value: string);
begin
  Fid_produto := Value;
end;

procedure TPedidoProdutosVO.Setqtde_estoque(const Value: double);
begin
  Fqtde_estoque := Value;
end;

procedure TPedidoProdutosVO.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

procedure TPedidoProdutosVO.Setunidade(const Value: string);
begin
  Funidade := Value;
end;

procedure TPedidoProdutosVO.Setvalor_unitario(const Value: double);
begin
  Fvalor_unitario := Value;
end;

end.
