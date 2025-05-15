{

STATUS VENDA: 0: CAIXA LIBERADO
              1: EM ANDAMENTO

}

unit untPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, untPrincipal,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.Mask, JvExMask,BaseLocalProdutosController,
  JvToolEdit, JvBaseEdits, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, acbrUtil, pcnConversao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, unitConfiguracoes,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, untBiblioteca,
  Vcl.DBCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCGrids, pcnConversaoNFe,
  JvExStdCtrls, JvEdit, JvValidateEdit, PedidoProdutosVO, PedidoProdutosController,
  Datasnap.DBClient, Datasnap.Provider, JvExExtCtrls, JvExtComponent, JvClock,
  JvPanel, ACBrNFeDANFEClass, ACBrNFeDANFeRLClass, ACBrDFeReport, System.DateUtils,
  ACBrDFeDANFeReport, ACBrNFeDANFeESCPOS, ACBrBase, ACBrDFe, ACBrNFe, BaseLocalFormasPagamentoController,
  ACBrSATExtratoClass, ACBrSATExtratoESCPOS, ACBrDANFCeFortesFr, BaseLocalClientesController,BaseLocalClientesVO,
  ACBrValidador,untIntegracaoFidelidade, ACBrDANFCeFortesFrA4;

type
  TfrmPedidos = class(TForm)
    pnlPrincipal: TPanel;
    Button4: TButton;
    Button3: TButton;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    Label1: TLabel;
    edtCodigo: TEdit;
    dtsItens: TDataSource;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    lblTotal: TLabel;
    Panel2: TPanel;
    lblVlUnitario: TLabel;
    Panel3: TPanel;
    lblVlTotal: TLabel;
    Panel4: TPanel;
    lblSubtotal: TLabel;
    Panel5: TPanel;
    lblTotalDesconto: TLabel;
    Panel6: TPanel;
    lblProduto: TLabel;
    edtQuantidade: TJvValidateEdit;
    Panel7: TPanel;
    lblTempoAberto: TLabel;
    TempoAberto: TTimer;
    lblMensagemVenda: TPanel;
    lblCliente: TLabel;
    lblCPFCNPJ: TLabel;
    lblNomeCliente: TLabel;
    lblCPFCNPJCliente: TLabel;
    Panel8: TPanel;
    lblHora: TLabel;
    lblNomeFuncionario: TLabel;
    lblFuncionario: TLabel;
    pnlBlend: TPanel;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Panel9: TPanel;
    Label2: TLabel;
    Panel10: TPanel;
    lblUserLogado: TLabel;
    Panel11: TPanel;
    lblCaixa: TLabel;
    lblMovimento: TPanel;
    ClientDataSet1ClientDataSet: TClientDataSet;
    ClientDataSet1StringField: TStringField;
    ClientDataSet1StringField2: TStringField;
    ClientDataSet1StringField3: TStringField;
    ClientDataSet1FloatField: TFloatField;
    ClientDataSet1StringField4: TStringField;
    ClientDataSet1FloatField2: TFloatField;
    ClientDataSet1FloatField3: TFloatField;
    ClientDataSet1IntegerField: TIntegerField;
    ClientDataSet1StringField5: TStringField;
    ClientDataSet1FloatField4: TFloatField;
    qryItens: TClientDataSet;
    ClientDataSet1ClientDataSet2: TClientDataSet;
    ClientDataSet1StringField6: TStringField;
    ClientDataSet1StringField7: TStringField;
    ClientDataSet1StringField8: TStringField;
    ClientDataSet1FloatField5: TFloatField;
    ClientDataSet1StringField9: TStringField;
    ClientDataSet1FloatField6: TFloatField;
    ClientDataSet1FloatField7: TFloatField;
    ClientDataSet1IntegerField2: TIntegerField;
    ClientDataSet1StringField10: TStringField;
    ClientDataSet1FloatField8: TFloatField;
    qryItensdescricao: TStringField;
    qryItensgtin: TStringField;
    qryItensitem: TStringField;
    qryItensqtde: TFloatField;
    qryItensunidade: TStringField;
    qryItensvlUnit: TFloatField;
    qryItensvlTotal: TFloatField;
    qryItensidProduto: TIntegerField;
    qryItensobservacao: TStringField;
    qryItenspromocao: TStringField;
    lblPromocao: TLabel;
    Image11: TImage;
    ACBrNFe: TACBrNFe;
    ACBrValidador1: TACBrValidador;
    lblErroNFce: TLabel;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsItensDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure TempoAbertoTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Image10Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    var tempo: TTime;
  public
    { Public declarations }
    Var statuVenda, id, idCliente, idFuncionario, idPedido, idFidelidade: integer;
        total, desconto, acrescimo: double;
        fecharTela: boolean;
        Configuracao: TLancamentos;
        obsFidelidade: string;
        queryParametros: TFDQuery;

    procedure Confirmar(produto: TPedidoProdutosVO);
    procedure PesquisarProdutoPeloCodigo(codigo: String);
    Function RetornarPromocao(idProduto: integer): Double;
    procedure ConsultarProduto;
    procedure DescontoAcrescimo;
    Procedure Cronometro;
    procedure Totalizadores;
    procedure CancelarVendaAtual(msg: boolean);
    procedure CancelarItem(item: integer);
    procedure LimparTela;
    procedure IdentificarCliente;
    procedure IdentificarVendedor;
    procedure FinalizarVenda;
    procedure MenuPrincipal;
    function Fechar: Boolean;
    procedure HabilitarTelaAzul;
    procedure DesabilitarTelaAzul;
    procedure GerarNFCe(valorVenda: double; idVenda:integer);
    //procedure GerarMFe(valorVenda: double; idVenda:integer);
    procedure InicializarNFCe;



  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses untPesquisarProdutos, untPesquisarClientes, untPesquisarFuncionarios,
     untPesquisarFormaPG, untDescontoAcrescimo, untCancelamentoItem,
  untFinalizarVenda, untMenuPrincipal, untObservacao, untMovimentacaoCaixa,
  untTelaAzul, untConsultarFidelidade;

procedure TfrmPedidos.BitBtn1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPedidos.Button2Click(Sender: TObject);
begin

   Application.CreateForm(TfrmPesquisarClientes, frmPesquisarClientes);
   frmPesquisarClientes.Show;

end;

procedure TfrmPedidos.Button3Click(Sender: TObject);
begin

   Application.CreateForm(TfrmPesquisarFormaPG, frmPesquisarFormaPG);
   frmPesquisarFormaPG.Show;

end;

procedure TfrmPedidos.Button4Click(Sender: TObject);
begin

   Application.CreateForm(TfrmPesquisarFuncionarios, frmPesquisarFuncionarios);
   frmPesquisarFuncionarios.ShowModal;

end;

procedure TfrmPedidos.CancelarItem(item: integer);
begin

   if qryItens.IsEmpty then Begin
      prcMsgAdv('Não existem ítens a serem cancelados.');
      Exit;
   End;

   HabilitarTelaAzul;
   Application.CreateForm(TfrmCancelamentoItem, frmCancelamentoItem);
   frmCancelamentoItem.showmodal;
   DesabilitarTelaAzul;

end;

procedure TfrmPedidos.CancelarVendaAtual(msg: boolean);
begin

   if msg then Begin

      if qryItens.IsEmpty then Begin

         prcMsgAdv('Não existe venda em andamento.');
         Exit;

      End;

      if fctMsgConfirmDefaultButtonYes('Confirma o cancelamento da venda atual?') = false then
         Exit;

   End;

   statuVenda := 0;
   obsFidelidade := '';

   LimparTela;
   Totalizadores;

   qryItens.Open;
   qryItens.EmptyDataSet;
   qryItens.Close;
   qryItens.Open;

   edtCodigo.SetFocus;

end;

procedure TfrmPedidos.Confirmar(produto: TPedidoProdutosVO);
Var query: TFDQuery;
begin

   if frmPrincipal.qryProdutosID.AsInteger < 0 then Begin

         Try

            query := TFDQuery.Create(Nil);
            query.Connection := frmPrincipal.ConexaoLocal;

            query.SQL.Add(' SELECT p.id, ');
            query.SQL.Add('        p.CODIGO_BARRAS, ');
            query.SQL.Add('        p.descricao, ');
            query.SQL.Add('        u.sigla, ');
            query.SQL.Add('        u.fator, ');
            query.SQL.Add('        k.valor, ');
            query.SQL.Add('        k.quantidade ');
            query.SQL.Add('   FROM kit_produto_detalhe k, ');
            query.SQL.Add('        produtos p, ');
            query.SQL.Add('        unidade_produtos u ');
            query.SQL.Add('  WHERE k.id_produto = p.id ');
            query.SQL.Add('    AND p.id_unidade = u.id ');
            query.SQL.Add('    AND k.id_kit_cabecalho = '+IntToStr(frmPrincipal.qryProdutosID.AsInteger*-1));
            query.Open;

            while Not(query.Eof) do Begin

               lblProduto.Caption    := AnsiUpperCase(Copy(Trim(query.FieldByName('descricao').AsString),1,41));
               lblVlUnitario.Caption := FormatFloat('###,#0.00', query.FieldByName('valor').AsFloat);
               lblVlTotal.Caption    := FormatFloat('###,#0.00', RoundABNT((edtQuantidade.AsFloat * (query.FieldByName('Quantidade').AsFloat * query.FieldByName('valor').AsFloat)),2));

               inc(id);

               qryItens.Append;

               qryItensdescricao.AsString  := Trim(query.FieldByName('descricao').AsString);
               qryItensitem.AsString       := '#'+FormatFloat('#00', id);
               qryItensgtin.AsString       := Trim(query.FieldByName('CODIGO_BARRAS').AsString);
               qryItensvlUnit.AsFloat      := query.FieldByName('valor').AsFloat;
               qryItensqtde.AsFloat        := (edtQuantidade.AsFloat * query.FieldByName('Quantidade').AsFloat);
               qryItenspromocao.AsString   := 'N';
               qryItensunidade.AsString    := Trim(query.FieldByName('sigla').AsString);
               qryItensidProduto.AsInteger := query.FieldByName('id').asinteger;
               qryItensvlTotal.AsFloat     := RoundABNT((edtQuantidade.AsFloat * (query.FieldByName('Quantidade').AsFloat * query.FieldByName('valor').AsFloat)),2);

               qryItens.Post;

               if TBaseLocalProdutosController.SaberSeImprimirCozinha(qryItensidProduto.AsInteger) then Begin

                  //HabilitarTelaAzul;
                  Application.CreateForm(TfrmObservacao, frmObservacao);
                  frmObservacao.tipo := 'V';
                  frmObservacao.ShowModal;
                  //DesabilitarTelaAzul;

               End;

               total := total + qryItensvlTotal.AsFloat;

               query.Next;
            End;

         Finally
            FreeAndNil(query);
         End;

   End else Begin

      lblProduto.Caption    := AnsiUpperCase(Copy(Trim(produto.descricao),1,41));
      lblVlUnitario.Caption := FormatFloat('###,#0.00', produto.valor_unitario);
      lblVlTotal.Caption    := FormatFloat('###,#0.00', produto.valor_unitario * edtQuantidade.AsFloat);

      inc(id);

      if RetornarPromocao(produto.id) > 0.00 then Begin

         produto.valor_unitario := RetornarPromocao(produto.id);
         produto.promocao := 'S';

      End;

      qryItens.Append;

      qryItensdescricao.AsString  := Trim(produto.descricao);
      qryItensitem.AsString       := '#'+FormatFloat('#00', id);
      qryItensgtin.AsString       := Trim(produto.gtin);
      qryItensvlUnit.AsFloat      := produto.valor_unitario;
      qryItensqtde.AsFloat        := edtQuantidade.AsFloat;
      qryItenspromocao.AsString   := produto.promocao;
      qryItensunidade.AsString    := 'UND';
      qryItensidProduto.AsInteger := produto.id;
      qryItensvlTotal.AsFloat     := RoundABNT((edtQuantidade.AsFloat * produto.valor_unitario),2);

      qryItens.Post;

      if TBaseLocalProdutosController.SaberSeImprimirCozinha(qryItensidProduto.AsInteger) then Begin

         //HabilitarTelaAzul;
         Application.CreateForm(TfrmObservacao, frmObservacao);
         frmObservacao.tipo := 'V';
         frmObservacao.ShowModal;
         //DesabilitarTelaAzul;

      End;

      total := total + qryItensvlTotal.AsFloat;

   End;

   statuVenda := 1;
   lblMensagemVenda.Caption := 'VENDA EM ANDAMENTO';
   Totalizadores;

   Label1.Visible := True;
   qryItens.Open;

   qryItens.Last;

   edtCodigo.Text := '';
   edtQuantidade.AsFloat := 1.000;
   edtCodigo.SetFocus;

end;

procedure TfrmPedidos.ConsultarProduto;
begin

   if statuVenda = 0 then begin

      if frmPrincipal.qryParametrosUTILIZA_FIDELIDADE.AsString = 'S' then begin
         Application.CreateForm(TfrmConsultarFidelidade, frmConsultarFidelidade);
         frmConsultarFidelidade.ShowModal;
      end;

   end;

   HabilitarTelaAzul;
   Application.CreateForm(TfrmPesquisarProdutos, frmPesquisarProdutos);
   frmPesquisarProdutos.mkeDescricao.Text := Trim(edtCodigo.Text);
   frmPesquisarProdutos.ShowModal;
   DesabilitarTelaAzul;

end;

procedure TfrmPedidos.Cronometro;
var
  ata1, iData2:  String;

begin

  tempo := tempo + 0.0000115741;
  lblHora.Caption := TimeToStr(time + 0.0000115741);

  lblTempoAberto.Caption := 'Tempo aberto: '+Copy(TimeToStr(tempo),1,2)+'h '+
                                             Copy(TimeToStr(tempo),4,2)+'m '+
                                             Copy(TimeToStr(tempo),7,2)+'s';

end;

procedure TfrmPedidos.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin

   if qryItenspromocao.AsString = 'S' then Begin
      DBText7.Font.Color := clRed;
      lblPromocao.Visible:= True;
   end else Begin
      DBText7.Font.Color := clBlack;
      lblPromocao.Visible:= False;
   End;

end;

procedure TfrmPedidos.DesabilitarTelaAzul;
begin

   FreeAndNil(frmTelaAzul);

end;

procedure TfrmPedidos.DescontoAcrescimo;
begin

   if statuVenda <> 1 then Begin
      prcMsgAdv('Não existe venda em andamento.');
      Exit;
   End;

   if qryItens.IsEmpty then Begin
      prcMsgAdv('Não existem ítens na venda.');
      edtCodigo.SetFocus;
      Exit;
   End;

   HabilitarTelaAzul;
   Application.CreateForm(TfrmDescontoAcrescimo, frmDescontoAcrescimo);
   frmDescontoAcrescimo.ShowModal;
   desabilitarTelaAzul;

end;

procedure TfrmPedidos.dtsItensDataChange(Sender: TObject; Field: TField);
begin

   ShowScrollBar(DBCtrlGrid1.handle, SB_HORZ, False);

end;

procedure TfrmPedidos.edtCodigoExit(Sender: TObject);
begin

   edtQuantidade.SetFocus;

end;

procedure TfrmPedidos.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin

   if key = #13 then
      if Trim(edtCodigo.Text) <> '' then
         PesquisarProdutoPeloCodigo(Trim(edtCodigo.Text))
      else
         edtQuantidade.SetFocus;


end;

procedure TfrmPedidos.edtQuantidadeExit(Sender: TObject);
begin

   if edtQuantidade.AsFloat <= 0.000 then
      edtQuantidade.AsFloat := 1.000;

   edtCodigo.SetFocus;

end;

procedure TfrmPedidos.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin

   if key = #13 then
      edtCodigo.SetFocus;

end;

function TfrmPedidos.Fechar: Boolean;
begin

   Result := True;

   if Not(qryItens.IsEmpty) then Begin
      prcMsgAdv('Existe venda em andamento');
      Result := False;
   End;

end;

procedure TfrmPedidos.FinalizarVenda;
begin

   if statuVenda <> 1 then Begin
      prcMsgAdv('Não existe venda em andamento.');
      Exit;
   End;

   if qryItens.IsEmpty then Begin
      prcMsgAdv('Não existem ítens na venda.');
      edtCodigo.SetFocus;
      Exit;
   End;

   if ((total - desconto) + acrescimo) <= 0 then Begin
      prcMsgAdv('Valor total da venda inválido');
      edtCodigo.SetFocus;
      Exit;
   End;


   HabilitarTelaAzul;
   Application.CreateForm(TfrmFinalizarVenda, frmFinalizarVenda);

   frmFinalizarVenda.ValorVenda    := RoundABNT((total - desconto) + acrescimo,2);
   frmFinalizarVenda.valorRecebido := 0.00;
   frmFinalizarVenda.valorRestante := 0.00;
   frmFinalizarVenda.valorTroco    := 0.00;

   frmFinalizarVenda.AtualizarTotais;
   frmFinalizarVenda.edtRecebido.AsFloat := RoundABNT((total - desconto) + acrescimo,2);

   frmFinalizarVenda.ShowModal;
   desabilitarTelaAzul;

end;

procedure TfrmPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   frmPedidos := Nil;

end;

procedure TfrmPedidos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
Var
Iconf:Integer;
begin

   if Fechar = false then
      CanClose := False
   else Begin

      if frmpedidos.fecharTela = False then Begin

        Iconf := Application.MessageBox('Confirma o fechamento da tela de venda ?','Confirmação',mb_yesNo+mb_iconQuestion+mb_Defbutton2);

        if Iconf = IDNO then
        begin
           CanClose := False;
        end else
        begin
           frmPedidos.Close;
        end;

      End else
        frmPedidos.Close;

   End;

end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin

   frmpedidos.fecharTela := False;
   frmPedidos.Height := frmPrincipal.Height;
   frmPedidos.Width  := frmPrincipal.Width;
   frmPedidos.Left   := 0;
   frmPedidos.Top    := 0;
   ShowScrollBar(DBCtrlGrid1.handle, SB_HORZ, False);
   id := 0;
   total     := 0.00;
   desconto  := 0.00;
   acrescimo := 0.00;
   tempo := StrToTime('00:00:00');
   lblHora.Caption := TimeToStr(time);
   TempoAberto.Enabled := True;
   statuVenda := 0;
   obsFidelidade := '';

   qryItens.Close;
   qryItens.Open;

   Try
      untIntegracaoFidelidade.TIntegracaoCoteFacil.Create(self);
      Configuracao := TLancamentos.RetornarTodasConfiguracoes;
   Except
   End;

end;

procedure TfrmPedidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_F1: MenuPrincipal;
      VK_F3: IdentificarCliente;
      VK_F4: ConsultarProduto;
      VK_F5: DescontoAcrescimo;
      VK_F6: CancelarItem(id);
      VK_F7: CancelarVendaAtual(True);
      VK_F8: IdentificarVendedor;
      VK_F9: FinalizarVenda;
      VK_F12: close;

   end;


end;

procedure TfrmPedidos.FormResize(Sender: TObject);
begin

      pnlPrincipal.top := (self.Height div 2) - (pnlPrincipal.height div 2);
      pnlPrincipal.left := (self.Width div 2) - (pnlPrincipal.width div 2);

end;

procedure TfrmPedidos.FormShow(Sender: TObject);
begin

      //pnlPrincipal.Align := alRight;
      //Panel2.Align       := alClient;

      //pnlCenter.Left     := Round((pnlPrincipal.Width - pnlCenter.Width) div 2);
      //pnlCenter.Top      := Round((pnlPrincipal.Height - pnlCenter.Height) div 2);

      //pnlCenter.Top      := 0;




end;

procedure TfrmPedidos.GerarNFCe(valorVenda: double; idVenda: integer);
var
  descontoItem, descontoItemArredonda, acrescimoItem, totalItem,
  TotalGeralNfce: double;
  A, ultimoRegistro: integer;
  Ok: Boolean;
  cfop: String;
  queryDadosFiscais : TFDQuery;

  Procedure CarregarDadosFiscais(idProduto: integer);
  Begin

     queryDadosFiscais := TFDQuery.Create(Nil);
     queryDadosFiscais.Connection := frmPrincipal.ConexaoLocal;

     queryDadosFiscais.SQL.Add('SELECT p.NCM,  ');
     queryDadosFiscais.SQL.Add('       p.CEST, ');
     queryDadosFiscais.SQL.Add('       p.TAXA_PIS, ');
     queryDadosFiscais.SQL.Add('       p.TAXA_COFINS, ');
     queryDadosFiscais.SQL.Add('       p.TAXA_ICMS, ');
     queryDadosFiscais.SQL.Add('       p.CST_CSOSN, ');
     queryDadosFiscais.SQL.Add('       p.CST_PIS, ');
     queryDadosFiscais.SQL.Add('       p.CFOP, ');
     queryDadosFiscais.SQL.Add('       p.CST_COFINS, ');
     queryDadosFiscais.SQL.Add('       p.ORIGEM, ');
     queryDadosFiscais.SQL.Add('       Coalesce(n.perc_imp_federal, 0) AS federal, ');
     queryDadosFiscais.SQL.Add('       Coalesce(n.perc_imp_estadual, 0) AS estadual, ');
     queryDadosFiscais.SQL.Add('       Coalesce(n.perc_imp_municipal, 0) AS municipal ');
     queryDadosFiscais.SQL.Add('  FROM produtos p, ');
     queryDadosFiscais.SQL.Add('       ncm n  ');
     queryDadosFiscais.SQL.Add(' WHERE p.ncm = n.ncm  ');
     queryDadosFiscais.SQL.Add('   AND p.id = '+idProduto.ToString);
     queryDadosFiscais.Open;

  End;

  procedure prcAtualizarSequenciaNFCe(id: integer);
  Var
    Query: TFDQuery;
  Begin

    Try

      Query := TFDQuery.Create(nil);
      Query.Connection := frmPrincipal.ConexaoLocal;

      Query.close;
      Query.SQL.Add('UPDATE configuracoes SET numero_nfce = ' + IntToStr(id));
      Query.ExecSQL;

      frmPrincipal.ConexaoLocal.Commit;

    Finally

      FreeAndNil(Query);

    End;

  End;

Var
  item, sequencia: integer;
  idNFCe, totalRegistros: integer;
  imprimir: Boolean;
  ex, descricao, ChaveAcesso, DigitoChaveAcesso: String;
  tabela: integer;
  aliqFedNac, aliqFedImp, aliqEst, aliqMun, totalBaseICMS, totalValorICMS,
    totalBasePIS, totalValorPIS, totalBaseCOFINS, totalValorCOFINS,
    totalVTributos, diferencaAcrescimo, valorAcrescimo, percDesconto: double;
  cliente: TBaseLocalClientesVO;
begin
  Try

    InicializarNFCe;

    ACBrNFe.NotasFiscais.Clear;

    idNFCe := queryParametros.FieldByName('numero_nfce').asinteger + 1;

    {
      Entrega.xLgr    := 'logradouro';
      Entrega.nro     := '112233';
      Entrega.xCpl    := 'complemento';
      Entrega.xBairro := 'bairro';
      Entrega.xMun    := 'municipio';
      Entrega.UF      := 'CE'; }

    A := 0;
    descontoItem := 0.00;
    acrescimoItem := 0.00;

    with ACBrNFe.NotasFiscais.Add.NFe do
    begin

      Ide.cNF := StrToInt(FormatFloat('#10000000', idNFCe));
      // Caso não seja preenchido será gerado um número aleatório pelo componente
      Ide.natOp  := 'VENDA';
      Ide.indPag := ipVista;
      Ide.modelo := 65;
      Ide.serie  := queryParametros.FieldByName('serie_nfce').asinteger;
      Ide.nNF    := idNFCe;
      Ide.dEmi   := now;
      Ide.dSaiEnt := now;
      Ide.hSaiEnt := now;
      Ide.tpNF := tnSaida;
      Ide.tpEmis := TpcnTipoEmissao(0);

      ChaveAcesso := '';

      if queryParametros.FieldByName('tipo_ambiente').AsString = 'P' then
        Ide.tpAmb := taProducao
      else
        Ide.tpAmb := taHomologacao;

      Ide.cUF    := frmPrincipal.qryEmpresaCODIGO_UF.AsInteger;
      Ide.cMunFG := frmPrincipal.qryEmpresaCODIGO_CIDADE.AsInteger;
      Ide.finNFe := fnNormal;
      Ide.tpImp := tiNFCe;
      Ide.indFinal := cfConsumidorFinal;
      Ide.verProc := '410';
      Ide.indPres := pcPresencial;

      // Ide.dhCont := date;
      // Ide.xJust  := 'Justificativa Contingencia';

      Emit.CNPJCPF := SoNumero(Trim(frmPrincipal.qryEmpresaCNPJ.AsString));
      Emit.IE      := Trim(frmPrincipal.qryEmpresaIE.AsString);
      Emit.xNome   := Trim(frmPrincipal.qryEmpresaRAZAO_SOCIAL.AsString);
      Emit.xFant   := Trim(frmPrincipal.qryEmpresaFANTASIA.AsString);

      Emit.EnderEmit.fone := Trim(frmPrincipal.qryEmpresaFONE.AsString);

      Emit.EnderEmit.CEP     := StrToInt(SoNumero(frmPrincipal.qryEmpresaCEP.AsString));
      Emit.EnderEmit.xLgr    := Trim(frmPrincipal.qryEmpresaLOGRADOURO.AsString);
      Emit.EnderEmit.nro     := Trim(frmPrincipal.qryEmpresaNUMERO.AsString);
      Emit.EnderEmit.xCpl    := Trim(frmPrincipal.qryEmpresaCOMPLEMENTO.AsString);
      Emit.EnderEmit.xBairro := Trim(frmPrincipal.qryEmpresaBAIRRO.AsString);
      Emit.EnderEmit.cMun    := frmPrincipal.qryEmpresaCODIGO_CIDADE.asinteger;
      Emit.EnderEmit.xMun    := Trim(frmPrincipal.qryEmpresaCIDADE.AsString);
      Emit.EnderEmit.UF      := Trim(frmPrincipal.qryEmpresaUF.AsString);
      Emit.EnderEmit.cPais   := 1058;
      Emit.EnderEmit.xPais   := 'BRASIL';

      Emit.IEST := '';
      // Emit.IM                := '2648800'; // Preencher no caso de existir serviços na nota
      // Emit.CNAE              := '6201500'; // Verifique na cidade do emissor da NFe se é permitido
      // a inclusão de serviços na NFe
      {
        frmMenu.FDEmpresa.Edit;
        frmMenu.FDEmpresatipo_regime.AsInteger := 3;
        frmMenu.FDEmpresa.Post;
      }

      cliente := TBaseLocalClientesController.RetornarClientePorID(idCliente);

      ACBrValidador1.Documento := cliente.cpf_cnpj;
      if Length(cliente.cpf_cnpj) <= 11 then
         ACBrValidador1.TipoDocto := docCPF
      else
         ACBrValidador1.TipoDocto := docCNPJ;

      if ((idCliente > 0) and (ACBrValidador1.Validar)) then Begin
         if Length(cliente.cpf_cnpj) > 11 then Begin
            if fctValidCNPJ(cliente.cpf_cnpj) then Begin
               Dest.CNPJCPF := Trim(cliente.cpf_cnpj);
               Dest.xNome   := Trim(cliente.nome);
               Dest.indIEDest := inNaoContribuinte;
            end;
         end else if Length(cliente.cpf_cnpj) <= 11 then Begin
            if fctValidCPF(cliente.cpf_cnpj) then Begin
               Dest.CNPJCPF := Trim(cliente.cpf_cnpj);
               Dest.xNome   := Trim(cliente.nome);
               Dest.indIEDest := inNaoContribuinte;
            end;
         end
      end;

      case frmPrincipal.qryEmpresaTIPO_REGIME.asinteger of
        1,2: Emit.CRT := crtRegimeNormal;
        3,4: Emit.CRT := crtSimplesNacional;
        //4: Emit.CRT := crtMEI;
      end;

      // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)

      // Adicionando Produtos

      item := 0;
      sequencia := 0;
      descontoItem := 0.00;
      descontoItemArredonda := 0.00;

      totalBaseICMS := 0.00;
      totalValorICMS := 0.00;

      totalBasePIS := 0.00;
      totalValorPIS := 0.00;

      totalBaseCOFINS := 0.00;
      totalValorCOFINS := 0.00;

      totalVTributos := 0.00;

      qryItens.First;

      acrescimo := 0.00;
      valorAcrescimo := 0.00;
      diferencaAcrescimo := 0.00;
      totalRegistros := 0;


      While Not (qryItens.Eof) do Begin

         if qryItensidProduto.AsInteger <> 0 then
            inc(totalRegistros)
         else
            acrescimo := acrescimo + qryItensvlTotal.AsFloat;

         TotalGeralNfce := TotalGeralNfce + qryItensvlTotal.AsFloat;

         qryItens.Next;

      end;

      if TotalGeralNfce < valorVenda then
         acrescimo := valorVenda - TotalGeralNfce;

      if acrescimo > 0.00 then Begin
         valorAcrescimo := RoundABNT((acrescimo / totalRegistros),2);
      End;

      if desconto > 0.00 then begin
         percDesconto := (desconto*100)/TotalGeralNfce;
      end;

      TotalGeralNfce := 0.00;

      qryItens.First;

      while Not(qryItens.eof) do
      Begin

       inc(item);

       if qryItensidProduto.AsInteger <> 0 then Begin

        inc(sequencia);

        with Det.Add do
        begin

          CarregarDadosFiscais(qryItensidProduto.AsInteger);

          Prod.nItem := sequencia;
          Prod.cProd := Trim(qryItensidProduto.AsString);
          Prod.xProd := Trim(qryItensdescricao.AsString);
          Prod.NCM   := Trim(queryDadosFiscais.FieldByName('NCM').AsString);
          Prod.cfop  := Trim(queryDadosFiscais.FieldByName('CFOP').AsString);
          Prod.uCom  := Trim(qryItensunidade.AsString);
          Prod.uTrib := Trim(qryItensunidade.AsString);
          Prod.qCom  := qryItensqtde.AsFloat;

          Prod.qTrib := qryItensqtde.AsFloat;
          Prod.vUnTrib := RoundABNT(qryItensvlUnit.AsFloat, -2);
          Prod.vUnCom  := RoundABNT(qryItensvlUnit.AsFloat, -2);

          acrescimoItem := acrescimoItem + Prod.vOutro;

          totalItem := RoundABNT(((Prod.qCom * Prod.vUnCom) - Prod.vDesc) + Prod.vOutro, -2);
          TotalGeralNfce := TotalGeralNfce + totalItem;

          if EAN13Valido(Trim(qryItensgtin.AsString)) Then
          Begin
            Prod.cEAN := Trim(qryItensgtin.AsString);
            Prod.cEANTrib := Trim(qryItensgtin.AsString);
          end
          else
          Begin
            Prod.cEAN := 'SEM GTIN';
            Prod.cEANTrib := 'SEM GTIN';
          end;

          if item = totalRegistros then
             Prod.vOutro := acrescimo - diferencaAcrescimo
          else Begin
             diferencaAcrescimo := diferencaAcrescimo + valorAcrescimo;
             Prod.vOutro := valorAcrescimo;
          end;

          if percDesconto > 0 then
             Prod.vDesc := (qryItensvlTotal.AsFloat + valorAcrescimo)* (percDesconto/100)
          else
             Prod.vDesc := 0.00;

          Prod.vProd := RoundABNT(qryItensvlTotal.AsFloat { Prod.qCom * Prod.vUnCom } , -2); // - prod.vDesc

          Prod.vFrete := 0;
          Prod.vSeg := 0;
          // Prod.vDesc     := 0;

          Prod.CEST := Trim(queryDadosFiscais.FieldByName('cest').AsString);

          // infAdProd    := 'Informação Adicional do Produto';
          with Imposto do
          begin

            // lei da transparencia nos impostos
            vTotTrib := RoundABNT(qryItensvlTotal.AsFloat *
                         ((queryDadosFiscais.FieldByName('federal').AsFloat +
                           queryDadosFiscais.FieldByName('estadual').AsFloat +
                           queryDadosFiscais.FieldByName('municipal').AsFloat)/100),2);
            totalVTributos := totalVTributos +
                              RoundABNT(qryItensvlTotal.AsFloat *
                                       ((queryDadosFiscais.FieldByName('federal').AsFloat +
                                         queryDadosFiscais.FieldByName('estadual').AsFloat +
                                         queryDadosFiscais.FieldByName('municipal').AsFloat)/100),2);

            with ICMS do
            begin

              orig := StrToOrig(Ok, queryDadosFiscais.FieldByName('origem').AsString);

              if frmPrincipal.qryEmpresatipo_regime.asinteger >= 3 then
                CSOSN := StrToCSOSNIcms(Ok, Trim(queryDadosFiscais.FieldByName('cst_csosn').AsString))
              else
                CST := StrToCSTICMS(Ok,Trim(FormatFloat('#00',queryDadosFiscais.FieldByName('cst_csosn').AsInteger)));

              pICMS := queryDadosFiscais.FieldByName('TAXA_ICMS').Asfloat;

              if queryDadosFiscais.FieldByName('TAXA_ICMS').Asfloat > 0 then
              Begin
                vBC := RoundABNT(qryItensvlTotal.AsFloat, 2);
                totalBaseICMS := totalBaseICMS + RoundABNT(qryItensvlTotal.AsFloat, 2);
                vICMS := RoundABNT(qryItensvlTotal.AsFloat * (queryDadosFiscais.FieldByName('TAXA_ICMS').Asfloat / 100), 2);
                totalValorICMS := totalValorICMS + RoundABNT(qryItensvlTotal.AsFloat * (queryDadosFiscais.FieldByName('TAXA_ICMS').AsFloat / 100), 2);
              end
              else
              Begin
                vICMS := 0.00;
                vBC := 0.00;
              end;

              vBCST := 0.00;
              pICMSST := 0.00;
              vICMSST := 0.00;

            end;

            // ICMS.modBC   := dbiValorOperacao;
            // ICMS.modBCST := dbisMargemValorAgregado;

            // Pis
            PIS.CST := StrToCSTPIS(Ok, Trim(queryDadosFiscais.FieldByName('CST_PIS').AsString));
            PIS.pPIS := queryDadosFiscais.FieldByName('TAXA_PIS').AsFloat / 100;

            if queryDadosFiscais.FieldByName('TAXA_PIS').AsFloat > 0 then
            Begin
              PIS.vBC := RoundABNT(qryItensvlTotal.AsFloat, 2);
              totalBasePIS := totalBasePIS + RoundABNT(qryItensvlTotal.AsFloat, 2);
              PIS.vPIS     := RoundABNT(qryItensvlTotal.AsFloat * (queryDadosFiscais.FieldByName('TAXA_PIS').AsFloat / 100), 2);
              totalValorPIS := totalValorPIS + RoundABNT(qryItensvlTotal.AsFloat * (queryDadosFiscais.FieldByName('TAXA_PIS').AsFloat / 100), 2);
            end
            else
            Begin
              PIS.vBC := 0.00;
              PIS.vPIS := 0.00;
            end;

            // Cofins
            COFINS.CST     := StrToCSTCOFINS(Ok, Trim(queryDadosFiscais.FieldByName('CST_COFINS').AsString));
            COFINS.pCOFINS := queryDadosFiscais.FieldByName('TAXA_COFINS').AsFloat / 100;

            if queryDadosFiscais.FieldByName('TAXA_COFINS').AsFloat > 0 then
            Begin
              COFINS.vBC := RoundABNT(qryItensvlTotal.AsFloat, 2);
              totalBaseCOFINS := totalBaseCOFINS + RoundABNT(qryItensvlTotal.AsFloat, 2);
              COFINS.vCOFINS  := RoundABNT(qryItensvlTotal.AsFloat * (queryDadosFiscais.FieldByName('TAXA_COFINS').AsFloat / 100), 2);
              totalValorCOFINS := totalValorCOFINS + RoundABNT(qryItensvlTotal.AsFloat * (queryDadosFiscais.FieldByName('TAXA_COFINS').AsFloat / 100), 2);
            end
            else
            Begin
              COFINS.vBC := 0.00;
              COFINS.vCOFINS := 0.00;
            end;

            // partilha do ICMS e fundo de probreza
            with ICMSUFDest do
            begin
              vBCUFDest := 0.00;
              pFCPUFDest := 0.00;
              pICMSUFDest := 0.00;
              pICMSInter := 0.00;
              pICMSInterPart := 0.00;
              vFCPUFDest := 0.00;
              vICMSUFDest := 0.00;
              vICMSUFRemet := 0.00;
            end;

          end;

        end;

       end else
          diferencaAcrescimo := diferencaAcrescimo + valorAcrescimo;

       qryItens.Next;

      end;

      if Not(frmPrincipal.qryEmpresaTIPO_REGIME.AsInteger = 3) then
      Begin
        total.ICMSTot.vBC := RoundABNT(totalBaseICMS, 2);
        total.ICMSTot.vICMS := RoundABNT(totalValorICMS, 2);
        total.ICMSTot.vBCST := 0.00;
        // sql.FieldByName('icms_base_subst').AsFloat;
        total.ICMSTot.vST := 0.00; // sql.FieldByName('icms_subst').AsFloat;
      end
      else
      Begin
        total.ICMSTot.vBC := 0.00;
        total.ICMSTot.vICMS := 0.00;
        total.ICMSTot.vBCST := 0.00;
        total.ICMSTot.vST := 0.00;
      end;

      // total.ICMSTot.vOutro := frmFinalizarVenda.FDCabecalhoACRESCIMO.AsFloat;
      total.ICMSTot.vProd := TotalGeralNfce;
      total.ICMSTot.vFrete := 0;
      total.ICMSTot.vSeg := 0;
      total.ICMSTot.vDesc := RoundABNT(desconto, 2);
      // sql.FieldByName('desconto').AsFloat;
      total.ICMSTot.vII := 0;
      total.ICMSTot.vIPI := 0;
      total.ICMSTot.vPIS := RoundABNT(totalValorPIS, 2);
      total.ICMSTot.vCOFINS := RoundABNT(totalValorCOFINS, 2);
      total.ICMSTot.vOutro := RoundABNT(acrescimo,2);
      // frmFinalizarVenda.FDCabecalhoACRESCIMO.AsFloat;
      total.ICMSTot.vNF := TotalGeralNfce + acrescimo - desconto;
      // TotalGeral;
      total.ICMSTot.vTotTrib := totalVTributos;

      // partilha do icms e fundo de probreza
      total.ICMSTot.vFCPUFDest := 0.00;
      total.ICMSTot.vICMSUFDest := 0.00;
      total.ICMSTot.vICMSUFRemet := 0.00;

      total.ISSQNtot.vServ := 0;
      total.ISSQNtot.vBC := 0;
      total.ISSQNtot.vISS := 0;
      total.ISSQNtot.vPIS := 0;
      total.ISSQNtot.vCOFINS := 0;

      frmFinalizarVenda.cdsPagamento.First;

      Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE

      while not(frmFinalizarVenda.cdsPagamento.eof) do
      Begin

        if ((TBaseLocalFormasPagamentoController.RetornarIdPgNFCe(frmFinalizarVenda.cdsPagamentoidPagamento.asinteger) = 1)
          and (frmFinalizarVenda.valorTroco > 0)) then
          Pag.vTroco := frmFinalizarVenda.valorTroco;

        with Pag.Add do
        begin
          case TBaseLocalFormasPagamentoController.RetornarIdPgNFCe(frmFinalizarVenda.cdsPagamentoidPagamento.asinteger) of

            1:tpag := fpDinheiro;
            2:tPag := fpCheque;
            4:
              Begin
                tpag := fpCartaoDebito;
                tpIntegra := tiPagNaoIntegrado;
                CNPJ := '';
                tBand := bcOutros;
                cAut := '999';
              end;
            3:
              Begin
                tpag := fpCartaoCredito;
                tpIntegra := tiPagNaoIntegrado;
                CNPJ := '';
                tBand := bcOutros;
                cAut := '999';
              end;
            5: tpag := fpCreditoLoja;
            10: tpag := fpValeAlimentacao;
            11: tpag := fpValeRefeicao;
            12: tpag := fpValePresente;
            13: tpag := fpValeCombustivel;
            15: tpag := fpBoletoBancario;
            16: tpag := fpDepositoBancario;
            17: tpag := fpPagamentoInstantaneo;
            18: tpag := fpTransfBancario;

          else
            tpag := fpOutro;

          end;

          vpag := frmFinalizarVenda.cdsPagamentovalor.AsFloat;

        end;

        frmFinalizarVenda.cdsPagamento.Next;

      End;

      InfAdic.infCpl := 'No. Venda: '+idVenda.ToString + '. ' + frmPedidos.obsFidelidade;

    end;

    lblErroNFce.Visible := False;

    try
      ACBrNFe.NotasFiscais.Assinar;
    Except
      //Application.MessageBox(pchar('Falha da Assinatura da Nfe '),
      //  pchar('Aviso Sistema'), MB_ICONEXCLAMATION + MB_OK);
      //Application.ProcessMessages;
      //frmFinalizarVenda.ErroNFCE := True;
      on e:exception do begin
         frmFinalizarVenda.existeFiscal := false;
         lblErroNFce.Caption := 'Não está sendo possível emitir NFCe: ' + e.Message;
         lblErroNFce.Visible := True;
         Writeln(frmPrincipal.Log, 'Erro ao assinar NFe: '+DateTimeToStr(now)+' - '+e.Message);
         exit;
      end;
      //raise;
    End;

    Try
      ACBrNFe.NotasFiscais.validar;
    Except
      on e:exception do begin
         frmFinalizarVenda.existeFiscal := false;
         lblErroNFce.Caption := 'Não está sendo possível emitir NFCe' + e.Message;
         lblErroNFce.Visible := True;
         Writeln(frmPrincipal.Log, 'Erro ao validar NFe: '+DateTimeToStr(now)+' - '+e.Message);
         exit;
      end;
    end;

    Try
      ACBrNFe.NotasFiscais.Items[0].GravarXML;
    Except
      on e:exception do begin
         frmFinalizarVenda.existeFiscal := false;
         lblErroNFce.Caption := 'Não está sendo possível emitir NFCe' + e.Message;
         lblErroNFce.Visible := True;
         Writeln(frmPrincipal.Log, 'Erro ao gravar XML: '+DateTimeToStr(now)+' - '+e.Message);
         exit;
      end;
    End;

    Try
      //frmPrincipal.PrepararImpressao(False);
      ACBrNFe.DANFE := ACBrNFeDANFeRL1;
      ACBrNFe.Configuracoes.Geral.ModeloDF := moNFCe;
      // ACBrPosPrinter1.IgnorarTags             := False;
      // ACBrPosPrinter1.ControlePorta           := True;
      // ACBrPosPrinter1.ControlePorta           := False;
      frmPrincipal.ACBrNFeDANFeESCPOS1.ImprimeEmUmaLinha := True;
      frmPrincipal.ACBrNFeDANFeESCPOS1.ImprimeDescAcrescItem := True;
      // ACBrNFe.DANFE.ImprimirItens := True;

    Except
      prcMsgAdv('Erro na configuração da impressora não fiscal.');
    End;

    Try

      if ACBrNFe.Enviar(1, false, True) Then
      Begin

        Try
           ACBrNFe.NotasFiscais.Items[0].GerarXML;
          prcAtualizarSequenciaNFCe(idNFCe);
          // ACBrNFeDANFeESCPOS.V := chkViaConsumidor.Checked;
          // ACBrNFeDANFeESCPOS.ImprimeItens  := not chkDanfeResumido.Checked;
        Except
          prcAtualizarSequenciaNFCe(idNFCe);
        end;

      end;

    Except

      on e:exception do begin
         frmFinalizarVenda.existeFiscal := false;
         lblErroNFce.Caption := 'Não está sendo possível emitir NFCe' + e.Message;
         lblErroNFce.Visible := True;
         Writeln(frmPrincipal.Log, 'Erro ao enviar NFe: '+DateTimeToStr(now)+' - '+e.Message);
      end;

    end;

    Try
     try
       //ACBrNFeDANFCeFortesA41.Impressora := 'HP1102w';
       ACBrNFe.NotasFiscais[0].Imprimir;
     Except
       on e:exception do
       prcMsgAdv('Não foi possível imprimir o cupom nº ' +
       ACBrNFe.NotasFiscais.Items[0].NFe.Ide.nNF.ToString+#13+e.Message);
     end;
    finally
       frmPrincipal.ACBrPosPrinter1.Desativar;
    end;
    //Aqui era a baixa de estoque

  Except

    on e:exception do begin
       frmFinalizarVenda.existeFiscal := false;
       lblErroNFce.Caption := 'Não está sendo possível emitir NFCe' + e.Message;
       lblErroNFce.Visible := True;
       Writeln(frmPrincipal.Log, 'Falha ao gerar a venda: '+DateTimeToStr(now)+' - '+e.Message);
    end;

  end;

end;

procedure TfrmPedidos.HabilitarTelaAzul;
begin

   frmTelaAzul := TfrmTelaAzul.Create(Self);
   frmTelaAzul.Show;

end;

procedure TfrmPedidos.IdentificarCliente;
begin

   HabilitarTelaAzul;
   Application.CreateForm(TfrmPesquisarClientes, frmPesquisarClientes);
   frmPesquisarClientes.ShowModal;
   desabilitarTelaAzul;

end;

procedure TfrmPedidos.IdentificarVendedor;
begin

   HabilitarTelaAzul;
   Application.CreateForm(TfrmPesquisarFuncionarios, frmPesquisarFuncionarios);
   frmPesquisarFuncionarios.ShowModal;
   desabilitarTelaAzul;

end;

procedure TfrmPedidos.Image10Click(Sender: TObject);
begin

   MenuPrincipal;

end;

procedure TfrmPedidos.Image2Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPedidos.Image3Click(Sender: TObject);
begin

   FinalizarVenda;

end;

procedure TfrmPedidos.Image4Click(Sender: TObject);
begin

   IdentificarVendedor;

end;

procedure TfrmPedidos.Image5Click(Sender: TObject);
begin

   CancelarVendaAtual(true);

end;

procedure TfrmPedidos.Image6Click(Sender: TObject);
begin

  CancelarItem(id);

end;

procedure TfrmPedidos.Image7Click(Sender: TObject);
begin

  DescontoAcrescimo;

end;

procedure TfrmPedidos.Image8Click(Sender: TObject);
begin

  ConsultarProduto;

end;

procedure TfrmPedidos.Image9Click(Sender: TObject);
begin

  IdentificarCliente;

end;

procedure TfrmPedidos.InicializarNFCe;
var
  Ok: Boolean;
  Diretorio, Ano: String;
  Mes: String;

begin

  Try

    queryParametros := TFDQuery.Create(Nil);
    queryParametros.Connection := frmPrincipal.ConexaoLocal;

    queryParametros.SQL.Add(' SELECT * FROM CONFIGURACOES WHERE id = 1 ');
    queryParametros.Open;

    Try
      {$IFDEF ACBrNFeOpenSSL}
      FDataModule.ACBrNFe.Configuracoes.Certificados.Certificado :=
        NfeConfiguracao.CaminhoCertificado;
      FDataModule.ACBrNFe.Configuracoes.Certificados.Senha :=
        NfeConfiguracao.SenhaCertificado;
      edtNumSerie.Visible := false;
      sbtnGetCert.Visible := false;
      {$ELSE}
      ACBrNFe.Configuracoes.Certificados.NumeroSerie :=
        Trim(queryParametros.FieldByName('certificado_digital').AsString);
      {$ENDIF}
    Except
      Application.MessageBox(pchar('Certificado não Encontrado'), pchar('Erro'),
        MB_ICONERROR + MB_OK);
      Application.ProcessMessages;
      raise;
    End;

    ACBrNFe.Configuracoes.Geral.Salvar := True;
    ACBrNFe.Configuracoes.Geral.ModeloDF := moNFCe;
    ACBrNFe.Configuracoes.Geral.VersaoDF := ve400;

    // ACBrNFe.Configuracoes.Geral.IncluirQRCodeXMLNFCe := True;
    ACBrNFe.Configuracoes.Geral.IdCSC :=
      Trim(queryParametros.FieldByName('id_csc_nfce').AsString);
    ACBrNFe.Configuracoes.Geral.CSC :=
      Trim(queryParametros.FieldByName('csc_nfce').AsString);
    ACBrNFe.Configuracoes.Geral.Salvar := True;

    ACBrNFe.Configuracoes.Arquivos.PathSalvar;
    // ('C:\AUTOCOM\PAF\RETORNO\');//NfeConfiguracao.CaminhoSalvarXml;

    if queryParametros.FieldByName('forma_emissao').AsString = 'N' then
      ACBrNFe.Configuracoes.Geral.FormaEmissao := teNormal
    else
      ACBrNFe.Configuracoes.Geral.FormaEmissao := teContingencia;

    ACBrNFe.Configuracoes.WebServices.UF := TBiblioteca.RetornarUFporID(frmPrincipal.qryEmpresaCODIGO_UF.AsInteger);

    if queryParametros.FieldByName('tipo_ambiente').AsString = 'P' then
      ACBrNFe.Configuracoes.WebServices.Ambiente := taProducao
    else
      ACBrNFe.Configuracoes.WebServices.Ambiente := taHomologacao;

    ACBrNFe.Configuracoes.WebServices.Visualizar := false;

    ACBrNFe.Configuracoes.WebServices.ProxyHost := '';
    ACBrNFe.Configuracoes.WebServices.ProxyPort := '';
    ACBrNFe.Configuracoes.WebServices.ProxyUser := '';
    ACBrNFe.Configuracoes.WebServices.ProxyPass := '';
    // ACBrNFe.DANFE.Logo      := '';

    if ACBrNFe.DANFE <> nil then
    begin
      ACBrNFe.DANFE.TipoDANFE := tiNFCe;
      // StrToTpImp(OK, '4'{NfeConfiguracao.FormaImpressaoDanfe});
      //ACBrNFe.DANFE.Fax := ''; // Empresa.Fax;      //Dennis Sobral - 10/11/2015
      ACBrNFe.DANFE.Site := '';
      // Empresa.Site;     //Dennis Sobral - 10/11/2015
      ACBrNFe.DANFE.Email := '';
      // Empresa.Email;    //Dennis Sobral - 10/11/2015
    end;

    // ACBrNFe.DANFE.TamanhoFonte_DemaisCampos := NfeConfiguracao.FonteOutrosCampos;

    if ACBrNFe.DANFE is TACBrNFeDANFeRL then
    begin
      //ACBrNFeDANFeRL1.Fonte.TamanhoFonteDemaisCampos := 10;
      // queryParametros.FieldByName('fonte_att').AsInteger;
      // DataModule.ACBrNFe.DANFE as TACBrNFeDANFERave).TamanhoFonte_RazaoSocial := NfeConfiguracao.FonteRazaoSocial;
      // DataModule.ACBrNFe.DANFE as TACBrNFeDANFERave).RavFile := ExtractFilePath(Application.ExeName) + 'NotaFiscalEletronica.rav';
      (ACBrNFe.DANFE as TACBrNFeDANFeRL).Usuario := '';

      (ACBrNFe.DANFE as TACBrNFeDANFeRL).CasasDecimais.qCom := 3;
      (ACBrNFe.DANFE as TACBrNFeDANFeRL).CasasDecimais.vUnCom := 2;

      (ACBrNFe.DANFE as TACBrNFeDANFeRL).TipoDANFE := StrToTpImp(Ok, '0');

      // Configura Final
      (ACBrNFe.DANFE as TACBrNFeDANFeRL).Sistema := 'SICOM VAREJO';
      (ACBrNFe.DANFE as TACBrNFeDANFeRL).MostraPreview := True;
      (ACBrNFe.DANFE as TACBrNFeDANFeRL).PathPDF :=
        PathWithDelim('C:\Users\Public\Desktop\');
      {
        ACBrNFeDANFERave1.Site             := edtSiteEmpresa.Text;
        ACBrNFeDANFERave1.Email            := edtEmailEmpresa.Text;
        ACBrNFeDANFERave1.Fax              := edtFaxEmpresa.Text;
        ACBrNFeDANFERave1.ImprimirDescPorc := cbxImpDescPorc.Checked;
        ACBrNFeDANFERave1.MostrarPreview   := cbxMostrarPreview.Checked;
        ACBrNFeDANFERave1.Impressora       := cbxImpressora.Text;
        ACBrNFeDANFERave1.NumCopias        := StrToInt(edtNumCopia.Text);
        ACBrNFeDANFERave1.MargemInferior   := StrToFloat(edtMargemInf.Text);
        ACBrNFeDANFERave1.PathPDF          := PathWithDelim(ExtractFileDir(application.ExeName)); }

    end;

    Ano := IntToStr(YearOf(now));
    Mes := Copy((DateToStr(date)), 4, 2);
    // Diretorio := 'C:\AUTOCOM\PAF\RETORNO\'+ NomeMonth(Mes, false)+Ano;  //ExtractFilePath(Application.ExeName)
    Diretorio := ExtractFilePath(Application.ExeName) + 'Vendas\' + 'NFCE' +
      Ano + Mes;

    ForceDirectories(Diretorio);
    ACBrNFe.Configuracoes.Arquivos.PathSalvar := Diretorio;

    with ACBrNFe.Configuracoes.Arquivos do
    begin
      // Salvar             := cbxSalvarArqs.Checked;
      // SepararPorMes      := cbxPastaMensal.Checked;
      // AdicionarLiteral   := cbxAdicionaLiteral.Checked;
      // EmissaoPathNFe     := cbxEmissaoPathNFe.Checked;
      // SalvarEvento       := cbxSalvaPathEvento.Checked;
      // SepararPorCNPJ     := cbxSepararPorCNPJ.Checked;
      // SepararPorModelo   := cbxSepararPorModelo.Checked;
      // PathSalvar         := edtPathLogs.Text;
      PathSchemas := ExtractFilePath(Application.ExeName) + 'SCHEMAS\';
      // PathNFe            := edtPathNFe.Text;
      // PathInu            := edtPathInu.Text;
      // PathEvento         := edtPathEvento.Text;
    end;

  Except
    Application.MessageBox(pchar('Erro de Configuração da NFe'), pchar('Erro'),
      MB_ICONERROR + MB_OK);
    Application.ProcessMessages;
    raise;
  End;

end;

procedure TfrmPedidos.LimparTela;
begin

   id := 0;
   idCliente := 0;
   idFuncionario := 0;
   idFidelidade := 0;
   idPedido := 0;
   edtQuantidade.AsFloat :=1.000;
   desconto  := 0.00;
   total     := 0.00;
   acrescimo := 0.00;
   lblProduto.Caption         := 'INFORME UM PRODUTO';
   lblSubtotal.Caption        := '0.00';
   lblVlTotal.Caption         := '0.00';
   lblVlUnitario.Caption      := '0.00';
   lblTotalDesconto.Caption   := '0.00';
   Label1.Visible             := False;
   lblNomeFuncionario.Visible := False;
   lblFuncionario.Visible     := False;
   lblNomeCliente.Visible     := False;
   lblCliente.Visible         := False;
   lblCPFCNPJ.Visible         := False;
   lblCPFCNPJCliente.Visible  := False;
   obsFidelidade := '';

   case  statuVenda of

      0: lblMensagemVenda.Caption := 'CAIXA ABERTO';
      1: lblMensagemVenda.Caption := 'VENDA EM ANDAMENTO';

   end;


end;

procedure TfrmPedidos.MenuPrincipal;
begin

   HabilitarTelaAzul;
   Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
   frmMenuPrincipal.ShowModal;
   desabilitarTelaAzul;

end;

procedure TfrmPedidos.PesquisarProdutoPeloCodigo(codigo: String);
Var produto: TPedidoProdutosVO;
begin

   Try

      lblProduto.Caption    := '';
      lblVlUnitario.Caption := '0,00';
      lblVlTotal.Caption    := '0,00';

      produto := TPedidoProdutosController.PesquisarProduto(Trim(edtCodigo.Text));

      if produto.id > 0 then Begin

         if ((frmPrincipal.qryParametrosCRITICAR_ESTOQUE.AsString = 'S') AND
             (frmPedidos.edtQuantidade.AsFloat > produto.qtde_estoque) and
             (frmPrincipal.qryProdutosKIT.AsString <> 'S')) Then Begin

            prcMsgAdv('Produto '+frmPrincipal.qryProdutosDESCRICAO.AsString+#13+'com quantidade insuficiente.');
            Exit;

         End;

         if RetornarPromocao(produto.id) > 0.00 then Begin

            produto.valor_unitario := RetornarPromocao(produto.id);
            produto.promocao := 'S';
            Confirmar(produto);

         End else Begin

            if statuVenda = 0 then begin
               if frmPrincipal.qryParametrosUTILIZA_FIDELIDADE.AsString = 'S' then begin
                  Application.CreateForm(TfrmConsultarFidelidade, frmConsultarFidelidade);
                  frmConsultarFidelidade.ShowModal;
               end;
            end;

            if produto.valor_unitario <= 0.00 then Begin
               prcMsgAdv('Produto com valor de venda inválido.');
               Exit;
            End else
               Confirmar(produto)

         End;
      end else
         ConsultarProduto;

   Finally

      FreeAndNil(produto);

   End;

end;

function TfrmPedidos.RetornarPromocao(idProduto: integer): Double;
Var query: TFDQuery;
begin

   Try

      Result := 0.00;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add('select promocao from Verificar_Promocao('+idProduto.ToString+', :data)');
      query.Params.ParamByName('data').AsDateTime := now;
      query.Open;

      if query.FieldByName('promocao').AsFloat > 0.00 then
         Result := query.FieldByName('promocao').AsFloat;


   Finally

      FreeAndNil(query)

   End;

end;

procedure TfrmPedidos.TempoAbertoTimer(Sender: TObject);
begin

   Cronometro;

end;

procedure TfrmPedidos.Totalizadores;
begin

   lblSubtotal.Caption      := FormatFloat('###,#0.00', total);

   lblTotalDesconto.Caption := '0,00';

   if desconto > 0 then
      lblTotalDesconto.Caption := '- '+FormatFloat('###,#0.00', desconto);

   if acrescimo > 0 then
      lblTotalDesconto.Caption := '+ '+FormatFloat('###,#0.00', acrescimo);

   lblTotal.Caption         := FormatFloat('###,#0.00', (total - desconto) + acrescimo);

end;

end.
