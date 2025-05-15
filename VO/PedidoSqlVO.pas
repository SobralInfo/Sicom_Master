unit PedidoSqlVO;

interface

Type
   TPedidoSqlVO = class
  private
    Fid: integer;
    Fsql_tipo_documentos: string;
    Fsql_produtos: String;
    Fsql_condicao_pagamento: string;
    Fsql_funcionarios: string;
    Fsql_clientes: string;
    Fsql_forma_pagamento: String;
    procedure Setid(const Value: integer);
    procedure Setsql_condicao_pagamento(const Value: string);
    procedure Setsql_funcionarios(const Value: string);
    procedure Setsql_produtos(const Value: String);
    procedure Setsql_tipo_documentos(const Value: string);
    procedure Setsql_clientes(const Value: string);
    procedure Setsql_forma_pagamento(const Value: String);

  published

      property id: integer read Fid write Setid;
      property sql_produtos: String read Fsql_produtos write Setsql_produtos;
      property sql_funcionarios: string read Fsql_funcionarios write Setsql_funcionarios;
      property sql_tipo_documentos: string read Fsql_tipo_documentos write Setsql_tipo_documentos;
      property sql_condicao_pagamento: string read Fsql_condicao_pagamento write Setsql_condicao_pagamento;
      property sql_clientes: string read Fsql_clientes write Setsql_clientes;
      property sql_forma_pagamento: String read Fsql_forma_pagamento write Setsql_forma_pagamento;

   end;

implementation

{ TPedidoSqlVO }

procedure TPedidoSqlVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TPedidoSqlVO.Setsql_clientes(const Value: string);
begin
  Fsql_clientes := Value;
end;

procedure TPedidoSqlVO.Setsql_condicao_pagamento(const Value: string);
begin
  Fsql_condicao_pagamento := Value;
end;

procedure TPedidoSqlVO.Setsql_forma_pagamento(const Value: String);
begin
  Fsql_forma_pagamento := Value;
end;

procedure TPedidoSqlVO.Setsql_funcionarios(const Value: string);
begin
  Fsql_funcionarios := Value;
end;

procedure TPedidoSqlVO.Setsql_produtos(const Value: String);
begin
  Fsql_produtos := Value;
end;

procedure TPedidoSqlVO.Setsql_tipo_documentos(const Value: string);
begin
  Fsql_tipo_documentos := Value;
end;

end.
