unit untFinalizarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, untIntegracaoFidelidade,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, untprincipal, acbrUtil,
  Vcl.StdCtrls, Vcl.DBCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, Vcl.Mask, unitConfiguracoes, BaseLocalEmpresaVO, BaseLocalEmpresaController,
  JvExMask, JvToolEdit, JvDBLookup, JvDBLookupComboEdit, JvExControls, baseLocalVendaCabecalhoVO, BaseLocalPedidoCabecalhoController,
  JvDBLookupTreeView, JvCombobox, JvDBCombobox, ACBrBase, ACBrEnterTab, baseLocalVendaCabecalhoController,
  Vcl.DBCGrids, Data.DB, Datasnap.DBClient, BaseLocalVendaDetalheController, BaseLocalVendaDetalheVO,
  BaseLocalTotalTipoPagtoController, BaseLocalTotalTipoPagtoVO, ACBrPosPrinter, generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, BaseLocalClientesController, BaseLocalClientesVO,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, BaseLocalFuncionariosController,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, BaseLocalFuncionariosVO,
  Vcl.Imaging.jpeg, JvExExtCtrls, JvExtComponent, JvPanel, FiadoVO, FiadoController, BaseLocalProdutosController,
  Vcl.Buttons;

type
  TfrmFinalizarVenda = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtRecebido: TJvValidateEdit;
    Label1: TLabel;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    Label2: TLabel;
    DBText7: TDBText;
    Panel3: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image5: TImage;
    Label3: TLabel;
    lblValorVenda: TLabel;
    lblValorRecebido: TLabel;
    lblValorFaltante: TLabel;
    lblValorTroco: TLabel;
    lkpFormaPG: TDBLookupComboBox;
    dtsPagamento: TDataSource;
    Panel4: TPanel;
    DBText2: TDBText;
    Label4: TLabel;
    qryFuncionarios: TFDQuery;
    qryFuncionariosID: TIntegerField;
    qryFuncionariosSTATUS: TStringField;
    qryFuncionariosCODIGO: TStringField;
    qryFuncionariosNOME: TStringField;
    qryFuncionariosPERCENTUAL_COMISSAO: TFloatField;
    Image1: TImage;
    Image3: TImage;
    JvPanel1: TJvPanel;
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    cdsPagamento: TClientDataSet;
    cdsPagamentoidPagamento: TIntegerField;
    cdsPagamentodescricao: TStringField;
    cdsPagamentovalor: TFloatField;
    cdsPagamentosequencia: TStringField;
    cdsPagamentofidelidade: TStringField;
    cdsPagamentoparcelas: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvDBLookupComboEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBLookupComboEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtRecebidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lkpFormaPGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lkpFormaPGExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var ValorVenda, valorRecebido, valorRestante, valorTroco: double;
        obsFiado, infAdicional: string;
        sequencia, qtdeParcelas: integer;
        existeFiscal: boolean;
    procedure AtualizarTotais;
    procedure EfetuarPagamento;
    procedure GravarVenda;
    Function ExisteFidelidade: boolean;
    Function ExisteFiado: boolean;
    procedure InformacoesAdicionais;

  end;

var
  frmFinalizarVenda: TfrmFinalizarVenda;

implementation

{$R *.dfm}

uses untPedidos, untConsultarPagarFidelidade, untObservacao, untQtdeParcelas;

procedure TfrmFinalizarVenda.AtualizarTotais;
begin

   valorRestante := RoundABNT(ValorVenda - valorRecebido,2);

   if valorRestante < 0 then Begin
      valorTroco    := RoundABNT(valorRestante * -1,2);
      valorRestante := 0.00;
   End;

   lblValorVenda.Caption    := 'R$ '+FormatFloat('###,#0.00',ValorVenda);
   lblValorRecebido.Caption := 'R$ '+FormatFloat('###,#0.00',valorRecebido);
   lblValorFaltante.Caption := 'R$ '+FormatFloat('###,#0.00',valorRestante);
   lblValorTroco.Caption    := 'R$ '+FormatFloat('###,#0.00',valorTroco);

   if valorRestante <= 0 then Begin
      GravarVenda;
      frmPedidos.CancelarVendaAtual(false);
      lkpFormaPG.Enabled  := False;
      edtRecebido.Enabled := False;
      //prcMsgInf('Venda finalizada com sucesso.');
      Timer1.Enabled := True;
      frmFinalizarVenda.SetFocus;
   End;

end;

procedure TfrmFinalizarVenda.DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if key = VK_DELETE then Begin

      if ((Not(cdsPagamento.IsEmpty)) AND (edtRecebido.Enabled = True)) then Begin

         if fctMsgConfirmDefaultButtonNo('Confirma a exclusão do pagamento selecionado?') = false then
            Exit;

         valorRecebido := valorRecebido - cdsPagamentovalor.AsFloat;
         cdsPagamento.Delete;
         AtualizarTotais;
         cdsPagamento.Open;

      End;

   End;


end;

procedure TfrmFinalizarVenda.edtRecebidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   case key of

      VK_RETURN: EfetuarPagamento;

   end;

end;

procedure TfrmFinalizarVenda.EfetuarPagamento;
begin
   if Trim(lkpFormaPG.Text) = '' then Begin
      prcMsgAdv('Informe a forma de pagamento.');
      lkpFormaPG.SetFocus;
      Exit;
   End;

   if ((frmPedidos.idCliente = 0) AND (lkpFormaPG.KeyValue = 0)) then Begin
      prcMsgAdv('Para a forma de pagamento fiado é necessário informar o cliente.');
      lkpFormaPG.SetFocus;
      Exit;
   End;

   if edtRecebido.AsFloat <= 0 then Begin
      prcMsgAdv('Valor de Pagamento inválido.');
      edtRecebido.SelectAll;
      Exit;
   End;

   if frmPrincipal.qryFormaPGID.AsInteger = 0 then Begin
      if TBaseLocalClientesController.VerificarBloqueioCliente(frmPedidos.idCliente) then Begin
         prcMsgAdv('Cliente informado está bloqueado para pagamento fiado.');
         Exit;
      End;

   End;

   if ((frmPrincipal.qryFormaPGID.AsInteger = 0) and (ExisteFiado)) then begin
      prcMsgAdv('Já consta uma forma de pagamento FIADO inserida.');
      lkpFormaPG.SetFocus;
      Exit;
   end;

   if (((StringParaFloat(FormatFloat('#0.00', ValorVenda - valorRecebido - edtRecebido.AsFloat)) < 0.00)) AND (frmPrincipal.qryFormaPGPERMITE_TROCO.AsString <> 'S')) then Begin
      prcMsgAdv('Forma de pagamento não permite troco.');
      edtRecebido.SelectAll;
      exit;
   End;

   valorRecebido := valorRecebido + edtRecebido.AsFloat;

   if frmPrincipal.qryFormaPGEMITIR_FISCAL.AsString = 'S' then
      existeFiscal := True;

   qtdeParcelas := 1;

   if frmPrincipal.qryFormaPGGERAR_FINANCEIRO.AsString = 'S' then
      begin
         Application.CreateForm(TfrmQtdeParcelas, frmQtdeParcelas);
         frmQtdeParcelas.ShowModal;
      end;

   cdsPagamento.Append;
   cdsPagamentoidPagamento.AsInteger := lkpFormaPG.KeyValue;
   cdsPagamentodescricao.AsString    := Trim(lkpFormaPG.Text);
   cdsPagamentoparcelas.AsInteger    := qtdeParcelas;
   cdsPagamentovalor.AsFloat         := edtRecebido.AsFloat;

   if frmPrincipal.qryFormaPGFIDELIDADE.AsString = 'S' then
      cdsPagamentofidelidade.AsString := 'S';

   Inc(sequencia);
   cdsPagamentosequencia.AsString    := 'Del';
   cdsPagamento.Post;
   cdsPagamento.Open;

   AtualizarTotais;
   edtRecebido.Value := valorRestante;

   if lkpFormaPG.Enabled = True then Begin
      lkpFormaPG.SetFocus;
      Exit;
   End;



end;

function TfrmFinalizarVenda.ExisteFiado: boolean;
begin
   Result := False;
   cdsPagamento.First;
   while not(cdsPagamento.Eof) do begin
      if cdsPagamentoidPagamento.AsInteger = 0 then
         Result := True;
      cdsPagamento.Next;
   end;
   cdsPagamento.First;
end;

function TfrmFinalizarVenda.ExisteFidelidade: boolean;
begin
   Result := False;
   cdsPagamento.First;
   while not(cdsPagamento.Eof) do begin
      if cdsPagamentofidelidade.AsString = 'S' then
         Result := True;
      cdsPagamento.Next;
   end;
   cdsPagamento.First;
end;

procedure TfrmFinalizarVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   frmFinalizarVenda := Nil;

end;

procedure TfrmFinalizarVenda.FormCreate(Sender: TObject);
begin

   frmPrincipal.qryFormaPG.Close;
   frmPrincipal.qryFormaPG.SQL.Clear;
   frmPrincipal.qryFormaPG.SQL.Add(' select id, prazo_parcelas, gerar_financeiro, status, nome, id_original, permite_troco, FIDELIDADE, EMITIR_FISCAL, TIPO_PG_NFCE from formas_pagamento WHERE STATUS = ''A'' ');
   frmPrincipal.qryFormaPG.SQL.Add(' UNION ');
   frmPrincipal.qryFormaPG.SQL.Add(' SELECT 0 AS ID, 0 as prazo_parcelas, ''N'' as gerar_financeiro, ''A'' status, ''FIADO'' AS nome, null id_original, ''N'' AS permite_troco, NULL AS FIDELIDADE, '''' EMITIR_FISCAL, 0 TIPO_PG_NFCE FROM configuracoes ');
   frmPrincipal.qryFormaPG.SQL.Add(' ORDER BY 3 ');
   frmPrincipal.qryFormaPG.Open;

end;

procedure TfrmFinalizarVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F3: InformacoesAdicionais;

   end;

end;

procedure TfrmFinalizarVenda.FormShow(Sender: TObject);
begin

   //lkpFormaPG.SetFocus;

end;

procedure TfrmFinalizarVenda.GravarVenda;
Var vendaCabecalho: TBaseLocalVendaCabecalhoVO;
    vendaDetalhe: TBaseLocalVendaDetalheVO;
    tipoPagto: TBaseLocalTotalTipoPagtoVO;
    sequencia: integer;
    fiado: TFiadoVO;
    fidelidade: TLancamentos;
    valorSemFidelidade, valorComFidelidade: double;

begin

   Try

     Try

      vendaCabecalho := TBaseLocalVendaCabecalhoVO.Create;

      vendaCabecalho.ID               := TBaseLocalVendaCabecalhoController.RetornarIdVenda;
      vendaCabecalho.ID_CLIENTE       := frmPedidos.idCliente;
      vendaCabecalho.ID_VENDEDOR      := frmPedidos.idFuncionario;
      vendaCabecalho.DATA_HORA_VENDA  := Now;
      vendaCabecalho.VALOR_VENDA      := frmPedidos.total;
      vendaCabecalho.DESCONTO         := frmPedidos.desconto;
      vendaCabecalho.ACRESCIMO        := frmPedidos.acrescimo;
      vendaCabecalho.VALOR_FINAL      := ValorVenda;
      vendaCabecalho.TROCO            := valorTroco;
      vendaCabecalho.STATUS           := 'F';
      vendaCabecalho.NOME_CLIENTE     := Copy(Trim(frmPedidos.lblNomeCliente.Caption),1,85);
      vendaCabecalho.CPF_CNPJ_CLIENTE := Trim(SoNumero(frmPedidos.lblCPFCNPJCliente.Caption));

      if frmPedidos.idPedido > 0 then
         vendaCabecalho.ID_PEDIDO     := frmPedidos.idPedido
      else
         vendaCabecalho.ID_PEDIDO     := 0;

      cdsPagamento.First;

       while Not(cdsPagamento.Eof) do Begin
         if cdsPagamentoidPagamento.AsInteger = 0 then begin
            frmObservacao := tfrmObservacao.create(self);
            frmObservacao.tipo := 'F';
            frmObservacao.ShowModal;
            break;
         end;
         cdsPagamento.Next;
       end;

       if existeFiscal then Begin
          frmPedidos.GerarNFCe(StringParaFloat(Copy(lblValorVenda.Caption,3,10)), vendaCabecalho.NUMERO_PEDIDO);
          vendaCabecalho.CHAVE_NFCE  := Trim(Copy(frmPedidos.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID,4,44));
          vendaCabecalho.NUMERO_NFCE := frmPedidos.ACBrNFe.NotasFiscais.Items[0].NFe.Ide.nNF;
       End;

      TBaseLocalVendaCabecalhoController.GravarVenda(vendaCabecalho);

      frmPedidos.qryItens.First;
      sequencia := 0;

      while not(frmPedidos.qryItens.Eof) do Begin

         Inc(sequencia);
         vendaDetalhe := TBaseLocalVendaDetalheVO.Create;

         vendaDetalhe.ID_VENDA_CABECALHO := vendaCabecalho.ID;
         vendaDetalhe.ID_PRODUTO         := frmPedidos.qryItensidProduto.AsInteger;
         vendaDetalhe.GTIN               := frmPedidos.qryItensgtin.AsString;
         vendaDetalhe.ITEM               := sequencia;
         vendaDetalhe.QUANTIDADE         := frmPedidos.qryItensqtde.AsFloat;
         vendaDetalhe.VALOR_UNITARIO     := frmPedidos.qryItensvlUnit.AsFloat;
         vendaDetalhe.VALOR_TOTAL        := frmPedidos.qryItensvlTotal.AsFloat;
         vendaDetalhe.DESCRICAO_PRODUTO  := Trim(frmPedidos.qryItensdescricao.AsString);
         vendaDetalhe.OBSERVACAO         := Trim(frmPedidos.qryItensobservacao.AsString);

         TBaseLocalVendaDetalheController.GravarVendaDetalhe(vendaDetalhe);
         //idProduto: integer; quantidade, fator: double; tipo: String; id_unidade, id_venda, id_fornecedor: intege

         if not(vendaCabecalho.ID_PEDIDO > 0) then
            TBaseLocalProdutosController.GravarMovimetacaoProduto(vendaDetalhe.ID_PRODUTO,
                                                                  (vendaDetalhe.QUANTIDADE*-1),
                                                                  0,
                                                                  'V',
                                                                  0,
                                                                  vendaCabecalho.ID);

         frmPedidos.qryItens.Next;

      End;

      cdsPagamento.First;

       while Not(cdsPagamento.Eof) do Begin

         tipoPagto := TBaseLocalTotalTipoPagtoVO.Create;

         tipoPagto.ID_VENDA_CABECALHO := vendaCabecalho.ID;
         tipoPagto.ID_FORMA_PAGAMENTO := cdsPagamentoidPagamento.AsInteger;
         tipoPagto.VALOR              := cdsPagamentovalor.AsFloat;
         tipoPagto.PARCELAS           := cdsPagamentoparcelas.AsInteger;

         TBaseLocalTotalTipoPagtoController.GravarTotalTipoPagto(tipoPagto);

         if cdsPagamentoidPagamento.AsInteger = 0 then Begin

           Try
              fiado := TFiadoVO.Create;

              fiado.id_venda    := vendaCabecalho.ID;
              fiado.valor_venda := cdsPagamentovalor.AsFloat;
              fiado.total_venda := frmPedidos.total - frmPedidos.desconto;
              fiado.id_cliente  := frmPedidos.idCliente;
              fiado.data_venda  := Date;
              fiado.tipo        := 'S';
              if trim(obsFiado) <> '' then
                 fiado.obs_fiado := obsFiado;

              TFiadoController.GravarVendaFiado(fiado);

           Finally

              FreeAndNil(fiado);

           End;

         End;

         cdsPagamento.Next;

       End;

       if ((frmPedidos.idFidelidade > 0) and (frmPrincipal.qryParametrosUTILIZA_FIDELIDADE.AsString = 'S')) then Begin

         valorSemFidelidade := 0.00;
         valorComFidelidade := 0.00;

         cdsPagamento.First;

         while not(cdsPagamento.Eof) do begin

            if cdsPagamentofidelidade.AsString <> 'S' then
               valorSemFidelidade := valorSemFidelidade + cdsPagamentovalor.AsFloat
            else
               valorComFidelidade := valorComFidelidade + cdsPagamentovalor.AsFloat;

            cdsPagamento.Next;

         end;

         Try

            fidelidade := TLancamentos.Create;

            if valorSemFidelidade > 0 then begin
               fidelidade.id_cliente     := frmPedidos.idFidelidade;
               fidelidade.tipo           := 'E';
               fidelidade.valor_compra   := valorSemFidelidade-vendaCabecalho.TROCO;
               fidelidade.pontuacao      := Trunc(valorSemFidelidade-vendaCabecalho.TROCO);
               fidelidade.data_compra    := Date;
               fidelidade.id_funcionario := 0;
               TLancamentos.GravarLancamento(fidelidade);
               if Trim(frmPedidos.Configuracao.observacao) <> '' then
                  frmPedidos.obsFidelidade  := Trim(frmPedidos.Configuracao.observacao) +
                  '. Parabéns! :) voce acumulou '+
                  inttostr(trunc((valorSemFidelidade-vendaCabecalho.TROCO) * frmPedidos.Configuracao.valor_ponto_venda))+' pontos no programa de fidelidade.'
               else
                  frmPedidos.obsFidelidade  := 'Parabéns! :) voce acumulou '+ inttostr(trunc((valorSemFidelidade-vendaCabecalho.TROCO) * frmPedidos.Configuracao.valor_ponto_venda))+' pontos no programa de fidelidade.';
            end;

            if valorComFidelidade > 0 then begin
               fidelidade.id_cliente     := frmPedidos.idFidelidade;
               fidelidade.tipo           := 'S';
               fidelidade.valor_compra   := valorComFidelidade;
               fidelidade.pontuacao      := Trunc(valorComFidelidade)*-1;
               fidelidade.data_compra    := Date;
               fidelidade.id_funcionario := 0;
               TLancamentos.GravarLancamento(fidelidade);
            end;

         Finally

            FreeAndNil(fidelidade);

         End;

       End else Begin

        Try

          Try

             fidelidade := TLancamentos.Create;
             if frmPedidos.idFidelidade > 0 then
                fidelidade.id_cliente  := frmPedidos.idFidelidade
             else
                fidelidade.id_cliente  := -1;
             fidelidade.tipo           := 'E';
             fidelidade.valor_compra   := vendaCabecalho.VALOR_FINAL;
             fidelidade.pontuacao      := 0;
             fidelidade.data_compra    := Date;
             fidelidade.id_funcionario := 0;
             TLancamentos.GravarLancamento(fidelidade);

          Finally

             FreeAndNil(fidelidade);

          End;

        Except
        End;

       End;

       if not existeFiscal then
         frmPrincipal.ImprimirVenda(vendaCabecalho.ID, infAdicional);

     Except

        on e:exception do Begin
           prcMsgErro('Erro ao finalizar a venda.'+e.Message);
           Abort;
        End;

     End;

      if vendaCabecalho.ID_PEDIDO > 0 then
         TBaseLocalPedidoCabecalhoController.MudarStatusPedido(vendaCabecalho.ID_PEDIDO.ToString, 'F');

      frmPrincipal.ImprimirProdutoCozinhaVenda(vendaCabecalho.ID);

   Finally

      FreeAndNil(vendaCabecalho);
      FreeAndNil(vendaDetalhe);

   End;

end;

procedure TfrmFinalizarVenda.Image1Click(Sender: TObject);
begin

   cdsPagamento.Delete;
   valorRecebido := valorRecebido - cdsPagamentovalor.AsFloat;
   AtualizarTotais;
   cdsPagamento.Open;

end;

procedure TfrmFinalizarVenda.InformacoesAdicionais;
begin
  if JvPanel1.Visible then
     Exit;
  frmObservacao := tfrmObservacao.create(self);
  frmObservacao.tipo := 'INFADCIONAIS';
  frmObservacao.mmoObs.Lines.Text := infAdicional;
  frmObservacao.ShowModal;
end;

procedure TfrmFinalizarVenda.JvDBLookupComboEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if Not(Key in [#38..#40]) then
      Key := #0;

end;

procedure TfrmFinalizarVenda.JvDBLookupComboEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin

   if Not(key in[#38..#40]) then
      key := #0;

end;

procedure TfrmFinalizarVenda.lkpFormaPGExit(Sender: TObject);
begin

   if frmPrincipal.qryFormaPGFIDELIDADE.AsString = 'S' then
      lkpFormaPG.KeyValue := -1;

end;

procedure TfrmFinalizarVenda.lkpFormaPGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var cliente: TClientes;
begin

   if key = VK_RETURN then Begin
      if Trim(lkpFormaPG.Text) = '' then Begin
         prcMsgAdv('Informe a forma de pagamento.');
         lkpFormaPG.SetFocus;
         Exit;
      End else if frmPrincipal.qryFormaPGFIDELIDADE.AsString = 'S' then Begin
         if frmPrincipal.qryParametrosUTILIZA_FIDELIDADE.AsString <> 'S' then begin
            prcMsgAdv('Programa de fidelidade não habilitado.');
            exit;
         end;
         if not (frmPedidos.idFidelidade > 0) then begin
            prcMsgAdv('Não existe cliente fidelidade informado.');
            exit;
         end;
         if ExisteFidelidade then begin
            prcMsgAdv('Já foi lançado um valor com fidelidade.');
            exit;
         end;
         frmConsultarPagarFidelidade := tfrmConsultarPagarFidelidade.Create(self);
         cliente := TClientes.RetornarPontuacao(frmPedidos.idFidelidade.ToString);
         frmConsultarPagarFidelidade.EdCpfCliFid.Text    := RetornarCPFCNPJcomMascara(Trim(cliente.cpf_cnpj));
         frmConsultarPagarFidelidade.EdNomCliFid.Text    := Trim(cliente.nome);
         frmConsultarPagarFidelidade.EdPntCliFid.Text    := cliente.pontuacao.ToString;
         frmConsultarPagarFidelidade.EdPntDinCliFid.Text := FormatFloat('###,#0.00', cliente.valor_Disponivel);
         frmConsultarPagarFidelidade.EdValDisVen.Text    := FormatFloat('###,#0.00', StringParaFloat(Copy(lblValorFaltante.Caption,3,15))*(cliente.perc_Utilizacao_Pontos/100));

         if StringParaFloat(frmConsultarPagarFidelidade.EdValDisVen.Text) >
                   StringParaFloat(frmConsultarPagarFidelidade.EdPntDinCliFid.Text) then
            frmConsultarPagarFidelidade.EdValDisVen.Text := frmConsultarPagarFidelidade.EdPntDinCliFid.Text;

         frmConsultarPagarFidelidade.ShowModal;
      End else
         edtRecebido.SetFocus;
   End;

end;

procedure TfrmFinalizarVenda.SpeedButton1Click(Sender: TObject);
begin
   InformacoesAdicionais;
end;

procedure TfrmFinalizarVenda.Timer1Timer(Sender: TObject);
begin

   JvPanel1.Visible := True;
   Panel3.Visible   := FAlse;

   if JvPanel1.Color = $00666666 then
   begin
      JvPanel1.Color      := clWhite;
      JvPanel1.Font.Color := $00FF9933;
   end
   else
   begin
      JvPanel1.Font.Color := clWhite;
      JvPanel1.Color      := $00666666;
   end;

end;

end.
