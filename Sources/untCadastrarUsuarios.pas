unit untCadastrarUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, baseLocalUsuariosVO, baseLocalUsuariosController,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.ExtCtrls, unitConfiguracoes;

type
  TfrmCadastrarUsuarios = class(TForm)
    cbbStatus: TComboBox;
    Label1: TLabel;
    Label4: TLabel;
    edtcpf: TMaskEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel4: TPanel;
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label3: TLabel;
    edtPW: TMaskEdit;
    Label5: TLabel;
    edtConfirmarPW: TMaskEdit;
    Label6: TLabel;
    edtUser: TMaskEdit;
    grpPermissoes: TGroupBox;
    chkFiltroCAncelVenda: TCheckBox;
    chkFiltroFechamento: TCheckBox;
    chkFiltroCadastrarEmpresa: TCheckBox;
    chkFiltroCadastrarUsuarios: TCheckBox;
    chkFiltroCadastrarFuncionarios: TCheckBox;
    chkFiltroCadastrarClientes: TCheckBox;
    chkFiltroCadastrarUnidades: TCheckBox;
    chkFiltroCadastrarProdutos: TCheckBox;
    chkFiltroCadastrarPagamentos: TCheckBox;
    chkFiltroCadastrarVendas: TCheckBox;
    chkFiltroAcessarConfiguracoes: TCheckBox;
    chkCadastroFornecedores: TCheckBox;
    chkCategorias: TCheckBox;
    chkKitProdutos: TCheckBox;
    chkCadastroCaixas: TCheckBox;
    chkPromocoes: TCheckBox;
    chkEntradaManual: TCheckBox;
    chkImportacaoXML: TCheckBox;
    chkAcessarFiados: TCheckBox;
    chkBloquearClienteFiado: TCheckBox;
    chkRecebimentoFiado: TCheckBox;
    chkRelVendasPeriodo: TCheckBox;
    chkRelProdutosMaisVendidos: TCheckBox;
    chkRelEstoqueProdutos: TCheckBox;
    chkRelFiadoPorCliente: TCheckBox;
    procedure speSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var DAO: string;
        idUser: integer;
    procedure Novo;
    procedure Salvar;
    procedure Cancelar;
    procedure HabilitarDesabilitarBotoes(tipo: string);
    procedure HabilitarDesabilitarCampos(tipo: string);
    procedure LimparCampos;
    procedure Pesquisar;
  end;

var
  frmCadastrarUsuarios: TfrmCadastrarUsuarios;

implementation

{$R *.dfm}

uses untPesquisarUsuarios;

{ TfrmCadastrarUsuarios }

procedure TfrmCadastrarUsuarios.Cancelar;
begin

   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');

end;

procedure TfrmCadastrarUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case Key of

      VK_ESCAPE: Close;

   end;

end;

procedure TfrmCadastrarUsuarios.HabilitarDesabilitarBotoes(tipo: string);
begin

   if tipo = 'N' then Begin

      speNovo.Enabled     := False;
      speSalvar.Enabled   := True;
      speCancelar.Enabled := True;

   End;

   if tipo = 'E' then Begin

      speNovo.Enabled     := False;
      speSalvar.Enabled   := True;
      speCancelar.Enabled := True;

   End;

   if tipo = 'X' then Begin

      speNovo.Enabled     := True;
      speSalvar.Enabled   := False;
      speCancelar.Enabled := False;

   End;

   if tipo = 'C' then Begin

      speNovo.Enabled     := True;
      speSalvar.Enabled   := False;
      speCancelar.Enabled := False;

   End;

   if tipo = 'S' then Begin

      speNovo.Enabled     := True;
      speSalvar.Enabled   := False;
      speCancelar.Enabled := False;

   End;

end;

procedure TfrmCadastrarUsuarios.HabilitarDesabilitarCampos(tipo: string);
begin

   if tipo = 'H' then Begin

      cbbStatus.Enabled      := True;
      edtcpf.Enabled         := True;
      edtPW.Enabled          := True;
      edtConfirmarPW.Enabled := True;
      edtUser.Enabled        := True;
      grpPermissoes.Enabled  := True;


   End else if tipo = 'D' then Begin

      cbbStatus.Enabled      := False;
      edtcpf.Enabled         := False;
      edtPW.Enabled          := False;
      edtConfirmarPW.Enabled := False;
      edtUser.Enabled        := False;
      grpPermissoes.Enabled  := False;

   End;

end;

procedure TfrmCadastrarUsuarios.Image1Click(Sender: TObject);
begin

   Close;

end;

procedure TfrmCadastrarUsuarios.LimparCampos;
begin

   cbbStatus.ItemIndex := -1;
   edtcpf.Text         := '';
   edtPW.Text          := '';
   edtConfirmarPW.Text := '';
   edtUser.Text        := '';
   idUser              := 0;
   DAO                 := '';

   chkFiltroCAncelVenda.Checked              := False;
   //chkFiltroCancelPedido.Checked             := False;
   chkFiltroFechamento.Checked               := False;
   //chkFiltroGerarPedido.Checked              := False;
   chkFiltroCadastrarEmpresa.Checked         := False;
   chkFiltroCadastrarUsuarios.Checked        := False;
   chkFiltroCadastrarFuncionarios.Checked    := False;
   chkFiltroCadastrarClientes.Checked        := False;
   chkFiltroCadastrarUnidades.Checked        := False;
   chkFiltroCadastrarProdutos.Checked        := False;
   chkFiltroCadastrarPagamentos.Checked      := False;
   chkFiltroCadastrarVendas.Checked          := False;
   //chkFiltroAcessarExportacoes.Checked       := False;
   //chkFiltroAcerrarRelatorios.Checked        := False;
   chkFiltroAcessarConfiguracoes.Checked     := False;
   //chkFiltroAcessarPedidos.Checked           := False;
   //chkFiltroAcessarPedidosCancelados.Checked := False;
   chkCadastroFornecedores.Checked           := False;
   chkCategorias.Checked                     := False;
   chkKitProdutos.Checked                    := False;
   chkCadastroCaixas.Checked                 := False;
   chkPromocoes.Checked                      := False;
   chkEntradaManual.Checked                  := False;
   chkImportacaoXML.Checked                  := False;
   chkAcessarFiados.Checked                  := False;
   chkBloquearClienteFiado.Checked           := False;
   chkRecebimentoFiado.Checked               := False;
   chkRelVendasPeriodo.Checked               := False;
   chkRelProdutosMaisVendidos.Checked        := False;
   chkRelEstoqueProdutos.Checked             := False;
   chkRelFiadoPorCliente.Checked             := False;
   //chkCancelarVenda.Checked                  := False;
   //chkFechamentoCaixa.Checked                := False;

end;

procedure TfrmCadastrarUsuarios.Novo;
begin

   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;
   cbbStatus.ItemIndex := 0;
   cbbStatus.SetFocus;
   DAO := 'N';

end;

procedure TfrmCadastrarUsuarios.Pesquisar;
begin

   Application.CreateForm(TfrmPesquisarUsuarios, frmPesquisarUsuarios);
   frmPesquisarUsuarios.origem := 'CADASTRO_USUARIOS';
   frmPesquisarUsuarios.ShowModal;

end;

procedure TfrmCadastrarUsuarios.Salvar;
var usuario: TBaseLocalUsuariosVO;
begin

   if cbbStatus.ItemIndex < 0 then Begin
      prcMsgAdv('Informe O status do usuário.');
      cbbStatus.SetFocus;
      Exit;
   End;

   if Length(Trim(edtCpf.Text)) <> 11 then Begin
      prcMsgAdv('CPF inválido.');
      edtcpf.SetFocus;
      Exit;
   End;

   if fctValidCPF(Trim(edtCpf.Text)) = false then Begin
      prcMsgAdv('CPF inválido.');
      edtcpf.SetFocus;
      Exit;
   End;

   if ((TBaseLocalUsuariosController.VerificarSeUsuarioExiste(Trim(edtcpf.Text))) and (DAO = 'N')) then Begin
      prcMsgAdv('CPF já consta cadastrado como usuário.');
      edtcpf.SetFocus;
      Exit;
   End;

   if Trim(edtUser.Text) = '' then Begin
      prcMsgAdv('Informe o nome do usuário.');
      edtUser.SetFocus;
      Exit;
   End;

   if Trim(edtPW.Text) = '' then Begin
      prcMsgAdv('Informe a senha do usuário.');
      edtUser.SetFocus;
      Exit;
   End;

   if Trim(edtPW.Text) <> Trim(edtConfirmarPW.Text) then Begin
      prcMsgAdv('Senha e confirmação de senha não conferem.');
      edtPW.SetFocus;
      Exit;
   End;

   Try

      usuario := TBaseLocalUsuariosVO.Create;

      usuario.STATUS   := Copy(Trim(cbbStatus.Text),1,1);
      usuario.CODIGO   := '';
      usuario.NOME     := Trim(edtUser.Text);
      usuario.PW       := Trim(edtPW.Text);
      usuario.cpf      := Trim(edtcpf.Text);

      //02
      if chkFiltroCAncelVenda.Checked then
         usuario.filtro_acesso_canc_venda := 'S'
      else
         usuario.filtro_acesso_canc_venda := 'N';

      //03
      {
      if chkFiltroCancelPedido.Checked then
         usuario.filtro_acesso_canc_pedido := 'S'
      else
         usuario.filtro_acesso_canc_pedido := 'N';
      }
      //01
      if chkFiltroFechamento.Checked then
         usuario.filtro_acesso_fechamento := 'S'
      else
         usuario.filtro_acesso_fechamento := 'N';

      //04
      {
      if chkFiltroGerarPedido.Checked then
         usuario.filtro_gerar_pedido := 'S'
      else
         usuario.filtro_gerar_pedido := 'N';
      }
      //05
      if chkFiltroCadastrarEmpresa.Checked then
         usuario.filtro_cadastro_empresa := 'S'
      else
         usuario.filtro_cadastro_empresa := 'N';

      //06
      if chkFiltroCadastrarUsuarios.Checked then
         usuario.filtro_cadastro_usuarios := 'S'
      else
         usuario.filtro_cadastro_usuarios := 'N';

      //07
      if chkFiltroCadastrarFuncionarios.Checked then
         usuario.filtro_cadastro_funcionarios := 'S'
      else
         usuario.filtro_cadastro_funcionarios := 'N';

      //08
      if chkFiltroCadastrarClientes.Checked then
         usuario.filtro_cadastro_clientes := 'S'
      else
         usuario.filtro_cadastro_clientes := 'N';

      //09
      if chkFiltroCadastrarUnidades.Checked then
         usuario.filtro_cadastro_unidades := 'S'
      else
         usuario.filtro_cadastro_unidades := 'N';

      //10
      if chkFiltroCadastrarProdutos.Checked then
         usuario.filtro_cadastro_produtos := 'S'
      else
         usuario.filtro_cadastro_produtos := 'N';

      //11
      if chkFiltroCadastrarPagamentos.Checked then
         usuario.filtro_cadastro_pagamentos := 'S'
      else
         usuario.filtro_cadastro_pagamentos := 'N';

      //12
      if chkFiltroCadastrarVendas.Checked then
         usuario.filtro_acesso_vendas := 'S'
      else
         usuario.filtro_acesso_vendas := 'N';

      //13
      {
      if chkFiltroAcessarExportacoes.Checked then
         usuario.filtro_acesso_exportacoes := 'S'
      else
         usuario.filtro_acesso_exportacoes := 'N';
      }
      //14
      {
      if chkFiltroAcerrarRelatorios.Checked then
         usuario.filtro_acesso_relatorios := 'S'
      else
         usuario.filtro_acesso_relatorios := 'N';
      }
      //15
      if chkFiltroAcessarConfiguracoes.Checked then
         usuario.filtro_acesso_configuracoes := 'S'
      else
         usuario.filtro_acesso_configuracoes := 'N';

      //16
      {
      if chkFiltroAcessarPedidos.Checked then
         usuario.filtro_acesso_ped_ativos := 'S'
      else
         usuario.filtro_acesso_ped_ativos := 'N';
      }
      //17
      {
      if chkFiltroAcessarPedidosCancelados.Checked then
         usuario.filtro_acesso_ped_cancelados := 'S'
      else
         usuario.filtro_acesso_ped_cancelados := 'N';
      }
      //18
      if chkCadastroFornecedores.Checked then
         usuario.cadastro_fornecedores := 'S'
      else
         usuario.cadastro_fornecedores := 'N';

      //19
      if chkCategorias.Checked then
         usuario.cadastro_categoria := 'S'
      else
         usuario.cadastro_categoria := 'N';

      //20
      if chkKitProdutos.Checked then
         usuario.cadastro_kit_produtos := 'S'
      else
         usuario.cadastro_kit_produtos := 'N';

      //21
      if chkCadastroCaixas.Checked then
         usuario.cadastro_caixas := 'S'
      else
         usuario.cadastro_caixas := 'N';

      //22
      if chkPromocoes.Checked then
         usuario.cadastro_promocoes := 'S'
      else
         usuario.cadastro_promocoes := 'N';

      //23
      if chkEntradaManual.Checked then
         usuario.entrada_manual := 'S'
      else
         usuario.entrada_manual := 'N';

      //24
      if chkImportacaoXML.Checked then
         usuario.Importacao_de_XML := 'S'
      else
         usuario.Importacao_de_XML := 'N';

      //25
      if chkAcessarFiados.Checked then
         usuario.Fiado := 'S'
      else
         usuario.Fiado := 'N';

      //26
      if chkBloquearClienteFiado.Checked then
         usuario.Bloquear_Cliente_Venda_Fiado := 'S'
      else
         usuario.Bloquear_Cliente_Venda_Fiado := 'N';

      //27
      if chkRecebimentoFiado.Checked then
         usuario.Recebimento_de_PG_Fiados := 'S'
      else
         usuario.Recebimento_de_PG_Fiados := 'N';

      //28
      if chkRelVendasPeriodo.Checked then
         usuario.rel_VENDAS_POR_PERiODO := 'S'
      else
         usuario.rel_VENDAS_POR_PERiODO := 'N';

      //29
      if chkRelProdutosMaisVendidos.Checked then
         usuario.Rel_Produtos_Mais_Vendidos := 'S'
      else
         usuario.Rel_Produtos_Mais_Vendidos := 'N';

      //30
      if chkRelEstoqueProdutos.Checked then
         usuario.Rel_Estoque_Produtos := 'S'
      else
         usuario.Rel_Estoque_Produtos := 'N';

      //31
      if chkRelFiadoPorCliente.Checked then
         usuario.Rel_Controle_Fiado_Cliente := 'S'
      else
         usuario.Rel_Controle_Fiado_Cliente := 'N';

      //32
      {
      if chkCancelarVenda.Checked then
         usuario.Cancelar_Venda := 'S'
      else
         usuario.Cancelar_Venda := 'N';
      }
      //33
      {
      if chkFechamentoCaixa.Checked then
         usuario.Fechamento_de_Caixa := 'S'
      else
         usuario.Fechamento_de_Caixa := 'N';
      }
      if DAO = 'U' then Begin
         usuario.ID    := idUser;
         TBaseLocalUsuariosController.AlterarUsuario(usuario);
      End else
         TBaseLocalUsuariosController.GravarUsuario(usuario);

   Finally

      FreeAndNil(usuario);

   End;

end;

procedure TfrmCadastrarUsuarios.speCancelarClick(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCadastrarUsuarios.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarUsuarios.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

procedure TfrmCadastrarUsuarios.SpeedButton5Click(Sender: TObject);
begin

   Pesquisar;

end;

end.
