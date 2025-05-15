unit BaseLocalPedidoDetalheController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, BaseLocalPedidoDetalheVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client, baselocalProdutosVo;

Type TBaseLocalPedidoDetalheController = class

   class Function RetornarListaDeItensPorIdPedido(id: integer): TObjectList<TBaseLocalPedidoDetalheVO>;
   class Procedure AlterarPedidoDetalhe(pedidoDetalhe: TBaseLocalPedidoDetalheVO);
   class Procedure GravarPedidoDetalhe(pedidoDetalhe: TBaseLocalPedidoDetalheVO);
   class Procedure ExcluirItemPedidoDetalhe(id: integer);

end;

implementation

{ TBaseLocalPedidoDetalheController }

class procedure TBaseLocalPedidoDetalheController.AlterarPedidoDetalhe(pedidoDetalhe: TBaseLocalPedidoDetalheVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' UPDATE pedido_detalhe SET id_pedido = :id_pedido, ');
      query.SQL.Add('                           id_produto = :id_produto, ');
      query.SQL.Add('                           quantidade = :quantidade, ');
      query.SQL.Add('                           valor_unitario = :valor_unitario, ');
      query.SQL.Add('                           observacao = :observacao, ');
      query.SQL.Add('                           sequencia = :sequencia ');
      query.SQL.Add('  WHERE id = :id ');

      query.Params.ParamByName('id').AsInteger           := pedidoDetalhe.id;
      query.Params.ParamByName('id_pedido').AsInteger    := pedidoDetalhe.id_pedido;
      query.Params.ParamByName('id_produto').AsInteger   := pedidoDetalhe.id_produto;
      query.Params.ParamByName('quantidade').AsFloat     := pedidoDetalhe.quantidade;
      query.Params.ParamByName('valor_unitario').AsFloat := pedidoDetalhe.valor_unitario;
      query.Params.ParamByName('observacao').AsString    := TRim(pedidoDetalhe.observacao);
      query.Params.ParamByName('sequencia').AsInteger    := pedidoDetalhe.sequencia;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         prcMsgInf('Registro alterado com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         prcMsgErro('Não foi possível alterar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class procedure TBaseLocalPedidoDetalheController.ExcluirItemPedidoDetalhe(id: integer);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' DELETE FROM pedido_detalhe WHERE id = '+id.ToString);

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

class procedure TBaseLocalPedidoDetalheController.GravarPedidoDetalhe(pedidoDetalhe: TBaseLocalPedidoDetalheVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' INSERT INTO pedido_detalhe ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' id_pedido, id_produto, quantidade, valor_unitario, observacao, descricao, unidade, fator_unidade, desconto_item, valor_total, sequencia ');
      query.SQL.Add(' ) ');
      query.SQL.Add(' VALUES ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' :id_pedido, :id_produto, :quantidade, :valor_unitario, :observacao, :descricao, :unidade, :fator_unidade, :desconto_item, :valor_total, :sequencia ');
      query.SQL.Add(' ) ');

      query.Params.ParamByName('id_pedido').AsInteger    := pedidoDetalhe.id_pedido;
      query.Params.ParamByName('id_produto').AsInteger   := pedidoDetalhe.id_produto;
      query.Params.ParamByName('quantidade').AsFloat     := pedidoDetalhe.quantidade;
      query.Params.ParamByName('valor_unitario').AsFloat := pedidoDetalhe.valor_unitario;
      query.Params.ParamByName('observacao').AsString    := TRim(pedidoDetalhe.observacao);
      query.Params.ParamByName('descricao').AsString     := TRim(pedidoDetalhe.descricao);
      query.Params.ParamByName('unidade').AsString       := TRim(pedidoDetalhe.unidade);
      query.Params.ParamByName('fator_unidade').AsFloat  := pedidoDetalhe.fator_unidade;
      query.Params.ParamByName('desconto_item').AsFloat  := pedidoDetalhe.desconto_item;
      query.Params.ParamByName('valor_total').AsFloat    := pedidoDetalhe.valor_total;
      query.Params.ParamByName('sequencia').AsInteger    := pedidoDetalhe.sequencia;

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

class function TBaseLocalPedidoDetalheController.RetornarListaDeItensPorIdPedido(id: integer): TObjectList<TBaseLocalPedidoDetalheVO>;
Var query: TFDQuery;
    lista: TObjectList<TBaseLocalPedidoDetalheVO>;
    pedido: TBaseLocalPedidoDetalheVO;
begin

   Try

      lista := TObjectList<TBaseLocalPedidoDetalheVO>.Create;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('    SELECT d.*, ');
      query.SQL.Add('           p.descricao AS nomeProduto ');
      query.SQL.Add('      FROM pedido_detalhe d,  ');
      query.SQL.Add('           produtos p ');
      query.SQL.Add('     WHERE d.id_produto = p.id ');
      query.SQL.Add('       AND d.id_pedido = '+id.ToString);
      query.Open;

      while Not(query.Eof) do Begin

         pedido := TBaseLocalPedidoDetalheVO.Create;

         pedido.id                            := query.FieldByName('id').AsInteger;
         pedido.id_pedido                     := query.FieldByName('id_pedido').AsInteger;
         pedido.id_produto                    := query.FieldByName('id_produto').AsInteger;
         pedido.quantidade                    := query.FieldByName('quantidade').AsFloat;
         pedido.valor_unitario                := query.FieldByName('valor_unitario').AsFloat;
         pedido.valor_total                   := query.FieldByName('valor_total').AsFloat;
         pedido.observacao                    := Trim(query.FieldByName('observacao').AsString);

         pedido.BaseLocalProdutosVO := tbaselocalProdutosVo.Create;
         pedido.BaseLocalProdutosVO.descricao := Trim(query.FieldByName('nomeProduto').AsString);

         lista.Add(pedido);

         query.Next;

      End;

      Result := lista

   Finally

      FreeAndNil(query);
      FreeAndNil(pedido);

   End;

end;

end.
