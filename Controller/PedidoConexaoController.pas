unit PedidoConexaoController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, PedidoConexaoVO;

Type TPedidoConexaoController = class

   public
      class function GravarPedidoConexao(conexao: TPedidoConexaoVO):TPedidoConexaoVO;
      class function AlterarPedidoConexao(conexao: TPedidoConexaoVO):TPedidoConexaoVO;
      class function RetornarConexao: TPedidoConexaoVO;

end;

implementation

{ TPedidoConexaoController }

class function TPedidoConexaoController.AlterarPedidoConexao(conexao: TPedidoConexaoVO): TPedidoConexaoVO;
Var vjsonObject: TJSONObject;
    vJsonArray: TJSONArray;
    conexaoVO: TPedidoConexaoVO;
begin

      Try

         vjsonObject := TJson.ObjectToJsonObject(conexao);
         frmPrincipal.CarregarRest();

         frmPrincipal.CarregarRest();

         //prcMsgInf(listaClientes.Count.ToString);

         frmPrincipal.RESTRequest1.Resource := '/PedidoConexao/{bd}';
         frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmPOST;
         frmPrincipal.RESTRequest1.Params.AddUrlSegment('bd',Trim(frmPrincipal.bd));
         frmPrincipal.RESTRequest1.AddBody(vjsonObject.ToString, ContentTypeFromString('application/json'));
         frmPrincipal.RESTRequest1.Execute;

         //prcMsgInf(listaClientes.Count.ToString);

         if frmPrincipal.RESTResponse1.StatusCode = 200 then Begin
            vjsonObject := frmPrincipal.RESTResponse1.JSONValue as TJSONObject;
            conexaoVO := TJson.JsonToObject<TPedidoConexaoVO>(vjsonObject.ToJSON);
            prcMsgInf('Registro alterado com sucesso');
            Result := conexaoVO;
         End
         else
            prcMsgAdv('Falha ao alterar o registro.');




         frmPrincipal.RESTClient1.Disconnect;

      Except

         prcMsgErro('Erro ao alterar o registro');

      End;

end;

class function TPedidoConexaoController.GravarPedidoConexao(conexao: TPedidoConexaoVO):TPedidoConexaoVO;
Var vjsonObject: TJSONObject;
    vJsonArray: TJSONArray;
    conexaoVO: TPedidoConexaoVO;
begin

      Try

         vjsonObject := TJson.ObjectToJsonObject(conexao);
         frmPrincipal.CarregarRest();

         //prcMsgInf(listaClientes.Count.ToString);

         frmPrincipal.RESTRequest1.Resource := '/PedidoConexao/{bd}';
         frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmPUT;
         frmPrincipal.RESTRequest1.Params.AddUrlSegment('bd',Trim(frmPrincipal.bd));
         frmPrincipal.RESTRequest1.AddBody(vjsonObject.ToString, ContentTypeFromString('application/json'));
         frmPrincipal.RESTRequest1.Execute;

         //prcMsgInf(listaClientes.Count.ToString);

         if frmPrincipal.RESTResponse1.StatusCode = 201 then Begin
            vjsonObject := frmPrincipal.RESTResponse1.JSONValue as TJSONObject;
            conexaoVO := TJson.JsonToObject<TPedidoConexaoVO>(vjsonObject.ToJSON);
            prcMsgInf('Registro inserido com sucesso');
            Result := conexaoVO;
         End
         else
            prcMsgAdv('Falha ao inserir o registro.');




         frmPrincipal.RESTClient1.Disconnect;

      Except

         prcMsgErro('Erro ao inserir o registro');

      End;

end;

class function TPedidoConexaoController.RetornarConexao: TPedidoConexaoVO;
Var vjsonObject: TJSONObject;
    conexaoVO: TPedidoConexaoVO;
begin

   Try

      frmPrincipal.CarregarRest();

      frmPrincipal.RESTRequest1.Resource := '/GetPedidoRetornarConexao/{bd}';
      frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmGET;
      frmPrincipal.RESTRequest1.Params.AddUrlSegment('bd',Trim(frmPrincipal.bd));
      frmPrincipal.RESTRequest1.Execute;

      conexaoVO := TPedidoConexaoVO.Create;
      vjsonObject := frmPrincipal.RESTResponse1.JSONValue as TJSONObject;
      conexaoVO := TJson.JsonToObject<TPedidoConexaoVO>(vjsonObject.ToJSON);

      Result := conexaoVO;

   Except

      prcMsgErro('Falha na validação');

   End;

end;

end.
