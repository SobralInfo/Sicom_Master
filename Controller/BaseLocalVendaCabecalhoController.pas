unit BaseLocalVendaCabecalhoController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     unitConfiguracoes, BaseLocalVendaCabecalhoVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type
   TBaseLocalVendaCabecalhoController = class
         class Procedure GravarVenda(venda: TBaseLocalVendaCabecalhoVO);
         class Function RetornarIdVenda: integer;
         class Function RetornarIdPedido: integer;
         class Function RetornarNumeroPedidoPorIDVenda(id: integer): integer;
         class procedure MudarStatusVenda(pedido, status : String);
         class Function RetornarVendaPorID(id: integer): TBaseLocalVendaCabecalhoVO;
         class procedure MarcarProdutosCozinha(pedido: integer);
         class Function RetornarIDPorNumeroPedido(id: integer; NFCe: Boolean = False): TBaseLocalVendaCabecalhoVO;
         class procedure BaixarEstoqueProduto(idProduto: integer; qtde: double);

   end;

implementation

uses untPrincipal;

{ TBaseLocalVendaCabecalhoController }

class procedure TBaseLocalVendaCabecalhoController.BaixarEstoqueProduto(idProduto: integer; qtde: double);
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('UPDATE produtos SET QTDE_ESTOQUE = QTDE_ESTOQUE - :qtde WHERE id = '+idProduto.ToString);
      query.Params.ParamByName('qtde').AsFloat := qtde;
      query.ExecSQL;
      frmPrincipal.ConexaoLocal.Commit;

   Finally

      FreeAndNil(query);

   End;

end;

class procedure TBaseLocalVendaCabecalhoController.GravarVenda(venda: TBaseLocalVendaCabecalhoVO);
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('   INSERT INTO venda_cabecalho ');
      query.SQL.Add('   (  ');
      query.SQL.Add('   ID, ID_CLIENTE, ID_VENDEDOR, DATA_HORA_VENDA, VALOR_VENDA, DESCONTO, NUMERO_PEDIDO, CHAVE_NFCE, NUMERO_NFCE, ');
      query.SQL.Add('   ACRESCIMO, VALOR_FINAL, STATUS, NOME_CLIENTE, CPF_CNPJ_CLIENTE, TROCO, ID_PEDIDO, ID_MOVIMENTO, exportado_financeiro  ');
      query.SQL.Add('   ) ');
      query.SQL.Add('   VALUES ');
      query.SQL.Add('   ( ');
      query.SQL.Add('   :ID, :ID_CLIENTE, :ID_VENDEDOR, :DATA_HORA_VENDA, :VALOR_VENDA, :DESCONTO, :NUMERO_PEDIDO, :CHAVE_NFCE, :NUMERO_NFCE, ');
      query.SQL.Add('   :ACRESCIMO, :VALOR_FINAL, :STATUS, :NOME_CLIENTE, :CPF_CNPJ_CLIENTE, :TROCO, :ID_PEDIDO, :ID_MOVIMENTO, ''N'' ');
      query.SQL.Add('   )  ');

      QUERY.Params.ParamByName('ID').AsInteger               := venda.ID;
      QUERY.Params.ParamByName('ID_CLIENTE').AsInteger       := venda.ID_CLIENTE;
      QUERY.Params.ParamByName('ID_VENDEDOR').AsInteger      := venda.ID_VENDEDOR;
      QUERY.Params.ParamByName('DATA_HORA_VENDA').AsDateTime := venda.DATA_HORA_VENDA;
      QUERY.Params.ParamByName('VALOR_VENDA').AsFloat        := venda.VALOR_VENDA;
      QUERY.Params.ParamByName('DESCONTO').AsFloat           := venda.DESCONTO;
      QUERY.Params.ParamByName('NUMERO_PEDIDO').AsInteger    := RetornarIdPedido;
      QUERY.Params.ParamByName('ACRESCIMO').AsFloat          := venda.ACRESCIMO;
      QUERY.Params.ParamByName('VALOR_FINAL').AsFloat        := venda.VALOR_FINAL;
      QUERY.Params.ParamByName('STATUS').AsString            := venda.STATUS;
      QUERY.Params.ParamByName('NOME_CLIENTE').AsString      := venda.NOME_CLIENTE;
      QUERY.Params.ParamByName('CPF_CNPJ_CLIENTE').AsString  := venda.CPF_CNPJ_CLIENTE;
      QUERY.Params.ParamByName('TROCO').AsFloat              := venda.TROCO;
      QUERY.Params.ParamByName('ID_PEDIDO').AsInteger        := venda.ID_PEDIDO;
      QUERY.Params.ParamByName('ID_MOVIMENTO').AsInteger     := frmPrincipal.idMovimento;
      QUERY.Params.ParamByName('NUMERO_NFCE').AsInteger      := venda.NUMERO_NFCE;
      QUERY.Params.ParamByName('CHAVE_NFCE').AsString        := venda.CHAVE_NFCE;

      query.ExecSQL;

      frmPrincipal.ConexaoLocal.Commit;

   Finally

      FreeAndNil(query);

   End;


end;

class procedure TBaseLocalVendaCabecalhoController.MarcarProdutosCozinha(pedido: integer);
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('UPDATE venda_detalhe SET impresso_cozinha = ''S'' WHERE id_venda_cabecalho = '+pedido.ToString);
      query.ExecSQL;
      frmPrincipal.ConexaoLocal.Commit;

   Finally

      FreeAndNil(query);

   End;

end;

class procedure TBaseLocalVendaCabecalhoController.MudarStatusVenda(pedido, status: String);
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' UPDATE venda_cabecalho SET status = '+QuotedStr(status));
      query.SQL.Add('  WHERE id = '+pedido);
      query.ExecSQL;
      frmPrincipal.ConexaoLocal.Commit;

   Finally

      //FreeAndNil(query);

   End;

end;

class function TBaseLocalVendaCabecalhoController.RetornarIdPedido: integer;
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('SELECT gen_id(gen_numero_pedido_id, 1) AS id from rdb$database;');
      query.Open;

      Result := query.FieldByName('id').AsInteger;

   Finally

      //FreeAndNil(query);

   End;

end;

class function TBaseLocalVendaCabecalhoController.RetornarIDPorNumeroPedido(id: integer; NFCe: Boolean = False): TBaseLocalVendaCabecalhoVO;
Var query: TFDQuery;
    venda: TBaseLocalVendaCabecalhoVO;
begin

   Try

      venda := TBaseLocalVendaCabecalhoVO.Create;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      if NFCe then
         query.SQL.Add(' SELECT Max(c.ID) as id, C.* FROM venda_cabecalho c WHERE c.numero_nfce = '+id.ToString)
      else
         query.SQL.Add(' SELECT Max(c.ID) as id, C.* FROM venda_cabecalho c WHERE c.numero_pedido = '+id.ToString);
      query.SQL.Add(' group by c.id,  ');
      query.SQL.Add('    c.id_cliente, ');
      query.SQL.Add('    c.id_vendedor,   ');
      query.SQL.Add('    c.data_hora_venda, ');
      query.SQL.Add('    c.valor_venda, ');
      query.SQL.Add('    c.desconto, ');
      query.SQL.Add('    c.acrescimo, ');
      query.SQL.Add('    c.valor_final, ');
      query.SQL.Add('    c.status, ');
      query.SQL.Add('    c.nome_cliente, ');
      query.SQL.Add('    c.cpf_cnpj_cliente,  ');
      query.SQL.Add('    c.troco, ');
      query.SQL.Add('    c.id_pedido, ');
      query.SQL.Add('    c.numero_pedido, ');
      query.SQL.Add('    c.CHAVE_NFCE, c.numero_nfce, C.ID_MOVIMENTO ');
      query.Open;

      if Not(query.IsEmpty) then Begin

         venda.ID               := query.FieldByName('ID').AsInteger;
         venda.ID_CLIENTE       := query.FieldByName('ID_CLIENTE').AsInteger;
         venda.ID_VENDEDOR      := query.FieldByName('ID_VENDEDOR').AsInteger;
         venda.DATA_HORA_VENDA  := query.FieldByName('DATA_HORA_VENDA').AsDateTime;
         venda.VALOR_VENDA      := query.FieldByName('VALOR_VENDA').AsFloat;
         venda.DESCONTO         := query.FieldByName('DESCONTO').AsFloat;
         venda.ACRESCIMO        := query.FieldByName('ACRESCIMO').AsFloat;
         venda.VALOR_FINAL      := query.FieldByName('VALOR_FINAL').AsFloat;
         venda.STATUS           := Trim(query.FieldByName('STATUS').AsString);
         venda.NOME_CLIENTE     := Trim(query.FieldByName('NOME_CLIENTE').AsString);
         venda.CPF_CNPJ_CLIENTE := Trim(query.FieldByName('CPF_CNPJ_CLIENTE').AsString);
         venda.TROCO            := query.FieldByName('TROCO').AsFloat;
         venda.ID_PEDIDO        := query.FieldByName('ID_PEDIDO').AsInteger;
         venda.NUMERO_PEDIDO    := query.FieldByName('NUMERO_PEDIDO').AsInteger;
         venda.CHAVE_NFCE       := Trim(query.FieldByName('CHAVE_NFCE').AsString);

      End;

      Result := venda;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalVendaCabecalhoController.RetornarIdVenda: integer;
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('SELECT gen_id(gen_venda_cabecalho_id, 1) AS id from rdb$database;');
      query.Open;

      Result := query.FieldByName('id').AsInteger;

   Finally

      //FreeAndNil(query);

   End;

end;

class function TBaseLocalVendaCabecalhoController.RetornarNumeroPedidoPorIDVenda(id: integer): integer;
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT Max(numero_pedido) as id from venda_cabecalho WHERE id = '+id.ToString);
      query.Open;

      Result := query.FieldByName('id').AsInteger;

   Finally

      //FreeAndNil(query);

   End;

end;

class function TBaseLocalVendaCabecalhoController.RetornarVendaPorID(id: integer): TBaseLocalVendaCabecalhoVO;
Var query: TFDQuery;
    venda: TBaseLocalVendaCabecalhoVO;
begin

   Try

      venda := TBaseLocalVendaCabecalhoVO.Create;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT * FROM venda_cabecalho WHERE ID = '+id.ToString);  //antigamento era ID
      query.Open;

      if Not(query.IsEmpty) then Begin

         venda.ID               := query.FieldByName('ID').AsInteger;
         venda.ID_CLIENTE       := query.FieldByName('ID_CLIENTE').AsInteger;
         venda.ID_VENDEDOR      := query.FieldByName('ID_VENDEDOR').AsInteger;
         venda.DATA_HORA_VENDA  := query.FieldByName('DATA_HORA_VENDA').AsDateTime;
         venda.VALOR_VENDA      := query.FieldByName('VALOR_VENDA').AsFloat;
         venda.DESCONTO         := query.FieldByName('DESCONTO').AsFloat;
         venda.ACRESCIMO        := query.FieldByName('ACRESCIMO').AsFloat;
         venda.VALOR_FINAL      := query.FieldByName('VALOR_FINAL').AsFloat;
         venda.STATUS           := Trim(query.FieldByName('STATUS').AsString);
         venda.NOME_CLIENTE     := Trim(query.FieldByName('NOME_CLIENTE').AsString);
         venda.CPF_CNPJ_CLIENTE := Trim(query.FieldByName('CPF_CNPJ_CLIENTE').AsString);
         venda.TROCO            := query.FieldByName('TROCO').AsFloat;
         venda.ID_PEDIDO        := query.FieldByName('ID_PEDIDO').AsInteger;
         venda.NUMERO_PEDIDO    := query.FieldByName('NUMERO_PEDIDO').AsInteger;

      End;

      Result := venda;

   Finally

      FreeAndNil(query);

   End;

end;

end.
