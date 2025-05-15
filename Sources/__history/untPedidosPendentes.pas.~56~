unit untPedidosPendentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage, BaseLocalPedidoCabecalhoController,
  Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, untPrincipal, BaseLocalPedidoDetalheController,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, unitConfiguracoes, BaseLocalPedidoDetalheVO,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, generics.collections,BaseLocalUsuariosController,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, BaseLocalClientesVO,
  BaseLocalFuncionariosVO, BaseLocalFuncionariosController, BaseLocalClientesController, BaseLocalVendaCabecalhoController;

type
  TfrmPedidosPendentes = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel5: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    qryGrid: TFDQuery;
    dtsGrid: TDataSource;
    qryGridPEDIDO: TIntegerField;
    qryGridNOME: TStringField;
    qryGridDATA_ABERTURA: TSQLTimeStampField;
    qryGridSTATUS: TStringField;
    qryGridTOTAL_ITENS: TFloatField;
    qryGridID_CLIENTE: TIntegerField;
    qryGridID_FUNCIONARIO: TIntegerField;
    qryGridVALOR_LIQUIDO: TFloatField;
    qryGridVALOR_TOTAL: TFloatField;
    qryGridVALOR_DESCONTO: TFloatField;
    qryGridCONTATO: TStringField;
    qryGridTAXA_ENTREGA: TFloatField;
    qryGridcalcDesconto: TFloatField;
    qryGridcalcAcrescimo: TFloatField;
    qryItens: TFDQuery;
    qryItensID: TIntegerField;
    qryItensID_PEDIDO: TIntegerField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensQUANTIDADE: TFloatField;
    qryItensVALOR_UNITARIO: TFloatField;
    qryItensOBSERVACAO: TStringField;
    qryItensDESCRICAO: TStringField;
    qryItensUNIDADE: TStringField;
    qryItensFATOR_UNIDADE: TFloatField;
    qryItensDESCONTO_ITEM: TFloatField;
    qryItensVALOR_TOTAL: TFloatField;
    qryItensIMPRESSO_COZINHA: TStringField;
    qryItensPRODUTO: TStringField;
    qryItensSIGLA: TStringField;
    qryItensCODIGO_BARRAS: TStringField;
    Label4: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Label1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryGridCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Novo;
    procedure Alterar;
    procedure CancelarPedido;
    procedure LiberarPedido;
    procedure GerarCupom;
  end;

var
  frmPedidosPendentes: TfrmPedidosPendentes;

implementation

{$R *.dfm}

uses untTelaDePedido, untPedidos, untMenuPrincipal;

procedure TfrmPedidosPendentes.Alterar;
begin

   if qryGrid.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

  Application.CreateForm(TfrmTelaDePedido, frmTelaDePedido);
  frmTelaDePedido.idPedido                      := qryGridPEDIDO.AsInteger;
  frmTelaDePedido.idCliente                     := qryGridID_CLIENTE.AsInteger;
  frmTelaDePedido.lkpFuncionarios.KeyValue      := qryGridID_FUNCIONARIO.AsInteger;
  frmTelaDePedido.idFuncionario                 := qryGridID_FUNCIONARIO.AsInteger;
  frmTelaDePedido.edtVendedor.Text              := qryGridID_FUNCIONARIO.AsString;
  frmTelaDePedido.edtCodCliente.Text            := qryGridID_CLIENTE.AsString;
  frmTelaDePedido.edtTaxaEntrega.AsFloat        := qryGridTAXA_ENTREGA.AsFloat;
  frmTelaDePedido.edtContato.Text               := Trim(qryGridCONTATO.AsString);
  frmTelaDePedido.lblSubtotal.Caption           := FormatFloat('###,#0.00',qryGridVALOR_TOTAL.AsFloat);
  frmTelaDePedido.lblDescontoAcrescimo.Caption  := '0,00';

  if qryGridVALOR_DESCONTO.AsFloat > 0 then
     frmTelaDePedido.lblDescontoAcrescimo.Caption  := '+'+FormatFloat('###,#0.00',qryGridVALOR_DESCONTO.AsFloat)
  else if qryGridVALOR_DESCONTO.AsFloat < 0 then
     frmTelaDePedido.lblDescontoAcrescimo.Caption  := FormatFloat('###,#0.00',qryGridVALOR_DESCONTO.AsFloat);

  frmTelaDePedido.lblTotalGeral.Caption         := FormatFloat('###,#0.00',qryGridVALOR_LIQUIDO.AsFloat);

  frmTelaDePedido.RefreshItens;
  frmTelaDePedido.ShowModal;

end;

procedure TfrmPedidosPendentes.CancelarPedido;
begin

   if qryGrid.IsEmpty then Begin
      prcMsgAdv('Selecione um registro');
      Exit;
   End;

   if TBaseLocalUsuariosController.VerificarPermissao(frmPrincipal.idUser, 'filtro_acesso_canc_pedido') = false then Begin
      prcMsgAdv('Usuário sem permissão de acesso a função.');
      Exit;
   End;

   if fctMsgConfirmDefaultButtonNo('Confirma o cancelamento do pedido selecionado?') = false then
      Exit;

   Try
      TBaseLocalPedidoCabecalhoController.MudarStatusPedido(qryGridPEDIDO.AsString, 'C');
      prcMsgInf('Registro cancelado com sucesso.');
      qryGrid.Refresh;
   Except
      prcMsgAdv('Falha ao alterar o status do pedido.');
   End;

end;

procedure TfrmPedidosPendentes.FormCreate(Sender: TObject);
begin

   qryGrid.Close;
   qryGrid.Open;

end;

procedure TfrmPedidosPendentes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F1: Novo;
      VK_F2: Alterar;
      VK_F3: CancelarPedido;
      VK_F4: GerarCupom;
      VK_F5: LiberarPedido;

   end;

end;

procedure TfrmPedidosPendentes.GerarCupom;
Var cliente :TBaseLocalClientesVO;
    funcionario: TBaseLocalFuncionariosVO;
    sequencia: Integer;
begin

   if qryGrid.IsEmpty then Begin
      prcMsgAdv('Selecione um registro');
      Exit;
   End;

   Try

      frmPedidos.CancelarVendaAtual(False);

      qryItens.Close;
      qryItens.SQL.Clear;
      qryItens.SQL.Add(' SELECT d.*, ');
      qryItens.SQL.Add('        p.descricao as produto, ');
      qryItens.SQL.Add('        p.codigo_barras, ');
      qryItens.SQL.Add('        u.sigla  ');
      qryItens.SQL.Add('   FROM pedido_detalhe d, ');
      qryItens.SQL.Add('        produtos p, ');
      qryItens.SQL.Add('        unidade_produtos u  ');
      qryItens.SQL.Add('  WHERE d.id_produto = p.id ');
      qryItens.SQL.Add('    AND p.id_unidade = u.id ');
      qryItens.SQL.Add('    AND d.id_pedido = '+qryGridPEDIDO.AsString);
      qryItens.Open;

      sequencia  := 1;

      while not(qryItens.Eof) do Begin


         frmPedidos.qryItens.Append;
         frmPedidos.qryItensdescricao.AsString  := Trim(qryItensPRODUTO.AsString);
         frmPedidos.qryItensgtin.AsString       := Trim(qryItensCODIGO_BARRAS.AsString);
         frmPedidos.qryItensitem.AsString       := sequencia.ToString;
         frmPedidos.qryItensqtde.AsFloat        := StringParaFloat(FormatFloat('#0.000',qryItensQUANTIDADE.AsFloat));
         frmPedidos.qryItensunidade.AsString    := qryItensUNIDADE.AsString;
         frmPedidos.qryItensvlUnit.AsFloat      := StringParaFloat(FormatFloat('#0.000',qryItensVALOR_UNITARIO.AsFloat));
         frmPedidos.qryItensvlTotal.AsFloat     := StringParaFloat(FormatFloat('#0.000',qryItensVALOR_TOTAL.AsFloat));
         frmPedidos.qryItensidProduto.AsInteger := qryItensID_PRODUTO.AsInteger;
         frmPedidos.qryItens.Post;

         frmPedidos.total := frmPedidos.total + qryItensVALOR_TOTAL.AsFloat;

         frmPedidos.statuVenda := 1;
         frmPedidos.lblMensagemVenda.Caption := 'VENDA EM ANDAMENTO';
         frmPedidos.Totalizadores;

         frmPedidos.Label1.Visible := True;
         frmPedidos.qryItens.Open;

         frmPedidos.qryItens.Last;

         frmPedidos.edtCodigo.Text := '';
         frmPedidos.edtQuantidade.AsFloat := 1.000;

         Inc(sequencia);

         qryItens.Next;

      End;

      if qryGridTAXA_ENTREGA.AsFloat > 0 then Begin

         frmPedidos.qryItens.Append;
         frmPedidos.qryItensdescricao.AsString  := 'TAXA DE ENTREGA';
         frmPedidos.qryItensgtin.AsString       := '';
         frmPedidos.qryItensitem.AsString       := sequencia.ToString;
         frmPedidos.qryItensqtde.AsFloat        := 1.000;
         frmPedidos.qryItensunidade.AsString    := 'UND';
         frmPedidos.qryItensvlUnit.AsFloat      := StringParaFloat(FormatFloat('#0.000',qryGridTAXA_ENTREGA.AsFloat));
         frmPedidos.qryItensvlTotal.AsFloat     := StringParaFloat(FormatFloat('#0.000',qryGridTAXA_ENTREGA.AsFloat));
         frmPedidos.qryItensidProduto.AsInteger := 0;
         frmPedidos.qryItens.Post;

         frmPedidos.total := frmPedidos.total + qryGridTAXA_ENTREGA.AsFloat;
         frmPedidos.Totalizadores;
         frmPedidos.qryItens.Open;

         frmPedidos.qryItens.Last;

         frmPedidos.edtCodigo.Text := '';
         frmPedidos.edtQuantidade.AsFloat := 1.000;

      End;

      if qryGridVALOR_DESCONTO.AsFloat > 0 then Begin
         frmPedidos.acrescimo := qryGridVALOR_DESCONTO.AsFloat;
         frmPedidos.Totalizadores;
      End else if qryGridVALOR_DESCONTO.AsFloat < 0 then Begin
         frmPedidos.desconto := qryGridVALOR_DESCONTO.AsFloat * -1;
         frmPedidos.Totalizadores;
      End;

      cliente := TBaseLocalClientesVO.Create;
      cliente := TBaseLocalClientesController.RetornarClientePorID(qryGridID_CLIENTE.AsInteger);

      frmPedidos.idCliente                 := cliente.id;
      frmPedidos.lblNomeCliente.Caption    := Trim(cliente.nome);
      frmPedidos.lblCPFCNPJCliente.Caption := RetornarCPFCNPJcomMascara(cliente.cpf_cnpj);
      frmPedidos.lblNomeCliente.Visible    := True;
      frmPedidos.lblCliente.Visible        := True;
      frmPedidos.lblCPFCNPJCliente.Visible := True;
      frmPedidos.lblCPFCNPJ.Visible        := True;

      funcionario := TBaseLocalFuncionariosVO.Create;
      funcionario := TBaseLocalFuncionariosController.RetornarFuncionarioPorID(qryGridID_FUNCIONARIO.AsInteger);

      frmPedidos.idFuncionario              := funcionario.id;
      frmPedidos.lblFuncionario.Caption     := Trim(funcionario.nome);
      frmPedidos.lblNomeFuncionario.Visible := True;
      frmPedidos.lblFuncionario.Visible     := True;

      frmPedidos.idPedido := qryGridPEDIDO.AsInteger;

      frmPedidos.edtCodigo.SetFocus;

      frmPedidosPendentes.Close;
      frmMenuPrincipal.close;


   Finally

       FreeAndNil(cliente);
       FreeAndNil(funcionario);

   End;

end;

procedure TfrmPedidosPendentes.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPedidosPendentes.Label1Click(Sender: TObject);
begin

   Novo;

end;

procedure TfrmPedidosPendentes.LiberarPedido;
begin
   if qryGrid.IsEmpty then Begin
      prcMsgAdv('Selecione um registro');
      Exit;
   End;

   if fctMsgConfirmDefaultButtonNo('Confirma a liberação do pedido selecionado?') = false then
      Exit;

   Try
      TBaseLocalPedidoCabecalhoController.MudarStatusPedido(qryGridPEDIDO.AsString, 'L');
      prcMsgInf('Registro liberado com sucesso.');
      qryGrid.Refresh;
   Except
      prcMsgAdv('Falha ao liberar o status do pedido.');
   End;

end;

procedure TfrmPedidosPendentes.Novo;
begin
   {
   if TBaseLocalUsuariosController.VerificarPermissao(frmPrincipal.idUser, 'filtro_gerar_pedido') = false then Begin
      prcMsgAdv('Usuário sem permissão de acesso a função.');
      Exit;
   End;
   }
   Application.CreateForm(TfrmTelaDePedido, frmTelaDePedido);
   frmTelaDePedido.ShowModal;

end;

procedure TfrmPedidosPendentes.qryGridCalcFields(DataSet: TDataSet);
begin

   if qryGridVALOR_DESCONTO.AsFloat > 0 then
      qryGridcalcAcrescimo.AsFloat := qryGridVALOR_DESCONTO.AsFloat
   else if qryGridVALOR_DESCONTO.AsFloat < 0 then
      qryGridcalcDesconto.AsFloat := qryGridVALOR_DESCONTO.AsFloat * -1
end;

end.
