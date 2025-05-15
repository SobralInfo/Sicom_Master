unit PedidoFormaPagamentoController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, PedidoFormaPagamentoVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type TPedidoFormaPagamentoController =  class

   private
      public
      class Procedure GravarFormaDePagamento(listaFormaPG: TObjectList<TPedidoFormaPagamentoVO>);
      class Procedure GravarFormaDePagamentoBaseLocal(listaFormaPG: TObjectList<TPedidoFormaPagamentoVO>);
      class Function RetornarListaDeFormaPG: TObjectList<TPedidoFormaPagamentoVO>;

end;

implementation

{ TPedidoFormaPagamentoController }

class procedure TPedidoFormaPagamentoController.GravarFormaDePagamento(listaFormaPG: TObjectList<TPedidoFormaPagamentoVO>);
Var vjsonObject: TJSONObject;
    vJsonArray: TJSONArray;
    i: integer;
begin

      Try

         vJsonArray := TJSONArray.Create;

         for I := 0 to listaFormaPG.Count -1 do Begin
            vjsonObject := TJSONObject.Create;
            //vjsonObject := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(listaProdutos.Items[i].descricao), 0) as TJSONObject;
            vjsonObject.AddPair(TJSONPair.Create('id_empresa', TJSONString.Create(listaFormaPG.Items[i].id_empresa.ToString)));
            vjsonObject.AddPair(TJSONPair.Create('ID_FORMA_PAGAMENTO', TJSONString.Create(listaFormaPG.Items[i].ID_FORMA_PAGAMENTO.ToString)));
            vjsonObject.AddPair(TJSONPair.Create('DESCRICAO', TJSONString.Create(listaFormaPG.Items[i].DESCRICAO)));
            vjsonObject.AddPair(TJSONPair.Create('STATUS', TJSONString.Create(listaFormaPG.Items[i].STATUS)));
            vjsonObject.AddPair(TJSONPair.Create('PERMITE_TROCO', TJSONString.Create(listaFormaPG.Items[i].PERMITE_TROCO)));
            vJsonArray.Add(vjsonObject);
         End;

         frmPrincipal.CarregarRest();

         //prcMsgInf(listaClientes.Count.ToString);

         frmPrincipal.RESTRequest1.Resource := '/PedidoFormaDePagamento/{bd}';
         frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmPUT;
         frmPrincipal.RESTRequest1.Params.AddUrlSegment('bd',Trim(frmPrincipal.bd));
         frmPrincipal.RESTRequest1.AddBody(vJsonArray.ToString, ContentTypeFromString('application/json'));
         frmPrincipal.RESTRequest1.Execute;

         if frmPrincipal.RESTResponse1.StatusCode = 201 then Begin
            prcMsgInf('Registros atualizados com sucesso');
         End
         else
            prcMsgAdv('Falha ao atualizar os registros.');

      Except

         prcMsgErro('Erro ao atualizar os registros');

      End;



end;

class procedure TPedidoFormaPagamentoController.GravarFormaDePagamentoBaseLocal(listaFormaPG: TObjectList<TPedidoFormaPagamentoVO>);
Var query: TFDQuery;
  I: Integer;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      for I := 0 to listaFormaPG.Count - 1 do Begin

         query.Close;
         query.SQL.Clear;
         query.SQL.Add(' SELECT * FROM FORMAS_PAGAMENTO WHERE id_original = '+listaFormaPG.Items[i].ID_FORMA_PAGAMENTO.ToString);
         query.Open;

         if query.IsEmpty then Begin

            query.Close;
            query.SQL.Clear;
            query.SQL.Add('   INSERT INTO FORMAS_PAGAMENTO ');
            query.SQL.Add('   (  ');
            query.SQL.Add('   status, nome, permite_troco, id_original ');
            query.SQL.Add('   )  ');
            query.SQL.Add('   VALUES   ');
            query.SQL.Add('   (  ');
            query.SQL.Add('   :status, :nome, :permite_troco, :id_original ');
            query.SQL.Add('   ) ');

         End else Begin

            query.Close;
            query.SQL.Clear;
            query.SQL.Add('   UPDATE FORMAS_PAGAMENTO SET status = :status, ');
            query.SQL.Add('                               nome = :nome, ');
            query.SQL.Add('                               permite_troco = :permite_troco ');
            //query.SQL.Add('                               id_original = :id_original ');
            query.SQL.Add('    WHERE id_original = :id_original ');

         End;

         //query.Params.ParamByName('id').AsInteger                 := listaFormaPG.Items[i].id;
         query.Params.ParamByName('status').AsString              := Copy(listaFormaPG.Items[i].status,1,1);
         query.Params.ParamByName('nome').AsString                := Copy(Trim(listaFormaPG.Items[i].DESCRICAO),1,120);
         query.Params.ParamByName('permite_troco').AsString       := Copy(Trim(listaFormaPG.Items[i].PERMITE_TROCO),1,1);
         query.Params.ParamByName('id_original').AsInteger        := listaFormaPG.Items[i].ID_FORMA_PAGAMENTO;

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

class function TPedidoFormaPagamentoController.RetornarListaDeFormaPG: TObjectList<TPedidoFormaPagamentoVO>;
Var vjsonObject: TJSONObject;
    i: integer;
    vJsonPair:TJSONPair;
    vJsonArray: TJSONArray;
    lista: TObjectList<TPedidoFormaPagamentoVO>;
    formaPG: TPedidoFormaPagamentoVO;

begin

  Try

   frmPrincipal.CarregarRest();

   frmPrincipal.RESTRequest1.Resource := '/GetPedidoListarFormaDePagamento/{schema}';
   frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmGET;
   frmPrincipal.RESTRequest1.Params.AddUrlSegment('schema',Trim(frmPrincipal.bd));
   frmPrincipal.RESTRequest1.Execute;

   vJsonArray := TJsonobject.ParseJSONValue(frmPrincipal.RESTResponse1.JSONText) as TJSONArray;
   lista := TObjectList<TPedidoFormaPagamentoVO>.Create();

   for I := 0 to vJsonArray.Count - 1 do Begin

      formaPG := TJson.JsonToObject<TPedidoFormaPagamentoVO>(VJsonArray.Get(i).ToJSON);
      lista.Add(formaPG);

   End;

   Result := lista;

  Except
  End;

end;

end.
