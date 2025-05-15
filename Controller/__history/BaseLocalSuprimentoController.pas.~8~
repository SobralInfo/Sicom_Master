unit BaseLocalSuprimentoController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     unitConfiguracoes, BaseLocalSuprimentoVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type TBaseLocalSuprimentoController = class
  private
   public
      class Procedure GravarSuprimento(suprimento: tBaseLocalsuprimentoVO);
      class Function RetornarListaDeSuprimentoPorData(suprimento: tBaseLocalsuprimentoVO): TObjectList<TBaseLocalSuprimentoVO>;

end;

implementation

USES untPrincipal;

{ TBaseLocalSuprimentoController }
class procedure TBaseLocalSuprimentoController.GravarSuprimento(suprimento: tBaseLocalsuprimentoVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' INSERT INTO suprimento ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' descricao, valor, data, id_usuario  ');
      query.SQL.Add(' )   ');
      query.SQL.Add(' VALUES   ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' :descricao, :valor, :data, :id_usuario ');
      query.SQL.Add(' ) ');

      query.Params.ParamByName('descricao').AsString   := Trim(suprimento.descricao);
      query.Params.ParamByName('valor').AsFloat        := suprimento.valor;
      query.Params.ParamByName('data').AsDateTime      := suprimento.data;
      query.Params.ParamByName('id_usuario').AsInteger := 1;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         prcMsgInf('Registro inserido com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         prcMsgErro('Não foi possível gravar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalSuprimentoController.RetornarListaDeSuprimentoPorData(suprimento: tBaseLocalsuprimentoVO): TObjectList<TBaseLocalSuprimentoVO>;
var query: TFDQuery;
    lista: TObjectList<TBaseLocalSuprimentoVO>;
    suprimentoVO: TBaseLocalSuprimentoVO;

begin

   Try

      lista := TObjectList<TBaseLocalSuprimentoVO>.Create;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT * FROM suprimento WHERE data = :data ORDER BY data ');
      query.Params.ParamByName('data').AsDateTime := suprimento.data;
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
