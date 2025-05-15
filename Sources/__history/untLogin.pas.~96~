unit untLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,unitConfiguracoes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage, untBiblioteca, PedidoUsuariosVO, PedidoProdutosController,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.jpeg, system.JSON, rest.json, system.Generics.collections,PedidoProdutosVO,
  PedidoUsuarioController, PedidoClientesController, PedidoClientesVO, Vcl.Mask, PedidoFormaPagamentoController, PedidoFormaPagamentoVO,
  PedidoFuncionariosVO, PedidoFuncionariosController, BaseLocalParametrosController, BaseLocalParametrosVO,
  BaseLocalUsuariosVO, BaseLocalUsuariosController, BaseLocalEmpresaController, BaseLocalEmpresaVO;

type

  ThreadSplash = class (TThread)
    public
       constructor creeate();
       procedure Execute; override;
  end;

  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtSenha: TEdit;
    Image2: TImage;
    mkeCPF: TMaskEdit;
    Label3: TLabel;
    mkeCNPJ: TMaskEdit;
    Panel2: TPanel;
    Label4: TLabel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    procedure speCancelClick(Sender: TObject);
    procedure edtLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure speOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
    FThreadSplash: ThreadSplash;
  public
    { Public declarations }
    var idFiltroOrcamento: integer;
         parametros: TBaseLocalParametrosVO;
    procedure Confirmar;
    procedure CarregarProdutos;
    procedure CarregarClientes;
    procedure CarregarFormaDePagamentos;
    procedure CarregarFuncionarios;
    procedure VerificarBaseLocal;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses untPrincipal, untSplash;


procedure TfrmLogin.CarregarClientes;
Var listaClientes: TObjectList<TPedidoClientesVO>;

begin

   Try

      listaClientes := TPedidoClientesController.RetornarListaDeClientes;

      if listaClientes.Count > 0 then
         TPedidoClientesController.GravarClienteBaseLocal(listaClientes);

   Finally

      FreeAndNil(listaClientes);
      //if frmSplash <> Nil then
      //   frmSplash.Close;

   End;

end;

procedure TfrmLogin.CarregarFormaDePagamentos;
Var listaFormaDePagamento: TObjectList<TPedidoFormaPagamentoVO>;
    I: Integer;
begin

   Try

      listaFormaDePagamento := TPedidoFormaPagamentoController.RetornarListaDeFormaPG;

      if listaFormaDePagamento.Count > 0 then
         TPedidoFormaPagamentoController.GravarFormaDePagamentoBaseLocal(listaFormaDePagamento);

   Finally

      FreeAndNil(listaFormaDePagamento);
      //if frmSplash <> Nil then
      //   frmSplash.Close;

   End;

end;

procedure TfrmLogin.CarregarFuncionarios;
Var listaFuncionarios: TObjectList<TPedidoFuncionariosVO>;
    I: Integer;
begin

   Try

      listaFuncionarios := TPedidoFuncionariosController.RetornarListaDeFuncionarios;

      if listaFuncionarios.Count > 0 then
         TPedidoFuncionariosController.GravarFuncionarioBaseLocal(listaFuncionarios);

   Finally

      FreeAndNil(listaFuncionarios);
      //if frmSplash <> Nil then
      //   frmSplash.Close;

   End;

end;

procedure TfrmLogin.CarregarProdutos;
Var listaProdutos: TObjectList<TPedidoProdutosVO>;
    I: Integer;
begin

   Try

      listaProdutos := TPedidoProdutosController.RetornarListaDeProdutos;

      if listaProdutos.Count > 0 then
         TPedidoProdutosController.GravarProdutoBaseLocal(listaProdutos);

   Finally

      FreeAndNil(listaProdutos);
      //if frmSplash <> Nil then
      //   frmSplash.Close;

   End;

end;

procedure TfrmLogin.Confirmar;
Begin

   if Length(frmLogin.mkeCNPJ.Text) <> 14 then Begin

      prcMsgAdv('CNPJ inválido.');
      frmLogin.mkeCNPJ.SetFocus;
      Exit;

   End;

   if fctValidCNPJ(frmLogin.mkeCNPJ.Text) = False then Begin

      prcMsgAdv('CNPJ inválido.');
      frmLogin.mkeCNPJ.SetFocus;
      Exit;

   End;

   if Length(frmLogin.mkeCPF.Text) <> 11 then Begin

      prcMsgAdv('CPF inválido.');
      frmLogin.mkeCPF.SetFocus;
      Exit;

   End;

   if fctValidCPF(frmLogin.mkeCPF.Text) = False then Begin

      prcMsgAdv('CPF inválido.');
      frmLogin.mkeCPF.SetFocus;
      Exit;

   End;

   if Trim(frmLogin.edtSenha.Text) = '' then Begin

      prcMsgAdv('Informe a senha do usuário.');
      frmLogin.edtSenha.SetFocus;
      Exit;

   End;

   //frmLogin.AlphaBlendValue := 230;
   FThreadSplash := ThreadSplash.creeate;
   frmSplash := TfrmSplash.Create(Self);
   //frmSplash.Timer2.Enabled := True;
   frmSplash.ShowModal;
   //frmLogin.AlphaBlendValue := 255;

End;

procedure TfrmLogin.edtLoginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if key = VK_RETURN then
      edtSenha.SetFocus;

end;

procedure TfrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if key = VK_RETURN then
      Confirmar;

end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   if FThreadSplash <> Nil then
      FThreadSplash.Terminate;

   //if frmSplash <> Nil then
   //   frmSplash.Close;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin

   FThreadSplash := Nil;
   VerificarBaseLocal;

end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if key = VK_ESCAPE then
      close;

end;

procedure TfrmLogin.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmLogin.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmLogin.speCancelClick(Sender: TObject);
begin

   close;

end;

procedure TfrmLogin.speOkClick(Sender: TObject);
begin

   Confirmar;

end;


procedure TfrmLogin.VerificarBaseLocal;
Var empresa: tBaseLocalEmpresaVO;
begin

   Try

      empresa := TBaseLocalEmpresaVO.Create;

      empresa := TBaseLocalEmpresaController.retornarDadosEmpresa;

      parametros := TBaseLocalParametrosVO.Create;
      parametros := TBaseLocalParametrosController.retornarParametros;

      if parametros.BASE_LOCAL = 'S' then Begin
         mkeCNPJ.Text    := empresa.CNPJ;
         mkeCNPJ.Enabled := false;
      End;

   Finally

      FreeAndNil(empresa);

   End;

end;

{ ThreadSplash }

constructor ThreadSplash.creeate;
begin

   inherited Create(false);

end;

procedure ThreadSplash.Execute;
Var tela: TForm;
    usuario: TPedidoUsuariosVO;
    usuarioLocal: TBaseLocalUsuariosVO;
    matriz_filial: string;

    function NomedoComputador: String;
    var
     buffer: Array[0..255] of char;
     size: DWord;
              begin
                 size := 256;
                   if GetComputerName (buffer,size) then
                     Result := Buffer
                   else
                Result := '';
              end;


begin

   Try

    //Try

      if frmLogin.parametros.BASE_LOCAL <> 'S' then Begin

         usuario := TPedidoUsuarioController.ValidarUsuario(Trim(frmLogin.mkeCNPJ.Text), Trim(frmLogin.mkeCPF.Text), Trim(frmLogin.edtSenha.Text));

         if usuario.id > 0 Then Begin

               frmLogin.Close;
               frmPrincipal.STATUSBAR1.PANELs[0].TEXT:='  USUÁRIO CONECTADO: '+Trim(usuario.nome);
                frmPrincipal.STATUSBAR1.PANELs[1].TEXT:='PC: '+NomedoComputador;
                      if usuario.matriz_filial = 'M' then
                  matriz_filial := ' (MATRIZ)'
               else
                  matriz_filial := ' (FILIAL)';
                      frmPrincipal.STATUSBAR1.PANELs[2].TEXT:='EMPRESA: '+Copy(frmLogin.mkeCNPJ.Text,1,2)+'.'+
                                                                   Copy(frmLogin.mkeCNPJ.Text,3,3)+'.'+
                                                                   Copy(frmLogin.mkeCNPJ.Text,6,3)+'/'+
                                                                   Copy(frmLogin.mkeCNPJ.Text,9,4)+'-'+
                                                                   Copy(frmLogin.mkeCNPJ.Text,13,2)+matriz_filial;
            frmPrincipal.vgbLOGIN  := True;
            frmPrincipal.idEmpresa := usuario.id_empresa;
            frmPrincipal.bd        := Trim(usuario.bd);
            frmLogin.CarregarProdutos;
            frmLogin.CarregarClientes;
            frmLogin.CarregarFormaDePagamentos;
            frmLogin.CarregarFuncionarios;
         end else if usuario.id = -1 then Begin
            frmPrincipal.vgbLOGIN := False;
            prcMsgErro('Empresa não cadastrada no sistema.');
            frmLogin.mkeCPF.SetFocus;
         End else Begin
            frmPrincipal.vgbLOGIN := False;
            prcMsgAdv('Usuário/Senha não localizados na empresa.');
            frmLogin.mkeCPF.SetFocus;
         End;

      end else Begin

         usuarioLocal := TBaseLocalUsuariosVO.Create;

         usuarioLocal.cpf := Trim(frmLogin.mkeCPF.Text);
         usuarioLocal.PW  := Trim(frmLogin.edtSenha.Text);

         usuarioLocal := TBaseLocalUsuariosController.ValidarUsuario(usuarioLocal);

         if usuarioLocal.id > 0 Then Begin

            if usuarioLocal.STATUS = 'I' then Begin

               prcMsgErro('Usuário inativo no sistema.');
               Exit;

            end;

            frmLogin.Close;
            frmPrincipal.STATUSBAR1.PANELs[0].TEXT:='  USUÁRIO CONECTADO: '+Trim(usuarioLocal.nome);
            frmPrincipal.STATUSBAR1.PANELs[1].TEXT:='PC: '+NomedoComputador;
            matriz_filial := ' (MATRIZ)';

            frmPrincipal.STATUSBAR1.PANELs[2].TEXT:='EMPRESA: '+Copy(frmLogin.mkeCNPJ.Text,1,2)+'.'+
                                                                Copy(frmLogin.mkeCNPJ.Text,3,3)+'.'+
                                                                Copy(frmLogin.mkeCNPJ.Text,6,3)+'/'+
                                                                Copy(frmLogin.mkeCNPJ.Text,9,4)+'-'+
                                                                Copy(frmLogin.mkeCNPJ.Text,13,2)+matriz_filial;
            frmPrincipal.vgbLOGIN  := True;
            frmPrincipal.idEmpresa := usuarioLocal.id;
            frmPrincipal.idUser    := usuarioLocal.id;
            frmPrincipal.bd        := '';

            Sleep(4000);

         end else Begin
            Sleep(4000);
            frmPrincipal.vgbLOGIN := False;
            prcMsgAdv('Usuário/Senha não localizados na empresa.');
            frmLogin.mkeCPF.SetFocus;
         End;

      end;

       {Except

         prcMsgAdv('Não foi possível se conectar com o servidor.'#13+'Verifique sua conexão com a internet.');

       End;}

   Finally

      FreeAndNil(usuario);
      Try
         FreeAndNil(usuarioLocal);
      Except
      end;
      if frmSplash <> Nil then
         frmSplash.Close;

   End;


end;


end.
