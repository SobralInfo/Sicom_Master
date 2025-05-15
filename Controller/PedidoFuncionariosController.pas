unit PedidoFuncionariosController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, PedidoFuncionariosVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;



Type
   TPedidoFuncionariosController = class

      private

      public
         class Procedure GravarFuncionarios(listaFuncionarios: TObjectList<TPedidoFuncionariosVO>);
         class Function RetornarListaDeFuncionarios: TObjectList<TPedidoFuncionariosVO>;
         class Procedure GravarFuncionarioBaseLocal(listaFuncionarios: TObjectList<TPedidoFuncionariosVO>);

   end;

implementation

{ TPedidoUsuarioController }

class procedure TPedidoFuncionariosController.GravarFuncionarioBaseLocal(listaFuncionarios: TObjectList<TPedidoFuncionariosVO>);
Var query: TFDQuery;
  I: Integer;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      for I := 0 to listaFuncionarios.Count - 1 do Begin

         query.Close;
         query.SQL.Clear;
         query.SQL.Add(' SELECT * FROM funcionarios WHERE id_original = '+listaFuncionarios.Items[i].id_funcionario.ToString);
         query.Open;

         if query.IsEmpty then Begin

            query.Close;
            query.SQL.Clear;
            query.SQL.Add('   INSERT INTO funcionarios ');
            query.SQL.Add('   (  ');
            query.SQL.Add('   status, codigo, nome, percentual_comissao, id_original ');
            query.SQL.Add('   )  ');
            query.SQL.Add('   VALUES   ');
            query.SQL.Add('   (  ');
            query.SQL.Add('   :status, :codigo, :nome, :percentual_comissao, :id_original ');
            query.SQL.Add('   ) ');

         End else Begin

            query.Close;
            query.SQL.Clear;
            query.SQL.Add('   UPDATE funcionarios SET status = :status, ');
            query.SQL.Add('                           codigo = :codigo, ');
            query.SQL.Add('                           nome = :nome, ');
            query.SQL.Add('                           percentual_comissao = :percentual_comissao, ');
            query.SQL.Add('                           id_original = :id_original ');
            query.SQL.Add('    WHERE id_original = :id ');

            query.Params.ParamByName('id').AsInteger  := listaFuncionarios.Items[i].id_funcionario;

         End;

         query.Params.ParamByName('status').AsString              := Copy(listaFuncionarios.Items[i].status,1,1);
         query.Params.ParamByName('codigo').AsString              := Copy(Trim(listaFuncionarios.Items[i].nome),1,30);
         query.Params.ParamByName('nome').AsString                := Copy(Trim(listaFuncionarios.Items[i].nome),1,120);
         query.Params.ParamByName('percentual_comissao').AsFloat  := listaFuncionarios.Items[i].percentual_comissao;
         query.Params.ParamByName('id_original').AsInteger        := listaFuncionarios.Items[i].id_funcionario;

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

class procedure TPedidoFuncionariosController.GravarFuncionarios(listaFuncionarios: TObjectList<TPedidoFuncionariosVO>);
Var vjsonObject: TJSONObject;
    vJsonArray: TJSONArray;
    FuncionarioVO: TPedidoFuncionariosVO;
    i: integer;
begin

      Try

         vJsonArray := TJSONArray.Create;

         for I := 0 to listaFuncionarios.Count -1 do Begin
            vjsonObject := TJSONObject.Create;
            //vjsonObject := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(listaProdutos.Items[i].descricao), 0) as TJSONObject;
            vjsonObject.AddPair(TJSONPair.Create('id_empresa', TJSONString.Create(listaFuncionarios.Items[i].id_empresa.ToString)));
            vjsonObject.AddPair(TJSONPair.Create('id_funcionario', TJSONString.Create(listaFuncionarios.Items[i].id_funcionario.tostring)));
            vjsonObject.AddPair(TJSONPair.Create('nome', TJSONString.Create(listaFuncionarios.Items[i].nome)));
            vjsonObject.AddPair(TJSONPair.Create('status', TJSONString.Create(listaFuncionarios.Items[i].status)));
            vJsonArray.Add(vjsonObject);
         End;

         frmPrincipal.CarregarRest();

         //prcMsgInf(vJsonArray.ToString);

         frmPrincipal.RESTRequest1.Resource := '/PedidoFuncionarios/{bd}';
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

class function TPedidoFuncionariosController.RetornarListaDeFuncionarios: TObjectList<TPedidoFuncionariosVO>;
Var vjsonObject: TJSONObject;
    i: integer;
    vJsonPair:TJSONPair;
    vJsonArray: TJSONArray;
    lista: TObjectList<TPedidoFuncionariosVO>;
    funcionarios: TPedidoFuncionariosVO;

begin

  Try

   frmPrincipal.CarregarRest();

   frmPrincipal.RESTRequest1.Resource := '/GetPedidoListarFuncionarios/{schema}';
   frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmGET;
   frmPrincipal.RESTRequest1.Params.AddUrlSegment('schema',Trim(frmPrincipal.bd));
   frmPrincipal.RESTRequest1.Execute;

   vJsonArray := TJsonobject.ParseJSONValue(frmPrincipal.RESTResponse1.JSONText) as TJSONArray;
   lista := TObjectList<TPedidoFuncionariosVO>.Create();

   for I := 0 to vJsonArray.Count - 1 do Begin

      funcionarios := TJson.JsonToObject<TPedidoFuncionariosVO>(VJsonArray.Get(i).ToJSON);
      lista.Add(funcionarios);

   End;

   Result := lista;

  Except
  End;

end;

end.
