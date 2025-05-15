unit PedidoUsuarioController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, PedidousuariosVO, unitConfiguracoes, PedidoProdutosVO;



Type
   TPedidoUsuarioController = class

      private

      public
         class Function ValidarUsuario(cnpj, cpf, senha: string): TPedidoUsuariosVO;

   end;

implementation

{ TEDSUsuarioController }

class function TPedidoUsuarioController.ValidarUsuario(cnpj, cpf, senha: string): TPedidoUsuariosVO;
Var vjsonObject: TJSONObject;
    vJsonArray: TJSONArray;
    usuarioVO: TPedidoUsuariosVO;
begin

   Try

      frmPrincipal.CarregarRest();

      frmPrincipal.RESTRequest1.Resource := '/GetPedidoValidarUsuarioEmpresas/{cnpj}/{cpf}/{senha}';
      frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmGET;
      frmPrincipal.RESTRequest1.Params.AddUrlSegment('cnpj',Trim(cnpj));
      frmPrincipal.RESTRequest1.Params.AddUrlSegment('cpf',Trim(cpf));
      frmPrincipal.RESTRequest1.Params.AddUrlSegment('senha',Trim(senha));
      frmPrincipal.RESTRequest1.Execute;

      usuarioVO := TPedidoUsuariosVO.Create;
      vjsonObject := frmPrincipal.RESTResponse1.JSONValue as TJSONObject;
      usuarioVO := TJson.JsonToObject<TPedidoUsuariosVO>(vjsonObject.ToJSON);

      Result := usuarioVO;

   Except

      prcMsgErro('Falha na validação');

   End;

end;

end.
