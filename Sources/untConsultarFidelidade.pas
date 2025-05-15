unit untConsultarFidelidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, untBiblioteca,
  Vcl.Imaging.pngimage, untIntegracaoFidelidade,unitConfiguracoes, BaseLocalClientesController, BaseLocalClientesVO;

type
  TfrmConsultarFidelidade = class(TForm)
    Panel2: TPanel;
    lblCaption: TLabel;
    Label6: TLabel;
    PainelCab: TPanel;
    EditCPF: TMaskEdit;
    ComboPsqCliente: TComboBox;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Label2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditCPFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboPsqClienteChange(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
  end;

var
  frmConsultarFidelidade: TfrmConsultarFidelidade;

implementation

{$R *.dfm}

uses untCadastrarFidelidade, untPedidos;

procedure TfrmConsultarFidelidade.ComboPsqClienteChange(Sender: TObject);
begin

   case ComboPsqCliente.ItemIndex of
      0: begin
            lblCaption.Caption := 'Informe o CPF';
            EditCPF.EditMask := '999.999.999-99;0;_';
         end;
      1: Begin
            lblCaption.Caption := 'Informe o Celular';
            EditCPF.EditMask := '(99)99999.9999;0;_';
         End;
   end;

end;

procedure TfrmConsultarFidelidade.Confirmar;
Var clientes: TClientes;
    clienteLocal: TBaseLocalClientesVO;
begin

   if Trim(EditCPF.Text) = '' then begin

      case ComboPsqCliente.ItemIndex of
         0: prcMsgAdv('Informe o CPF do cliente.');
         1: prcMsgAdv('Informe o celular do cliente.')
      end;

      Exit;

   end;

   case ComboPsqCliente.ItemIndex of

      0: begin
            if Length(EditCPF.Text) <> 11 then begin
               prcMsgAdv('CPF informado inválido');
               exit;
            end;
            if not fctValidCPF(EditCPF.Text) then begin
               prcMsgAdv('CPF informado inválido');
               exit;
            end;
         end;
      1: begin
            if Length(Trim(EditCPF.Text)) <> 11 then begin
               prcMsgAdv('Celular informado inválido');
               exit;
            end;
         end;

   end;

   Try
      case ComboPsqCliente.ItemIndex of
         0: clientes := TClientes.RetornarCliente(Trim(EditCPF.Text),'');
         1: clientes := TClientes.RetornarCliente('',Trim(EditCPF.Text));
      end;

      if clientes.id > 0 then begin
         if fctMsgConfirmDefaultButtonYes('Olá, ' + clientes.nome + ' :)'+#13+'Deseja inserir o cliente?') = false then
            exit;
            clienteLocal := TBaseLocalClientesVO.Create;
            clienteLocal := TBaseLocalClientesController.RetornarClientePorCPF(clientes.cpf_cnpj);

            if clienteLocal.id = 0 then begin
               clienteLocal.status   := 'A';
               clienteLocal.cpf_cnpj := clientes.cpf_cnpj;
               clienteLocal.nome     := clientes.nome;
               clienteLocal.celular  := clientes.celular;
               clienteLocal.fidelidade := 'S';
               TBaseLocalClientesController.GravarCliente(clienteLocal);
               clienteLocal := TBaseLocalClientesController.RetornarClientePorCPF(clientes.cpf_cnpj);
            End;

            frmPedidos.idFidelidade              := clientes.id;
            frmPedidos.idCliente                 := clienteLocal.id;
            frmPedidos.lblNomeCliente.Caption    := Trim(FormataNome(clienteLocal.nome));
            frmPedidos.lblCPFCNPJCliente.Caption := TBiblioteca.mascaraCPFCNPJ(Trim(clienteLocal.cpf_cnpj));

            frmPedidos.lblCliente.Visible        := True;
            frmPedidos.lblCPFCNPJ.Visible        := True;
            frmPedidos.lblNomeCliente.Visible    := True;
            frmPedidos.lblCPFCNPJCliente.Visible := True;

            Close;

      end else begin
         if fctMsgConfirmDefaultButtonYes('Cliente não cadastrado, deseja cadastrar o cliente?') = false then
            exit;
         frmCadastrarFidelidade := TfrmCadastrarFidelidade.Create(self);
         case ComboPsqCliente.ItemIndex of
            0: frmCadastrarFidelidade.EditCPF.Text    := EditCPF.Text;
            1: frmCadastrarFidelidade.mkeCelular.Text := EditCPF.Text;
         end;
         frmCadastrarFidelidade.ShowModal;
      End;
   Finally
      FreeAndNil(clientes);
   End;

end;

procedure TfrmConsultarFidelidade.EditCPFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of
      VK_RETURN: Confirmar;
      VK_F12: Confirmar;
      VK_ESCAPE: close;
   end;

end;

procedure TfrmConsultarFidelidade.FormCreate(Sender: TObject);
begin

   if TLancamentos.RetornarConfiguracao = 'T' then Begin
      ComboPsqCliente.ItemIndex := 1;
      lblCaption.Caption := 'Informe o Celular';
      EditCPF.EditMask := '(99)99999.9999;0;_';
   End;

end;

procedure TfrmConsultarFidelidade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmConsultarFidelidade.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmConsultarFidelidade.Image4Click(Sender: TObject);
begin

  close;

end;

end.
