unit PedidoProdutosController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, PedidoProdutosVO, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

Type TPedidoProdutosController = class

   public
      class Function RetornarListaDeProdutos: TObjectList<TPedidoProdutosVO>;
      class Procedure GravarProduto(listaProdutos: TObjectList<TPedidoProdutosVO>);
      class Procedure GravarProdutoBaseLocal(listaProdutos: TObjectList<TPedidoProdutosVO>);
      class Function PesquisarProduto(codigo: String): TPedidoProdutosVO;
      class Function RetornarProdutoPorID(id: integer): TPedidoProdutosVO;

end;

implementation

{ TPedidoProdutosController }

class procedure TPedidoProdutosController.GravarProduto(listaProdutos: TObjectList<TPedidoProdutosVO>);
Var vjsonObject: TJSONObject;
    vJsonArray: TJSONArray;
    clienteVO: TPedidoProdutosVO;
    i, contador: integer;
begin

   Try

      vJsonArray := TJSONArray.Create;

      contador := 0;

      for I := 0 to listaProdutos.Count -1 do Begin
         vjsonObject := TJSONObject.Create;
         //vjsonObject := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(listaProdutos.Items[i].descricao), 0) as TJSONObject;
         vjsonObject.AddPair(TJSONPair.Create('descricao', TJSONString.Create(listaProdutos.Items[i].descricao)));
         vjsonObject.AddPair(TJSONPair.Create('fator_unidade', TJSONString.Create(listaProdutos.Items[i].fator_unidade.ToString)));
         vjsonObject.AddPair(TJSONPair.Create('id_empresa', TJSONString.Create(listaProdutos.Items[i].id_empresa.ToString)));
         vjsonObject.AddPair(TJSONPair.Create('id_produto', TJSONString.Create(listaProdutos.Items[i].id_produto)));
         vjsonObject.AddPair(TJSONPair.Create('status', TJSONString.Create(listaProdutos.Items[i].status)));
         vjsonObject.AddPair(TJSONPair.Create('unidade', TJSONString.Create(listaProdutos.Items[i].unidade)));
         vjsonObject.AddPair(TJSONPair.Create('valor_unitario', TJSONString.Create(listaProdutos.Items[i].valor_unitario.ToString)));
         vjsonObject.AddPair(TJSONPair.Create('gtin', TJSONString.Create(listaProdutos.Items[i].gtin)));
         vjsonObject.AddPair(TJSONPair.Create('qtde_estoque', TJSONString.Create(listaProdutos.Items[i].qtde_estoque.ToString)));
         vJsonArray.Add(vjsonObject);

         inc(contador);

         if ((contador = 100) or (i = listaProdutos.Count -1)) then Begin

            frmPrincipal.CarregarRest();

            frmPrincipal.RESTRequest1.Resource := '/PedidoProdutos/{bd}';
            frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmPUT;
            frmPrincipal.RESTRequest1.Params.AddUrlSegment('bd',Trim(frmPrincipal.bd));
            frmPrincipal.RESTRequest1.AddBody(vJsonArray.ToString, ContentTypeFromString('application/json'));
            frmPrincipal.RESTRequest1.Execute;

            contador := 0;
            vJsonArray.Destroy;
            vJsonArray := TJSONArray.Create;

            frmPrincipal.RESTClient1.Disconnect;

         End;

      End;

      if frmPrincipal.RESTResponse1.StatusCode = 201 then Begin
         prcMsgInf('Registros atualizados com sucesso');
      End
      else
         prcMsgAdv('Falha ao atualizar os registros.');

   Except

      prcMsgErro('Erro ao atualizar os registros');

   End;



end;

class procedure TPedidoProdutosController.GravarProdutoBaseLocal(listaProdutos: TObjectList<TPedidoProdutosVO>);
Var query: TFDQuery;
  I: Integer;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      for I := 0 to listaProdutos.Count - 1 do Begin

         query.Close;
         query.SQL.Clear;
         query.SQL.Add(' SELECT * FROM produtos WHERE id_original = '+listaProdutos.Items[i].id_produto);
         query.Open;

         if query.IsEmpty then Begin

            query.Close;
            query.SQL.Clear;
            query.SQL.Add('   INSERT INTO produtos ');
            query.SQL.Add('   (  ');
            query.SQL.Add('   status, descricao, qtde_estoque, referencia, id_unidade, codigo_barras, valor_unitario, id_original ');
            query.SQL.Add('   )  ');
            query.SQL.Add('   VALUES   ');
            query.SQL.Add('   (  ');
            query.SQL.Add('   :status, :descricao, :qtde_estoque, :referencia, :id_unidade, :codigo_barras, :valor_unitario, :id_original ');
            query.SQL.Add('   ) ');

         End else Begin

            query.Close;
            query.SQL.Clear;
            query.SQL.Add('   UPDATE produtos SET status = :status, ');
            query.SQL.Add('                       descricao = :descricao, ');
            query.SQL.Add('                       qtde_estoque = :qtde_estoque, ');
            query.SQL.Add('                       referencia = :referencia, ');
            query.SQL.Add('                       id_unidade = :id_unidade, ');
            query.SQL.Add('                       codigo_barras = :codigo_barras, ');
            query.SQL.Add('                       valor_unitario = :valor_unitario, ');
            //query.SQL.Add('                       id_original = :id_original ');
            query.SQL.Add('    WHERE id_original = :id_original ');

         End;

         //query.Params.ParamByName('id').AsInteger            := listaProdutos.Items[i].id;
         query.Params.ParamByName('status').AsString         := Copy(listaProdutos.Items[i].status,1,1);
         query.Params.ParamByName('descricao').AsString      := DesCriptografa(Copy(Trim(listaProdutos.Items[i].descricao),1,120),150);
         query.Params.ParamByName('qtde_estoque').AsFloat    := listaProdutos.Items[i].qtde_estoque;
         query.Params.ParamByName('referencia').AsString     := '';
         query.Params.ParamByName('id_unidade').AsInteger    := 1;
         query.Params.ParamByName('codigo_barras').AsString  := Copy(Trim(listaProdutos.Items[i].gtin),1,15);
         query.Params.ParamByName('id_original').AsString    := Copy(Trim(listaProdutos.Items[i].id_produto),1,80);
         query.Params.ParamByName('valor_unitario').AsFloat  := listaProdutos.Items[i].valor_unitario;

         Try
            query.ExecSQL;
            frmPrincipal.ConexaoLocal.Commit;
         Except

            frmPrincipal.ConexaoLocal.Rollback;
         End;


      End;

   Finally

      FreeAndNil(query);

   End;

end;

class function TPedidoProdutosController.PesquisarProduto(codigo: String): TPedidoProdutosVO;
Var produto: TPedidoProdutosVO;
    query: TFDQuery;
begin

   Try

      produto := TPedidoProdutosVO.Create;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Clear;
      query.SQL.Add(' SELECT * FROM produtos WHERE status = ''A'' AND id_original = :id_original ');
      query.Params.ParamByName('id_original').AsString := Trim(codigo);
      query.Open;

      if query.IsEmpty then Begin

         query.Close;
         query.SQL.Clear;
         query.SQL.Add(' SELECT * FROM produtos WHERE status = ''A'' AND codigo_barras = :codigo_barras ');
         query.Params.ParamByName('codigo_barras').AsString := Trim(codigo);
         query.Open;

      End;

      if query.IsEmpty then Begin

         query.Close;
         query.SQL.Clear;
         query.SQL.Add(' SELECT * FROM produtos WHERE status = ''A'' AND referencia = :referencia ');
         query.Params.ParamByName('referencia').AsString := Trim(codigo);
         query.Open;

      End;

      if Not(query.IsEmpty) then Begin

         produto.id             := query.FieldByName('id').AsInteger;
         produto.id_produto     := query.FieldByName('id_original').AsString;
         produto.status         := query.FieldByName('status').AsString;
         produto.descricao      := query.FieldByName('descricao').AsString;
         produto.unidade        := 'UND';
         produto.valor_unitario := query.FieldByName('valor_unitario').AsFloat;
         produto.qtde_estoque   := query.FieldByName('qtde_estoque').AsFloat;
         produto.fator_unidade  := 1;
         produto.gtin           := query.FieldByName('codigo_barras').AsString;

      End;

      Result := produto;

   Finally

      FreeAndNil(query);

   End;

end;

class function TPedidoProdutosController.RetornarListaDeProdutos: TObjectList<TPedidoProdutosVO>;
Var vjsonObject: TJSONObject;
    i: integer;
    vJsonPair:TJSONPair;
    vJsonArray: TJSONArray;
    lista: TObjectList<TPedidoProdutosVO>;
    produtos: TPedidoProdutosVO;

begin

  Try

   frmPrincipal.CarregarRest();

   frmPrincipal.RESTRequest1.Resource := '/GetPedidoListarProdutos/{schema}';
   frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmGET;
   frmPrincipal.RESTRequest1.Params.AddUrlSegment('schema',Trim(frmPrincipal.bd));
   frmPrincipal.RESTRequest1.Execute;

   vJsonArray := TJsonobject.ParseJSONValue(frmPrincipal.RESTResponse1.JSONText) as TJSONArray;
   lista := TObjectList<TPedidoProdutosVO>.Create();

   for I := 0 to vJsonArray.Count - 1 do Begin

      produtos := TJson.JsonToObject<TPedidoProdutosVO>(VJsonArray.Get(i).ToJSON);
      lista.Add(produtos);

   End;

   Result := lista;

  Except
  End;

end;


class function TPedidoProdutosController.RetornarProdutoPorID(id: integer): TPedidoProdutosVO;
Var produto: TPedidoProdutosVO;
    query: TFDQuery;
begin

   Try

      produto := TPedidoProdutosVO.Create;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Clear;
      query.SQL.Add(' SELECT * FROM produtos WHERE id = :id ');
      query.Params.ParamByName('id').AsInteger := id;
      query.Open;

      if Not(query.IsEmpty) then Begin

         produto.id             := query.FieldByName('id').AsInteger;
         produto.id_produto     := query.FieldByName('id_original').AsString;
         produto.status         := query.FieldByName('status').AsString;
         produto.descricao      := query.FieldByName('descricao').AsString;
         produto.unidade        := 'UND';
         produto.valor_unitario := query.FieldByName('valor_unitario').AsFloat;
         produto.qtde_estoque   := query.FieldByName('qtde_estoque').AsFloat;
         produto.fator_unidade  := 1;
         produto.gtin           := query.FieldByName('codigo_barras').AsString;

      End;

      Result := produto;

   Finally

      FreeAndNil(query);

   End;

end;

end.
