unit untPesquisarUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, untPrincipal,
  JvExDBGrids, JvDBGrid, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, unitConfiguracoes,
  Vcl.Mask, RxDBCtrl;

type
  TfrmPesquisarUsuarios = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    mkeDescricao: TMaskEdit;
    Panel2: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    JvDBGrid1: TRxDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mkeDescricaoChange(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarUsuarios: TfrmPesquisarUsuarios;

implementation

{$R *.dfm}

uses untCadastrarUsuarios;

procedure TfrmPesquisarUsuarios.Confirmar;
begin

   if frmPrincipal.qryUsuarios.IsEmpty then Begin
      prcMsgAdv('Selecione um registro.');
      mkeDescricao.SetFocus;
      Exit;
   End;

   if origem = 'CADASTRO_USUARIOS' then Begin

      frmCadastrarUsuarios.HabilitarDesabilitarBotoes('E');
      frmCadastrarUsuarios.HabilitarDesabilitarCampos('H');
      frmCadastrarUsuarios.LimparCampos;
      frmCadastrarUsuarios.DAO := 'U';

      if frmPrincipal.qryUsuariosSTATUS.AsString = 'A' then
         frmCadastrarUsuarios.cbbStatus.ItemIndex := 0
      else
         frmCadastrarUsuarios.cbbStatus.ItemIndex := 1;

      frmCadastrarUsuarios.edtcpf.Text         := Trim(frmPrincipal.qryUsuariosCPF.AsString);
      frmCadastrarUsuarios.edtPW.Text          := Trim(DesCriptografa(Trim(frmPrincipal.qryUsuariosPW.AsString),50));
      frmCadastrarUsuarios.edtUser.Text        := Trim(frmPrincipal.qryUsuariosNOME.AsString);
      frmCadastrarUsuarios.edtConfirmarPW.Text := Trim(DesCriptografa(Trim(frmPrincipal.qryUsuariosPW.AsString),50));
      frmCadastrarUsuarios.idUser              := frmPrincipal.qryUsuariosID.AsInteger;

      frmCadastrarUsuarios.chkFiltroCadastrarEmpresa.Checked      := False;
      frmCadastrarUsuarios.chkFiltroCadastrarUsuarios.Checked     := False;
      frmCadastrarUsuarios.chkFiltroCadastrarFuncionarios.Checked := False;
      frmCadastrarUsuarios.chkFiltroCadastrarClientes.Checked     := False;
      frmCadastrarUsuarios.chkFiltroCadastrarUnidades.Checked     := False;
      frmCadastrarUsuarios.chkFiltroCadastrarProdutos.Checked     := False;
      frmCadastrarUsuarios.chkFiltroCadastrarPagamentos.Checked   := False;
      frmCadastrarUsuarios.chkFiltroCadastrarVendas.Checked       := False;
      //frmCadastrarUsuarios.chkFiltroAcerrarRelatorios.Checked    := False;
      frmCadastrarUsuarios.chkFiltroAcessarConfiguracoes.Checked  := False;
      //frmCadastrarUsuarios.chkFiltroAcessarPedidos.Checked        := False;
      //frmCadastrarUsuarios.chkFiltroAcessarPedidos.Checked        := False;
      //frmCadastrarUsuarios.chkFiltroAcessarExportacoes.Checked    := False;
      frmCadastrarUsuarios.chkFiltroFechamento.Checked            := False;
      frmCadastrarUsuarios.chkFiltroCAncelVenda.Checked           := False;
      //frmCadastrarUsuarios.chkFiltroCancelPedido.Checked          := False;
      frmCadastrarUsuarios.chkCadastroFornecedores.Checked        := False;
      frmCadastrarUsuarios.chkCategorias .Checked                 := False;
      frmCadastrarUsuarios.chkKitProdutos.Checked                 := False;
      frmCadastrarUsuarios.chkCadastroCaixas.Checked              := False;
      frmCadastrarUsuarios.chkPromocoes.Checked                   := False;
      frmCadastrarUsuarios.chkEntradaManual.Checked               := False;
      frmCadastrarUsuarios.chkImportacaoXML.Checked               := False;
      frmCadastrarUsuarios.chkAcessarFiados.Checked               := False;
      frmCadastrarUsuarios.chkBloquearClienteFiado.Checked        := False;
      frmCadastrarUsuarios.chkRecebimentoFiado.Checked            := False;
      frmCadastrarUsuarios.chkRelVendasPeriodo.Checked            := False;
      frmCadastrarUsuarios.chkRelProdutosMaisVendidos.Checked     := False;
      frmCadastrarUsuarios.chkRelEstoqueProdutos.Checked          := False;
      frmCadastrarUsuarios.chkRelFiadoPorCliente.Checked          := False;

      if frmPrincipal.qryUsuariosFILTRO_CADASTRO_EMPRESA.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroCadastrarEmpresa.Checked := True;

      if frmPrincipal.qryUsuariosFILTRO_CADASTRO_USUARIOS.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroCadastrarUsuarios.Checked := True;

      if frmPrincipal.qryUsuariosFILTRO_CADASTRO_FUNCIONARIOS.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroCadastrarFuncionarios.Checked := True;

      if frmPrincipal.qryUsuariosFILTRO_CADASTRO_CLIENTES.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroCadastrarClientes.Checked := True;

      if frmPrincipal.qryUsuariosFILTRO_CADASTRO_UNIDADES.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroCadastrarUnidades.Checked := True;

      if frmPrincipal.qryUsuariosFILTRO_CADASTRO_PRODUTOS.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroCadastrarProdutos.Checked := True;

      if frmPrincipal.qryUsuariosFILTRO_CADASTRO_PAGAMENTOS.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroCadastrarPagamentos.Checked := True;

      if frmPrincipal.qryUsuariosFILTRO_ACESSO_VENDAS.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroCadastrarVendas.Checked := True;

      //if frmPrincipal.qryUsuariosFILTRO_ACESSO_EXPORTACOES.AsString = 'S' then
      //   frmCadastrarUsuarios.chkFiltroAcessarExportacoes.Checked := True;

      //if frmPrincipal.qryUsuariosFILTRO_ACESSO_RELATORIOS.AsString = 'S' then
      //   frmCadastrarUsuarios.chkFiltroAcerrarRelatorios.Checked := True;

      if frmPrincipal.qryUsuariosFILTRO_ACESSO_CONFIGURACOES.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroAcessarConfiguracoes.Checked := True;

      //if frmPrincipal.qryUsuariosFILTRO_ACESSO_PED_ATIVOS.AsString = 'S' then
      //   frmCadastrarUsuarios.chkFiltroAcessarPedidos.Checked := True;

      //if frmPrincipal.qryUsuariosFILTRO_ACESSO_PED_CANCELADOS.AsString = 'S' then
      //   frmCadastrarUsuarios.chkFiltroAcessarPedidosCancelados.Checked := True;

      //if frmPrincipal.qryUsuariosFILTRO_GERAR_PEDIDO.AsString = 'S' then
      //   frmCadastrarUsuarios.chkFiltroGerarPedido.Checked := True;

      if frmPrincipal.qryUsuariosFILTRO_ACESSO_FECHAMENTO.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroFechamento.Checked := True;

      if frmPrincipal.qryUsuariosFILTRO_ACESSO_CANC_VENDA.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroCAncelVenda.Checked := True;
      {
      if frmPrincipal.qryUsuariosFILTRO_ACESSO_CANC_PEDIDO.AsString = 'S' then
         frmCadastrarUsuarios.chkFiltroCancelPedido.Checked := True;
      }
      if frmPrincipal.qryUsuariosCADASTRO_FORNECEDORES.AsString = 'S' then
         frmCadastrarUsuarios.chkCadastroFornecedores.Checked := True;

      if frmPrincipal.qryUsuariosCADASTRO_CATEGORIA.AsString = 'S' then
         frmCadastrarUsuarios.chkCategorias .Checked := True;

      if frmPrincipal.qryUsuariosCADASTRO_KIT_PRODUTOS.AsString = 'S' then
         frmCadastrarUsuarios.chkKitProdutos.Checked := True;

      if frmPrincipal.qryUsuariosCADASTRO_CAIXAS.AsString = 'S' then
         frmCadastrarUsuarios.chkCadastroCaixas.Checked := True;

      if frmPrincipal.qryUsuariosCADASTRO_PROMOCOES.AsString = 'S' then
         frmCadastrarUsuarios.chkPromocoes.Checked := True;

      if frmPrincipal.qryUsuariosENTRADA_MANUAL.AsString = 'S' then
         frmCadastrarUsuarios.chkEntradaManual.Checked := True;

      if frmPrincipal.qryUsuariosIMPORTACAO_DE_XML.AsString = 'S' then
         frmCadastrarUsuarios.chkImportacaoXML.Checked := True;

      if frmPrincipal.qryUsuariosFIADO.AsString = 'S' then
         frmCadastrarUsuarios.chkAcessarFiados.Checked := True;

      if frmPrincipal.qryUsuariosBLOQUEAR_CLIENTE_VENDA_FIADO.AsString = 'S' then
         frmCadastrarUsuarios.chkBloquearClienteFiado.Checked := True;

      if frmPrincipal.qryUsuariosRECEBIMENTO_DE_PG_FIADOS.AsString = 'S' then
         frmCadastrarUsuarios.chkRecebimentoFiado.Checked := True;

      if frmPrincipal.qryUsuariosREL_VENDAS_POR_PERIODO.AsString = 'S' then
         frmCadastrarUsuarios.chkRelVendasPeriodo.Checked := True;

      if frmPrincipal.qryUsuariosREL_PRODUTOS_MAIS_VENDIDOS.AsString = 'S' then
         frmCadastrarUsuarios.chkRelProdutosMaisVendidos.Checked := True;

      if frmPrincipal.qryUsuariosREL_ESTOQUE_PRODUTOS.AsString = 'S' then
         frmCadastrarUsuarios.chkRelEstoqueProdutos.Checked := True;

      if frmPrincipal.qryUsuariosREL_CONTROLE_FIADO_CLIENTE.AsString = 'S' then
         frmCadastrarUsuarios.chkRelFiadoPorCliente.Checked := True;



      frmCadastrarUsuarios.cbbStatus.SetFocus;

   End;

   close;

end;

procedure TfrmPesquisarUsuarios.Filtrar;
begin

   frmPrincipal.qryUsuarios.Filtered := False;
   frmPrincipal.qryUsuarios.Filter := ' nome like '+QuotedStr(Trim(Copy(mkeDescricao.Text,1,120))+'%');
   frmPrincipal.qryUsuarios.Filtered := True;

   lblTotal.Caption := 'Total de Usuários: '+frmPrincipal.qryUsuarios.RecordCount.ToString;
   frmPrincipal.qryUsuarios.First;

end;

procedure TfrmPesquisarUsuarios.FormCreate(Sender: TObject);
begin

   frmPrincipal.qryUsuarios.Close;
   frmPrincipal.qryUsuarios.Open;
   Filtrar;

end;

procedure TfrmPesquisarUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case KEY of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmPesquisarUsuarios.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarUsuarios.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarUsuarios.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarUsuarios.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarUsuarios.mkeDescricaoChange(Sender: TObject);
begin

   filtrar;

end;

procedure TfrmPesquisarUsuarios.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   case key of

      VK_DOWN: JvDBGrid1.SetFocus;

   end;

end;

end.
