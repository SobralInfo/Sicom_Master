unit BaseLocalParametrosController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, BaseLocalParametrosVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type TBaseLocalParametrosController = class

   public
      Class Function retornarParametros: TBaseLocalParametrosVO;
      class Procedure GravarParametros(config: TBaseLocalParametrosVO);
      class Procedure AlterarParametros(config: TBaseLocalParametrosVO);


end;

implementation

{ TBaseLocalParametrosController }

class procedure TBaseLocalParametrosController.AlterarParametros(config: TBaseLocalParametrosVO);
begin

end;

class procedure TBaseLocalParametrosController.GravarParametros(config: TBaseLocalParametrosVO);
Var query: TFDQuery;
    parametro: TBaseLocalParametrosVO;

Begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' UPDATE configuracoes SET caixa = :caixa, ');
      query.SQL.Add('                          base_local = :base, ');
      query.SQL.Add('                          tipo_desconto_pedido = :tipo_desconto_pedido, ');
      query.SQL.Add('                          certificado = :certificado, ');
      query.SQL.Add('                          certificado_digital = :certificado_digital, ');
      query.SQL.Add('                          CRITICAR_ESTOQUE = :CRITICAR_ESTOQUE, ');
      query.SQL.Add('                          MENSAGEM_IMPRIMIR = :MENSAGEM_IMPRIMIR, ');
      query.SQL.Add('                          VALIDAR_CPF_CLIENTE = :VALIDAR_CPF_CLIENTE, ');
      query.SQL.Add('                          ID_CSC_NFCE = :ID_CSC_NFCE, ');
      query.SQL.Add('                          CSC_NFCE = :CSC_NFCE, ');
      query.SQL.Add('                          NUMERO_NFCE = :NUMERO_NFCE, ');
      query.SQL.Add('                          SERIE_NFCE = :SERIE_NFCE, ');
      query.SQL.Add('                          FORMA_EMISSAO = :FORMA_EMISSAO, ');

      if config.idclientePAdraoFinanceiro > 0 then
      query.SQL.Add('                          ID_CLI_PADRAO_LANC_FINANC = ' + config.idclientePAdraoFinanceiro.tostring + ',');

      if config.idcontaPAdraoFinanceiro > 0 then
      query.SQL.Add('                          ID_CONTA_FINANCEIRA_PADRAO = ' + config.idcontaPAdraoFinanceiro.tostring + ',');

      query.SQL.Add('                          TIPO_AMBIENTE = :TIPO_AMBIENTE  ');
      query.SQL.Add('  WHERE id = 1 ');
      query.Params.ParamByName('caixa').AsString                 := config.CAIXA;
      query.Params.ParamByName('base').AsString                  := 'S';
      query.Params.ParamByName('tipo_desconto_pedido').AsString  := config.tipo_desconto_pedido;
      query.Params.ParamByName('certificado').AsString           := config.CERTIFICADO;
      query.Params.ParamByName('certificado_digital').AsString   := config.CERTIFICADO;
      query.Params.ParamByName('CRITICAR_ESTOQUE').AsString      := config.CRITICAR_ESTOQUE;
      query.Params.ParamByName('MENSAGEM_IMPRIMIR').AsString     := config.MENSAGEM_IMPRIMIR;
      query.Params.ParamByName('VALIDAR_CPF_CLIENTE').AsString   := config.VALIDAR_CPF_CAD_CLIENTE;
      query.Params.ParamByName('ID_CSC_NFCE').AsString           := config.ID_CSC_NFCE;
      query.Params.ParamByName('CSC_NFCE').AsString              := config.CSC_NFCE;
      query.Params.ParamByName('NUMERO_NFCE').AsInteger          := config.NUMERO_NFCE;
      query.Params.ParamByName('SERIE_NFCE').AsInteger           := config.SERIE_NFCE;
      query.Params.ParamByName('FORMA_EMISSAO').AsString         := config.FORMA_EMISSAO;
      query.Params.ParamByName('TIPO_AMBIENTE').AsString         := config.TIPO_AMBIENTE;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         prcMsgInf('Registro salvo com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         prcMsgInf('Falha ao salvar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalParametrosController.retornarParametros: TBaseLocalParametrosVO;
Var query: TFDQuery;
    parametro: TBaseLocalParametrosVO;

Begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT * FROM configuracoes ');
      query.open;

      parametro := TBaseLocalParametrosVO.Create;

      if Not(query.IsEmpty) then Begin

         parametro.ID                   := query.FieldByName('id').AsInteger;
         parametro.BASE_LOCAL           := query.FieldByName('BASE_LOCAL').Asstring;
         parametro.TIPO_DESCONTO_PEDIDO := query.FieldByName('TIPO_DESCONTO_PEDIDO').Asstring;
         parametro.CERTIFICADO          := query.FieldByName('CERTIFICADO').Asstring;

      End;

      Result := parametro;

   Finally

      FreeAndNil(query);

   End;

end;
end.
