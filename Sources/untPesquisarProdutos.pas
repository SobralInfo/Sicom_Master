unit untPesquisarProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask, PedidoProdutosVO, unitConfiguracoes,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, JvExDBGrids, JvDBGrid, PedidoProdutosController, BaseLocalUnidadesController,
  BaseLocalUnidadesVO, Vcl.Imaging.pngimage, RxDBCtrl, firedac.Comp.Client;

type
  TfrmPesquisarProdutos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Image1: TImage;
    mkeDescricao: TMaskEdit;
    Panel2: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    JvDBGrid1: TRxDBGrid;
    procedure mkeDescricaoChange(Sender: TObject);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image4Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarProdutos: TfrmPesquisarProdutos;

implementation

{$R *.dfm}

uses untPrincipal, untPedidos, untCadastrarProdutos, untTelaDePedido,
  untObservacao, untImportarXML, untEntradaManual, untInserirProdutoPromocao,
  untInserirProdutoKit, untRelEstoque;

procedure TfrmPesquisarProdutos.Confirmar;
Var produto: TPedidoProdutosVO;
    unidade: TBaseLocalUnidadesVO;
    query: TFDQuery;
begin

   if frmPrincipal.qryProdutos.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   if origem = 'PEDIDO' then Begin

      if frmPrincipal.qryProdutosVALOR_UNITARIO.AsFloat <= 0.00 then Begin

         prcMsgAdv('Produto com valor de venda inválido.');
         Exit;

      End;

      frmTelaDePedido.edtCodigoProduto.Text    := frmPrincipal.qryProdutosID.AsString;
      frmTelaDePedido.edtDescricaoProduto.Text := Trim(frmPrincipal.qryProdutosDESCRICAO.AsString);
      frmTelaDePedido.lblUnidade.Caption       := Trim(frmPrincipal.qryProdutosUNIDADE.AsString);
      frmTelaDePedido.fatorUnidade             := frmPrincipal.qryProdutosFATOR.AsFloat;
      frmTelaDePedido.lblValorUnitario.Caption := FormatFloat('###,#0.00',frmPrincipal.qryProdutosVALOR_UNITARIO.AsFloat);
      frmTelaDePedido.idProduto := frmPrincipal.qryProdutosID.AsInteger;
      frmTelaDePedido.estoqueAtual             := frmPrincipal.qryProdutosQTDE_ESTOQUE.AsFloat;
      frmTelaDePedido.AtualizarTotais;

      frmTelaDePedido.edtQuantidade.SetFocus;
      frmTelaDePedido.edtQuantidade.SelText;

   end else if origem = 'ENTRADA_NOTA' then Begin

      frmImportarXML.qryItens.Edit;
      frmImportarXML.qryItensID_PRODUTO.AsInteger              := frmPrincipal.qryProdutosID.AsInteger;
      frmImportarXML.qryItensCalcCodigo.AsString               := formatfloat('#0000000000', frmPrincipal.qryProdutosID.AsInteger);
      frmImportarXML.qryItensPROD_ID_UNIDADE_PRODUTO.AsInteger := frmPrincipal.qryProdutosID_UNIDADE.AsInteger;
      frmImportarXML.qryItensPROD_ID_UNIDADE_ENTRADA.AsInteger := frmPrincipal.qryProdutosID_UNIDADE.AsInteger;
      frmImportarXML.qryItensPROD_DESCRICAO.AsString           := Trim(frmPrincipal.qryProdutosDESCRICAO.AsString);

      frmImportarXML.qryItensPROD_ID_UNIDADE_PRODUTO.AsInteger := frmPrincipal.qryUnidadesID.AsInteger;
      frmImportarXML.qryItenscalUnidadeProd.AsString := frmPrincipal.qryUnidadesSIGLA.AsString+' (x'+
                                                        FormatFloat('#0.00',frmPrincipal.qryUnidadesFATOR.AsFloat)+')';

      frmImportarXML.qryItensPROD_VALOR_VENDA.AsFloat          := frmPrincipal.qryProdutosVALOR_UNITARIO.AsFloat;

      unidade := TBaseLocalUnidadesController.RetornarUnidadeporID(frmPrincipal.qryProdutosID_UNIDADE.AsInteger);

      frmImportarXML.qryItenscalUnidadeProd.AsString := unidade.SIGLA+' (x'+
                                                        FormatFloat('#0.00', unidade.fator)+')';

      frmImportarXML.qryItens.Post;

      frmImportarXML.qryItens.Refresh;

   end else if origem = 'ENTRADA_MANUAL' then Begin

      frmEntradaManual.edtProduto.Text := Trim(frmPrincipal.qryProdutosDESCRICAO.AsString);
      frmEntradaManual.idProduto :=  frmPrincipal.qryProdutosID.AsInteger;
      frmEntradaManual.edtValorVenda.AsFloat := frmPrincipal.qryProdutosVALOR_UNITARIO.AsFloat;
      frmEntradaManual.unidade := frmPrincipal.qryProdutosUNIDADE.AsString;
      frmEntradaManual.edtUnidade.Text := frmPrincipal.qryProdutosUNIDADE.AsString;
      frmEntradaManual.idUnidade := frmPrincipal.qryProdutosID_UNIDADE.AsInteger;
      frmEntradaManual.qtdeAtual := frmPrincipal.qryProdutosQTDE_ESTOQUE.AsFloat;
      frmEntradaManual.edtQtde.SetFocus;

   End else if origem = 'CADASTRO_PROMOCAO' then Begin

      Application.CreateForm(TfrmInserirProdutoPromocao, frmInserirProdutoPromocao);
      frmInserirProdutoPromocao.edtProduto.Text := Trim(frmPrincipal.qryProdutosDESCRICAO.AsString);
      frmInserirProdutoPromocao.edtValor.AsFloat:= frmPrincipal.qryProdutosVALOR_UNITARIO.AsFloat;
      frmInserirProdutoPromocao.idProduto := frmPrincipal.qryProdutosID.AsInteger;
      frmInserirProdutoPromocao.ShowModal;

   end else if origem = 'CADASTRO_KIT' then Begin

      Application.CreateForm(TfrmInserirProdutoKit, frmInserirProdutoKit);
      frmInserirProdutoKit.edtProduto.Text := Trim(frmPrincipal.qryProdutosDESCRICAO.AsString);
      frmInserirProdutoKit.edtValor.AsFloat:= frmPrincipal.qryProdutosVALOR_UNITARIO.AsFloat;
      frmInserirProdutoKit.idProduto := frmPrincipal.qryProdutosID.AsInteger;
      frmInserirProdutoKit.ShowModal;

   end else if origem = 'REL_ESTOQUE' then Begin

      frmRelEstoque.idProduto := frmPrincipal.qryProdutosID.AsInteger;
      frmRelEstoque.edtProduto.Text := Trim(frmPrincipal.qryProdutosDESCRICAO.AsString);

   End else if origem <> 'CADASTRO_PRODUTOS' then Begin


      if frmPrincipal.qryProdutosVALOR_UNITARIO.AsFloat <= 0.00 then Begin

         prcMsgAdv('Produto com valor de venda inválido.');
         Exit;

      End;

      if ((frmPrincipal.qryParametrosCRITICAR_ESTOQUE.AsString = 'S') AND
          (frmPedidos.edtQuantidade.AsFloat > frmPrincipal.qryProdutosQTDE_ESTOQUE.AsFloat) AND
          (frmPrincipal.qryProdutosKIT.AsString = 'N')) Then Begin

          prcMsgAdv('Produto '+frmPrincipal.qryProdutosDESCRICAO.AsString+#13+'com quantidade insuficiente.');
          Exit;

      End;

      Try

         produto := TPedidoProdutosVO.Create;
         produto := TPedidoProdutosController.RetornarProdutoPorID(frmPrincipal.qryProdutosID.AsInteger);
         frmPedidos.Confirmar(produto);

      Finally

         FreeAndNil(produto);

      End;

   end else Begin

      frmCadastrarProdutos.HabilitarDesabilitarBotoes('E');
      frmCadastrarProdutos.HabilitarDesabilitarCampos('H');
      frmCadastrarProdutos.LimparCampos;
      frmCadastrarProdutos.DAO := 'U';

      if frmPrincipal.qryProdutosSTATUS.AsString = 'A' then
         frmCadastrarProdutos.cbbStatus.ItemIndex := 0
      else
         frmCadastrarProdutos.cbbStatus.ItemIndex := 1;

      if frmPrincipal.qryProdutosIMPRIMIR_COZINHA.AsString = 'S' then
         frmCadastrarProdutos.cbbImprimirCozinha.ItemIndex := 0
      else
         frmCadastrarProdutos.cbbImprimirCozinha.ItemIndex := 1;

      frmCadastrarProdutos.edtDescricao.Text    := Trim(frmPrincipal.qryProdutosDESCRICAO.AsString);
      frmCadastrarProdutos.lkpUnidade.KeyValue  := frmPrincipal.qryProdutosID_UNIDADE.AsInteger;
      frmCadastrarProdutos.edtCodigoBarras.Text := Trim(frmPrincipal.qryProdutosCODIGO_BARRAS.AsString);
      frmCadastrarProdutos.edtReferencia.Text   := Trim(frmPrincipal.qryProdutosREFERENCIA.AsString);
      frmCadastrarProdutos.edtEstoque.AsFloat   := frmPrincipal.qryProdutosQTDE_ESTOQUE.AsFloat;
      frmCadastrarProdutos.edtValor.AsFloat     := frmPrincipal.qryProdutosVALOR_UNITARIO.AsFloat;
      frmCadastrarProdutos.idProduto            := frmPrincipal.qryProdutosID.AsInteger;
      frmCadastrarProdutos.lkpCategoria.KeyValue:= frmPrincipal.qryProdutosID_CATEGORIA.AsInteger;
      frmCadastrarProdutos.edtEstoqueMinimo.AsFloat := frmPrincipal.qryProdutosESTOQUE_MINIMO.AsFloat;

      frmCadastrarProdutos.chkFiscais.Checked := True;
      frmCadastrarProdutos.chkFiscais.Checked := False;

      if Trim(frmPrincipal.qryProdutosFISCAL.AsString) = 'S' then Begin

         frmCadastrarProdutos.chkFiscais.Checked := True;
         frmCadastrarProdutos.lkpOrigem.KeyValue := frmPrincipal.qryProdutosORIGEM.AsInteger;
         frmCadastrarProdutos.lkpCFOP.KeyValue   := frmPrincipal.qryProdutosCFOP.AsString;
         frmCadastrarProdutos.edtNCM.Text        := Trim(frmPrincipal.qryProdutosNCM.AsString);
         frmCadastrarProdutos.edtCEST.Text       := Trim(frmPrincipal.qryProdutosCEST.AsString);
         frmCadastrarProdutos.lkpCST_CSOSN.KeyValue := frmPrincipal.qryProdutosCST_CSOSN.AsString;
         frmCadastrarProdutos.lkpAliquotaICMS.KeyValue := frmPrincipal.qryProdutosTAXA_ICMS.AsFloat;
         frmCadastrarProdutos.lkpCST_PIS.KeyValue := frmPrincipal.qryProdutosCST_PIS.AsString;
         frmCadastrarProdutos.lkpAliquotaPIS.KeyValue  := frmPrincipal.qryProdutosTAXA_PIS.AsFloat;
         frmCadastrarProdutos.lkpCST_COFINS.KeyValue   := frmPrincipal.qryProdutosCST_COFINS.AsString;
         frmCadastrarProdutos.lkpAliquotaCOFINS.KeyValue := frmPrincipal.qryProdutosTAXA_COFINS.AsFloat;
         frmCadastrarProdutos.cbbStatus.SetFocus;

      End;

   End;

   close;

end;

procedure TfrmPesquisarProdutos.Filtrar;
begin

   frmPrincipal.qryProdutos.Close;
   frmPrincipal.qryProdutos.Filtered := False;

   if origem = 'CADASTRO_PRODUTOS' then
      frmPrincipal.qryProdutos.Filter := ' ((Upper(referencia) like '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,80)+'%')+') or (Upper(descricao) LIKE '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,100)+'%')+') OR (Upper(codigo_barras) like '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,15)+'%')+'))'
   else
      frmPrincipal.qryProdutos.Filter := ' ((status = ''A'') AND (((Upper(referencia) like '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,80)+'%')+') or (Upper(descricao) LIKE '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,100)+'%')+') OR (Upper(codigo_barras) like '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,15)+'%')+'))))';


   frmPrincipal.qryProdutos.Filtered := True;

   frmPrincipal.qryProdutos.Open;

   lblTotal.Caption := 'Total de Produtos: '+frmPrincipal.qryProdutos.RecordCount.ToString;
   frmPrincipal.qryProdutos.First;

end;

procedure TfrmPesquisarProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   frmPrincipal.qryProdutos.Close;
end;

procedure TfrmPesquisarProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_F12: Confirmar;
      VK_ESCAPE: close;

   end;

end;

procedure TfrmPesquisarProdutos.FormShow(Sender: TObject);
begin
   if Assigned(frmPedidos) then Begin

      frmPrincipal.qryProdutos.Close;
      frmPrincipal.qryProdutos.SQL.Clear;
      frmPrincipal.qryProdutos.SQL.Add('  select p.id, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.status, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.descricao, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.qtde_estoque, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.referencia, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.id_unidade, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.codigo_barras, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.valor_unitario, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.imprimir_cozinha, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.id_categoria, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.estoque_minimo, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.NCM, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.CEST, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.TAXA_PIS, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.TAXA_COFINS, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.TAXA_ICMS, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.CST_CSOSN, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.CST_PIS, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.CST_COFINS, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.ORIGEM, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.CFOP, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.FISCAL, ');
      frmPrincipal.qryProdutos.SQL.Add('         u.sigla as unidade, ');
      frmPrincipal.qryProdutos.SQL.Add('         u.fator, ');
      frmPrincipal.qryProdutos.SQL.Add('         ''N'' AS kit ');
      frmPrincipal.qryProdutos.SQL.Add('    from produtos p, ');
      frmPrincipal.qryProdutos.SQL.Add('         unidade_produtos u ');
      frmPrincipal.qryProdutos.SQL.Add('   WHERE p.id_unidade = u.id ');
      frmPrincipal.qryProdutos.SQL.Add('   UNION ');
      frmPrincipal.qryProdutos.SQL.Add('  select Cast((k.id*-1) as integer) AS id, ');
      frmPrincipal.qryProdutos.SQL.Add('         k.status, ');
      frmPrincipal.qryProdutos.SQL.Add('         k.descricao, ');
      frmPrincipal.qryProdutos.SQL.Add('         0.00 AS qtde_estoque, ');
      frmPrincipal.qryProdutos.SQL.Add('         '''' AS referencia, ');
      frmPrincipal.qryProdutos.SQL.Add('         1 AS id_unidade, ');
      frmPrincipal.qryProdutos.SQL.Add('         k.gtin AS codigo_barras, ');
      frmPrincipal.qryProdutos.SQL.Add('         K.valor AS valor_unitario, ');
      frmPrincipal.qryProdutos.SQL.Add('         ''N'' AS imprimir_cozinha, ');
      frmPrincipal.qryProdutos.SQL.Add('         1 AS id_categoria, ');
      frmPrincipal.qryProdutos.SQL.Add('         0.00 as estoque_minimo, ');
      frmPrincipal.qryProdutos.SQL.Add('         '''' NCM, ');
      frmPrincipal.qryProdutos.SQL.Add('         '''' CEST, ');
      frmPrincipal.qryProdutos.SQL.Add('         0.00 TAXA_PIS, ');
      frmPrincipal.qryProdutos.SQL.Add('         0.00 TAXA_COFINS, ');
      frmPrincipal.qryProdutos.SQL.Add('         0.00 TAXA_ICMS, ');
      frmPrincipal.qryProdutos.SQL.Add('         '''' CST_CSOSN, ');
      frmPrincipal.qryProdutos.SQL.Add('         '''' CST_PIS, ');
      frmPrincipal.qryProdutos.SQL.Add('         '''' CST_COFINS, ');
      frmPrincipal.qryProdutos.SQL.Add('         0 ORIGEM, ');
      frmPrincipal.qryProdutos.SQL.Add('         '''' CFOP, ');
      frmPrincipal.qryProdutos.SQL.Add('         '''' FISCAL, ');
      frmPrincipal.qryProdutos.SQL.Add('         ''UND'' as unidade, ');
      frmPrincipal.qryProdutos.SQL.Add('         1 AS fator, ');
      frmPrincipal.qryProdutos.SQL.Add('         ''S'' AS kit ');
      frmPrincipal.qryProdutos.SQL.Add('    from kit_produto_cabecalho k ');
      frmPrincipal.qryProdutos.Open;

   End else Begin

      frmPrincipal.qryProdutos.Close;
      frmPrincipal.qryProdutos.SQL.Clear;
      frmPrincipal.qryProdutos.SQL.Add('  select p.id, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.status, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.descricao, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.qtde_estoque, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.referencia, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.id_unidade, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.codigo_barras, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.valor_unitario, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.imprimir_cozinha, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.id_categoria, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.estoque_minimo, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.NCM, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.CEST, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.TAXA_PIS, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.TAXA_COFINS, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.TAXA_ICMS, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.CST_CSOSN, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.CST_PIS, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.CST_COFINS, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.ORIGEM, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.CFOP, ');
      frmPrincipal.qryProdutos.SQL.Add('         p.FISCAL, ');
      frmPrincipal.qryProdutos.SQL.Add('         u.sigla as unidade, ');
      frmPrincipal.qryProdutos.SQL.Add('         u.fator, ');
      frmPrincipal.qryProdutos.SQL.Add('         ''S'' AS kit ');
      frmPrincipal.qryProdutos.SQL.Add('    from produtos p, ');
      frmPrincipal.qryProdutos.SQL.Add('         unidade_produtos u ');
      frmPrincipal.qryProdutos.SQL.Add('   WHERE p.id_unidade = u.id ');
      frmPrincipal.qryProdutos.Open;

   End;

   Filtrar;
end;

procedure TfrmPesquisarProdutos.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarProdutos.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarProdutos.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarProdutos.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarProdutos.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarProdutos.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_DOWN then
      JvDBGrid1.SetFocus;

end;

procedure TfrmPesquisarProdutos.RxDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

end.
