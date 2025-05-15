unit BaseLocalProdutosController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, BaseLocalProdutosVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type
   TBaseLocalProdutosController = class

      class Procedure AlterarProduto(produto: TBaseLocalProdutosVO);
      class Procedure GravarProduto(produto: TBaseLocalProdutosVO);
      class Function SaberSeImprimirCozinha(id: integer): Boolean;
      class Function retornarGenerator: integer;
      class Procedure GravarMovimetacaoProduto(idProduto: integer;
                                               quantidade: double;
                                               fator: double;
                                               tipo: String;
                                               id_unidade: integer = 0;
                                               id_venda: integer = 0;
                                               id_fornecedor: integer = 0;
                                               valor_venda: double = 0.00;
                                               TipoMovto: string = 'E');



   end;

implementation

{ TBaseLocalProdutosController }

class procedure TBaseLocalProdutosController.AlterarProduto(produto: TBaseLocalProdutosVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' UPDATE produtos SET STATUS = :STATUS, ');
      query.SQL.Add('                     DESCRICAO = :DESCRICAO, ');
      query.SQL.Add('                     QTDE_ESTOQUE = :QTDE_ESTOQUE, ');
      query.SQL.Add('                     REFERENCIA = :REFERENCIA, ');
      query.SQL.Add('                     ID_UNIDADE = :ID_UNIDADE, ');
      query.SQL.Add('                     CODIGO_BARRAS = :CODIGO_BARRAS, ');
      query.SQL.Add('                     VALOR_UNITARIO = :VALOR_UNITARIO, ');
      query.SQL.Add('                     IMPRIMIR_COZINHA = :IMPRIMIR_COZINHA, ');
      query.SQL.Add('                     ID_CATEGORIA = :ID_CATEGORIA, ');
      query.SQL.Add('                     ESTOQUE_MINIMO = :ESTOQUE_MINIMO, ');
      query.SQL.Add('                     cest = :cest, ');
      query.SQL.Add('                     CST_CSOSN = :CST_CSOSN, ');
      query.SQL.Add('                     CST_PIS = :CST_PIS, ');
      query.SQL.Add('                     CST_COFINS = :CST_COFINS, ');
      query.SQL.Add('                     TAXA_PIS = :TAXA_PIS, ');
      query.SQL.Add('                     TAXA_COFINS = :TAXA_COFINS, ');
      query.SQL.Add('                     TAXA_ICMS = :TAXA_ICMS, ');
      query.SQL.Add('                     ORIGEM = :ORIGEM, ');
      query.SQL.Add('                     NCM = :NCM, ');
      query.SQL.Add('                     CFOP = :CFOP, ');
      query.SQL.Add('                     FISCAL = :FISCAL ');
      query.SQL.Add('  WHERE id = :id ');

      query.Params.ParamByName('status').AsString           := Trim(produto.STATUS);
      query.Params.ParamByName('DESCRICAO').AsString        := Trim(produto.DESCRICAO);
      query.Params.ParamByName('QTDE_ESTOQUE').AsFloat      := produto.QTDE_ESTOQUE;
      query.Params.ParamByName('REFERENCIA').AsString       := Trim(produto.REFERENCIA);
      query.Params.ParamByName('ID_UNIDADE').AsInteger      := produto.ID_UNIDADE;
      query.Params.ParamByName('CODIGO_BARRAS').AsString    := Trim(produto.CODIGO_BARRAS);
      query.Params.ParamByName('VALOR_UNITARIO').AsFloat    := produto.VALOR_UNITARIO;
      query.Params.ParamByName('ID').AsInteger              := produto.ID;
      query.Params.ParamByName('IMPRIMIR_COZINHA').AsString := Trim(produto.ImprimirCozinha);
      query.Params.ParamByName('ID_CATEGORIA').AsInteger    := produto.idCategoria;
      query.Params.ParamByName('ESTOQUE_MINIMO').AsFloat    := produto.estoqueMinimo;
      query.Params.ParamByName('cest').AsString             := Trim(produto.cest);
      query.Params.ParamByName('CST_CSOSN').AsString        := Trim(produto.CST_CSOSN);
      query.Params.ParamByName('CST_PIS').AsString          := Trim(produto.CST_PIS);
      query.Params.ParamByName('CST_COFINS').AsString       := Trim(produto.CST_COFINS);
      query.Params.ParamByName('TAXA_PIS').AsFloat          := produto.TAXA_PIS;
      query.Params.ParamByName('TAXA_COFINS').AsFloat       := produto.TAXA_COFINS;
      query.Params.ParamByName('TAXA_ICMS').AsFloat         := produto.TAXA_ICMS;
      query.Params.ParamByName('ORIGEM').AsInteger          := produto.ORIGEM;
      query.Params.ParamByName('NCM').AsString              := Trim(produto.NCM);
      query.Params.ParamByName('CFOP').AsString             := Trim(produto.CFOP);
      query.Params.ParamByName('FISCAL').AsString           := produto.fiscal;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         Try
            frmPrincipal.qryProdutos.Refresh;
         Except
            frmPrincipal.qryProdutos.Close;
            frmPrincipal.qryProdutos.Open;
         End;
         prcMsgInf('Registro alterado com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         Try
            frmPrincipal.qryProdutos.Refresh;
         Except
            frmPrincipal.qryProdutos.Close;
            frmPrincipal.qryProdutos.Open;
         End;
         prcMsgErro('Não foi possível alterar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;


class procedure TBaseLocalProdutosController.GravarMovimetacaoProduto(
  idProduto: integer; quantidade, fator: double; tipo: String; id_unidade,
  id_venda, id_fornecedor: integer; valor_venda: double; TipoMovto: string);
Var query: TFDQuery;
begin

   Try
      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add('  INSERT INTO movimentacao_produtos ');
      query.SQL.Add('  (  ');
      query.SQL.Add('  id_produto, quantidade, id_unidade, fator, ');
      query.SQL.Add('  data_registro, id_user, tipo, id_venda, id_fornecedor ');
      query.SQL.Add('  )  ');
      query.SQL.Add('  VALUES ');
      query.SQL.Add('  (  ');
      query.SQL.Add('  :id_produto, :quantidade, :id_unidade, :fator, ');
      query.SQL.Add('  :data_registro, :id_user, :tipo, :id_venda, :id_fornecedor ');
      query.SQL.Add('  ) ');

      query.Params.ParamByName('id_produto').AsInteger     := idProduto;
      query.Params.ParamByName('quantidade').AsFloat       := quantidade;
      query.Params.ParamByName('id_unidade').AsInteger     := id_unidade;
      query.Params.ParamByName('fator').AsFloat            := fator;
      query.Params.ParamByName('data_registro').AsDateTime := Now;
      query.Params.ParamByName('id_user').AsInteger        := frmPrincipal.idUser;
      query.Params.ParamByName('tipo').AsString            := tipo;
      query.Params.ParamByName('id_venda').AsInteger       := id_venda;
      query.Params.ParamByName('id_fornecedor').AsInteger  := id_fornecedor;

      query.ExecSQL;

      query.Close;
      query.SQL.Clear;
      if TipoMovto = 'E' then
         query.SQL.Add(' UPDATE produtos SET QTDE_ESTOQUE = COALESCE(QTDE_ESTOQUE, 0.00) + :qtde WHERE id = '+idProduto.ToString)
      else
         query.SQL.Add(' UPDATE produtos SET QTDE_ESTOQUE = COALESCE(QTDE_ESTOQUE, 0.00) - :qtde WHERE id = '+idProduto.ToString);
      query.Params.ParamByName('qtde').AsFloat := quantidade;
      query.ExecSQL;

      if valor_venda > 0.00 then Begin

         query.Close;
         query.SQL.Clear;
         query.SQL.Add(' UPDATE produtos SET valor_unitario = :valor_unitario WHERE id = '+idProduto.ToString);
         query.Params.ParamByName('valor_unitario').AsFloat := valor_venda;
         query.ExecSQL;

      End;

   Except
      Raise
   End;

end;

class procedure TBaseLocalProdutosController.GravarProduto(produto: TBaseLocalProdutosVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' INSERT INTO produtos ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' ID, STATUS, DESCRICAO, QTDE_ESTOQUE, REFERENCIA, ID_CATEGORIA, ');
      query.SQL.Add(' ID_UNIDADE, CODIGO_BARRAS, VALOR_UNITARIO, IMPRIMIR_COZINHA, ESTOQUE_MINIMO, ');
      query.SQL.Add(' cest, CST_CSOSN, CST_PIS, CST_COFINS, TAXA_PIS, TAXA_COFINS, ');
      query.SQL.Add(' TAXA_ICMS, ORIGEM, NCM, CFOP, FISCAL ');
      query.SQL.Add(' )  ');
      query.SQL.Add(' VALUES  ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' :ID, :STATUS, :DESCRICAO, :QTDE_ESTOQUE, :REFERENCIA, :ID_CATEGORIA, ');
      query.SQL.Add(' :ID_UNIDADE, :CODIGO_BARRAS, :VALOR_UNITARIO, :IMPRIMIR_COZINHA, :ESTOQUE_MINIMO, ');
      query.SQL.Add(' :cest, :CST_CSOSN, :CST_PIS, :CST_COFINS, :TAXA_PIS, :TAXA_COFINS, ');
      query.SQL.Add(' :TAXA_ICMS, :ORIGEM, :NCM, :CFOP, :FISCAL ');
      query.SQL.Add(' )  ');

      query.Params.ParamByName('ID').AsInteger              := produto.id;
      query.Params.ParamByName('status').AsString           := Trim(produto.STATUS);
      query.Params.ParamByName('DESCRICAO').AsString        := Trim(produto.DESCRICAO);
      query.Params.ParamByName('QTDE_ESTOQUE').AsFloat      := produto.QTDE_ESTOQUE;
      query.Params.ParamByName('REFERENCIA').AsString       := Trim(produto.REFERENCIA);
      query.Params.ParamByName('ID_UNIDADE').AsInteger      := produto.ID_UNIDADE;
      query.Params.ParamByName('CODIGO_BARRAS').AsString    := Trim(produto.CODIGO_BARRAS);
      query.Params.ParamByName('VALOR_UNITARIO').AsFloat    := produto.VALOR_UNITARIO;
      query.Params.ParamByName('IMPRIMIR_COZINHA').AsString := Trim(produto.ImprimirCozinha);
      query.Params.ParamByName('ID_CATEGORIA').AsInteger    := produto.idCategoria;
      query.Params.ParamByName('ESTOQUE_MINIMO').AsFloat    := produto.estoqueMinimo;
      query.Params.ParamByName('cest').AsString             := Trim(produto.cest);
      query.Params.ParamByName('CST_CSOSN').AsString        := Trim(produto.CST_CSOSN);
      query.Params.ParamByName('CST_PIS').AsString          := Trim(produto.CST_PIS);
      query.Params.ParamByName('CST_COFINS').AsString       := Trim(produto.CST_COFINS);
      query.Params.ParamByName('TAXA_PIS').AsFloat          := produto.TAXA_PIS;
      query.Params.ParamByName('TAXA_COFINS').AsFloat       := produto.TAXA_COFINS;
      query.Params.ParamByName('TAXA_ICMS').AsFloat         := produto.TAXA_ICMS;
      query.Params.ParamByName('ORIGEM').AsInteger          := produto.ORIGEM;
      query.Params.ParamByName('NCM').AsString              := Trim(produto.NCM);
      query.Params.ParamByName('CFOP').AsString             := Trim(produto.CFOP);
      query.Params.ParamByName('FISCAL').AsString           := produto.fiscal;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         Try
            frmPrincipal.qryProdutos.Refresh;
         Except
            frmPrincipal.qryProdutos.Close;
            frmPrincipal.qryProdutos.Open;
         End;
         prcMsgInf('Registro inserido com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         Try
            frmPrincipal.qryProdutos.Refresh;
         Except
            frmPrincipal.qryProdutos.Close;
            frmPrincipal.qryProdutos.Open;
         End;
         prcMsgErro('Não foi possível gravar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalProdutosController.retornarGenerator: integer;
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('SELECT gen_id(GEN_PRODUTOS_ID, 1) AS id from rdb$database;');
      query.Open;

      Result := query.FieldByName('id').AsInteger;

   Finally

      //FreeAndNil(query);

   End;

end;

class function TBaseLocalProdutosController.SaberSeImprimirCozinha(id: integer): Boolean;
var query: TFDQuery;
begin

   Try

      Result := False;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT imprimir_cozinha FROM produtos WHERE id = '+id.ToString);
      query.Open;

      if query.FieldByName('imprimir_cozinha').AsString = 'S' then
         Result := True;

   Finally

      FreeAndNil(query);

   End;

end;

end.

