unit PedidoSqlController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, PedidousuariosVO, unitConfiguracoes, PedidoSqlVO;

Type TPedidoSqlController = class

   public
      class function GravarSQL(SQL: TPedidoSqlVO): TPedidoSqlVO;
      class function AlterarSQL(SQL: TPedidoSqlVO): TPedidoSqlVO;
      class function RetornarSQL(id: integer): TPedidoSqlVO;

end;

implementation

{ TPedidoSqlController }

class function TPedidoSqlController.AlterarSQL(SQL: TPedidoSqlVO): TPedidoSqlVO;
Var vjsonObject: TJSONObject;
    sqlVO: TPedidoSqlVO;
begin

      Try

         vjsonObject := TJson.ObjectToJsonObject(SQL);
         frmPrincipal.CarregarRest();

         frmPrincipal.RESTRequest1.Resource := '/PedidoSql/{bd}';
         frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmPOST;
         frmPrincipal.RESTRequest1.Params.AddUrlSegment('bd',Trim(frmPrincipal.bd));
         frmPrincipal.RESTRequest1.AddBody(vjsonObject.ToString, ContentTypeFromString('application/json'));
         frmPrincipal.RESTRequest1.Execute;

         if frmPrincipal.RESTResponse1.StatusCode = 200 then Begin
            vjsonObject := frmPrincipal.RESTResponse1.JSONValue as TJSONObject;
            sqlVO := TJson.JsonToObject<TPedidoSqlVO>(vjsonObject.ToJSON);
            prcMsgInf('Registro alterado com sucesso');
            Result := sqlVO;
         End
         else
            prcMsgAdv('Falha ao alterar o registro.');

      Except

         prcMsgErro('Erro ao inserir o registro');

      End;


end;

class function TPedidoSqlController.GravarSQL(SQL: TPedidoSqlVO):TPedidoSqlVO;
Var vjsonObject: TJSONObject;
    sqlVO: TPedidoSqlVO;
begin

      Try

         vjsonObject := TJson.ObjectToJsonObject(SQL);
         frmPrincipal.CarregarRest();

         frmPrincipal.RESTRequest1.Resource := '/PedidoSql/{bd}';
         frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmPUT;
         frmPrincipal.RESTRequest1.Params.AddUrlSegment('bd',Trim(frmPrincipal.bd));
         frmPrincipal.RESTRequest1.AddBody(vjsonObject.ToString, ContentTypeFromString('application/json'));
         frmPrincipal.RESTRequest1.Execute;

         if frmPrincipal.RESTResponse1.StatusCode = 201 then Begin
            vjsonObject := frmPrincipal.RESTResponse1.JSONValue as TJSONObject;
            sqlVO := TJson.JsonToObject<TPedidoSqlVO>(vjsonObject.ToJSON);
            prcMsgInf('Registro inserido com sucesso');
            Result := sqlVO;
         End
         else
            prcMsgAdv('Falha ao inserir o registro.');

      Except

         prcMsgErro('Erro ao inserir o registro');

      End;


end;

class function TPedidoSqlController.RetornarSQL(id: integer): TPedidoSqlVO;
Var vjsonObject: TJSONObject;
    sqlVO: TPedidoSqlVO;
begin

   Try

      frmPrincipal.CarregarRest();

      frmPrincipal.RESTRequest1.Resource := '/GetEDSListarSQLPorID/{bd}/{id}';
      frmPrincipal.RESTRequest1.Method := TRESTRequestMethod.rmGET;
      frmPrincipal.RESTRequest1.Params.AddUrlSegment('bd',Trim(frmPrincipal.bd));
      frmPrincipal.RESTRequest1.Params.AddUrlSegment('id',id.ToString);
      frmPrincipal.RESTRequest1.Execute;

      sqlVO := TPedidoSqlVO.Create;
      vjsonObject := frmPrincipal.RESTResponse1.JSONValue as TJSONObject;
      sqlVO := TJson.JsonToObject<TPedidoSqlVO>(vjsonObject.ToJSON);

      Result := sqlVO;

   Except

      prcMsgErro('Falha na validação');

   End;

end;

end.
