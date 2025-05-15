unit BaseLocalUnidadesController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, BaseLocalUnidadesVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type TBaseLocalUnidadesController = class

   class Procedure AlterarUnidade(unidade: TBaseLocalUnidadesVO);
   class Procedure GravarUnidade(unidade: TBaseLocalUnidadesVO);
   class Function RetornarUnidadeporID(id: integer):TBaseLocalUnidadesVO;
   class Function retornarGenerator: integer;

end;

implementation

{ TBaseLocalUnidadesController }

class procedure TBaseLocalUnidadesController.AlterarUnidade(unidade: TBaseLocalUnidadesVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' UPDATE UNIDADE_PRODUTOS SET STATUS = :STATUS, ');
      query.SQL.Add('                             DESCRICAO = :DESCRICAO, ');
      query.SQL.Add('                             SIGLA = :SIGLA, ');
      query.SQL.Add('                             FATOR = :FATOR, ');
      query.SQL.Add('                             PODE_FRACIONAR = :PODE_FRACIONAR ');
      query.SQL.Add('  WHERE id = :id ');

      query.Params.ParamByName('status').AsString         := Trim(unidade.STATUS);
      query.Params.ParamByName('DESCRICAO').AsString      := Trim(unidade.DESCRICAO);
      query.Params.ParamByName('SIGLA').AsString          := Trim(unidade.SIGLA);
      query.Params.ParamByName('FATOR').AsFloat           := unidade.fator;
      query.Params.ParamByName('PODE_FRACIONAR').AsString := Trim(unidade.pode_fracionar);
      query.Params.ParamByName('id').AsInteger            := unidade.id;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         Try
            frmPrincipal.qryUnidades.Refresh;
         Except
            frmPrincipal.qryUnidades.Close;
            frmPrincipal.qryUnidades.Open;
         End;
         prcMsgInf('Registro alterado com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         Try
            frmPrincipal.qryUnidades.Refresh;
         Except
            frmPrincipal.qryUnidades.Close;
            frmPrincipal.qryUnidades.Open;
         End;
         prcMsgErro('Não foi possível alterar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class procedure TBaseLocalUnidadesController.GravarUnidade(unidade: TBaseLocalUnidadesVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' INSERT INTO UNIDADE_PRODUTOS ');
      query.SQL.Add(' (   ');
      query.SQL.Add(' ID, STATUS, DESCRICAO, SIGLA, FATOR, PODE_FRACIONAR ');
      query.SQL.Add(' )   ');
      query.SQL.Add(' VALUES  ');
      query.SQL.Add(' (   ');
      query.SQL.Add(' :ID, :STATUS, :DESCRICAO, :SIGLA, :FATOR, :PODE_FRACIONAR ');
      query.SQL.Add(' )   ');

      query.Params.ParamByName('ID').AsInteger            := unidade.id;
      query.Params.ParamByName('status').AsString         := Trim(unidade.STATUS);
      query.Params.ParamByName('DESCRICAO').AsString      := Trim(unidade.DESCRICAO);
      query.Params.ParamByName('SIGLA').AsString          := Trim(unidade.SIGLA);
      query.Params.ParamByName('FATOR').AsFloat           := unidade.fator;
      query.Params.ParamByName('PODE_FRACIONAR').AsString := Trim(unidade.pode_fracionar);

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         Try
            frmPrincipal.qryUnidades.Refresh;
         Except
            frmPrincipal.qryUnidades.Close;
            frmPrincipal.qryUnidades.Open;
         End;
         prcMsgInf('Registro inserido com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         Try
            frmPrincipal.qryUnidades.Refresh;
         Except
            frmPrincipal.qryUnidades.Close;
            frmPrincipal.qryUnidades.Open;
         End;
         prcMsgErro('Não foi possível inserir o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalUnidadesController.retornarGenerator: integer;
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('SELECT gen_id(GEN_UNIDADE_PRODUTOS_ID, 1) AS id from rdb$database;');
      query.Open;

      Result := query.FieldByName('id').AsInteger;

   Finally

      //FreeAndNil(query);

   End;

end;

class function TBaseLocalUnidadesController.RetornarUnidadeporID(id: integer): TBaseLocalUnidadesVO;
var query: TFDQuery;
    unidade: TBaseLocalUnidadesVO;
begin

   Try

      unidade := TBaseLocalUnidadesVO.Create;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add('SELECT * FROM UNIDADE_PRODUTOS WHERE id = '+id.ToString);
      query.Open;

      if Not(query.IsEmpty) then Begin

         unidade.id    := query.FieldByName('ID').AsInteger;
         unidade.fator := query.FieldByName('FATOR').AsFloat;
         unidade.sigla := Trim(query.FieldByName('SIGLA').AsString);

      End;

      Result := unidade;


   Finally

      FreeAndNil(query);

   End;

end;

end.
