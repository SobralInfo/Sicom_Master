unit BaseLocalTotalTipoPagtoController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, BaseLocalTotalTipoPagtoVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type TBaseLocalTotalTipoPagtoController = class
   class Procedure GravarTotalTipoPagto(tipoPagto: TBaseLocalTotalTipoPagtoVO);

end;

implementation

{ TBaseLocalTotalTipoPagtoController }

class procedure TBaseLocalTotalTipoPagtoController.GravarTotalTipoPagto(tipoPagto: TBaseLocalTotalTipoPagtoVO);
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('   INSERT INTO total_tipo_pgto  ');
      query.SQL.Add('   (  ');
      query.SQL.Add('   ID_VENDA_CABECALHO, ID_FORMA_PAGAMENTO, VALOR  ');
      query.SQL.Add('   )  ');
      query.SQL.Add('   VALUES   ');
      query.SQL.Add('   (   ');
      query.SQL.Add('   :ID_VENDA_CABECALHO, :ID_FORMA_PAGAMENTO, :VALOR ');
      query.SQL.Add('   )  ');

      query.Params.ParamByName('ID_VENDA_CABECALHO').AsInteger := tipoPagto.ID_VENDA_CABECALHO;
      query.Params.ParamByName('ID_FORMA_PAGAMENTO').AsInteger := tipoPagto.ID_FORMA_PAGAMENTO;
      query.Params.ParamByName('VALOR').AsFloat                := tipoPagto.VALOR;

      query.ExecSQL;

      frmPrincipal.ConexaoLocal.Commit;

   Finally

      FreeAndNil(query);

   End;

end;

end.
