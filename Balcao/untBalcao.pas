unit untBalcao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, BaseLocalClientesController,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,BaseLocalClientesVO,
  FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.DBCGrids, Vcl.Imaging.pngimage, BaseLocalPedidoCabecalhoVO,
  Vcl.ExtCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, unitConfiguracoes, BaseLocalPedidoDetalheVO,
  ACBrBase, ACBrEnterTab, BaseLocalProdutosController, BaseLocalPedidoCabecalhoController,
  BaseLocalPedidoDetalheController;

type
  TfrmBalcao = class(TForm)
    qryItens: TFDQuery;
    dtsItens: TDataSource;
    qryItensID: TIntegerField;
    qryItensID_PEDIDO: TIntegerField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensQUANTIDADE: TFloatField;
    qryItensVALOR_UNITARIO: TFloatField;
    qryItensOBSERVACAO: TStringField;
    qryItensDESCRICAO: TStringField;
    qryItensPRODUTO: TStringField;
    qryItensSIGLA: TStringField;
    qryItensFATOR: TFloatField;
    qryItensPODE_FRACIONAR: TStringField;
    pnlPrincipal: TPanel;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Label1: TLabel;
    DBCtrlGrid2: TDBCtrlGrid;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    lkpFuncionarios: TDBLookupComboBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label14: TLabel;
    Panel6: TPanel;
    edtCodigoProduto: TJvValidateEdit;
    Panel7: TPanel;
    Panel9: TPanel;
    edtQuantidade: TJvValidateEdit;
    pnlDescontoValor: TPanel;
    edtDescontoValor: TJvValidateEdit;
    pnlDescontoPercentual: TPanel;
    edtDescontoPercentual: TJvValidateEdit;
    Label13: TLabel;
    edtVendedor: TJvEdit;
    edtContato: TJvEdit;
    edtCodCliente: TJvEdit;
    lblValorUnitario: TLabel;
    lblTotalProduto: TLabel;
    lblSubtotal: TLabel;
    lblDescontoAcrescimo: TLabel;
    Label27: TLabel;
    lblTotalGeral: TLabel;
    Label29: TLabel;
    edtNomeCliente: TJvEdit;
    edtCPF_CNPJ: TJvEdit;
    ACBrEnterTab1: TACBrEnterTab;
    pnlBlend: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    qryItensUNIDADE: TStringField;
    qryItensFATOR_UNIDADE: TFloatField;
    qryItensDESCONTO_ITEM: TFloatField;
    qryItensVALOR_TOTAL: TFloatField;
    qryItensCODIGO_BARRAS: TStringField;
    qryItenscalItem: TIntegerField;
    Label16: TLabel;
    lblUnidade: TLabel;
    Panel8: TPanel;
    edtTaxaEntrega: TJvValidateEdit;
    Label10: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    qryItensSEQUENCIA: TIntegerField;
    edtDescricaoProduto: TJvEdit;
    qryFuncionarios: TFDQuery;
    qryFuncionariosID: TIntegerField;
    qryFuncionariosSTATUS: TStringField;
    qryFuncionariosCODIGO: TStringField;
    qryFuncionariosNOME: TStringField;
    qryFuncionariosPERCENTUAL_COMISSAO: TFloatField;
    dtsFuncionarios: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edtVendedorChange(Sender: TObject);
    procedure lkpFuncionariosClick(Sender: TObject);
    procedure edtCodClienteChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image8Click(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure edtDescontoPercentualKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescontoPercentualEnter(Sender: TObject);
    procedure edtDescontoPercentualExit(Sender: TObject);
    procedure edtDescontoValorChange(Sender: TObject);
    procedure edtDescontoPercentualChange(Sender: TObject);
    procedure qryItensCalcFields(DataSet: TDataSet);
    procedure dtsItensDataChange(Sender: TObject; Field: TField);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtDescontoValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtTaxaEntregaChange(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GerarCupom;
    procedure LimparTela;
    procedure RefreshItens;
    procedure InserirProduto;
    procedure InserirCliente;
    procedure InserirDescontoTotal;
    procedure InserirFuncionario;
    procedure HabilitarTelaAzul;
    procedure DesabilitarTelaAzul;
    procedure CancelarPedidoTela;
    procedure filtrarCliente;
    procedure AtualizarTotais;
    procedure Confirmar;
    procedure DescontoItem;
    procedure CancelarItem;
    procedure GravarPedido(MSG: boolean);
    procedure AtualizarDescontoItem;
    var idPedido, idProduto, idCliente, idFuncionario: integer;
        fatorUnidade: double;
        tipoDesconto, obsProduto: String;
  end;

var
  frmBalcao: TfrmBalcao;

implementation

{$R *.dfm}

uses untPrincipal, untPesquisarClientes, untPesquisarFuncionarios,
  untPesquisarProdutos, untDescontoAcrescimo, untCancelamentoItemPedido;

{ TfrmTelaDePedido }

procedure TfrmBalcao.AtualizarDescontoItem;
Var percentual: double;
begin

   if tipoDesconto = '' Then
      Exit;

   if frmPrincipal.qryProdutosVALOR_UNITARIO.AsFloat <= 0.00 then Begin

      prcMsgAdv('Produto com valor de venda inválido.');
      Exit;

   End;

   if (StringParaFloat(lblValorUnitario.Caption) * edtQuantidade.AsFloat) <= 0 then Begin

      prcMsgAdv('Valor total do ítem inválido.');
      Exit;

   End;


   if tipoDesconto = 'V' then Begin

      percentual := (edtDescontoValor.AsFloat * 100)/(StringParaFloat(lblValorUnitario.Caption) * edtQuantidade.AsFloat);
      edtDescontoPercentual.Value := percentual;

   End else if tipoDesconto = 'P' then Begin

      percentual := (edtDescontoPercentual.AsFloat/100)*(StringParaFloat(lblValorUnitario.Caption) * edtQuantidade.AsFloat);
      edtDescontoValor.Value := percentual;

   End;

end;

procedure TfrmBalcao.AtualizarTotais;
Var total: double;
begin

   total := ((edtQuantidade.AsFloat * fatorUnidade) * StringParaFloat(lblValorUnitario.Caption)) - edtDescontoValor.AsFloat;
   lblTotalProduto.Caption := FormatFloat('###,#0.00',total);

end;

procedure TfrmBalcao.CancelarItem;
begin

   if qryItens.IsEmpty then Begin
      prcMsgAdv('Não existem ítens a serem cancelados.');
      Exit;
   End;

   HabilitarTelaAzul;
   Application.CreateForm(TfrmCancelamentoItemPedido, frmCancelamentoItemPedido);
   frmCancelamentoItemPedido.showmodal;
   DesabilitarTelaAzul;

end;

procedure TfrmBalcao.CancelarPedidoTela;
begin

   //if idPedido > 0 then
   //   TBaseLocalPedidoCabecalhoController.MudarStatusPedido(idpedido.ToString, 'C');

   idProduto := 0;
   edtCodigoProduto.Text         := '';
   edtDescricaoProduto.Text      := '';
   tipoDesconto                  := '';
   lblUnidade.Caption            := '';
   edtDescontoValor.AsFloat      := 0.00;
   edtDescontoPercentual.AsFloat := 0.00;
   lblValorUnitario.Caption      := '0,00';
   lblTotalProduto.Caption       := '0,00';
   edtQuantidade.AsFloat         := 1.000;
   ACBrEnterTab1.EnterAsTab      := True;
   lkpFuncionarios.KeyValue      := -1;
   edtVendedor.Text              := '';
   edtContato.Text               := '';
   edtTaxaEntrega.Value          := 0.00;
   edtCodCliente.Text            := '';
   edtNomeCliente.Text           := '';
   edtCPF_CNPJ.Text              := '';
   edtCodigoProduto.Text         := '';
   edtDescricaoProduto.Text      := '';
   edtQuantidade.Value           := 0.00;
   idPedido                      := 0;
   idCliente                     := 0;
   idFuncionario                 := 0;
   lblSubtotal.Caption           := '0,00';
   lblDescontoAcrescimo.Caption  := '0,00';
   lblTotalGeral.Caption         := '0,00';
   edtCodigoProduto.SetFocus;

   Label16.Visible := True;
   RefreshItens;


end;

procedure TfrmBalcao.Confirmar;
Var pedidoCabecalho: TBaseLocalPedidoCabecalhoVO;
    pedidoDetalhe: TBaseLocalPedidoDetalheVO;
begin

   Try

      if Not(lkpFuncionarios.KeyValue > 0) then Begin

         prcMsgAdv('Informe um funcionário');
         edtVendedor.SetFocus;
         Exit;

      End;

      if Not(idCliente > 0) then Begin

         prcMsgAdv('Informe um cliente');
         edtCodCliente.SetFocus;
         Exit;

      End;

      if Not(idProduto > 0) then Begin

         prcMsgAdv('Informe um produto.');
         edtCodigoProduto.SetFocus;
         Exit;

      End;

      if Not(edtQuantidade.AsFloat > 0) then Begin

         prcMsgAdv('Informe a quantidade do produto.');
         edtQuantidade.SetFocus;
         Exit;

      End;

      obsProduto := '';

      pedidoCabecalho := TBaseLocalPedidoCabecalhoVO.Create;
      pedidoDetalhe   := TBaseLocalPedidoDetalheVO.Create;

      pedidoCabecalho.status         := 'A';
      pedidoCabecalho.id_cliente     := idCliente;
      pedidoCabecalho.id_funcionario := lkpFuncionarios.KeyValue;
      pedidoCabecalho.data_abertura  := Now;
      pedidoCabecalho.observacao     := '';
      pedidoCabecalho.VALOR_TOTAL    := StringParaFloat(lblSubtotal.Caption);
      pedidoCabecalho.VALOR_DESCONTO := StringParaFloat(lblDescontoAcrescimo.Caption);
      pedidoCabecalho.VALOR_LIQUIDO  := StringParaFloat(lblTotalGeral.Caption);
      pedidoCabecalho.taxa_entrega   := edtTaxaEntrega.AsFloat;
      pedidoCabecalho.contato        := Trim(edtContato.Text);

      if Not(idPedido > 0) then Begin
         pedidoCabecalho.VALOR_TOTAL    := StringParaFloat(lblTotalProduto.Caption)+edtDescontoValor.Value;
         pedidoCabecalho.VALOR_DESCONTO := edtDescontoValor.Value;
         pedidoCabecalho.VALOR_LIQUIDO  := StringParaFloat(lblTotalProduto.Caption);
         idPedido := TBaseLocalPedidoCabecalhoController.retornarGenerator;
         pedidoCabecalho.id          := idPedido;
         TBaseLocalPedidoCabecalhoController.GravarPedido(pedidoCabecalho);
      End else Begin
         pedidoCabecalho.id          := idPedido;
         TBaseLocalPedidoCabecalhoController.AlterarPedido(pedidoCabecalho);
         TBaseLocalPedidoCabecalhoController.AlterarTotaisPedido(pedidoCabecalho);
      End;

      lblSubtotal.Caption          := FormatFloat('###,#0.00',StringParaFloat(lblSubtotal.Caption) + StringParaFloat(lblTotalProduto.Caption)+edtDescontoValor.AsFloat);

      if ((Copy(Trim(lblDescontoAcrescimo.Caption),1,1) = '-') or
          (Copy(Trim(lblDescontoAcrescimo.Caption),1,1) = '+')) then
         lblDescontoAcrescimo.Caption := Copy(Trim(lblDescontoAcrescimo.Caption),1,1)+FormatFloat('###,#0.00',StringParaFloat(Copy(lblDescontoAcrescimo.Caption,2,20)) + edtDescontoValor.AsFloat)
      else Begin
         lblDescontoAcrescimo.Caption := FormatFloat('###,#0.00',StringParaFloat(lblDescontoAcrescimo.Caption) + edtDescontoValor.AsFloat);
         if edtDescontoValor.AsFloat > 0 then
            lblDescontoAcrescimo.Caption := '-' + lblDescontoAcrescimo.Caption;
      End;

      lblTotalGeral.Caption        := FormatFloat('###,#0.00',StringParaFloat(lblTotalGeral.Caption) + StringParaFloat(lblTotalProduto.Caption));

      pedidoDetalhe.id_pedido      := idPedido;
      pedidoDetalhe.id_produto     := idProduto;
      pedidoDetalhe.quantidade     := edtQuantidade.AsFloat;
      pedidoDetalhe.valor_unitario := StringParaFloat(lblValorUnitario.Caption);
      pedidoDetalhe.observacao     := obsProduto;
      pedidoDetalhe.descricao      := Trim(edtDescricaoProduto.Text);
      pedidoDetalhe.unidade        := Trim(lblUnidade.Caption);
      pedidoDetalhe.fator_unidade  := fatorUnidade;
      pedidoDetalhe.valor_total    := StringParaFloat(lblTotalProduto.Caption);
      pedidoDetalhe.desconto_item  := edtDescontoValor.AsFloat;

      if qryItensSEQUENCIA.AsInteger > 0 then
         pedidoDetalhe.sequencia   := qryItensSEQUENCIA.AsInteger + 1
      else
         pedidoDetalhe.sequencia   := 1;

      TBaseLocalPedidoDetalheController.GravarPedidoDetalhe(pedidoDetalhe);

      idProduto := 0;
      edtCodigoProduto.Text         := '';
      edtDescricaoProduto.Text      := '';
      tipoDesconto                  := '';
      lblUnidade.Caption            := '';
      edtDescontoValor.AsFloat      := 0.00;
      edtDescontoPercentual.AsFloat := 0.00;
      lblValorUnitario.Caption      := '0,00';
      lblTotalProduto.Caption       := '0,00';
      edtQuantidade.AsFloat         := 1.000;
      ACBrEnterTab1.EnterAsTab      := True;
      edtCodigoProduto.SetFocus;

      Label16.Visible := True;
      RefreshItens;
      GravarPedido(False);

   Finally
      FreeAndNil(pedidoCabecalho);
      FreeAndNil(pedidoDetalhe);
   End;

end;

procedure TfrmBalcao.DesabilitarTelaAzul;
begin

   //frmTelaDePedido.AlphaBlendValue     := 255;
   //frmPedidosPendentes.AlphaBlendValue := 220;
   pnlBlend.Visible := False;

end;

procedure TfrmBalcao.DescontoItem;
begin

   if frmPrincipal.qryParametrosTIPO_DESCONTO_PEDIDO.AsString = 'I' then Begin

      prcMsgAdv('Opção de desconto no total não habilitada.');
      Exit;

   End;

   if Not(idPedido > 0) then Begin
      prcMsgAdv('Não existe venda em andamento.');
      Exit;
   End;

   if qryItens.IsEmpty then Begin
      prcMsgAdv('Não existem ítens na venda.');
      edtCodigoProduto.SetFocus;
      Exit;
   End;

   HabilitarTelaAzul;
   Application.CreateForm(TfrmDescontoAcrescimo, frmDescontoAcrescimo);
   frmDescontoAcrescimo.tipo := 'PEDIDO';
   frmDescontoAcrescimo.ShowModal;
   desabilitarTelaAzul;

end;

procedure TfrmBalcao.dtsItensDataChange(Sender: TObject; Field: TField);
begin

   ShowScrollBar(DBCtrlGrid2.handle, SB_HORZ, False);

end;

procedure TfrmBalcao.edtVendedorChange(Sender: TObject);
begin

   Try
      lkpFuncionarios.KeyValue := StrToInt(edtVendedor.Text);
   Except
      lkpFuncionarios.KeyValue := -1
   End;

end;

procedure TfrmBalcao.filtrarCliente;
Var cliente: TBaseLocalClientesVO;
    complemento, referencia: string;
begin

   Try

      Try

         cliente := TBaseLocalClientesVO.create;
         cliente := TBaseLocalClientesController.RetornarClientePorID(strtoint(edtCodCliente.Text));

         if cliente.id > 0 then Begin

            complemento := '';
            referencia  := '';

            if Trim(cliente.complemento) <> '' then
               complemento := ' '+Trim(cliente.complemento);

            if Trim(cliente.referencia) <> '' then
               referencia := ' '+Trim(cliente.referencia);

            edtNomeCliente.Text := Trim(cliente.nome)+' ('+
                                   Trim(cliente.logradouro)+', '+
                                   Trim(cliente.numero)+
                                   complemento+' '+
                                   Trim(cliente.bairro)+
                                   referencia+')';

            edtCPF_CNPJ.Text    := RetornarCPFCNPJcomMascara(Trim(cliente.cpf_cnpj));
            idCliente           := cliente.id;

         End else Begin

            edtCPF_CNPJ.Text    := '';
            edtNomeCliente.Text := '';
            idCliente           := 0;

         End;

      Except
         idCliente           := 0;
         edtCPF_CNPJ.Text    := '';
         edtNomeCliente.Text := '';
      End;

   Finally

      FreeAndNil(cliente);

   End;

end;

procedure TfrmBalcao.FormCreate(Sender: TObject);
begin

   frmBalcao.Height := frmPrincipal.Height;
   frmBalcao.Width  := frmPrincipal.Width;
   frmBalcao.Left   := 0;
   frmBalcao.Top    := 0;

   qryFuncionarios.Close;
   qryFuncionarios.Open;
   {
   if frmPrincipal.qryParametrosTIPO_DESCONTO_PEDIDO.AsString = 'T' then Begin

      edtDescontoValor.ReadOnly        := True;
      edtDescontoPercentual.ReadOnly   := True;


      pnlDescontoValor.Color           := $00E1E1E1;
      pnlDescontoPercentual.Color      := $00E1E1E1;

      edtDescontoValor.Color           := $00E1E1E1;
      edtDescontoPercentual.Color      := $00E1E1E1;

      edtDescontoValor.Font.Color      := $00AAAAAA;
      edtDescontoPercentual.Font.Color := $00AAAAAA;
      label13.Font.Color               := $00AAAAAA;

   End;
   }
   qryItens.Close;
   qryItens.Open;

   lkpFuncionarios.KeyValue := -1;
   idCliente     := 0;
   idProduto     := 0;
   idPedido      := 0;
   idFuncionario := 0;

end;

procedure TfrmBalcao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_F3: InserirCliente;
      VK_F4: InserirProduto;
      VK_F5: DescontoItem;
      VK_F6: CancelarItem;
      VK_F7: CancelarPedidoTela;
      VK_F9: GravarPedido(True);
      VK_F12: Close;

   end;

end;

procedure TfrmBalcao.FormResize(Sender: TObject);
begin

   pnlPrincipal.top := (self.Height div 2) - (pnlPrincipal.height div 2);
   pnlPrincipal.left := (self.Width div 2) - (pnlPrincipal.width div 2);

end;

procedure TfrmBalcao.GerarCupom;
begin

   //frmPedidos.CancelarVendaAtual(False);

end;

procedure TfrmBalcao.GravarPedido(MSG: boolean);
Var pedidoCabecalho: TBaseLocalPedidoCabecalhoVO;

begin

   Try

      if Not(lkpFuncionarios.KeyValue > 0) then Begin

         prcMsgAdv('Informe um funcionário');
         edtVendedor.SetFocus;
         Exit;

      End;

      if Not(idCliente > 0) then Begin

         prcMsgAdv('Informe um cliente');
         edtCodCliente.SetFocus;
         Exit;

      End;


      pedidoCabecalho := TBaseLocalPedidoCabecalhoVO.Create;

      pedidoCabecalho.id_cliente     := idCliente;
      pedidoCabecalho.id_funcionario := lkpFuncionarios.KeyValue;
      pedidoCabecalho.observacao     := '';
      pedidoCabecalho.VALOR_TOTAL    := StringParaFloat(lblSubtotal.Caption);
      pedidoCabecalho.VALOR_DESCONTO := StringParaFloat(lblDescontoAcrescimo.Caption);
      pedidoCabecalho.VALOR_LIQUIDO  := StringParaFloat(lblTotalGeral.Caption);
      pedidoCabecalho.taxa_entrega   := edtTaxaEntrega.AsFloat;
      pedidoCabecalho.contato        := Trim(edtContato.Text);

      if Not(idPedido > 0) then Begin
         pedidoCabecalho.status         := 'A';
         pedidoCabecalho.data_abertura  := Now;
         pedidoCabecalho.VALOR_TOTAL    := StringParaFloat(lblTotalProduto.Caption)+edtDescontoValor.Value;
         pedidoCabecalho.VALOR_DESCONTO := edtDescontoValor.Value;
         pedidoCabecalho.VALOR_LIQUIDO  := StringParaFloat(lblTotalProduto.Caption);
         idPedido := TBaseLocalPedidoCabecalhoController.retornarGenerator;
         pedidoCabecalho.id          := idPedido;
         TBaseLocalPedidoCabecalhoController.GravarPedido(pedidoCabecalho);
      End else Begin
         pedidoCabecalho.id          := idPedido;
         TBaseLocalPedidoCabecalhoController.AlterarPedido(pedidoCabecalho);
         TBaseLocalPedidoCabecalhoController.AlterarTotaisPedido(pedidoCabecalho);
      End;

      if MSG then Begin

         prcMsgInf('Pedido nº '+idpedido.ToString+' gravado com sucesso.');
         frmPrincipal.ImprimirPedido(idPedido);

         idProduto := 0;
         edtCodigoProduto.Text         := '';
         edtDescricaoProduto.Text      := '';
         tipoDesconto                  := '';
         lblUnidade.Caption            := '';
         edtDescontoValor.AsFloat      := 0.00;
         edtDescontoPercentual.AsFloat := 0.00;
         lblValorUnitario.Caption      := '0,00';
         lblTotalProduto.Caption       := '0,00';
         edtQuantidade.AsFloat         := 1.000;
         ACBrEnterTab1.EnterAsTab      := True;
         lkpFuncionarios.KeyValue      := -1;
         edtVendedor.Text              := '';
         edtContato.Text               := '';
         edtTaxaEntrega.Value          := 0.00;
         edtCodCliente.Text            := '';
         edtNomeCliente.Text           := '';
         edtCPF_CNPJ.Text              := '';
         edtCodigoProduto.Text         := '';
         edtDescricaoProduto.Text      := '';
         edtQuantidade.Value           := 0.00;
         idPedido                      := 0;
         idCliente                     := 0;
         idFuncionario                 := 0;
         lblSubtotal.Caption           := '0,00';
         lblDescontoAcrescimo.Caption  := '0,00';
         lblTotalGeral.Caption         := '0,00';
         edtCodigoProduto.SetFocus;

      End;

      Label16.Visible := True;
      RefreshItens;

   Finally

   End;


end;

procedure TfrmBalcao.HabilitarTelaAzul;
begin
   {
   frmPedidos.AlphaBlendValue          := 255;
   frmPedidosPendentes.AlphaBlendValue := 220;
   pnlBlend.Align   := alClient;
   pnlBlend.Visible := True;
   }
end;

procedure TfrmBalcao.Image10Click(Sender: TObject);
begin

   DescontoItem;

end;

procedure TfrmBalcao.Image11Click(Sender: TObject);
begin

   CancelarItem;

end;

procedure TfrmBalcao.Image12Click(Sender: TObject);
begin

   CancelarPedidoTela;

end;

procedure TfrmBalcao.Image13Click(Sender: TObject);
begin

   GravarPedido(True);

end;

procedure TfrmBalcao.Image14Click(Sender: TObject);
begin

   close;

end;

procedure TfrmBalcao.Image8Click(Sender: TObject);
begin

   InserirCliente;

end;

procedure TfrmBalcao.Image9Click(Sender: TObject);
begin

   InserirProduto;

end;

procedure TfrmBalcao.InserirCliente;
begin

   //idCliente := 0;
   HabilitarTelaAzul;
   Application.CreateForm(TfrmPesquisarClientes, frmPesquisarClientes);
   frmPesquisarClientes.imgNovo.Visible := True;
   frmPesquisarClientes.ShowModal;
   desabilitarTelaAzul;

end;

procedure TfrmBalcao.InserirDescontoTotal;
begin
   {
   if frmPrincipal.qryParametrosTIPO_DESCONTO_PEDIDO.AsString = 'I' then Begin
      prcMsgAdv('Desconto habilitado somente nos produtos.');
      Exit;
   End;
  }

end;

procedure TfrmBalcao.InserirFuncionario;
begin

   //idFuncionario := 0;
   HabilitarTelaAzul;
   Application.CreateForm(TfrmPesquisarFuncionarios, frmPesquisarFuncionarios);
   frmPesquisarFuncionarios.origem := 'PEDIDO';
   frmPesquisarFuncionarios.ShowModal;
   desabilitarTelaAzul;

end;

procedure TfrmBalcao.InserirProduto;
begin

   idProduto := 0;
   HabilitarTelaAzul;
   Application.CreateForm(TfrmPesquisarProdutos, frmPesquisarProdutos);
   frmPesquisarProdutos.origem := 'PEDIDO';
   frmPesquisarProdutos.ShowModal;
   DesabilitarTelaAzul;

end;

procedure TfrmBalcao.edtCodClienteChange(Sender: TObject);
begin

   filtrarCliente;

end;

procedure TfrmBalcao.edtDescontoPercentualChange(Sender: TObject);
begin

   AtualizarDescontoItem;
   AtualizarTotais;

end;

procedure TfrmBalcao.edtDescontoPercentualEnter(Sender: TObject);
begin

   ACBrEnterTab1.EnterAsTab := False;

end;

procedure TfrmBalcao.edtDescontoPercentualExit(Sender: TObject);
begin

   ACBrEnterTab1.EnterAsTab := True;

end;

procedure TfrmBalcao.edtDescontoPercentualKeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then Begin
      //if frmPrincipal.qryParametrosTIPO_DESCONTO_PEDIDO.AsString = 'I' then
         Confirmar;
   End else
         tipoDesconto := 'P';


end;

procedure TfrmBalcao.edtDescontoValorChange(Sender: TObject);
begin

   AtualizarDescontoItem;
   AtualizarTotais;

end;

procedure TfrmBalcao.edtDescontoValorKeyPress(Sender: TObject;
  var Key: Char);
begin

   tipoDesconto := 'V';

end;

procedure TfrmBalcao.edtQuantidadeChange(Sender: TObject);
begin

   AtualizarTotais;

end;

procedure TfrmBalcao.edtQuantidadeEnter(Sender: TObject);
begin
   {
   if frmPrincipal.qryParametrosTIPO_DESCONTO_PEDIDO.AsString = 'T' then
      ACBrEnterTab1.EnterAsTab := False;
  }
end;

procedure TfrmBalcao.edtQuantidadeExit(Sender: TObject);
begin
   {
   if frmPrincipal.qryParametrosTIPO_DESCONTO_PEDIDO.AsString = 'T' then
      ACBrEnterTab1.EnterAsTab := True;
   }
end;

procedure TfrmBalcao.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
   {
   if key = #13 then Begin
      if frmPrincipal.qryParametrosTIPO_DESCONTO_PEDIDO.AsString = 'T' then
         Confirmar;
   End;
   }
end;

procedure TfrmBalcao.edtTaxaEntregaChange(Sender: TObject);
begin

   //lblTotalGeral.Caption := FormatFloat('###,#0.00',(StringParaFloat(lblSubtotal.Caption)+StringParaFloat(lblDescontoAcrescimo.Caption))+edtTaxaEntrega.AsFloat);

end;

procedure TfrmBalcao.LimparTela;
begin

   Label6.Visible := True;

end;

procedure TfrmBalcao.lkpFuncionariosClick(Sender: TObject);
begin

   edtVendedor.Text := qryFuncionariosID.AsString;

end;

procedure TfrmBalcao.qryItensCalcFields(DataSet: TDataSet);
begin

   if Not(qryItenscalItem.AsInteger > 0) then
      qryItenscalItem.AsInteger := 1
   else
      qryItenscalItem.AsInteger := qryItenscalItem.AsInteger + 1;

end;

procedure TfrmBalcao.RefreshItens;
begin

   qryItens.Close;
   qryItens.SQL.Clear;
   qryItens.SQL.Add('    SELECT d.*, ');
   qryItens.SQL.Add('           p.descricao AS produto, ');
   qryItens.SQL.Add('           p.codigo_barras, ');
   qryItens.SQL.Add('           u.sigla, ');
   qryItens.SQL.Add('           u.fator, ');
   qryItens.SQL.Add('           u.pode_fracionar ');
   qryItens.SQL.Add('      FROM pedido_detalhe d,  ');
   qryItens.SQL.Add('           produtos p, ');
   qryItens.SQL.Add('           unidade_produtos u ');
   qryItens.SQL.Add('     WHERE d.id_produto = p.id ');
   qryItens.SQL.Add('       AND p.id_unidade = u.id');
   qryItens.SQL.Add('       AND d.id_pedido = '+idpedido.ToString);
   qryItens.SQL.Add('  ORDER BY id ');
   qryItens.Open;
   qryItens.Last;

   if Not(qryItens.IsEmpty) then
      Label16.Visible := True;



end;



end.
