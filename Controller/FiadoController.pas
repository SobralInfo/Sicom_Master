unit FiadoController;

interface

uses FiadoVO, FireDAC.Comp.Client, generics.Collections, system.sysutils, untPrincipal;

Type TFiadoController = class

   public
      class Procedure GravarVendaFiado(fiado: TFiadoVO);


end;

implementation

{ TFiadoController }

class procedure TFiadoController.GravarVendaFiado(fiado: TFiadoVO);
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add(' INSERT INTO fiados ');
      query.SQL.Add(' ( ');
      query.SQL.Add(' id_venda, valor_venda, data_venda, id_cliente, tipo, total_venda, OBS_FIADO ');
      query.SQL.Add(' ) ');
      query.SQL.Add(' VALUES ');
      query.SQL.Add(' ( ');
      query.SQL.Add(' :id_venda, :valor_venda, :data_venda, :id_cliente, ''S'', :total_venda, :OBS_FIADO ');
      query.SQL.Add(' ) ');

      query.Params.ParamByName('id_venda').AsInteger    := fiado.id_venda;
      query.Params.ParamByName('valor_venda').AsFloat   := fiado.valor_venda;
      query.Params.ParamByName('data_venda').AsDateTime := fiado.data_venda;
      query.Params.ParamByName('id_cliente').AsInteger  := fiado.id_cliente;
      query.Params.ParamByName('total_venda').AsFloat   := fiado.total_venda;
      QUERY.Params.ParamByName('OBS_FIADO').AsString    := fiado.OBS_FIADO;

      Try

         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;

      Except

         frmPrincipal.ConexaoLocal.Rollback;

      End;

   Finally

      FreeAndNil(query)

   End;

end;

end.
