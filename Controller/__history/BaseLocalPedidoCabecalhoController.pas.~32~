unit BaseLocalPedidoCabecalhoController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types, baseLocalClientesVO,
     untPrincipal, unitConfiguracoes, BaseLocalPedidoCabecalhoVO, baseLocalFuncionariosVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type TBaseLocalPedidoCabecalhoController = class

   class Function RetornarPedidoPorID(id: integer): TBaseLocalPedidoCabecalhoVO;
   class Function RetornarListaDePedidoPorStatus(status: String): TObjectList<TBaseLocalPedidoCabecalhoVO>;
   class Procedure AlterarPedido(pedido: TBaseLocalPedidoCabecalhoVO);
   class Procedure AlterarTotaisPedido(pedido: TBaseLocalPedidoCabecalhoVO);
   class Procedure GravarPedido(pedido: TBaseLocalPedidoCabecalhoVO);
   class procedure MudarStatusPedido(pedido, status : String);
   class procedure MarcarProdutosCozinha(pedido: integer);
   class Function retornarGenerator: integer;

end;

implementation

{ TBaseLocalPedidoCabecalhoController }

class procedure TBaseLocalPedidoCabecalhoController.AlterarPedido(pedido: TBaseLocalPedidoCabecalhoVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' UPDATE pedido_cabecalho SET status = :status, ');
      query.SQL.Add('                             id_cliente = :id_cliente, ');
      query.SQL.Add('                             id_funcionario = :id_funcionario, ');
      query.SQL.Add('                             data_conclusao = :data_conclusao, ');
      query.SQL.Add('                             observacao = :observacao, ');
      query.SQL.Add('                             valor_total = :valor_total, ');
      query.SQL.Add('                             valor_desconto = :valor_desconto, ');
      query.SQL.Add('                             valor_liquido = :valor_liquido, ');
      query.SQL.Add('                             taxa_entrega = :taxa_entrega, ');
      query.SQL.Add('                             contato = :contato ');
      query.SQL.Add('  WHERE id = :id ');

      query.Params.ParamByName('id').AsInteger              := pedido.id;
      query.Params.ParamByName('status').AsString           := Trim(pedido.status);
      query.Params.ParamByName('id_cliente').AsInteger      := pedido.id_cliente;
      query.Params.ParamByName('id_funcionario').AsInteger  := pedido.id_funcionario;
      query.Params.ParamByName('data_conclusao').AsDateTime := pedido.data_conclusao;
      query.Params.ParamByName('observacao').AsString       := TRim(pedido.observacao);
      query.Params.ParamByName('VALOR_TOTAL').AsFloat       := pedido.valor_total;
      query.Params.ParamByName('VALOR_DESCONTO').AsFloat    := pedido.valor_desconto;
      query.Params.ParamByName('VALOR_LIQUIDO').AsFloat     := pedido.valor_liquido;
      query.Params.ParamByName('taxa_entrega').AsFloat      := pedido.taxa_entrega;
      query.Params.ParamByName('contato').AsString          := Trim(pedido.contato);


      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         //prcMsgInf('Registro alterado com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         //prcMsgErro('Não foi possível alterar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class procedure TBaseLocalPedidoCabecalhoController.AlterarTotaisPedido(pedido: TBaseLocalPedidoCabecalhoVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' UPDATE pedido_cabecalho SET VALOR_TOTAL = :VALOR_TOTAL, ');
      query.SQL.Add('                             VALOR_DESCONTO = :VALOR_DESCONTO, ');
      query.SQL.Add('                             VALOR_LIQUIDO = :VALOR_LIQUIDO, ');
      query.SQL.Add('  WHERE id = :id ');

      query.Params.ParamByName('id').AsInteger             := pedido.id;
      query.Params.ParamByName('VALOR_TOTAL').AsFloat      := pedido.valor_total;
      query.Params.ParamByName('VALOR_DESCONTO').AsFloat   := pedido.valor_desconto;
      query.Params.ParamByName('VALOR_LIQUIDO').AsFloat    := pedido.valor_liquido;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
      Except
         frmPrincipal.ConexaoLocal.Rollback;
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class procedure TBaseLocalPedidoCabecalhoController.GravarPedido(pedido: TBaseLocalPedidoCabecalhoVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' INSERT INTO pedido_cabecalho ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' id, status, id_cliente, id_funcionario, data_abertura, observacao, taxa_entrega, VALOR_TOTAL, VALOR_DESCONTO, VALOR_LIQUIDO, contato ');
      query.SQL.Add(' ) ');
      query.SQL.Add(' VALUES ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' :id, :status, :id_cliente, :id_funcionario, :data_abertura, :observacao, :taxa_entrega, :VALOR_TOTAL, :VALOR_DESCONTO, :VALOR_LIQUIDO, :contato ');
      query.SQL.Add(' ) ');

      query.Params.ParamByName('id').AsInteger             := pedido.id;
      query.Params.ParamByName('status').AsString          := Trim(pedido.status);
      query.Params.ParamByName('id_cliente').AsInteger     := pedido.id_cliente;
      query.Params.ParamByName('id_funcionario').AsInteger := pedido.id_funcionario;
      query.Params.ParamByName('data_abertura').AsDateTime := pedido.data_abertura;
      query.Params.ParamByName('observacao').AsString      := TRim(pedido.observacao);
      query.Params.ParamByName('taxa_entrega').AsFloat     := pedido.taxa_entrega;
      query.Params.ParamByName('VALOR_TOTAL').AsFloat      := pedido.valor_total;
      query.Params.ParamByName('VALOR_DESCONTO').AsFloat   := pedido.valor_desconto;
      query.Params.ParamByName('VALOR_LIQUIDO').AsFloat    := pedido.valor_liquido;
      query.Params.ParamByName('contato').AsString         := pedido.contato;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         //prcMsgInf('Registro inserido com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         //prcMsgErro('Não foi possível gravar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class procedure TBaseLocalPedidoCabecalhoController.MarcarProdutosCozinha(pedido: integer);
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('UPDATE pedido_detalhe SET impresso_cozinha = ''S'' WHERE id_pedido = '+pedido.ToString);
      query.ExecSQL;
      frmPrincipal.ConexaoLocal.Commit;

   Finally

      FreeAndNil(query);

   End;

end;

class procedure TBaseLocalPedidoCabecalhoController.MudarStatusPedido(pedido, status: String);
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' UPDATE pedido_cabecalho SET status = '+QuotedStr(status));
      query.SQL.Add('        ,data_conclusao = :dt ');
      query.SQL.Add('  WHERE id = '+pedido);
      query.Params.ParamByName('dt').AsDateTime := now;
      query.ExecSQL;
      frmPrincipal.ConexaoLocal.Commit;

   Finally

      //FreeAndNil(query);

   End;

end;

class function TBaseLocalPedidoCabecalhoController.retornarGenerator: integer;
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('SELECT gen_id(GEN_PEDIDO_CABECALHO_ID, 1) AS id from rdb$database;');
      query.Open;

      Result := query.FieldByName('id').AsInteger;

   Finally

      //FreeAndNil(query);

   End;

end;

class function TBaseLocalPedidoCabecalhoController.RetornarListaDePedidoPorStatus(status: String): TObjectList<TBaseLocalPedidoCabecalhoVO>;
Var query: TFDQuery;
    lista: TObjectList<TBaseLocalPedidoCabecalhoVO>;
    pedido: TBaseLocalPedidoCabecalhoVO;
begin

   Try

      lista := TObjectList<TBaseLocalPedidoCabecalhoVO>.Create;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('    SELECT p.*, ');
      query.SQL.Add('           c.nome AS nomeCliente, ');
      query.SQL.Add('           f.nome AS nomeFuncionario ');
      query.SQL.Add('      FROM pedido_cabecalho p ');
      query.SQL.Add('           LEFT JOIN clientes c ON p.id_cliente = c.id ');
      query.SQL.Add('           LEFT JOIN funcionarios f ON p.id_funcionario = f.id ');
      query.SQL.Add('     WHERE status = '+QuotedStr(status));
      query.SQL.Add('  ORDER BY data_abertura DESC ');
      query.Open;

      while Not(query.Eof) do Begin

         pedido := TBaseLocalPedidoCabecalhoVO.Create;

         pedido.id                           := query.FieldByName('id').AsInteger;
         pedido.status                       := Trim(query.FieldByName('status').AsString);
         pedido.id_cliente                   := query.FieldByName('id_cliente').AsInteger;
         pedido.id_funcionario               := query.FieldByName('id_funcionario').AsInteger;
         pedido.data_abertura                := query.FieldByName('data_abertura').AsDateTime;
         pedido.data_conclusao               := query.FieldByName('data_conclusao').AsDateTime;
         pedido.observacao                   := Trim(query.FieldByName('observacao').AsString);
         pedido.baseLocalClientesVO.nome     := Trim(query.FieldByName('nomeCliente').AsString);
         pedido.baseLocalFuncionariosVO.nome := Trim(query.FieldByName('nomeFuncionario').AsString);

         lista.Add(pedido);

         query.Next;

      End;

      Result := lista

   Finally

      FreeAndNil(query);
      FreeAndNil(pedido);

   End;

end;

class function TBaseLocalPedidoCabecalhoController.RetornarPedidoPorID(id: integer): TBaseLocalPedidoCabecalhoVO;
Var query: TFDQuery;
    pedido: TBaseLocalPedidoCabecalhoVO;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('    SELECT p.*, ');
      query.SQL.Add('           c.nome AS nomeCliente, ');
      query.SQL.Add('           f.nome AS nomeFuncionario ');
      query.SQL.Add('      FROM pedido_cabecalho p ');
      query.SQL.Add('           LEFT JOIN clientes c ON p.id_cliente = c.id ');
      query.SQL.Add('           LEFT JOIN funcionarios f ON p.id_funcionario = f.id ');
      query.SQL.Add('     WHERE p.id = '+id.ToString);
      query.SQL.Add('  ORDER BY data_abertura DESC ');
      query.Open;

      pedido := TBaseLocalPedidoCabecalhoVO.Create;

      if Not(query.IsEmpty) then Begin

         pedido.id                           := query.FieldByName('id').AsInteger;
         pedido.status                       := Trim(query.FieldByName('status').AsString);
         pedido.id_cliente                   := query.FieldByName('id_cliente').AsInteger;
         pedido.id_funcionario               := query.FieldByName('id_funcionario').AsInteger;
         pedido.data_abertura                := query.FieldByName('data_abertura').AsDateTime;
         pedido.data_conclusao               := query.FieldByName('data_conclusao').AsDateTime;
         pedido.observacao                   := Trim(query.FieldByName('observacao').AsString);
         pedido.taxa_entrega                 := query.FieldByName('taxa_entrega').AsFloat;
         pedido.VALOR_DESCONTO               := query.FieldByName('valor_desconto').AsFloat;

         Try
            pedido.baseLocalClientesVO          := TBaseLocalClientesVO.Create;
            pedido.baseLocalClientesVO.nome     := Trim(query.FieldByName('nomeCliente').AsString);
            pedido.baseLocalFuncionariosVO      := TbaseLocalFuncionariosVO.Create;
            pedido.baseLocalFuncionariosVO.nome := Trim(query.FieldByName('nomeFuncionario').AsString);
         Except
         End;

      End;

      Result := pedido

   Finally

      FreeAndNil(query);
      //FreeAndNil(pedido);

   End;

end;

end.
