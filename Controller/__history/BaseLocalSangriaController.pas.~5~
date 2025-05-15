unit BaseLocalSangriaController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, BaseLocalSangriaVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type TBaseLocalSangriaController = class

    public
       class Procedure GravarSangria(sangria: tBaseLocalSangriaVO);
       class Function RetornarListaDeSangriaPorData(sangria: tBaseLocalSangriaVO):TObjectList<TBaseLocalSangriaVO>;

end;

implementation

{ TBaseLocalSangriaController }

class procedure TBaseLocalSangriaController.GravarSangria(sangria: tBaseLocalSangriaVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' INSERT INTO sangria ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' descricao, valor, data, id_usuario  ');
      query.SQL.Add(' )   ');
      query.SQL.Add(' VALUES   ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' :descricao, :valor, :data, :id_usuario ');
      query.SQL.Add(' ) ');

      query.Params.ParamByName('descricao').AsString   := Trim(sangria.descricao);
      query.Params.ParamByName('valor').AsFloat        := sangria.valor;
      query.Params.ParamByName('data').AsDateTime      := sangria.data;
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

class function TBaseLocalSangriaController.RetornarListaDeSangriaPorData(sangria: tBaseLocalSangriaVO): TObjectList<TBaseLocalSangriaVO>;
var query: TFDQuery;
    lista: TObjectList<TBaseLocalSangriaVO>;
    sangriaVO: TBaseLocalSangriaVO;

begin

   Try

      lista := TObjectList<TBaseLocalSangriaVO>.Create;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT * FROM sangria WHERE data = :data ORDER BY data ');
      query.Params.ParamByName('data').AsDateTime := sangria.data;
      query.Open;

      while Not(query.Eof) do Begin

         sangriaVO := TBaseLocalSangriaVO.Create;

         sangriaVO.descricao  := Trim(query.FieldByName('descricao').AsString);
         sangriaVO.valor      := query.FieldByName('valor').AsFloat;
         sangriaVO.id_usuario := query.FieldByName('id_usuario').AsInteger;
         sangriaVO.data       := query.FieldByName('data').AsDateTime;
         sangriaVO.id         := query.FieldByName('id').AsInteger;

         lista.Add(sangriaVO);
         query.Next;

      End;

      Result := lista;

   Finally

      FreeAndNil(query);
      FreeAndNil(sangriaVO);

   End;

end;

end.
