unit FornecedoresController;

interface

uses fornecedoresVO, FireDAC.Comp.Client, generics.Collections, untPrincipal, System.SysUtils, BaseLocalClientesController;

Type TFornecedoresController = class

   public
      class Function InserirFornecedor(fornecedor: tfornecedoresVO; transacao: TFDTransaction = nil): tfornecedoresVO;
      class Function AlterarFornecedor(fornecedor: tfornecedoresVO; transacao: TFDTransaction = nil): tfornecedoresVO;
      class Function retornarGenerator: integer;
      class Function VerificarSeCNPJExiste(cnpcnpj: string): Boolean;

end;

implementation

{ TFornecedoresController }

class function TFornecedoresController.AlterarFornecedor(fornecedor: tfornecedoresVO; transacao: TFDTransaction): tfornecedoresVO;
Var query: tfdquery;

begin

  Try

    Try

       query := TFDQuery.Create(transacao);
       query.Connection := frmPrincipal.ConexaoLocal;

       query.SQL.Add('    UPDATE fornecedores  SET NOME = :NOME, ');
       query.SQL.Add('                             FANTASIA = :FANTASIA, ');
       query.SQL.Add('                             EMAIL = :EMAIL, ');
       query.SQL.Add('                             CPF_CNPJ = :CPF_CNPJ, ');
       query.SQL.Add('                             INSCRICAO_ESTADUAL = :INSCRICAO_ESTADUAL, ');
       query.SQL.Add('                             TIPO_PESSOA = :TIPO_PESSOA, ');
       query.SQL.Add('                             LOGRADOURO = :LOGRADOURO, ');
       query.SQL.Add('                             NUMERO = :NUMERO, ');
       query.SQL.Add('                             COMPLEMENTO = :COMPLEMENTO, ');
       query.SQL.Add('                             CEP = :CEP, ');
       query.SQL.Add('                             BAIRRO = :BAIRRO, ');
       query.SQL.Add('                             CIDADE = :CIDADE, ');
       query.SQL.Add('                             UF = :UF, ');
       query.SQL.Add('                             CELULAR = :CELULAR, ');
       query.SQL.Add('                             CODIGO_IBGE_CIDADE = :CODIGO_IBGE_CIDADE, ');
       query.SQL.Add('                             CODIGO_IBGE_UF = :CODIGO_IBGE_UF ');
       query.SQL.Add('     WHERE ID = :ID ');

       query.Params.ParamByName('ID').AsInteger                := fornecedor.ID;
       query.Params.ParamByName('NOME').AsString               := fornecedor.NOME;
       query.Params.ParamByName('FANTASIA').AsString           := fornecedor.FANTASIA;
       query.Params.ParamByName('EMAIL').AsString              := fornecedor.EMAIL;
       query.Params.ParamByName('CPF_CNPJ').AsString           := fornecedor.CPF_CNPJ;
       query.Params.ParamByName('INSCRICAO_ESTADUAL').AsString := fornecedor.INSCRICAO_ESTADUAL;
       query.Params.ParamByName('TIPO_PESSOA').AsString        := fornecedor.TIPO_PESSOA;
       query.Params.ParamByName('LOGRADOURO').AsString         := fornecedor.LOGRADOURO;
       query.Params.ParamByName('NUMERO').AsString             := fornecedor.NUMERO;
       query.Params.ParamByName('COMPLEMENTO').AsString        := fornecedor.COMPLEMENTO;
       query.Params.ParamByName('CEP').AsString                := fornecedor.CEP;
       query.Params.ParamByName('BAIRRO').AsString             := fornecedor.BAIRRO;
       query.Params.ParamByName('CIDADE').AsString             := fornecedor.CIDADE;
       query.Params.ParamByName('UF').AsString                 := fornecedor.UF;
       query.Params.ParamByName('CELULAR').AsString            := fornecedor.CELULAR;
       query.Params.ParamByName('CODIGO_IBGE_CIDADE').AsInteger:= fornecedor.CODIGO_IBGE_CIDADE;
       query.Params.ParamByName('CODIGO_IBGE_UF').AsInteger    := fornecedor.CODIGO_IBGE_UF;

       query.ExecSQL;
       frmPrincipal.ConexaoLocal.Commit;

       Result := fornecedor;

    Finally

       FreeAndNil(query)

    End;

  Except
     raise;
  End;

end;

class function TFornecedoresController.InserirFornecedor(fornecedor: tfornecedoresVO; transacao: TFDTransaction): tfornecedoresVO;
Var query: tfdquery;

begin

  Try

    Try

       query := TFDQuery.Create(transacao);
       query.Connection := frmPrincipal.ConexaoLocal;

       query.SQL.Add('SELECT * FROM fornecedores WHERE CPF_CNPJ = '''+(fornecedor.CPF_CNPJ)+'''');
       query.Open;

       if query.IsEmpty then Begin

          query.Close;
          query.SQL.Clear;

          query.Close;
          query.SQL.Clear;

          query.SQL.Add('    INSERT INTO fornecedores ');
          query.SQL.Add('    ( ');
          query.SQL.Add('    ID, NOME, FANTASIA, EMAIL, CPF_CNPJ, INSCRICAO_ESTADUAL, TIPO_PESSOA, ');
          query.SQL.Add('    DATA_CADASTRO, LOGRADOURO, NUMERO, COMPLEMENTO, CEP, BAIRRO, ');
          query.SQL.Add('    CIDADE, UF, CELULAR, CODIGO_IBGE_CIDADE, CODIGO_IBGE_UF ');
          query.SQL.Add('    ) ');
          query.SQL.Add('    VALUES ');
          query.SQL.Add('    (  ');
          query.SQL.Add('    :ID, :NOME, :FANTASIA, :EMAIL, :CPF_CNPJ, :INSCRICAO_ESTADUAL, :TIPO_PESSOA, ');
          query.SQL.Add('    :DATA_CADASTRO, :LOGRADOURO, :NUMERO, :COMPLEMENTO, :CEP, :BAIRRO, ');
          query.SQL.Add('    :CIDADE, :UF, :CELULAR, :CODIGO_IBGE_CIDADE, :CODIGO_IBGE_UF ');
          query.SQL.Add('    ) ');

          if fornecedor.ID > 0 then
             query.Params.ParamByName('ID').AsInteger             := fornecedor.ID
          else
             query.Params.ParamByName('ID').AsInteger             := retornarGenerator;
          query.Params.ParamByName('NOME').AsString               := fornecedor.NOME;
          query.Params.ParamByName('FANTASIA').AsString           := fornecedor.FANTASIA;
          query.Params.ParamByName('EMAIL').AsString              := fornecedor.EMAIL;
          query.Params.ParamByName('CPF_CNPJ').AsString           := fornecedor.CPF_CNPJ;
          query.Params.ParamByName('INSCRICAO_ESTADUAL').AsString := fornecedor.INSCRICAO_ESTADUAL;
          query.Params.ParamByName('TIPO_PESSOA').AsString        := fornecedor.TIPO_PESSOA;
          query.Params.ParamByName('DATA_CADASTRO').Asdate        := Date;
          query.Params.ParamByName('LOGRADOURO').AsString         := fornecedor.LOGRADOURO;
          query.Params.ParamByName('NUMERO').AsString             := fornecedor.NUMERO;
          query.Params.ParamByName('COMPLEMENTO').AsString        := fornecedor.COMPLEMENTO;
          query.Params.ParamByName('CEP').AsString                := fornecedor.CEP;
          query.Params.ParamByName('BAIRRO').AsString             := fornecedor.BAIRRO;
          query.Params.ParamByName('CIDADE').AsString             := fornecedor.CIDADE;
          query.Params.ParamByName('UF').AsString                 := fornecedor.UF;
          query.Params.ParamByName('CELULAR').AsString            := fornecedor.CELULAR;
          query.Params.ParamByName('CODIGO_IBGE_CIDADE').AsInteger:= fornecedor.CODIGO_IBGE_CIDADE;
          query.Params.ParamByName('CODIGO_IBGE_UF').AsInteger    := fornecedor.CODIGO_IBGE_UF;

          query.ExecSQL;
          frmPrincipal.ConexaoLocal.Commit;
          fornecedor.ID := fornecedor.ID;

       End else
          fornecedor.ID := query.FieldByName('id').AsInteger;

       Result := fornecedor;

    Finally

       FreeAndNil(query)

    End;

  Except
     raise;
  End;

end;

class function TFornecedoresController.retornarGenerator: integer;
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('SELECT gen_id(GEN_FORNECEDORES_ID, 1) AS id from rdb$database;');
      query.Open;

      Result := query.FieldByName('id').AsInteger;

   Finally

      //FreeAndNil(query);

   End;

end;

class function TFornecedoresController.VerificarSeCNPJExiste(cnpcnpj: string): Boolean;
Var query: TFDQuery;
begin

   Try

      Result := false;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;
      query.SQL.Add('SELECT * FROM fornecedores WHERE CPF_CNPJ = '''+(cnpcnpj)+'''');
      query.Open;

      if not(query.IsEmpty) then
         result := true;

   Finally

      FreeAndNil(query);

   End;

end;

end.
