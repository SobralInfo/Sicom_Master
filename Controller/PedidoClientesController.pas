unit PedidoClientesController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, PedidoClientesVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

type TPedidoClientesController = class

   private

      public
         class Procedure GravarClientes(listaClientes: TObjectList<TPedidoClientesVO>);
         class Function RetornarListaDeClientes: TObjectList<TPedidoClientesVO>;
         class Procedure GravarClienteBaseLocal(listaClientes: TObjectList<TPedidoClientesVO>);
         class Function RetornarClientePorID(id: integer): TPedidoClientesVO;



end;

implementation

{ TPedidoClientesController }

class procedure TPedidoClientesController.GravarClienteBaseLocal(listaClientes: TObjectList<TPedidoClientesVO>);
Var query: TFDQuery;
  I: Integer;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      for I := 0 to listaClientes.Count - 1 do Begin

         query.Close;
         query.SQL.Clear;
         query.SQL.Add(' SELECT * FROM CLIENTES WHERE ID_ORIGINAL = '+listaClientes.Items[i].id_cliente.ToString);
         query.Open;

         if query.IsEmpty then Begin

            query.Close;
            query.SQL.Clear;
            query.SQL.Add('   INSERT INTO CLIENTES ');
            query.SQL.Add('   (  ');
            query.SQL.Add('   STATUS, CPF_CNPJ, NOME, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, CONTATO, ID_ORIGINAL ');
            query.SQL.Add('   )  ');
            query.SQL.Add('   VALUES   ');
            query.SQL.Add('   (  ');
            query.SQL.Add('   :STATUS, :CPF_CNPJ, :NOME, :LOGRADOURO, :NUMERO, :COMPLEMENTO, :BAIRRO, :CIDADE, :CONTATO, :ID_CLIENTE ');
            query.SQL.Add('   ) ');

         End else Begin

            query.Close;
            query.SQL.Clear;
            query.SQL.Add('   UPDATE CLIENTES SET STATUS = :STATUS, ');
            query.SQL.Add('                       CPF_CNPJ = :CPF_CNPJ, ');
            query.SQL.Add('                       NOME = :NOME, ');
            query.SQL.Add('                       LOGRADOURO = :LOGRADOURO, ');
            query.SQL.Add('                       NUMERO = :NUMERO, ');
            query.SQL.Add('                       COMPLEMENTO = :COMPLEMENTO, ');
            query.SQL.Add('                       BAIRRO = :BAIRRO, ');
            query.SQL.Add('                       CIDADE = :CIDADE, ');
            query.SQL.Add('                       CONTATO = :CONTATO, ');
            query.SQL.Add('    WHERE ID_ORIGINAL = :ID_CLIENTE ');

         End;

         query.Params.ParamByName('ID_CLIENTE').AsInteger := listaClientes.Items[i].id_cliente;
         query.Params.ParamByName('status').AsString      := Copy(listaClientes.Items[i].status,1,1);
         query.Params.ParamByName('CPF_CNPJ').AsString    := DesCriptografa(Trim(listaClientes.Items[i].cpf_cnpj),150);
         query.Params.ParamByName('NOME').AsString        := DesCriptografa(Trim(listaClientes.Items[i].nome),150);
         query.Params.ParamByName('LOGRADOURO').AsString  := DesCriptografa(Trim(listaClientes.Items[i].logradouro),150);
         query.Params.ParamByName('NUMERO').AsString      := DesCriptografa(Trim(listaClientes.Items[i].numero),150);
         query.Params.ParamByName('COMPLEMENTO').AsString := DesCriptografa(Trim(listaClientes.Items[i].complemento),150);
         query.Params.ParamByName('BAIRRO').AsString      := DesCriptografa(Trim(listaClientes.Items[i].bairro),150);
         query.Params.ParamByName('CIDADE').AsInteger     := listaClientes.Items[i].id_municipio;
         query.Params.ParamByName('CONTATO').AsString     := '';

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

class procedure TPedidoClientesController.GravarClientes(listaClientes: TObjectList<TPedidoClientesVO>);
Var vjsonObject: TJSONObject;
    vJsonArray: TJSONArray;
    i, contador: integer;
begin

   Try

      vJsonArray := TJSONArray.Create;

      contador := 0;

      for I := 0 to listaClientes.Count -1 do Begin
         vjsonObject := TJSONObject.Create;
         //vjsonObject := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(listaProdutos.Items[i].descricao), 0) as TJSONObject;

         vjsonObject.AddPair(TJSONPair.Create('id_empresa', TJSONString.Create(listaClientes.Items[i].id_empresa.ToString)));
         vjsonObject.AddPair(TJSONPair.Create('id_cliente', TJSONString.Create(listaClientes.Items[i].id_cliente.ToString)));
         vjsonObject.AddPair(TJSONPair.Create('nome', TJSONString.Create(listaClientes.Items[i].nome)));
         vjsonObject.AddPair(TJSONPair.Create('fantasia', TJSONString.Create(listaClientes.Items[i].fantasia)));
         vjsonObject.AddPair(TJSONPair.Create('cpf_cnpj', TJSONString.Create(listaClientes.Items[i].cpf_cnpj)));
         vjsonObject.AddPair(TJSONPair.Create('logradouro', TJSONString.Create(listaClientes.Items[i].logradouro)));
         vjsonObject.AddPair(TJSONPair.Create('numero', TJSONString.Create(listaClientes.Items[i].numero)));
         vjsonObject.AddPair(TJSONPair.Create('complemento', TJSONString.Create(listaClientes.Items[i].complemento)));
         vjsonObject.AddPair(TJSONPair.Create('bairro', TJSONString.Create(listaClientes.Items[i].bairro)));
         vjsonObject.AddPair(TJSONPair.Create('id_municipio', TJSONString.Create(listaClientes.Items[i].id_municipio.ToString)));
         vjsonObject.AddPair(TJSONPair.Create('celular', TJSONString.Create(listaClientes.Items[i].celular)));
         vjsonObject.AddPair(TJSONPair.Create('fone_fixo', TJSONString.Create(listaClientes.Items[i].fone_fixo)));
         vjsonObject.AddPair(TJSONPair.Create('status', TJSONString.Create(listaClientes.Items[i].status)));

         vJsonArray.Add(vjsonObject);

         inc(contador);

         if ((contador = 100) or (i = listaClientes.Count -1)) then Begin

            frmPrincipal.CarregarRest();

            frmPrincipal.RESTRequest1.Resource := '/PedidoClientes/{bd}';
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

class function TPedidoClientesController.RetornarClientePorID(id: integer): TPedidoClientesVO;
begin

end;

class function TPedidoClientesController.RetornarListaDeClientes: TObjectList<TPedidoClientesVO>;
Var vjsonObject: TJSONObject;
    i: integer;
    vJsonPair:TJSONPair;
    vJsonArray: TJSONArray;
    lista: TObjectList<TPedidoClientesVO>;
    produtos: TPedidoClientesVO;

begin

  Try

   frmPrincipal.CarregarRest();

   frmPrincipal.RESTRequest1.Resource := '/GetPedidoListarClientes/{schema}';
   frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmGET;
   frmPrincipal.RESTRequest1.Params.AddUrlSegment('schema',Trim(frmPrincipal.bd));
   frmPrincipal.RESTRequest1.Execute;

   vJsonArray := TJsonobject.ParseJSONValue(frmPrincipal.RESTResponse1.JSONText) as TJSONArray;
   lista := TObjectList<TPedidoClientesVO>.Create();

   for I := 0 to vJsonArray.Count - 1 do Begin

      produtos := TJson.JsonToObject<TPedidoClientesVO>(VJsonArray.Get(i).ToJSON);
      lista.Add(produtos);

   End;

   Result := lista;

  Except
  End;

end;

end.
