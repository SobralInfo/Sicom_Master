unit BaseLocalSuprimentoController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     unitConfiguracoes, BaseLocalSuprimentoVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type TBaseLocalSuprimentoController = class
  private
   public
      class Procedure GravarSuprimentos(suprimento: tBaseLocalsuprimentoVO);
      class Function RetornarListaDeSuprimentoPorMovimento(suprimento: tBaseLocalsuprimentoVO): TObjectList<TBaseLocalSuprimentoVO>;

end;

implementation

USES untPrincipal;

{ TBaseLocalSuprimentoController }
class procedure TBaseLocalSuprimentoController.GravarSuprimentos(suprimento: tBaseLocalsuprimentoVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' INSERT INTO suprimento ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' descricao, valor, data, id_usuario, id_movimento, id_forma_pg  ');
      query.SQL.Add(' )   ');
      query.SQL.Add(' VALUES   ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' :descricao, :valor, :data, :id_usuario, :id_movimento, :id_forma_pg ');
      query.SQL.Add(' ) ');

      query.Params.ParamByName('descricao').AsString     := Trim(suprimento.descricao);
      query.Params.ParamByName('valor').AsFloat          := suprimento.valor;
      query.Params.ParamByName('data').AsDateTime        := suprimento.data;
      query.Params.ParamByName('id_usuario').AsInteger   := frmPrincipal.idUser;
      query.Params.ParamByName('id_movimento').AsInteger := suprimento.id_movimento;
      query.Params.ParamByName('id_forma_pg').AsInteger  := suprimento.idFomaPg;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         if suprimento.id_usuario > 0 then
            prcMsgInf('Registro inserido com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         if suprimento.id_usuario > 0 then
            prcMsgErro('Não foi possível gravar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalSuprimentoController.RetornarListaDeSuprimentoPorMovimento(suprimento: tBaseLocalsuprimentoVO): TObjectList<TBaseLocalSuprimentoVO>;
var query: TFDQuery;
    lista: TObjectList<TBaseLocalSuprimentoVO>;
    suprimentoVO: TBaseLocalSuprimentoVO;

begin

   Try

      lista := TObjectList<TBaseLocalSuprimentoVO>.Create;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT * FROM suprimento WHERE id_movimento = :id_movimento ORDER BY data ');
      query.Params.ParamByName('id_movimento').AsDateTime := suprimento.id_movimento;
      query.Open;

      while Not(query.Eof) do Begin

         suprimentoVO := TBaseLocalSuprimentoVO.Create;

         suprimentoVO.descricao  := Trim(query.FieldByName('descricao').AsString);
         suprimentoVO.valor      := query.FieldByName('valor').AsFloat;
         suprimentoVO.id_usuario := query.FieldByName('id_usuario').AsInteger;
         suprimentoVO.data       := query.FieldByName('data').AsDateTime;
         suprimentoVO.id         := query.FieldByName('id').AsInteger;

         lista.Add(suprimentoVO);
         query.Next;

      End;

      Result := lista;

   Finally

      FreeAndNil(query);
      FreeAndNil(suprimentoVO);

   End;

end;


end.
