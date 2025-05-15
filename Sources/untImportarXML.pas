unit untImportarXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, FornecedoresVO,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Comp.Client, untPrincipal, XMLDoc, XMLIntf, unitConfiguracoes,
  BaseLocalProdutosVO, generics.Collections, BaseLocalUnidadesVO, NotaEntradaCabecalhoVO, NotaEntradaDetalheVO,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, BaseLocalUnidadesController, BaseLocalProdutosController,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, fornecedoresController,
  Data.DB, FireDAC.Comp.DataSet, Vcl.DBCtrls, Vcl.DBCGrids, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Menus;

type
  TfrmImportarXML = class(TForm)
    dtsItens: TDataSource;
    qryItens: TFDMemTable;
    qryItensID: TIntegerField;
    qryItensID_CABECALHO: TIntegerField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensSEQUENCIA: TIntegerField;
    qryItensQTREAL: TFloatField;
    qryItensVL_UNITARIO: TFloatField;
    qryItensVL_FRETE: TFloatField;
    qryItensVL_IPI: TFloatField;
    qryItensVL_DESCONTO: TFloatField;
    qryItensVL_ICMS: TFloatField;
    qryItensVL_ICMS_SUBST: TFloatField;
    qryItensVL_ISENTO: TFloatField;
    qryItensVL_COFINS: TFloatField;
    qryItensVL_PIS: TFloatField;
    qryItensVL_SEGURO: TFloatField;
    qryItensVL_OUTROS: TFloatField;
    qryItensCODIGO_ORIGEM: TStringField;
    qryItensUND: TStringField;
    qryItensFATOR_UNIDADE: TFloatField;
    Panel9: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    DBCtrlGrid3: TDBCtrlGrid;
    DBText13: TDBText;
    Panel10: TPanel;
    qryItensDESCRICAO_ORIGEM: TStringField;
    DBText1: TDBText;
    DBText2: TDBText;
    Image1: TImage;
    Image2: TImage;
    Panel6: TPanel;
    Label3: TLabel;
    Image3: TImage;
    Label1: TLabel;
    Image4: TImage;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    DBText3: TDBText;
    lblQtdeItens: TLabel;
    Label5: TLabel;
    DBText4: TDBText;
    Image5: TImage;
    lblCodigo: TDBText;
    DBText6: TDBText;
    lblValorVenda: TDBText;
    lblUnidadeProduto: TDBText;
    lblUnidadeEntrada: TDBText;
    qryItensPROD_ID_UNIDADE_PRODUTO: TIntegerField;
    qryItensPROD_ID_UNIDADE_ENTRADA: TIntegerField;
    qryItensPROD_DESCRICAO: TStringField;
    qryItensPROD_VALOR_VENDA: TFloatField;
    qryItensCalcCodigo: TStringField;
    qryItenscalUnidadeProd: TStringField;
    qryItenscalcUnidadeEntrada: TStringField;
    qryItensGTIN: TStringField;
    PopupMenu1: TPopupMenu;
    ValoresPadro1: TMenuItem;
    procedure DBCtrlGrid3PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure Image3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image5Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ValoresPadro1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Var fornecedor: TFornecedoresVO;
    procedure ImportarProdutos(chave: String);
    procedure AlterarPreco;
    procedure AlterarProduto;
    procedure AlterarUnidadeProduto;
    procedure AlterarUnidadeEntrada;
    procedure GravarFornecedor(transacao: TFDTransaction);
    Function RetornarUnidadeComFator(id: integer): String;
    Function VerificarSeProdutoJaCadastrado(fornecedor, produto: String): Boolean;
    Function InserirProduto(idCabeca: integer): integer;
    Procedure GravarNota;
  end;

var
  frmImportarXML: TfrmImportarXML;

implementation

{$R *.dfm}

uses untEntradaXML, untAlterarPreco, untPesquisarProdutos, untPesquisarUnidades,
  untPadraoImpXml;

{ TfrmImportarXML }

procedure TfrmImportarXML.AlterarPreco;
begin

   Application.CreateForm(TfrmAlterarPreco, frmAlterarPreco);
   frmAlterarPreco.edtValor.AsFloat := qryItensPROD_VALOR_VENDA.AsFloat;
   frmAlterarPreco.ShowModal;

end;

procedure TfrmImportarXML.AlterarProduto;
begin

   Application.CreateForm(TfrmPesquisarProdutos, frmPesquisarProdutos);
   frmPesquisarProdutos.origem := 'ENTRADA_NOTA';
   frmPesquisarProdutos.ShowModal;

end;

procedure TfrmImportarXML.AlterarUnidadeEntrada;
begin

   Application.CreateForm(TfrmPesquisarUnidades, frmPesquisarUnidades);
   frmPesquisarUnidades.origem := 'NOTA_ENTRADA';
   frmPesquisarUnidades.ShowModal;

end;

procedure TfrmImportarXML.AlterarUnidadeProduto;
begin

   Application.CreateForm(TfrmPesquisarUnidades, frmPesquisarUnidades);
   frmPesquisarUnidades.origem := 'NOTA_ENTRADA_PRODUTO';
   frmPesquisarUnidades.ShowModal;


end;

procedure TfrmImportarXML.DBCtrlGrid3PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
begin

   if qryItensID_PRODUTO.AsInteger > 0 then
      lblCodigo.Font.Color := $00666666
   else
      lblCodigo.Font.Color := clRed;

   if qryItensPROD_VALOR_VENDA.AsFloat > 0.00 then
      lblValorVenda.Font.Color := $00666666
   else
      lblValorVenda.Font.Color := clRed;

   if qryItenscalUnidadeProd.AsString <> 'PENDENTE' then
      lblUnidadeProduto.Font.Color := $00666666
   else
      lblUnidadeProduto.Font.Color := clRed;

   if qryItenscalcUnidadeEntrada.AsString <> 'PENDENTE' then
      lblUnidadeEntrada.Font.Color := $00666666
   else
      lblUnidadeEntrada.Font.Color := clRed;

end;

procedure TfrmImportarXML.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmImportarXML.GravarFornecedor(transacao: TFDTransaction);
Begin

  Try

     fornecedor := TFornecedoresController.InserirFornecedor(fornecedor);

  Except

    Raise;

  End;

end;

procedure TfrmImportarXML.GravarNota;
Var query: TFDQuery;
    transacao: TFDTransaction;
    IdPedido, id: integer;
begin

   if qryItens.IsEmpty then Begin

      prcMsgAdv('Nota de entrada sem ítens.');
      Exit;

   End;

   qryItens.First;

   while Not(qryItens.Eof) do Begin

      if qryItensPROD_VALOR_VENDA.AsFloat <= 0.00 then Begin

         prcMsgAdv('Produto '+qryItensDESCRICAO_ORIGEM.AsString+#13+' sem valor de venda informado. ');
         Abort;

      End;

      if qryItenscalUnidadeProd.AsString = 'PENDENTE' then Begin

         prcMsgAdv('Produto '+qryItensDESCRICAO_ORIGEM.AsString+#13+' sem a unidade informada. ');
         Abort;

      End;

      if qryItenscalcUnidadeEntrada.AsString = 'PENDENTE' then Begin

         prcMsgAdv('Produto '+qryItensDESCRICAO_ORIGEM.AsString+#13+' sem a unidade de entrada informada. ');
         Abort;

      End;


      qryItens.Next;

   End;

   Try

      transacao := TFDTransaction.Create(Nil);
      transacao.Connection := frmPrincipal.ConexaoLocal;

      transacao.StartTransaction;
      GravarFornecedor(transacao);

      query := TFDQuery.Create(transacao);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add('SELECT gen_id(GEN_NOTA_ENTRADA_CABECALHO_ID, 1) AS id from rdb$database;');
      query.Open;

      IdPedido := query.FieldByName('id').AsInteger;

      query.Close;
      query.SQL.Clear;
      query.SQl.Add(' INSERT INTO nota_entrada_cabecalho ');
      query.SQl.Add(' ( ');
      query.SQl.Add(' ID, DATA_PEDIDO, DATA_ENTRADA, DATA_CHEGADA, NUMERO_NOTA, ID_FORNECEDOR, STATUS, OUTROS, DESCONTO, ');
      query.SQl.Add(' FRETE, VALOR_NOTA, ID_USUARIO, SERIE, CHAVE_NFE, TP_NF, VALOR_TOTAL_NOTA, QTD_PROD  ');
      query.SQl.Add(' )  ');
      query.SQl.Add(' VALUES ');
      query.SQl.Add(' (  ');
      query.SQl.Add(' :ID, :DATA_PEDIDO, :DATA_ENTRADA, :DATA_CHEGADA, :NUMERO_NOTA, :ID_FORNECEDOR, :STATUS, :OUTROS, :DESCONTO, ');
      query.SQl.Add(' :FRETE, :VALOR_NOTA, :ID_USUARIO, :SERIE, :CHAVE_NFE, :TP_NF, :VALOR_TOTAL_NOTA, :QTD_PROD ');
      query.SQl.Add(' ) ');

      query.Params.ParamByName('ID').AsInteger             := IdPedido;
      query.Params.ParamByName('DATA_PEDIDO').AsDate       := frmEntradaXML.qryNFeDATA_EMISSAO.AsDateTime;
      query.Params.ParamByName('DATA_ENTRADA').AsDate      := Date;
      query.Params.ParamByName('DATA_CHEGADA').AsDate      := frmEntradaXML.qryNFeDATA_REC.AsDateTime;
      query.Params.ParamByName('NUMERO_NOTA').AsInteger    := frmEntradaXML.qryNFeNUMERO.AsInteger;
      query.Params.ParamByName('ID_FORNECEDOR').AsInteger  := fornecedor.ID;
      query.Params.ParamByName('STATUS').AsString          := Copy(frmEntradaXML.qryNFeSITUACAO.AsString,1,1);
      query.Params.ParamByName('OUTROS').AsFloat           := 0.00;
      query.Params.ParamByName('DESCONTO').AsFloat         := 0.00;
      query.Params.ParamByName('FRETE').AsFloat            := 0.00;
      query.Params.ParamByName('VALOR_NOTA').AsFloat       := frmEntradaXML.qryNFeVALOR_TOTAL.AsFloat;
      query.Params.ParamByName('ID_USUARIO').AsInteger     := frmPrincipal.idUser;
      query.Params.ParamByName('SERIE').AsString           := frmEntradaXML.qryNFeSERIE.AsString;
      query.Params.ParamByName('CHAVE_NFE').AsString       := frmEntradaXML.qryNFeCHAVE_ACESSO.AsString;
      query.Params.ParamByName('TP_NF').AsString           := frmEntradaXML.qryNFeTIPO_OPERACAO.AsString;
      query.Params.ParamByName('VALOR_TOTAL_NOTA').AsFloat := frmEntradaXML.qryNFeVALOR_TOTAL.AsFloat;
      query.Params.ParamByName('QTD_PROD').AsInteger       := qryItens.RecordCount;

      query.ExecSQL;

      qryItens.First;
      id := 1;

      while Not(qryItens.Eof) do Begin

         query := TFDQuery.Create(transacao);
         query.Connection := frmPrincipal.ConexaoLocal;

         query.SQl.Add(' INSERT INTO nota_entrada_detalhe ');
         query.SQl.Add(' (   ');
         query.SQl.Add(' ID_CABECALHO, ID_PRODUTO, SEQUENCIA, QTREAL, VL_UNITARIO, VL_FRETE, VL_IPI, ');
         query.SQl.Add(' VL_ICMS, VL_DESCONTO, VL_ICMS_SUBST, VL_ISENTO, VL_PIS, VL_COFINS, VL_SEGURO,  ');
         query.SQl.Add(' VL_OUTROS, CODIGO_ORIGEM, UND, FATOR_UNIDADE, PROD_ID_UNIDADE_PRODUTO, ');
         query.SQl.Add(' PROD_ID_UNIDADE_ENTRADA, PROD_DESCRICAO, PROD_VALOR_VENDA  ');
         query.SQl.Add(' )  ');
         query.SQl.Add(' VALUES ');
         query.SQl.Add(' (  ');
         query.SQl.Add(' :ID_CABECALHO, :ID_PRODUTO, :SEQUENCIA, :QTREAL, :VL_UNITARIO, :VL_FRETE, :VL_IPI, ');
         query.SQl.Add(' :VL_ICMS, :VL_DESCONTO, :VL_ICMS_SUBST, :VL_ISENTO, :VL_PIS, :VL_COFINS, :VL_SEGURO, ');
         query.SQl.Add(' :VL_OUTROS, :CODIGO_ORIGEM, :UND, :FATOR_UNIDADE, :PROD_ID_UNIDADE_PRODUTO,  ');
         query.SQl.Add(' :PROD_ID_UNIDADE_ENTRADA, :PROD_DESCRICAO, :PROD_VALOR_VENDA  ');
         query.SQl.Add(' ) ');

         query.Params.ParamByName('ID_CABECALHO').AsInteger       := IdPedido;

         if qryItensCalcCodigo.AsString <> 'PRODUTO NOVO' then
            query.Params.ParamByName('ID_PRODUTO').AsInteger   := qryItensID_PRODUTO.AsInteger
         else
            query.Params.ParamByName('ID_PRODUTO').AsInteger   := InserirProduto(IdPedido);

         query.Params.ParamByName('SEQUENCIA').AsInteger               := id;
         query.Params.ParamByName('QTREAL').AsFloat                    := qryItensQTREAL.AsFloat;
         query.Params.ParamByName('VL_UNITARIO').AsFloat               := qryItensVL_UNITARIO.AsFloat;
         query.Params.ParamByName('VL_FRETE').AsFloat                  := qryItensVL_FRETE.AsFloat;
         query.Params.ParamByName('VL_IPI').AsFloat                    := qryItensVL_IPI.AsFloat;
         query.Params.ParamByName('VL_ICMS').AsFloat                   := qryItensVL_ICMS.AsFloat;
         query.Params.ParamByName('VL_DESCONTO').AsFloat               := qryItensVL_DESCONTO.AsFloat;
         query.Params.ParamByName('VL_ICMS_SUBST').AsFloat             := qryItensVL_ICMS_SUBST.AsFloat;
         query.Params.ParamByName('VL_ISENTO').AsFloat                 := qryItensVL_ISENTO.AsFloat;
         query.Params.ParamByName('VL_PIS').AsFloat                    := qryItensVL_PIS.AsFloat;
         query.Params.ParamByName('VL_COFINS').AsFloat                 := qryItensVL_COFINS.AsFloat;
         query.Params.ParamByName('VL_SEGURO').AsFloat                 := qryItensVL_SEGURO.AsFloat;
         query.Params.ParamByName('VL_OUTROS').AsFloat                 := qryItensVL_OUTROS.AsFloat;
         query.Params.ParamByName('CODIGO_ORIGEM').AsString            := qryItensCODIGO_ORIGEM.AsString;
         query.Params.ParamByName('PROD_DESCRICAO').AsString           := qryItensDESCRICAO_ORIGEM.AsString;
         query.Params.ParamByName('UND').AsString                      := qryItensUND.AsString;
         query.Params.ParamByName('FATOR_UNIDADE').AsFloat             := qryItensFATOR_UNIDADE.AsFloat;
         query.Params.ParamByName('PROD_ID_UNIDADE_PRODUTO').AsInteger := qryItensPROD_ID_UNIDADE_PRODUTO.AsInteger;
         query.Params.ParamByName('PROD_ID_UNIDADE_ENTRADA').AsInteger := qryItensPROD_ID_UNIDADE_ENTRADA.AsInteger;
         query.Params.ParamByName('PROD_VALOR_VENDA').AsFloat          := qryItensPROD_VALOR_VENDA.AsFloat;

         query.ExecSQL;

         TBaseLocalProdutosController.GravarMovimetacaoProduto(qryItensID_PRODUTO.AsInteger,
                                                               (qryItensQTREAL.AsFloat*qryItensFATOR_UNIDADE.AsFloat),
                                                               qryItensFATOR_UNIDADE.AsFloat,
                                                               'C',
                                                               qryItensPROD_ID_UNIDADE_ENTRADA.asinteger,
                                                               IdPedido,
                                                               fornecedor.ID,
                                                               qryItensPROD_VALOR_VENDA.AsFloat);

         inc(id);

         query.Free;

         qryItens.Next;

      End;

      query := TFDQuery.Create(transacao);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Clear;
      query.SQL.Add(' UPDATE MANIFESTACAO_NFE SET importada = ''S'' WHERE codigo = '+frmEntradaXML.qryNFeCODIGO.AsString);
      query.ExecSQL;

      transacao.Commit;
      frmEntradaXML.qryNFe.Refresh;

      prcMsgInf('Entrada de Nota realizada com sucesso.');
      frmEntradaXML.NotaJaCadastrada;
      close;

   Except

      on e:exception do Begin
         transacao.Rollback;
         prcMsgAdv('Falha ao inserir a nota fiscal.'+#13+e.Message);
      End;

   End;

end;

procedure TfrmImportarXML.Image1Click(Sender: TObject);
begin

   AlterarProduto;

end;

procedure TfrmImportarXML.Image2Click(Sender: TObject);
begin

   AlterarUnidadeProduto;

end;

procedure TfrmImportarXML.Image3Click(Sender: TObject);
begin

   close;

end;

procedure TfrmImportarXML.Image4Click(Sender: TObject);
begin

   AlterarUnidadeEntrada;

end;

procedure TfrmImportarXML.Image5Click(Sender: TObject);
begin

   AlterarPreco;

end;

procedure TfrmImportarXML.ImportarProdutos(chave: String);
var
   vXMLDoc: TXMLDocument;

   NODE_protNFe,
   NODE_infProt,
   NODE_ide,
   NODE_emit,
   NODE_total,
   NODE_ICMSTot,
   NODE_cobr,
   NODE_det,
   NODE_imposto,
   NODE_ICMS,
   NODE_ICMS40,
   NODE_prod: IXMLNode;

   Produtos: TBaseLocalProdutosVO;
   ListaProdutos: TObjectList<TBaseLocalProdutosVO>;
   NotaEntradaCabeca: TNotaEntradaCabecalhoVO;
   NotaEntradaItens: TNotaEntradaDetalheVO;
   ListaNotaEntradaItens: TObjectList<TNotaEntradaDetalheVO>;

   I: Integer;

begin

   vXMLDoc := TXMLDocument.Create(self);
   vXMLDoc.Active := True;

   Application.ProcessMessages;

   Try
      vXMLDoc.LoadFromFile(ExtractFilePath(Application.ExeName)+'XML_NF_ENTRADA\'+chave+'-nfe.xml');
   Except
      on e:exception do Begin
         prcMsgAdv('Não foi possível carregar o XML da pasta.'+#13+'Motivo: '+e.Message);
         Abort;
      End;
   End;

   NotaEntradaCabeca := TNotaEntradaCabecalhoVO.Create;

   //Versão e chave
   NODE_protNFe := vXMLDoc.DocumentElement.ChildNodes.FindNode('protNFe');
   NODE_protNFe.ChildNodes.First;

   NODE_infProt := NODE_protNFe.ChildNodes['infProt'];
   NODE_infProt.ChildNodes.First;

   NotaEntradaCabeca.CHAVE_NFE := NODE_infProt.ChildNodes['chNFe'].Text;

   // Identificação da NF
   NODE_ide := vXMLDoc.DocumentElement.ChildNodes.First.ChildNodes.First.ChildNodes.FindNode('ide');
   NODE_ide.ChildNodes.First;

   NotaEntradaCabeca.NUMERO_NOTA := (NODE_ide.ChildNodes['nNF'].Text);
   NotaEntradaCabeca.SERIE := NODE_ide.ChildNodes['serie'].Text;

   NotaEntradaCabeca.DATA_PEDIDO := StrToDate(Copy(NODE_ide.ChildNodes['dhEmi'].Text,9,2) + '/' +
                                    Copy(NODE_ide.ChildNodes['dhEmi'].Text,6,2) + '/' + Copy(NODE_ide.ChildNodes['dhEmi'].Text,1,4));

   //Emitente
   NODE_emit := vXMLDoc.DocumentElement.ChildNodes.First.ChildNodes.First.ChildNodes.FindNode('emit');
   NODE_emit.ChildNodes.First;

   fornecedor := TFornecedoresVO.Create;

   fornecedor.CPF_CNPJ           := Trim(NODE_emit.ChildNodes['CNPJ'].Text);
   fornecedor.NOME               := UpperCase(Trim(NODE_emit.ChildNodes['xNome'].Text));
   fornecedor.FANTASIA           := UpperCase(Trim(NODE_emit.ChildNodes['xFant'].Text));
   fornecedor.INSCRICAO_ESTADUAL := Trim(NODE_emit.ChildNodes['IE'].Text);
   fornecedor.LOGRADOURO         := UpperCase(Trim(NODE_emit.ChildNodes['enderEmit'].ChildNodes['xLgr'].Text));
   fornecedor.NUMERO             := Trim(NODE_emit.ChildNodes['enderEmit'].ChildNodes['nro'].Text);
   fornecedor.BAIRRO             := UpperCase(Trim(NODE_emit.ChildNodes['enderEmit'].ChildNodes['xBairro'].Text));
   fornecedor.CODIGO_IBGE_CIDADE := StrToInt(NODE_emit.ChildNodes['enderEmit'].ChildNodes['cMun'].Text);
   fornecedor.CODIGO_IBGE_UF     := StrToInt(Copy(NODE_emit.ChildNodes['enderEmit'].ChildNodes['cMun'].Text,1,2));
   fornecedor.UF                 := UpperCase(Trim(NODE_emit.ChildNodes['enderEmit'].ChildNodes['UF'].Text));
   fornecedor.CEP                := Trim(NODE_emit.ChildNodes['enderEmit'].ChildNodes['CEP'].Text);
   fornecedor.CELULAR            := Copy(SoNumero(Trim(NODE_emit.ChildNodes['enderEmit'].ChildNodes['fone'].Text)),1,11);
   fornecedor.CIDADE             := UpperCase(Trim(NODE_emit.ChildNodes['enderEmit'].ChildNodes['xMun'].Text));

   // Total
   NODE_total := vXMLDoc.DocumentElement.ChildNodes.First.ChildNodes.First.ChildNodes.FindNode('total');
   NODE_total.ChildNodes.First;
   NODE_ICMSTot := NODE_total.ChildNodes['ICMSTot'];
   NotaEntradaCabeca.VALOR_NOTA := StringParaFloat(fctTransformPontoEmVirgula(NODE_ICMSTot.ChildNodes['vNF'].Text));

   ListaProdutos := TObjectList<TBaseLocalProdutosVO>.Create;
   ListaNotaEntradaItens := TObjectList<TNotaEntradaDetalheVO>.Create;

   NODE_det := vXMLDoc.DocumentElement.ChildNodes.First.ChildNodes.First.ChildNodes.FindNode('det');
   NODE_det.ChildNodes.First;

   Try
      NODE_imposto := NODE_det.ChildNodes['imposto'].ChildNodes['ICMS'].ChildNodes[0];
      //NODE_imposto := NODE_det.ChildNodes['imposto'].ChildNodes.First;
      //NODE_imposto := NODE_det.ChildNodes['imposto'].ChildNodes[0].ChildNodes[0];
   Except
      NODE_imposto := NODE_det.ChildNodes['imposto'].ChildNodes[0].ChildNodes[0];
   End;

   if NotaEntradaCabeca.NUMERO_NOTA.ToInteger > 0 then begin

      Repeat

       Produtos := TBaseLocalProdutosVO.Create;
       Produtos.unidade := TBaseLocalUnidadesVO.Create;

       NotaEntradaItens := TNotaEntradaDetalheVO.Create;

       NODE_prod := NODE_det.ChildNodes['prod'];

       if Trim(NODE_prod.ChildNodes['cProd'].Text) <> '' then Begin

         NotaEntradaItens.CODIGO_ORIGEM := NODE_prod.ChildNodes['cProd'].Text;
         NotaEntradaItens.UND := NODE_prod.ChildNodes['uCom'].Text;
         NotaEntradaItens.GTIN := NODE_prod.ChildNodes['cEAN'].Text;
         NotaEntradaItens.PROD_DESCRICAO := Trim(NODE_prod.ChildNodes['xProd'].Text);

         Produtos.codigo_barras := Trim(NODE_prod.ChildNodes['cEAN'].Text);
         Produtos.descricao := Trim(NODE_prod.ChildNodes['xProd'].Text);

         if Length(Trim(NODE_prod.ChildNodes['qCom'].Text)) > 0 then
            NotaEntradaItens.QTREAL := StrToFloat(fctTransformPontoEmVirgula(NODE_prod.ChildNodes['qCom'].Text))
         else
            NotaEntradaItens.QTREAL := 0.00;

         if Length(Trim(NODE_prod.ChildNodes['vDesc'].Text)) > 0 then
            NotaEntradaItens.VL_DESCONTO := StrToFloat(fctTransformPontoEmVirgula(NODE_prod.ChildNodes['vDesc'].Text))
          else
            NotaEntradaItens.VL_DESCONTO := 0.00;

        if Length(Trim(NODE_prod.ChildNodes['vOutro'].Text)) > 0 then
           NotaEntradaItens.VL_OUTROS := StrToFloat(fctTransformPontoEmVirgula(NODE_prod.ChildNodes['vOutro'].Text))
        else
           NotaEntradaItens.VL_OUTROS := 0.00;

        if Length(Trim(NODE_prod.ChildNodes['vProd'].Text)) > 0 then
           NotaEntradaItens.VL_UNITARIO := StrToFloat(fctTransformPontoEmVirgula(NODE_prod.ChildNodes['vProd'].Text))
        else
           NotaEntradaItens.VL_UNITARIO := 0.00;

        if Length(Trim(NODE_prod.ChildNodes['vFrete'].Text)) > 0 then
           NotaEntradaItens.VL_FRETE := StrToFloat(fctTransformPontoEmVirgula(NODE_prod.ChildNodes['vFrete'].Text))
        else
           NotaEntradaItens.VL_FRETE := 0.00;

        if Length(Trim(NODE_prod.ChildNodes['vSeg'].Text)) > 0 then
           NotaEntradaItens.VL_SEGURO := StrToFloat(fctTransformPontoEmVirgula(NODE_prod.ChildNodes['vSeg'].Text))
        else
           NotaEntradaItens.VL_SEGURO := 0.00;


        //IMPOSTOS
        Try

          //Valor ICMS
           if Length(Trim(NODE_imposto.ChildNodes['vICMS'].Text)) > 0 then
              NotaEntradaItens.VL_ICMS := StrToFloat(fctTransformPontoEmVirgula(NODE_imposto.ChildNodes['vICMS'].Text))
           else
              NotaEntradaItens.VL_ICMS := 0.00;


           //Valor ICMS Substituição
           if Length(Trim(NODE_imposto.ChildNodes['vICMSST'].Text)) > 0 then
              NotaEntradaItens.VL_ICMS_SUBST := StrToFloat(fctTransformPontoEmVirgula(NODE_imposto.ChildNodes['vICMSST'].Text))
           else
              NotaEntradaItens.VL_ICMS_SUBST := 0.00;

        Except
        end;

        //IPI
        Try
           NODE_imposto := NODE_det.ChildNodes['imposto'].ChildNodes['IPI'].ChildNodes['IPITrib'];

           //Valor IPI
           if Length(Trim(NODE_imposto.ChildNodes['vIPI'].Text)) > 0 then
              NotaEntradaItens.VL_IPI := StrToFloat(fctTransformPontoEmVirgula(NODE_imposto.ChildNodes['vIPI'].Text))
           else
              NotaEntradaItens.VL_IPI := 0.00;

        Except
        end;

        //PIS
        Try
           NODE_imposto := NODE_det.ChildNodes['imposto'].ChildNodes['PIS'].ChildNodes[0];

           //Valor PIS
           if Length(Trim(NODE_imposto.ChildNodes['vPIS'].Text)) > 0 then
              NotaEntradaItens.VL_PIS := StrToFloat(fctTransformPontoEmVirgula(NODE_imposto.ChildNodes['vPIS'].Text))
           else
              NotaEntradaItens.VL_PIS := 0.00;

        Except
        end;

        //COFINS
        Try
           NODE_imposto := NODE_det.ChildNodes['imposto'].ChildNodes['COFINS'].ChildNodes[0];

           if Length(Trim(NODE_imposto.ChildNodes['vCOFINS'].Text)) > 0 then
              NotaEntradaItens.VL_COFINS := StrToFloat(fctTransformPontoEmVirgula(NODE_imposto.ChildNodes['vCOFINS'].Text))
           else
              NotaEntradaItens.VL_COFINS := 0.00;
        Except
        end;

        ListaProdutos.Add(Produtos);
        ListaNotaEntradaItens.Add(NotaEntradaItens);

       End;

       NODE_det := NODE_det.NextSibling;

     Until NODE_det = nil;

   end;

   qryItens.Close;
   qryItens.Open;

   for I := 0 to ListaNotaEntradaItens.Count - 1 do Begin

      qryItens.Append;

      qryItensSEQUENCIA.AsInteger       := i + 1;
      qryItensQTREAL.AsFloat            := ListaNotaEntradaItens.Items[i].QTREAL;
      qryItensVL_UNITARIO.AsFloat       := ListaNotaEntradaItens.Items[i].VL_UNITARIO;
      qryItensVL_FRETE.AsFloat          := ListaNotaEntradaItens.Items[i].VL_FRETE;
      qryItensVL_IPI.AsFloat            := ListaNotaEntradaItens.Items[i].VL_IPI;
      qryItensVL_DESCONTO.AsFloat       := ListaNotaEntradaItens.Items[i].VL_DESCONTO;
      qryItensVL_ICMS.AsFloat           := ListaNotaEntradaItens.Items[i].VL_ICMS;
      qryItensVL_ICMS_SUBST.AsFloat     := ListaNotaEntradaItens.Items[i].VL_ICMS_SUBST;
      qryItensVL_ISENTO.AsFloat         := ListaNotaEntradaItens.Items[i].VL_ISENTO;
      qryItensVL_COFINS.AsFloat         := ListaNotaEntradaItens.Items[i].VL_COFINS;
      qryItensVL_PIS.AsFloat            := ListaNotaEntradaItens.Items[i].VL_PIS;
      qryItensVL_SEGURO.AsFloat         := ListaNotaEntradaItens.Items[i].VL_SEGURO;
      qryItensVL_OUTROS.AsFloat         := ListaNotaEntradaItens.Items[i].VL_OUTROS;
      qryItensCODIGO_ORIGEM.AsString    := Trim(ListaNotaEntradaItens.Items[i].CODIGO_ORIGEM);
      qryItensGTIN.AsString             := ListaNotaEntradaItens.Items[i].GTIN;
      qryItensFATOR_UNIDADE.AsFloat     := ListaNotaEntradaItens.Items[i].FATOR_UNIDADE;
      qryItensDESCRICAO_ORIGEM.AsString := Trim(ListaProdutos.Items[i].descricao);
      qryItensUND.AsString              := Trim(ListaNotaEntradaItens[i].UND);
      qryItenscalcUnidadeEntrada.AsString := 'PENDENTE';

      if Not(VerificarSeProdutoJaCadastrado(fornecedor.CPF_CNPJ, Trim(ListaNotaEntradaItens.Items[i].CODIGO_ORIGEM))) then Begin
         qryItensCalcCodigo.AsString := 'PRODUTO NOVO';
         qryItenscalUnidadeProd.AsString  := 'PENDENTE';
         qryItensPROD_VALOR_VENDA.AsFloat := 0.00;
         qryItensPROD_DESCRICAO.AsString := Trim(ListaNotaEntradaItens[i].PROD_DESCRICAO);
      End;

      qryItens.Post;

   End;

   qryItens.Open;
   qryItens.First;

   lblQtdeItens.Caption := 'Total de Produtos: '+qryItens.RecordCount.ToString;

   {// Movendo
   Try
   prcMoveDir(edtXML_Origem.Text  + '\' + Trim(chNFe) +'.xml',
              edtXML_Destino.Text + '\' + Trim(chNFe) +'.xml');
   except
   end;

   // Movendo
   Try
   prcMoveDir(edtXML_Origem.Text  + '\' + Trim(chNFe) + '-nfe' + '.xml',
              edtXML_Destino.Text + '\' + Trim(chNFe) + '-nfe' + '.xml');
   except
   end;

   end else begin
      prcMsgAdv('Nota de entrada de Nº ' + IntToStr(IdeNNF) + ' inválida!');
   end;
   }


END;

function TfrmImportarXML.InserirProduto(idCabeca: integer): integer;
Var query: TFDQuery;
    idProduto: integer;
begin

   Try

     Try

       query := TFDQuery.Create(Nil);
       query.Connection := frmPrincipal.ConexaoLocal;

        query.SQL.Add('SELECT gen_id(GEN_PRODUTOS_ID, 1) AS id from rdb$database;');
        query.Open;

        idProduto := query.FieldByName('id').AsInteger;

        query.Close;
        query.SQL.Clear;
        query.SQL.Add(' INSERT INTO produtos ');
        query.SQL.Add(' (  ');
        query.SQL.Add(' ID, STATUS, DESCRICAO, QTDE_ESTOQUE, REFERENCIA, ');
        query.SQL.Add(' ID_UNIDADE, CODIGO_BARRAS, VALOR_UNITARIO, IMPRIMIR_COZINHA ');
        query.SQL.Add(' )  ');
        query.SQL.Add(' VALUES  ');
        query.SQL.Add(' (  ');
        query.SQL.Add(' :ID, :STATUS, :DESCRICAO, :QTDE_ESTOQUE, :REFERENCIA, ');
        query.SQL.Add(' :ID_UNIDADE, :CODIGO_BARRAS, :VALOR_UNITARIO, :IMPRIMIR_COZINHA ');
        query.SQL.Add(' )  ');

        query.Params.ParamByName('ID').AsInteger              := idProduto;
        query.Params.ParamByName('STATUS').AsString           := 'A';
        query.Params.ParamByName('DESCRICAO').AsString        := UpperCase(Trim(qryItensDESCRICAO_ORIGEM.AsString));
        query.Params.ParamByName('REFERENCIA').AsString       := UpperCase(Trim(qryItensCODIGO_ORIGEM.AsString));
        query.Params.ParamByName('ID_UNIDADE').AsInteger      := qryItensPROD_ID_UNIDADE_PRODUTO.AsInteger;
        query.Params.ParamByName('CODIGO_BARRAS').AsString    := Trim(qryItensGTIN.AsString);
        query.Params.ParamByName('QTDE_ESTOQUE').AsFloat      := 0.00;
        query.Params.ParamByName('VALOR_UNITARIO').AsFloat    := qryItensPROD_VALOR_VENDA.AsFloat;
        query.Params.ParamByName('IMPRIMIR_COZINHA').AsString := 'N';

        query.ExecSQL;

        query.Close;
        query.SQL.Clear;
        query.SQL.Add(' INSERT INTO produto_fornecedor  ');
        query.SQL.Add(' (  ');
        query.SQL.Add(' CNPJ, ID_PRODUTO_ORIGEM, ID_PRODUTO, DATA_VINCULO, ID_NOTA_VINCULO ');
        query.SQL.Add(' ) ');
        query.SQL.Add(' VALUES ');
        query.SQL.Add(' (  ');
        query.SQL.Add(' :CNPJ, :ID_PRODUTO_ORIGEM, :ID_PRODUTO, :DATA_VINCULO, :ID_NOTA_VINCULO ');
        query.SQL.Add(' ) ');

        query.Params.ParamByName('CNPJ').AsString               := fornecedor.CPF_CNPJ;
        query.Params.ParamByName('ID_PRODUTO_ORIGEM').AsString  := qryItensCODIGO_ORIGEM.AsString;
        query.Params.ParamByName('ID_PRODUTO').AsInteger        := idProduto;
        query.Params.ParamByName('DATA_VINCULO').Asdate         := Date;
        query.Params.ParamByName('ID_NOTA_VINCULO').AsInteger   := idCabeca;
        query.ExecSQL;

        qryItens.Edit;
        qryItensID_PRODUTO.AsInteger := idProduto;
        qryItens.Post;

        Result := idProduto;

     Except

        ON E:EXCEPTION DO BEGIN
           RaiSE Exception.Create(E.Message);
        END;

     End;

   Finally

      FreeAndNil(query)

   End;

end;

function TfrmImportarXML.RetornarUnidadeComFator(id: integer): String;
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add(' SELECT sigla, fator FROM unidade_produtos WHERE id = '+id.ToString);
      query.Open;

      if Not(query.IsEmpty) then
         Result := Trim(query.FieldByName('sigla').AsString)+' ('+
                   FormatFloat('#0.00', query.FieldByName('fator').Asfloat)+')';

   Finally

      FreeAndNil(query)

   End;

end;

procedure TfrmImportarXML.SpeedButton1Click(Sender: TObject);
begin

   GravarNota;

end;

procedure TfrmImportarXML.ValoresPadro1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmPadraoImpXml, frmPadraoImpXml);
   frmPadraoImpXml.ShowModal;
end;

function TfrmImportarXML.VerificarSeProdutoJaCadastrado(fornecedor, produto: String): Boolean;
Var query: TFDQuery;
    unidade: TBaseLocalUnidadesVO;
begin

   Try

      Result := False;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT p.id, ');
      query.SQL.Add('        p.descricao, ');
      query.SQL.Add('        p.id_unidade, ');
      query.SQL.Add('        u.sigla,  ');
      query.SQL.Add('        p.valor_unitario, ');
      query.SQL.Add('        u.fator ');
      query.SQL.Add('   FROM produto_fornecedor pf inner join produtos p ON pf.id_produto = p.id  ');
      query.SQL.Add('                              inner join unidade_produtos u ON p.id_unidade = u.id  ');
      query.SQL.Add('  WHERE pf.cnpj = :cnpj AND pf.id_produto_origem = :id_origem ');

      query.Params.ParamByName('cnpj').AsString      := fornecedor;
      query.Params.ParamByName('id_origem').AsString := produto;

      query.Open;

      if Not(query.IsEmpty) then Begin

         qryItensID_PRODUTO.AsInteger              := query.FieldByName('id').AsInteger;
         qryItensPROD_ID_UNIDADE_PRODUTO.AsInteger := query.FieldByName('id_unidade').AsInteger;
         qryItensFATOR_UNIDADE.AsInteger           := query.FieldByName('fator').AsInteger;
         qryItensPROD_DESCRICAO.AsString           := Trim(query.FieldByName('descricao').AsString);
         qryItensPROD_VALOR_VENDA.AsFloat          := query.FieldByName('valor_unitario').AsFloat;

         unidade := TBaseLocalUnidadesController.RetornarUnidadeporID(query.FieldByName('id_unidade').AsInteger);
         qryItenscalUnidadeProd.AsString           := unidade.sigla +' (x'+ FormatFloat('#0.00', unidade.fator)+')';

         Result := True;

      End;

   Finally

      FreeAndNil(query);

   End;

end;

end.
