unit BaseLocalUsuariosController;

interface

uses generics.Collections, system.sysutils,  system.JSON, rest.json, rest.types,
     unitConfiguracoes, BaseLocalUsuariosVO, FireDAC.Comp.DataSet,
     FireDAC.Comp.Client;

Type TBaseLocalUsuariosController = class

   public
      Class Function ValidarUsuario(user: TBaseLocalUsuariosVO): TBaseLocalUsuariosVO;
      class Procedure GravarUsuario(user: TBaseLocalUsuariosVO);
      class Procedure AlterarUsuario(user: TBaseLocalUsuariosVO);
      class Function VerificarSeUsuarioExiste(cpf: string): Boolean;
      class Function VerificarPermissao(idUser: integer; campo: String): Boolean;

end;

implementation

uses untPrincipal;

{ TBaseLocalUsuariosController }

class procedure TBaseLocalUsuariosController.AlterarUsuario(user: TBaseLocalUsuariosVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' UPDATE usuarios SET status = :status, ');
      query.SQL.Add('                     codigo = :codigo, ');
      query.SQL.Add('                     nome = :nome, ');
      query.SQL.Add('                     pw = :pw, ');
      query.SQL.Add('                     cpf = :cpf, ');
      query.SQL.Add('                     filtro_cadastro_empresa = :filtro_cadastro_empresa, ');
      query.SQL.Add('                     filtro_cadastro_usuarios = :filtro_cadastro_usuarios, ');
      query.SQL.Add('                     filtro_cadastro_funcionarios = :filtro_cadastro_funcionarios, ');
      query.SQL.Add('                     filtro_cadastro_clientes = :filtro_cadastro_clientes, ');
      query.SQL.Add('                     filtro_cadastro_unidades = :filtro_cadastro_unidades, ');
      query.SQL.Add('                     filtro_cadastro_produtos = :filtro_cadastro_produtos, ');
      query.SQL.Add('                     filtro_cadastro_pagamentos = :filtro_cadastro_pagamentos, ');
      query.SQL.Add('                     filtro_acesso_vendas = :filtro_acesso_vendas, ');
      query.SQL.Add('                     filtro_acesso_exportacoes = :filtro_acesso_exportacoes, ');
      query.SQL.Add('                     filtro_acesso_relatorios = :filtro_acesso_relatorios, ');
      query.SQL.Add('                     filtro_acesso_configuracoes = :filtro_acesso_configuracoes, ');
      query.SQL.Add('                     filtro_acesso_ped_ativos = :filtro_acesso_ped_ativos, ');
      query.SQL.Add('                     filtro_acesso_ped_cancelados = :filtro_acesso_ped_cancelados, ');
      query.SQL.Add('                     filtro_acesso_canc_venda = :filtro_acesso_canc_venda, ');
      query.SQL.Add('                     filtro_acesso_canc_pedido = :filtro_acesso_canc_pedido, ');
      query.SQL.Add('                     filtro_acesso_fechamento = :filtro_acesso_fechamento, ');
      query.SQL.Add('                     filtro_gerar_pedido = :filtro_gerar_pedido, ');
      query.SQL.Add('                     cadastro_fornecedores = :cadastro_fornecedores, ');
      query.SQL.Add('                     cadastro_categoria = :cadastro_categoria, ');
      query.SQL.Add('                     cadastro_kit_produtos = :cadastro_kit_produtos, ');
      query.SQL.Add('                     cadastro_caixas = :cadastro_caixas, ');
      query.SQL.Add('                     cadastro_promocoes = :cadastro_promocoes, ');
      query.SQL.Add('                     entrada_manual = :entrada_manual, ');
      query.SQL.Add('                     Importacao_de_XML = :Importacao_de_XML,  ');
      query.SQL.Add('                     Fiado = :Fiado,  ');
      query.SQL.Add('                     rel_VENDAS_POR_PERiODO = :rel_VENDAS_POR_PERiODO, ');
      query.SQL.Add('                     Rel_Produtos_Mais_Vendidos = :Rel_Produtos_Mais_Vendidos, ');
      query.SQL.Add('                     Rel_Estoque_Produtos = :Rel_Estoque_Produtos, ');
      query.SQL.Add('                     Rel_Controle_Fiado_Cliente = :Rel_Controle_Fiado_Cliente, ');
      query.SQL.Add('                     Bloquear_Cliente_Venda_Fiado = :Bloquear_Cliente_Venda_Fiado, ');
      query.SQL.Add('                     Recebimento_de_PG_Fiados = :Recebimento_de_PG_Fiados, ');
      query.SQL.Add('                     Cancelar_Venda = :Cancelar_Venda, ');
      query.SQL.Add('                     Fechamento_de_Caixa = :Fechamento_de_Caixa ');
      query.SQL.Add('  WHERE id = :id ');

      query.Params.ParamByName('status').AsString                       := Trim(user.STATUS);
      query.Params.ParamByName('codigo').AsString                       := Trim(user.CODIGO);
      query.Params.ParamByName('nome').AsString                         := Trim(user.NOME);
      query.Params.ParamByName('pw').AsString                           := Criptografa(Trim(user.PW),50);
      query.Params.ParamByName('cpf').AsString                          := Trim(user.cpf);
      query.Params.ParamByName('id').AsInteger                          := user.ID;
      query.Params.ParamByName('filtro_cadastro_empresa').AsString      := user.filtro_cadastro_empresa;
      query.Params.ParamByName('filtro_cadastro_usuarios').AsString     := user.filtro_cadastro_usuarios;
      query.Params.ParamByName('filtro_cadastro_funcionarios').AsString := user.filtro_cadastro_funcionarios;
      query.Params.ParamByName('filtro_cadastro_clientes').AsString     := user.filtro_cadastro_clientes;
      query.Params.ParamByName('filtro_cadastro_unidades').AsString     := user.filtro_cadastro_unidades;
      query.Params.ParamByName('filtro_cadastro_produtos').AsString     := user.filtro_cadastro_produtos;
      query.Params.ParamByName('filtro_cadastro_pagamentos').AsString   := user.filtro_cadastro_pagamentos;
      query.Params.ParamByName('filtro_acesso_vendas').AsString         := user.filtro_acesso_vendas;
      query.Params.ParamByName('filtro_acesso_exportacoes').AsString    := user.filtro_acesso_exportacoes;
      query.Params.ParamByName('filtro_acesso_relatorios').AsString     := user.filtro_acesso_relatorios;
      query.Params.ParamByName('filtro_acesso_configuracoes').AsString  := user.filtro_acesso_configuracoes;
      query.Params.ParamByName('filtro_acesso_ped_ativos').AsString     := user.filtro_acesso_ped_ativos;
      query.Params.ParamByName('filtro_acesso_ped_cancelados').AsString := user.filtro_acesso_ped_cancelados;
      query.Params.ParamByName('filtro_acesso_canc_venda').AsString     := user.filtro_acesso_canc_venda;
      query.Params.ParamByName('filtro_acesso_canc_pedido').AsString    := user.filtro_acesso_canc_pedido;
      query.Params.ParamByName('filtro_acesso_fechamento').AsString     := user.filtro_acesso_fechamento;
      query.Params.ParamByName('filtro_gerar_pedido').AsString          := user.filtro_gerar_pedido;
      query.Params.ParamByName('cadastro_fornecedores').AsString        := user.cadastro_fornecedores;
      query.Params.ParamByName('cadastro_categoria').AsString           := user.cadastro_categoria;
      query.Params.ParamByName('cadastro_kit_produtos').AsString        := user.cadastro_kit_produtos;
      query.Params.ParamByName('cadastro_caixas').AsString              := user.cadastro_caixas;
      query.Params.ParamByName('cadastro_promocoes').AsString           := user.cadastro_promocoes;
      query.Params.ParamByName('entrada_manual').AsString               := user.entrada_manual;
      query.Params.ParamByName('Importacao_de_XML').AsString            := user.Importacao_de_XML;
      query.Params.ParamByName('Fiado').AsString                        := user.Fiado;
      query.Params.ParamByName('rel_VENDAS_POR_PERiODO').AsString       := user.rel_VENDAS_POR_PERiODO;
      query.Params.ParamByName('Rel_Produtos_Mais_Vendidos').AsString   := user.Rel_Produtos_Mais_Vendidos;
      query.Params.ParamByName('Rel_Estoque_Produtos').AsString         := user.Rel_Estoque_Produtos;
      query.Params.ParamByName('Rel_Controle_Fiado_Cliente').AsString   := user.Rel_Controle_Fiado_Cliente;
      query.Params.ParamByName('Bloquear_Cliente_Venda_Fiado').AsString := user.Bloquear_Cliente_Venda_Fiado;
      query.Params.ParamByName('Recebimento_de_PG_Fiados').AsString     := user.Recebimento_de_PG_Fiados;
      query.Params.ParamByName('Cancelar_Venda').AsString               := user.Cancelar_Venda;
      query.Params.ParamByName('Fechamento_de_Caixa').AsString          := user.Fechamento_de_Caixa;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         Try
            frmPrincipal.qryUsuarios.Refresh;
         Except
            frmPrincipal.qryUsuarios.Close;
            frmPrincipal.qryUsuarios.Open;
         End;
         prcMsgInf('Registro alterado com sucesso.');
      Except
         frmPrincipal.ConexaoLocal.Rollback;
         Try
            frmPrincipal.qryUsuarios.Refresh;
         Except
            frmPrincipal.qryUsuarios.Close;
            frmPrincipal.qryUsuarios.Open;
         End;
         prcMsgErro('Não foi possível alterar o registro.');
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class procedure TBaseLocalUsuariosController.GravarUsuario(user: TBaseLocalUsuariosVO);
var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' INSERT INTO usuarios ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' status, codigo, nome, pw, cpf, filtro_cadastro_empresa, filtro_cadastro_usuarios, ');
      query.SQL.Add(' filtro_cadastro_funcionarios, filtro_cadastro_clientes, filtro_cadastro_unidades, ');
      query.SQL.Add(' filtro_cadastro_produtos, filtro_cadastro_pagamentos, filtro_acesso_vendas, ');
      query.SQL.Add(' filtro_acesso_exportacoes, filtro_acesso_relatorios, filtro_acesso_configuracoes, ');
      query.SQL.Add(' filtro_acesso_ped_ativos, filtro_acesso_ped_cancelados, filtro_acesso_canc_venda, ');
      query.SQL.Add(' filtro_acesso_canc_pedido, filtro_acesso_fechamento, filtro_gerar_pedido,  ');
      query.SQL.Add(' cadastro_fornecedores, cadastro_categoria, cadastro_kit_produtos, ');
      query.SQL.Add(' cadastro_caixas, cadastro_promocoes, entrada_manual, Importacao_de_XML, ');
      query.SQL.Add(' Fiado, rel_VENDAS_POR_PERiODO, Rel_Produtos_Mais_Vendidos, Rel_Estoque_Produtos, ');
      query.SQL.Add(' Rel_Controle_Fiado_Cliente, Bloquear_Cliente_Venda_Fiado, Recebimento_de_PG_Fiados, ');
      query.SQL.Add(' Cancelar_Venda, Fechamento_de_Caixa ');
      query.SQL.Add(' )   ');
      query.SQL.Add(' VALUES   ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' :status, :codigo, :nome, :pw, :cpf, :filtro_cadastro_empresa, :filtro_cadastro_usuarios, ');
      query.SQL.Add(' :filtro_cadastro_funcionarios, :filtro_cadastro_clientes, :filtro_cadastro_unidades, ');
      query.SQL.Add(' :filtro_cadastro_produtos, :filtro_cadastro_pagamentos, :filtro_acesso_vendas, ');
      query.SQL.Add(' :filtro_acesso_exportacoes, :filtro_acesso_relatorios, :filtro_acesso_configuracoes, ');
      query.SQL.Add(' :filtro_acesso_ped_ativos, :filtro_acesso_ped_cancelados, :filtro_acesso_canc_venda, ');
      query.SQL.Add(' :filtro_acesso_canc_pedido, :filtro_acesso_fechamento, :filtro_gerar_pedido,  ');
      query.SQL.Add(' :cadastro_fornecedores, :cadastro_categoria, :cadastro_kit_produtos, ');
      query.SQL.Add(' :cadastro_caixas, :cadastro_promocoes, :entrada_manual, :Importacao_de_XML, ');
      query.SQL.Add(' :Fiado, :rel_VENDAS_POR_PERiODO, :Rel_Produtos_Mais_Vendidos, :Rel_Estoque_Produtos, ');
      query.SQL.Add(' :Rel_Controle_Fiado_Cliente, :Bloquear_Cliente_Venda_Fiado, :Recebimento_de_PG_Fiados, ');
      query.SQL.Add(' :Cancelar_Venda, :Fechamento_de_Caixa ');
      query.SQL.Add(' ) ');

      query.Params.ParamByName('status').AsString := Trim(user.STATUS);
      query.Params.ParamByName('codigo').AsString := Trim(user.CODIGO);
      query.Params.ParamByName('nome').AsString   := Trim(user.NOME);
      query.Params.ParamByName('pw').AsString     := Criptografa(Trim(user.PW),50);
      query.Params.ParamByName('cpf').AsString    := Trim(user.cpf);
      query.Params.ParamByName('filtro_cadastro_empresa').AsString      := user.filtro_cadastro_empresa;
      query.Params.ParamByName('filtro_cadastro_usuarios').AsString     := user.filtro_cadastro_usuarios;
      query.Params.ParamByName('filtro_cadastro_funcionarios').AsString := user.filtro_cadastro_funcionarios;
      query.Params.ParamByName('filtro_cadastro_clientes').AsString     := user.filtro_cadastro_clientes;
      query.Params.ParamByName('filtro_cadastro_unidades').AsString     := user.filtro_cadastro_unidades;
      query.Params.ParamByName('filtro_cadastro_produtos').AsString     := user.filtro_cadastro_produtos;
      query.Params.ParamByName('filtro_cadastro_pagamentos').AsString   := user.filtro_cadastro_pagamentos;
      query.Params.ParamByName('filtro_acesso_vendas').AsString         := user.filtro_acesso_vendas;
      query.Params.ParamByName('filtro_acesso_exportacoes').AsString    := user.filtro_acesso_exportacoes;
      query.Params.ParamByName('filtro_acesso_relatorios').AsString     := user.filtro_acesso_relatorios;
      query.Params.ParamByName('filtro_acesso_configuracoes').AsString  := user.filtro_acesso_configuracoes;
      query.Params.ParamByName('filtro_acesso_ped_ativos').AsString     := user.filtro_acesso_ped_ativos;
      query.Params.ParamByName('filtro_acesso_ped_cancelados').AsString := user.filtro_acesso_ped_cancelados;
      query.Params.ParamByName('filtro_acesso_canc_venda').AsString     := user.filtro_acesso_canc_venda;
      query.Params.ParamByName('filtro_acesso_canc_pedido').AsString    := user.filtro_acesso_canc_pedido;
      query.Params.ParamByName('filtro_acesso_fechamento').AsString     := user.filtro_acesso_fechamento;
      query.Params.ParamByName('filtro_gerar_pedido').AsString          := user.filtro_gerar_pedido;
      query.Params.ParamByName('cadastro_fornecedores').AsString        := user.cadastro_fornecedores;
      query.Params.ParamByName('cadastro_categoria').AsString           := user.cadastro_categoria;
      query.Params.ParamByName('cadastro_kit_produtos').AsString        := user.cadastro_kit_produtos;
      query.Params.ParamByName('cadastro_caixas').AsString              := user.cadastro_caixas;
      query.Params.ParamByName('cadastro_promocoes').AsString           := user.cadastro_promocoes;
      query.Params.ParamByName('entrada_manual').AsString               := user.entrada_manual;
      query.Params.ParamByName('Importacao_de_XML').AsString            := user.Importacao_de_XML;
      query.Params.ParamByName('Fiado').AsString                        := user.Fiado;
      query.Params.ParamByName('rel_VENDAS_POR_PERiODO').AsString       := user.rel_VENDAS_POR_PERiODO;
      query.Params.ParamByName('Rel_Produtos_Mais_Vendidos').AsString   := user.Rel_Produtos_Mais_Vendidos;
      query.Params.ParamByName('Rel_Estoque_Produtos').AsString         := user.Rel_Estoque_Produtos;
      query.Params.ParamByName('Rel_Controle_Fiado_Cliente').AsString   := user.Rel_Controle_Fiado_Cliente;
      query.Params.ParamByName('Bloquear_Cliente_Venda_Fiado').AsString := user.Bloquear_Cliente_Venda_Fiado;
      query.Params.ParamByName('Recebimento_de_PG_Fiados').AsString     := user.Recebimento_de_PG_Fiados;
      query.Params.ParamByName('Cancelar_Venda').AsString               := user.Cancelar_Venda;
      query.Params.ParamByName('Fechamento_de_Caixa').AsString          := user.Fechamento_de_Caixa;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         Try
            frmPrincipal.qryUsuarios.Refresh;
         Except
            frmPrincipal.qryUsuarios.Close;
            frmPrincipal.qryUsuarios.Open;
         End;
         prcMsgInf('Registro inserido com sucesso.');
      Except
         on e:exception do begin
           frmPrincipal.ConexaoLocal.Rollback;
           Try
              frmPrincipal.qryUsuarios.Refresh;
           Except
              frmPrincipal.qryUsuarios.Close;
              frmPrincipal.qryUsuarios.Open;
           End;
           prcMsgErro('Não foi possível gravar o registro.'+#13+e.Message);
         end;
      End;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalUsuariosController.ValidarUsuario(user: TBaseLocalUsuariosVO): TBaseLocalUsuariosVO;
Var query: TFDQuery;

Begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;

      if Trim(user.cpf) <> '' then Begin
         query.SQL.Add(' SELECT * FROM usuarios WHERE ((cpf = :cpf) AND (pw = :pw)) ');
         query.Params.ParamByName('cpf').AsString := Trim(user.cpf);
      End else Begin
         query.SQL.Add(' SELECT * FROM usuarios WHERE ((nome = :nome) AND (pw = :pw)) ');
         query.Params.ParamByName('nome').AsString := Trim(user.NOME);
      End;

      query.Params.ParamByName('pw').AsString  := Criptografa(Trim(user.PW),50);
      query.open;

      user := TBaseLocalUsuariosVO.Create;

      if Not(query.IsEmpty) then Begin

         user.ID                           := query.FieldByName('id').AsInteger;
         user.NOME                         := query.FieldByName('nome').AsString;
         user.STATUS                       := query.FieldByName('status').AsString;
         user.filtro_cadastro_usuarios     := query.FieldByName('filtro_cadastro_empresa').AsString;
         user.filtro_cadastro_usuarios     := query.FieldByName('filtro_cadastro_usuarios').AsString;
         user.filtro_cadastro_funcionarios := query.FieldByName('filtro_cadastro_funcionarios').AsString;
         user.filtro_cadastro_clientes     := query.FieldByName('filtro_cadastro_clientes').AsString;
         user.filtro_cadastro_unidades     := query.FieldByName('filtro_cadastro_unidades').AsString;
         user.filtro_cadastro_produtos     := query.FieldByName('filtro_cadastro_produtos').AsString;
         user.filtro_cadastro_pagamentos   := query.FieldByName('filtro_cadastro_pagamentos').AsString;
         user.filtro_acesso_vendas         := query.FieldByName('filtro_acesso_vendas').AsString;
         user.filtro_acesso_exportacoes    := query.FieldByName('filtro_acesso_exportacoes').AsString;
         user.filtro_acesso_relatorios     := query.FieldByName('filtro_acesso_relatorios').AsString;
         user.filtro_acesso_configuracoes  := query.FieldByName('filtro_acesso_configuracoes').AsString;
         user.filtro_acesso_ped_ativos     := query.FieldByName('filtro_acesso_ped_ativos').AsString;
         user.filtro_acesso_ped_cancelados := query.FieldByName('filtro_acesso_ped_cancelados').AsString;
         user.filtro_acesso_canc_venda     := query.FieldByName('filtro_acesso_canc_venda').AsString;
         user.filtro_acesso_canc_pedido    := query.FieldByName('filtro_acesso_canc_pedido').AsString;
         user.filtro_acesso_fechamento     := query.FieldByName('filtro_acesso_fechamento').AsString;
         user.filtro_gerar_pedido          := query.FieldByName('filtro_gerar_pedido').AsString;

      End;

      Result := user;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalUsuariosController.VerificarPermissao(idUser: integer;campo: String): Boolean;
Var query: TFDQuery;

Begin

   Try

      Result := False;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT '+campo+' FROM usuarios WHERE id = :id ');
      query.Params.ParamByName('id').AsInteger := idUser;
      query.open;

      if Trim(query.FieldByName(campo).AsString) = 'S' then
         Result := True;

   Finally

      FreeAndNil(query);

   End;

end;

class function TBaseLocalUsuariosController.VerificarSeUsuarioExiste(cpf: string): Boolean;
Var query: TFDQuery;

Begin

   Try

      Result := False;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add(' SELECT * FROM usuarios WHERE cpf = :cpf ');
      query.Params.ParamByName('cpf').AsString := Trim(cpf);
      query.open;

      if Not(query.IsEmpty) then
         Result := True;

   Finally

      FreeAndNil(query);

   End;

end;

end.
