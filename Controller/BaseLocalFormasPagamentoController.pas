unit BaseLocalFormasPagamentoController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, BaseLocalFormasPagamentoVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type TBaseLocalFormasPagamentoController = class

   public
      class Procedure AlterarFormaPG(FormaPG: TBaseLocalFormasPagamentoVO);
      class Procedure GravarFormaPG(FormaPG: TBaseLocalFormasPagamentoVO);
      class function RetornarIdPgNFCe(idPagamento: integer): integer;
      class Function retornarGenerator: integer;

end;

implementation

{ TBaseLocalFormasPagamentoController }

class procedure TBaseLocalFormasPagamentoController.AlterarFormaPG(FormaPG: TBaseLocalFormasPagamentoVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' UPDATE FORMAS_PAGAMENTO SET STATUS = :STATUS, ');
      query.SQL.Add('                             NOME = :NOME, ');
      query.SQL.Add('                             PERMITE_TROCO = :PERMITE_TROCO, ');
      query.SQL.Add('                             tipo_pg_nfce = :tipo_pg_nfce, ');
      query.SQL.Add('                             EMITIR_FISCAL =:EMITIR_FISCAL, ');
      query.SQL.Add('                             GERAR_FINANCEIRO = :GERAR_FINANCEIRO, ');
      query.SQL.Add('                             PRAZO_PARCELAS = :PRAZO_PARCELAS ');
      query.SQL.Add('  WHERE id = :id ');

      query.Params.ParamByName('status').AsString        := Trim(FormaPG.STATUS);
      query.Params.ParamByName('NOME').AsString          := Trim(FormaPG.nome);
      query.Params.ParamByName('PERMITE_TROCO').AsString := Trim(FormaPG.permite_troco);
      query.Params.ParamByName('id').AsInteger           := FormaPG.id;
      query.Params.ParamByName('tipo_pg_nfce').AsInteger := FormaPG.tipo_pagamento_nfce;
      query.Params.ParamByName('EMITIR_FISCAL').AsString := Trim(FormaPG.EMITIR_FISCAL);
      query.Params.ParamByName('PRAZO_PARCELAS').AsInteger := FormaPG.PRAZO_PARCELAS;
      query.Params.ParamByName('GERAR_FINANCEIRO').AsString  := Trim(FormaPG.GERAR_FINANCEIRO);

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         Try
            frmPrincipal.qryFormaPG.Refresh;
         Except
            frmPrincipal.qryFormaPG.Close;
            frmPrincipal.qryFormaPG.Open;
         End;
         prcMsgInf('Registro alterado com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         Try
            frmPrincipal.qryFormaPG.Refresh;
         Except
            frmPrincipal.qryFormaPG.Close;
            frmPrincipal.qryFormaPG.Open;
         End;
         prcMsgErro('Não foi possível alterar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class procedure TBaseLocalFormasPagamentoController.GravarFormaPG(FormaPG: TBaseLocalFormasPagamentoVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' INSERT INTO FORMAS_PAGAMENTO ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' ID, STATUS, NOME, PERMITE_TROCO, tipo_pg_nfce, EMITIR_FISCAL, GERAR_FINANCEIRO, PRAZO_PARCELAS ');
      query.SQL.Add(' )  ');
      query.SQL.Add(' VALUES  ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' :ID, :STATUS, :NOME, :PERMITE_TROCO, :tipo_pg_nfce, :EMITIR_FISCAL, :GERAR_FINANCEIRO, :PRAZO_PARCELAS ');
      query.SQL.Add(' )  ');

      query.Params.ParamByName('id').AsInteger           := FormaPG.id;
      query.Params.ParamByName('status').AsString        := Trim(FormaPG.STATUS);
      query.Params.ParamByName('NOME').AsString          := Trim(FormaPG.nome);
      query.Params.ParamByName('PERMITE_TROCO').AsString := Trim(FormaPG.permite_troco);
      query.Params.ParamByName('tipo_pg_nfce').AsInteger := FormaPG.tipo_pagamento_nfce;
      query.Params.ParamByName('EMITIR_FISCAL').AsString := Trim(FormaPG.EMITIR_FISCAL);
      query.Params.ParamByName('PRAZO_PARCELAS').AsInteger := FormaPG.PRAZO_PARCELAS;
      query.Params.ParamByName('GERAR_FINANCEIRO').AsString  := Trim(FormaPG.GERAR_FINANCEIRO);

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         Try
            frmPrincipal.qryFormaPG.Refresh;
         Except
            frmPrincipal.qryFormaPG.Close;
            frmPrincipal.qryFormaPG.Open;
         End;
         prcMsgInf('Registro inserido com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         Try
            frmPrincipal.qryFormaPG.Refresh;
         Except
            frmPrincipal.qryFormaPG.Close;
            frmPrincipal.qryFormaPG.Open;
         End;
         prcMsgErro('Não foi possível gravar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalFormasPagamentoController.retornarGenerator: integer;
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('SELECT gen_id(GEN_FORMAS_PAGAMENTO_ID, 1) AS id from rdb$database;');
      query.Open;

      Result := query.FieldByName('id').AsInteger;

   Finally

      //FreeAndNil(query);

   End;

end;

class function TBaseLocalFormasPagamentoController.RetornarIdPgNFCe(idPagamento: integer): integer;
var query: TFDQuery;
begin

   Try

      Result := 0;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT TIPO_PG_NFCE FROM FORMAS_PAGAMENTO WHERE id = '+idPagamento.ToString);
      query.Open;

      if query.FieldByName('TIPO_PG_NFCE').AsInteger > 0 then
         Result := query.FieldByName('TIPO_PG_NFCE').AsInteger;

   Finally

      FreeAndNil(query);

   End;

end;

end.
