program prjBalcao;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untBalcao in 'untBalcao.pas' {frmBalcao},
  untPesquisarClientes in 'untPesquisarClientes.pas' {frmPesquisarClientes},
  BaseLocalClientesVO in '..\VO\BaseLocalClientesVO.pas',
  untBiblioteca in '..\Sources\untBiblioteca.pas',
  BaseLocalClientesController in '..\Controller\BaseLocalClientesController.pas',
  unitConfiguracoes in '..\Sources\unitConfiguracoes.pas',
  untCadastrarClientes in 'untCadastrarClientes.pas' {frmCadastrarClientes},
  untPesquisarFuncionarios in 'untPesquisarFuncionarios.pas' {frmPesquisarFuncionarios},
  untPesquisarProdutos in 'untPesquisarProdutos.pas' {frmPesquisarProdutos},
  PedidoProdutosVO in '..\VO\PedidoProdutosVO.pas',
  BaseLocalUnidadesController in '..\Controller\BaseLocalUnidadesController.pas',
  BaseLocalUnidadesVO in '..\VO\BaseLocalUnidadesVO.pas',
  BaseLocalPedidoCabecalhoVO in '..\VO\BaseLocalPedidoCabecalhoVO.pas',
  BaseLocalPedidoDetalheVO in '..\VO\BaseLocalPedidoDetalheVO.pas',
  BaseLocalFuncionariosVO in '..\VO\BaseLocalFuncionariosVO.pas',
  BaseLocalProdutosVO in '..\VO\BaseLocalProdutosVO.pas',
  BaseLocalProdutosController in '..\Controller\BaseLocalProdutosController.pas',
  BaseLocalPedidoCabecalhoController in '..\Controller\BaseLocalPedidoCabecalhoController.pas',
  BaseLocalPedidoDetalheController in '..\Controller\BaseLocalPedidoDetalheController.pas',
  untDescontoAcrescimo in 'untDescontoAcrescimo.pas' {frmDescontoAcrescimo},
  untCancelamentoItemPedido in 'untCancelamentoItemPedido.pas' {frmCancelamentoItemPedido},
  untPedidosPendentes in 'untPedidosPendentes.pas' {frmPedidosPendentes},
  BaseLocalFuncionariosController in '..\Controller\BaseLocalFuncionariosController.pas',
  untPedidosCancelados in 'untPedidosCancelados.pas' {frmPedidosCancelados},
  untLogin in 'untLogin.pas' {frmLogin},
  BaseLocalParametrosController in '..\Controller\BaseLocalParametrosController.pas',
  BaseLocalParametrosVO in '..\VO\BaseLocalParametrosVO.pas',
  BaseLocalUsuariosVO in '..\VO\BaseLocalUsuariosVO.pas',
  BaseLocalUsuariosController in '..\Controller\BaseLocalUsuariosController.pas',
  BaseLocalEmpresaController in '..\Controller\BaseLocalEmpresaController.pas',
  BaseLocalEmpresaVO in '..\VO\BaseLocalEmpresaVO.pas',
  untSplash in '..\Sources\untSplash.pas' {frmSplash},
  PedidoUsuariosVO in '..\VO\PedidoUsuariosVO.pas',
  PedidoUsuarioController in '..\Controller\PedidoUsuarioController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.Run;
end.
