unit untCadastrarFidelidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, untBiblioteca,
  Vcl.Imaging.pngimage, untIntegracaoFidelidade, unitconfiguracoes, BaseLocalClientesVO, BaseLocalClientesController;

type
  TfrmCadastrarFidelidade = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel1: TPanel;
    Label3: TLabel;
    EditCPF: TMaskEdit;
    Label2: TLabel;
    mkeNome: TMaskEdit;
    Label4: TLabel;
    mkeNascimento: TMaskEdit;
    Label5: TLabel;
    mkeEmail: TMaskEdit;
    mkeCelular: TMaskEdit;
    Label6: TLabel;
    procedure Image3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
  end;

var
  frmCadastrarFidelidade: TfrmCadastrarFidelidade;

implementation

{$R *.dfm}

uses untConsultarFidelidade, untPedidos;

{ TfrmCadastrarFidelidade }

procedure TfrmCadastrarFidelidade.Confirmar;
var cliente: TClientes;
    clienteLocal: TBaseLocalClientesVO;
begin

   if Length(EditCPF.Text) <> 11 then begin

      prcMsgAdv('CPF informado inválido.');
      EditCPF.SetFocus;
      exit;

   end;

   if not fctValidCPF(EditCPF.Text) then begin

      prcMsgAdv('CPF informado inválido.');
      EditCPF.SetFocus;
      exit;

   end;

   if Trim(mkeNome.Text) = '' then begin

      prcMsgAdv('Informe o nome do cliente.');
      mkeNome.SetFocus;
      exit;

   end;

   if Length(mkeCelular.Text) <> 11 then begin

      prcMsgAdv('Celular informado inválido.');
      mkeCelular.SetFocus;
      exit;

   end;

   Try
      StrToDate(mkeNascimento.Text);
   except
      prcMsgAdv('Data de aniversário inválida.');
      mkeNascimento.SetFocus;
      exit;
   End;

   try

      cliente := TClientes.Create;

      cliente := TClientes.RetornarCliente(Trim(EditCPF.Text),'');
         if cliente.id > 0 then begin
            prcMsgAdv('CPF já cadastrado para o cliente, '+cliente.nome+'.');
            exit;
         end;

      cliente := TClientes.RetornarCliente('', Trim(mkeCelular.Text));
         if cliente.id > 0 then begin
            prcMsgAdv('Celular já cadastrado para o cliente, '+cliente.nome+'.');
            exit;
         end;

      cliente.cpf_cnpj        := EditCPF.Text;
      cliente.nome            := Trim(mkeNome.Text);
      cliente.data_nascimento := strtodate(mkeNascimento.Text);
      cliente.email           := trim(mkeEmail.Text);
      cliente.celular         := mkeCelular.Text;
      cliente.id_funcionario  := 0;

      if TClientes.GravarCliente(cliente) then begin
         clienteLocal := TBaseLocalClientesVO.Create;
         clienteLocal := TBaseLocalClientesController.RetornarClientePorCPF(cliente.cpf_cnpj);

         if clienteLocal.id = 0 then begin
            clienteLocal.status   := 'A';
            clienteLocal.cpf_cnpj := cliente.cpf_cnpj;
            clienteLocal.nome     := cliente.nome;
            clienteLocal.celular  := cliente.celular;
            clienteLocal.fidelidade := 'S';
            TBaseLocalClientesController.GravarCliente(clienteLocal);
            clienteLocal := TBaseLocalClientesController.RetornarClientePorCPF(cliente.cpf_cnpj);
         End;

         cliente := TClientes.RetornarCliente(Trim(EditCPF.Text),'');

         frmPedidos.idCliente                 := clienteLocal.id;
         frmPedidos.lblNomeCliente.Caption    := Trim(FormataNome(clienteLocal.nome));
         frmPedidos.lblCPFCNPJCliente.Caption := TBiblioteca.mascaraCPFCNPJ(Trim(clienteLocal.cpf_cnpj));

         frmPedidos.idFidelidade              := cliente.id;
         frmPedidos.lblCliente.Visible        := True;
         frmPedidos.lblCPFCNPJ.Visible        := True;
         frmPedidos.lblNomeCliente.Visible    := True;
         frmPedidos.lblCPFCNPJCliente.Visible := True;
         frmConsultarFidelidade.Close;
         close;
      end else
         prcMsgAdv('Não foi possível cadastrar o cliente.');

   finally

      FreeAndNil(cliente);

   end;

end;

procedure TfrmCadastrarFidelidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of
      VK_ESCAPE: close;
      VK_F12: Confirmar;
   end;

end;

procedure TfrmCadastrarFidelidade.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

end.
