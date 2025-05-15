unit BaseLocalUsuariosVO;

interface

Type
   TBaseLocalUsuariosVO = class
  private
    FCODIGO: string;
    FID: integer;
    FSTATUS: string;
    FPW: string;
    FNOME: string;
    Fcpf: string;
    Ffiltro_acesso_vendas: String;
    Ffiltro_cadastro_produtos: String;
    Ffiltro_cadastro_funcionarios: String;
    Ffiltro_acesso_fechamento: String;
    Ffiltro_acesso_ped_ativos: String;
    Ffiltro_cadastro_clientes: String;
    Ffiltro_acesso_relatorios: String;
    Ffiltro_acesso_ped_cancelados: String;
    Ffiltro_acesso_exportacoes: String;
    Ffiltro_cadastro_pagamentos: String;
    Ffiltro_cadastro_unidades: String;
    Ffiltro_acesso_canc_venda: String;
    Ffiltro_acesso_canc_pedido: String;
    Ffiltro_cadastro_usuarios: String;
    Ffiltro_acesso_configuracoes: String;
    Ffiltro_cadastro_empresa: String;
    Ffiltro_gerar_pedido: String;
    FCancelar_Venda: String;
    FFiado: String;
    Fcadastro_fornecedores: String;
    FBloquear_Cliente_Venda_Fiado: String;
    Frel_VENDAS_POR_PERiODO: String;
    FRel_Produtos_Mais_Vendidos: String;
    FRel_Controle_Fiado_Cliente: String;
    Fcadastro_caixas: String;
    FFechamento_de_Caixa: String;
    FRel_Estoque_Produtos: String;
    FRecebimento_de_PG_Fiados: String;
    FImportacao_de_XML: String;
    Fcadastro_kit_produtos: String;
    Fentrada_manual: String;
    Fcadastro_promocoes: String;
    Fcadastro_categoria: String;
    procedure SetCODIGO(const Value: string);
    procedure SetID(const Value: integer);
    procedure SetNOME(const Value: string);
    procedure SetPW(const Value: string);
    procedure SetSTATUS(const Value: string);
    procedure Setcpf(const Value: string);
    procedure Setfiltro_acesso_canc_pedido(const Value: String);
    procedure Setfiltro_acesso_canc_venda(const Value: String);
    procedure Setfiltro_acesso_configuracoes(const Value: String);
    procedure Setfiltro_acesso_exportacoes(const Value: String);
    procedure Setfiltro_acesso_fechamento(const Value: String);
    procedure Setfiltro_acesso_ped_ativos(const Value: String);
    procedure Setfiltro_acesso_ped_cancelados(const Value: String);
    procedure Setfiltro_acesso_relatorios(const Value: String);
    procedure Setfiltro_acesso_vendas(const Value: String);
    procedure Setfiltro_cadastro_clientes(const Value: String);
    procedure Setfiltro_cadastro_empresa(const Value: String);
    procedure Setfiltro_cadastro_funcionarios(const Value: String);
    procedure Setfiltro_cadastro_pagamentos(const Value: String);
    procedure Setfiltro_cadastro_produtos(const Value: String);
    procedure Setfiltro_cadastro_unidades(const Value: String);
    procedure Setfiltro_cadastro_usuarios(const Value: String);
    procedure Setfiltro_gerar_pedido(const Value: String);
    procedure SetBloquear_Cliente_Venda_Fiado(const Value: String);
    procedure Setcadastro_caixas(const Value: String);
    procedure Setcadastro_categoria(const Value: String);
    procedure Setcadastro_fornecedores(const Value: String);
    procedure Setcadastro_kit_produtos(const Value: String);
    procedure Setcadastro_promocoes(const Value: String);
    procedure SetCancelar_Venda(const Value: String);
    procedure Setentrada_manual(const Value: String);
    procedure SetFechamento_de_Caixa(const Value: String);
    procedure SetFiado(const Value: String);
    procedure SetImportacao_de_XML(const Value: String);
    procedure SetRecebimento_de_PG_Fiados(const Value: String);
    procedure SetRel_Controle_Fiado_Cliente(const Value: String);
    procedure SetRel_Estoque_Produtos(const Value: String);
    procedure SetRel_Produtos_Mais_Vendidos(const Value: String);
    procedure Setrel_VENDAS_POR_PERiODO(const Value: String);
  published


      property ID: integer read FID write SetID;
      property STATUS: string read FSTATUS write SetSTATUS;
      property CODIGO: string read FCODIGO write SetCODIGO;
      property NOME: string read FNOME write SetNOME;
      property PW: string read FPW write SetPW;
      property cpf: string read Fcpf write Setcpf;
      property filtro_cadastro_empresa: String read Ffiltro_cadastro_empresa write Setfiltro_cadastro_empresa;
      property filtro_cadastro_usuarios: String read Ffiltro_cadastro_usuarios write Setfiltro_cadastro_usuarios;
      property filtro_cadastro_funcionarios: String read Ffiltro_cadastro_funcionarios write Setfiltro_cadastro_funcionarios;
      property filtro_cadastro_clientes: String read Ffiltro_cadastro_clientes write Setfiltro_cadastro_clientes;
      property filtro_cadastro_unidades: String read Ffiltro_cadastro_unidades write Setfiltro_cadastro_unidades;
      property filtro_cadastro_produtos: String read Ffiltro_cadastro_produtos write Setfiltro_cadastro_produtos;
      property filtro_cadastro_pagamentos: String read Ffiltro_cadastro_pagamentos write Setfiltro_cadastro_pagamentos;
      property filtro_acesso_vendas: String read Ffiltro_acesso_vendas write Setfiltro_acesso_vendas;
      property filtro_acesso_exportacoes: String read Ffiltro_acesso_exportacoes write Setfiltro_acesso_exportacoes;
      property filtro_acesso_relatorios: String read Ffiltro_acesso_relatorios write Setfiltro_acesso_relatorios;
      property filtro_acesso_configuracoes: String read Ffiltro_acesso_configuracoes write Setfiltro_acesso_configuracoes;
      property filtro_acesso_ped_ativos: String read Ffiltro_acesso_ped_ativos write Setfiltro_acesso_ped_ativos;
      property filtro_acesso_ped_cancelados: String read Ffiltro_acesso_ped_cancelados write Setfiltro_acesso_ped_cancelados;
      property filtro_acesso_canc_venda: String read Ffiltro_acesso_canc_venda write Setfiltro_acesso_canc_venda;
      property filtro_acesso_canc_pedido: String read Ffiltro_acesso_canc_pedido write Setfiltro_acesso_canc_pedido;
      property filtro_acesso_fechamento: String read Ffiltro_acesso_fechamento write Setfiltro_acesso_fechamento;
      property filtro_gerar_pedido: String read Ffiltro_gerar_pedido write Setfiltro_gerar_pedido;
      property cadastro_fornecedores: String read Fcadastro_fornecedores write Setcadastro_fornecedores;
      property cadastro_categoria: String read Fcadastro_categoria write Setcadastro_categoria;
      property cadastro_kit_produtos: String read Fcadastro_kit_produtos write Setcadastro_kit_produtos;
      property cadastro_caixas: String read Fcadastro_caixas write Setcadastro_caixas;
      property cadastro_promocoes: String read Fcadastro_promocoes write Setcadastro_promocoes;
      property entrada_manual: String read Fentrada_manual write Setentrada_manual;
      property Importacao_de_XML: String read FImportacao_de_XML write SetImportacao_de_XML;
      property Fiado: String read FFiado write SetFiado;
      property rel_VENDAS_POR_PERiODO: String read Frel_VENDAS_POR_PERiODO write Setrel_VENDAS_POR_PERiODO;
      property Rel_Produtos_Mais_Vendidos: String read FRel_Produtos_Mais_Vendidos write SetRel_Produtos_Mais_Vendidos;
      property Rel_Estoque_Produtos: String read FRel_Estoque_Produtos write SetRel_Estoque_Produtos;
      property Rel_Controle_Fiado_Cliente: String read FRel_Controle_Fiado_Cliente write SetRel_Controle_Fiado_Cliente;
      property Bloquear_Cliente_Venda_Fiado: String read FBloquear_Cliente_Venda_Fiado write SetBloquear_Cliente_Venda_Fiado;
      property Recebimento_de_PG_Fiados: String read FRecebimento_de_PG_Fiados write SetRecebimento_de_PG_Fiados;
      property Cancelar_Venda: String read FCancelar_Venda write SetCancelar_Venda;
      property Fechamento_de_Caixa: String read FFechamento_de_Caixa write SetFechamento_de_Caixa;

   end;

implementation

{ TBaseLocalUsuariosVO }

procedure TBaseLocalUsuariosVO.SetBloquear_Cliente_Venda_Fiado(
  const Value: String);
begin
  FBloquear_Cliente_Venda_Fiado := Value;
end;

procedure TBaseLocalUsuariosVO.Setcadastro_caixas(const Value: String);
begin
  Fcadastro_caixas := Value;
end;

procedure TBaseLocalUsuariosVO.Setcadastro_categoria(const Value: String);
begin
  Fcadastro_categoria := Value;
end;

procedure TBaseLocalUsuariosVO.Setcadastro_fornecedores(const Value: String);
begin
  Fcadastro_fornecedores := Value;
end;

procedure TBaseLocalUsuariosVO.Setcadastro_kit_produtos(const Value: String);
begin
  Fcadastro_kit_produtos := Value;
end;

procedure TBaseLocalUsuariosVO.Setcadastro_promocoes(const Value: String);
begin
  Fcadastro_promocoes := Value;
end;

procedure TBaseLocalUsuariosVO.SetCancelar_Venda(const Value: String);
begin
  FCancelar_Venda := Value;
end;

procedure TBaseLocalUsuariosVO.SetCODIGO(const Value: string);
begin
  FCODIGO := Value;
end;

procedure TBaseLocalUsuariosVO.Setcpf(const Value: string);
begin
  Fcpf := Value;
end;

procedure TBaseLocalUsuariosVO.Setentrada_manual(const Value: String);
begin
  Fentrada_manual := Value;
end;

procedure TBaseLocalUsuariosVO.SetFechamento_de_Caixa(const Value: String);
begin
  FFechamento_de_Caixa := Value;
end;

procedure TBaseLocalUsuariosVO.SetFiado(const Value: String);
begin
  FFiado := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_acesso_canc_pedido(
  const Value: String);
begin
  Ffiltro_acesso_canc_pedido := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_acesso_canc_venda(const Value: String);
begin
  Ffiltro_acesso_canc_venda := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_acesso_configuracoes(
  const Value: String);
begin
  Ffiltro_acesso_configuracoes := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_acesso_exportacoes(
  const Value: String);
begin
  Ffiltro_acesso_exportacoes := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_acesso_fechamento(const Value: String);
begin
  Ffiltro_acesso_fechamento := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_acesso_ped_ativos(const Value: String);
begin
  Ffiltro_acesso_ped_ativos := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_acesso_ped_cancelados(
  const Value: String);
begin
  Ffiltro_acesso_ped_cancelados := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_acesso_relatorios(const Value: String);
begin
  Ffiltro_acesso_relatorios := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_acesso_vendas(const Value: String);
begin
  Ffiltro_acesso_vendas := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_cadastro_clientes(const Value: String);
begin
  Ffiltro_cadastro_clientes := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_cadastro_empresa(const Value: String);
begin
  Ffiltro_cadastro_empresa := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_cadastro_funcionarios(
  const Value: String);
begin
  Ffiltro_cadastro_funcionarios := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_cadastro_pagamentos(
  const Value: String);
begin
  Ffiltro_cadastro_pagamentos := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_cadastro_produtos(const Value: String);
begin
  Ffiltro_cadastro_produtos := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_cadastro_unidades(const Value: String);
begin
  Ffiltro_cadastro_unidades := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_cadastro_usuarios(const Value: String);
begin
  Ffiltro_cadastro_usuarios := Value;
end;

procedure TBaseLocalUsuariosVO.Setfiltro_gerar_pedido(const Value: String);
begin
  Ffiltro_gerar_pedido := Value;
end;

procedure TBaseLocalUsuariosVO.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TBaseLocalUsuariosVO.SetImportacao_de_XML(const Value: String);
begin
  FImportacao_de_XML := Value;
end;

procedure TBaseLocalUsuariosVO.SetNOME(const Value: string);
begin
  FNOME := Value;
end;

procedure TBaseLocalUsuariosVO.SetPW(const Value: string);
begin
  FPW := Value;
end;

procedure TBaseLocalUsuariosVO.SetRecebimento_de_PG_Fiados(const Value: String);
begin
  FRecebimento_de_PG_Fiados := Value;
end;

procedure TBaseLocalUsuariosVO.SetRel_Controle_Fiado_Cliente(
  const Value: String);
begin
  FRel_Controle_Fiado_Cliente := Value;
end;

procedure TBaseLocalUsuariosVO.SetRel_Estoque_Produtos(const Value: String);
begin
  FRel_Estoque_Produtos := Value;
end;

procedure TBaseLocalUsuariosVO.SetRel_Produtos_Mais_Vendidos(
  const Value: String);
begin
  FRel_Produtos_Mais_Vendidos := Value;
end;

procedure TBaseLocalUsuariosVO.Setrel_VENDAS_POR_PERiODO(const Value: String);
begin
  Frel_VENDAS_POR_PERiODO := Value;
end;

procedure TBaseLocalUsuariosVO.SetSTATUS(const Value: string);
begin
  FSTATUS := Value;
end;

end.

