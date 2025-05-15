unit BaseLocalFuncionariosController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, BaseLocalFuncionariosVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type TBaseLocalFuncionariosController = class

   class Function RetornarFuncionarioPorID(id: integer): TBaseLocalFuncionariosVO;
   class Procedure GravarFuncionario(funcionario: TBaseLocalFuncionariosVO);
   class Procedure AlterarFuncionario(funcionario: TBaseLocalFuncionariosVO);

end;

implementation

{ TBaseLocalFuncionariosController }

class procedure TBaseLocalFuncionariosController.AlterarFuncionario(funcionario: TBaseLocalFuncionariosVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' UPDATE FUNCIONARIOS SET status = :status, ');
      query.SQL.Add('                         codigo = :codigo, ');
      query.SQL.Add('                         nome = :nome, ');
      query.SQL.Add('                         percentual_comissao = :percentual_comissao  ');
      query.SQL.Add('  WHERE id = :id  ');

      query.Params.ParamByName('id').AsInteger                 := funcionario.id;
      query.Params.ParamByName('status').AsString              := Trim(funcionario.STATUS);
      query.Params.ParamByName('codigo').AsString              := Trim(funcionario.CODIGO);
      query.Params.ParamByName('nome').AsString                := Trim(funcionario.NOME);
      query.Params.ParamByName('percentual_comissao').AsFloat  := funcionario.percentual_comissao;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         Try
            frmPrincipal.qryFuncionarios.Refresh;
         Except
            frmPrincipal.qryFuncionarios.Close;
            frmPrincipal.qryFuncionarios.Open;
         End;
         prcMsgInf('Registro alterado com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         Try
            frmPrincipal.qryFuncionarios.Refresh;
         Except
            frmPrincipal.qryFuncionarios.Close;
            frmPrincipal.qryFuncionarios.Open;
         End;
         prcMsgErro('Não foi possível alterar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class procedure TBaseLocalFuncionariosController.GravarFuncionario(funcionario: TBaseLocalFuncionariosVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' INSERT INTO FUNCIONARIOS ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' status, codigo, nome, percentual_comissao  ');
      query.SQL.Add(' )   ');
      query.SQL.Add(' VALUES   ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' :status, :codigo, :nome, :percentual_comissao ');
      query.SQL.Add(' ) ');

      query.Params.ParamByName('status').AsString              := Trim(funcionario.STATUS);
      query.Params.ParamByName('codigo').AsString              := Trim(funcionario.CODIGO);
      query.Params.ParamByName('nome').AsString                := Trim(funcionario.NOME);
      query.Params.ParamByName('percentual_comissao').AsFloat  := funcionario.percentual_comissao;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         Try
            frmPrincipal.qryFuncionarios.Refresh;
         Except
            frmPrincipal.qryFuncionarios.Close;
            frmPrincipal.qryFuncionarios.Open;
         End;
         prcMsgInf('Registro inserido com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         Try
            frmPrincipal.qryFuncionarios.Refresh;
         Except
            frmPrincipal.qryFuncionarios.Close;
            frmPrincipal.qryFuncionarios.Open;
         End;
         prcMsgErro('Não foi possível gravar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalFuncionariosController.RetornarFuncionarioPorID(id: integer): TBaseLocalFuncionariosVO;
Var query: TFDQuery;
    funcionario: TBaseLocalFuncionariosVO;

Begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT * FROM funcionarios WHERE id = '+id.ToString);
      query.open;

      funcionario := TBaseLocalFuncionariosVO.Create;

      if Not(query.IsEmpty) then Begin

         funcionario.id       := query.FieldByName('id').AsInteger;
         funcionario.nome     := Trim(query.FieldByName('nome').AsString);
         Result := funcionario;

      End;

   Finally

      FreeAndNil(query);

   End;

end;

end.
