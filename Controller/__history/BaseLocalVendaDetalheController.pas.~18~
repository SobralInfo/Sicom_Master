unit BaseLocalVendaDetalheController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     untPrincipal, unitConfiguracoes, BaseLocalVendaDetalheVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type
   TBaseLocalVendaDetalheController = class
      class Procedure GravarVendaDetalhe(vendaDetalhe: TBaseLocalVendaDetalheVO);
      class Function RetornarListaDeProdutosDaVenda(id: integer): TObjectList<TBaseLocalVendaDetalheVO>;

   end;

implementation

{ TBaseLocalVendaDetalheController }

class procedure TBaseLocalVendaDetalheController.GravarVendaDetalhe(vendaDetalhe: TBaseLocalVendaDetalheVO);
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('   INSERT INTO venda_detalhe ');
      query.SQL.Add('   (  ');
      query.SQL.Add('   ID_PRODUTO, ID_VENDA_CABECALHO, GTIN, ITEM, OBSERVACAO, ');
      query.SQL.Add('   QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL, DESCRICAO_PRODUTO ');
      query.SQL.Add('   )  ');
      query.SQL.Add('   VALUES  ');
      query.SQL.Add('   (  ');
      query.SQL.Add('   :ID_PRODUTO, :ID_VENDA_CABECALHO, :GTIN, :ITEM, :OBSERVACAO, ');
      query.SQL.Add('   :QUANTIDADE, :VALOR_UNITARIO, :VALOR_TOTAL, :DESCRICAO_PRODUTO ');
      query.SQL.Add('   )  ');

      query.Params.ParamByName('ID_PRODUTO').AsInteger         := vendaDetalhe.ID_PRODUTO;
      query.Params.ParamByName('ID_VENDA_CABECALHO').AsInteger := vendaDetalhe.ID_VENDA_CABECALHO;
      query.Params.ParamByName('GTIN').AsString                := vendaDetalhe.GTIN;
      query.Params.ParamByName('ITEM').AsInteger               := vendaDetalhe.ITEM;
      query.Params.ParamByName('QUANTIDADE').AsFloat           := vendaDetalhe.QUANTIDADE;
      query.Params.ParamByName('VALOR_UNITARIO').AsFloat       := vendaDetalhe.VALOR_UNITARIO;
      query.Params.ParamByName('VALOR_TOTAL').AsFloat          := vendaDetalhe.VALOR_TOTAL;
      query.Params.ParamByName('DESCRICAO_PRODUTO').AsString   := Trim(vendaDetalhe.DESCRICAO_PRODUTO);
      query.Params.ParamByName('OBSERVACAO').AsString          := Trim(vendaDetalhe.OBSERVACAO);

      query.ExecSQL;

      frmPrincipal.ConexaoLocal.Commit;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalVendaDetalheController.RetornarListaDeProdutosDaVenda(id: integer): TObjectList<TBaseLocalVendaDetalheVO>;
Var query: TFDQuery;
    venda: TObjectList<TBaseLocalVendaDetalheVO>;
    item: TBaseLocalVendaDetalheVO;

begin

   Try

      venda := TObjectList<TBaseLocalVendaDetalheVO>.Create;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT * FROM venda_detalhe WHERE ID_VENDA_CABECALHO = '+id.ToString);
      query.Open;
      query.First;


      while not(query.Eof) do Begin

         item := TBaseLocalVendaDetalheVO.Create;

         item.ID                 := query.FieldByName('ID').AsInteger;
         item.ID_PRODUTO         := query.FieldByName('ID_PRODUTO').AsInteger;
         item.ID_VENDA_CABECALHO := query.FieldByName('ID_VENDA_CABECALHO').AsInteger;
         item.GTIN               := Trim(query.FieldByName('GTIN').AsString);
         item.ITEM               := query.FieldByName('ITEM').AsInteger;
         item.QUANTIDADE         := query.FieldByName('QUANTIDADE').AsFloat;
         item.VALOR_UNITARIO     := query.FieldByName('VALOR_UNITARIO').AsFloat;
         item.VALOR_TOTAL        := query.FieldByName('VALOR_TOTAL').AsFloat;
         item.DESCRICAO_PRODUTO  := Trim(query.FieldByName('DESCRICAO_PRODUTO').AsString);

         venda.Add(item);

         query.Next;

      End;

      Result := venda;

   Finally

      FreeAndNil(query);
      FreeAndNil(item);

   End;

end;

end.
