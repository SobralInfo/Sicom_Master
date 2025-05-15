unit untCadastrarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, untPrincipal,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, BaseLocalClientesVO, BaseLocalClientesController,
  unitConfiguracoes;

type
  TfrmCadastrarClientes = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    edtNome: TMaskEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel4: TPanel;
    edtCPF_CNPJ: TMaskEdit;
    rdbCPF: TRadioButton;
    rdbCNPJ: TRadioButton;
    Label3: TLabel;
    edtLogradouro: TMaskEdit;
    Label5: TLabel;
    edtNumero: TMaskEdit;
    Label6: TLabel;
    edtComplemento: TMaskEdit;
    Label7: TLabel;
    edtBairro: TMaskEdit;
    Label8: TLabel;
    edtContato: TMaskEdit;
    Label12: TLabel;
    lkpUF: TComboBox;
    lkpMunicipio: TDBLookupComboBox;
    Label13: TLabel;
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    cbbStatus: TComboBox;
    Panel1: TPanel;
    Label9: TLabel;
    edtReferencia: TMaskEdit;
    Label10: TLabel;
    edtCelular: TMaskEdit;
    Label11: TLabel;
    edtFoneFixo: TMaskEdit;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rdbCPFClick(Sender: TObject);
    procedure rdbCNPJClick(Sender: TObject);
    procedure lkpUFChange(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Var DAO: String;
        idCliente: integer;
    procedure Novo;
    procedure Salvar;
    procedure CANCELAR;
    procedure FiltrarMunicipio;
    procedure HabilitarDesabilitarBotoes(tipo: string);
    procedure HabilitarDesabilitarCampos(tipo: string);
    procedure LimparCampos;
    procedure Pesquisar;
  end;

var
  frmCadastrarClientes: TfrmCadastrarClientes;

implementation

{$R *.dfm}

uses untPesquisarClientes, untBalcao;

procedure TfrmCadastrarClientes.CANCELAR;
begin

   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');

end;

procedure TfrmCadastrarClientes.FiltrarMunicipio;
begin

   frmPrincipal.qryMunicipio.Close;
   frmPrincipal.qryMunicipio.Filtered := False;
   frmPrincipal.qryMunicipio.Filter := ' UPPER(UF_SIGLA) = '+QuotedStr(Trim(UpperCase(lkpUF.Text)));
   frmPrincipal.qryMunicipio.Filtered := True;
   frmPrincipal.qryMunicipio.Open;

end;

procedure TfrmCadastrarClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: Close;

   end;

end;

procedure TfrmCadastrarClientes.HabilitarDesabilitarBotoes(tipo: string);
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

procedure TfrmCadastrarClientes.HabilitarDesabilitarCampos(tipo: string);
begin

   if tipo = 'H' then Begin

      cbbStatus.Enabled       := True;
      rdbCPF.Enabled          := True;
      rdbCNPJ.Enabled         := True;
      edtCPF_CNPJ.Enabled     := True;
      edtNome.Enabled         := True;
      edtContato.Enabled      := True;
      edtLogradouro.Enabled   := True;
      edtNumero.Enabled       := True;
      edtComplemento.Enabled  := True;
      edtReferencia.Enabled   := True;
      edtFoneFixo.Enabled     := True;
      edtCelular.Enabled      := True;
      edtBairro.Enabled       := True;
      lkpUF.Enabled           := True;
      lkpMunicipio.Enabled    := True;

   End else if tipo = 'D' then Begin

      cbbStatus.Enabled       := False;
      rdbCPF.Enabled          := False;
      rdbCNPJ.Enabled         := False;
      edtCPF_CNPJ.Enabled     := False;
      edtNome.Enabled         := False;
      edtContato.Enabled      := False;
      edtLogradouro.Enabled   := False;
      edtNumero.Enabled       := False;
      edtComplemento.Enabled  := False;
      edtBairro.Enabled       := False;
      lkpUF.Enabled           := False;
      lkpMunicipio.Enabled    := False;
      edtReferencia.Enabled   := False;
      edtFoneFixo.Enabled     := False;
      edtCelular.Enabled      := False;

   End;


end;

procedure TfrmCadastrarClientes.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarClientes.LimparCampos;
begin

   cbbStatus.ItemIndex     := -1;
   rdbCPF.Checked          := True;
   edtCPF_CNPJ.Text        := '';
   edtNome.Text            := '';
   edtContato.Text         := '';
   edtLogradouro.Text      := '';
   edtNumero.Text          := '';
   edtComplemento.Text     := '';
   edtBairro.Text          := '';
   lkpUF.ItemIndex         := -1;
   lkpMunicipio.KeyValue   := -1;
   idCliente               := 0;
   edtReferencia.Text      := '';
   edtCelular.Text         := '';
   edtFoneFixo.Text        := '';
   DAO                     := '';

end;

procedure TfrmCadastrarClientes.lkpUFChange(Sender: TObject);
begin

   FiltrarMunicipio;

end;

procedure TfrmCadastrarClientes.Novo;
begin

   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;
   cbbStatus.ItemIndex := 0;
   cbbStatus.SetFocus;
   DAO := 'N';

end;

procedure TfrmCadastrarClientes.Pesquisar;
begin

   Application.CreateForm(TfrmPesquisarClientes, frmPesquisarClientes);
   frmPesquisarClientes.origem := 'CADASTRO_CLIENTES';
   frmPesquisarClientes.ShowModal;

end;

procedure TfrmCadastrarClientes.rdbCNPJClick(Sender: TObject);
begin

   edtCPF_CNPJ.Text     := '';
   edtCPF_CNPJ.EditMask := '99.999.999/9999-99;0;_';

   Try
      edtCPF_CNPJ.SetFocus;
   Except
   End;

end;

procedure TfrmCadastrarClientes.rdbCPFClick(Sender: TObject);
begin

   edtCPF_CNPJ.Text     := '';
   edtCPF_CNPJ.EditMask := '999.999.999-99;0;_';

   Try
      edtCPF_CNPJ.SetFocus;
   Except
   End;

end;

procedure TfrmCadastrarClientes.Salvar;
var cliente: TBaseLocalClientesVO;
begin

   if cbbStatus.ItemIndex < 0 then Begin
      prcMsgAdv('Informe O status do funcionário.');
      cbbStatus.SetFocus;
      Exit;
   End;

   if ((Length(Trim(edtCPF_CNPJ.Text)) <> 14) and (rdbCNPJ.Checked)) then Begin
      prcMsgAdv('CNPJ inválido.');
      edtCPF_CNPJ.SetFocus;
      Exit;
   End;

   if ((Length(Trim(edtCPF_CNPJ.Text)) <> 11) and (rdbCPF.Checked)) then Begin
      prcMsgAdv('CPF inválido.');
      edtCPF_CNPJ.SetFocus;
      Exit;
   End;

   if frmPrincipal.qryParametros.FieldByName('VALIDAR_CPF_CLIENTE').asstring = 'S' then Begin
      if rdbCPF.Checked then
         begin
            if fctValidCPF(Trim(edtCPF_CNPJ.Text)) then
              begin
                 prcMsgAdv('CPF inválido.');
                 edtCPF_CNPJ.SetFocus;
                 Exit;
              end;
         end else
      if rdbCNPJ.Checked then
         begin
            if fctValidCNPJ(Trim(edtCPF_CNPJ.Text)) then
              begin
                 prcMsgAdv('CNPJ inválido.');
                 edtCPF_CNPJ.SetFocus;
                 Exit;
              end;
         end;
   End;

   if TBaseLocalClientesController.RetornarClientePorCpfCnpj(Trim(edtCPF_CNPJ.Text)) then begin
      prcMsgAdv('CPF/CNPJ já cadastrado.');
      edtCPF_CNPJ.SetFocus;
      Exit;
   end;


   if Trim(edtNome.Text) = '' then Begin
      prcMsgAdv('Informe o nome do cliente.');
      edtNome.SetFocus;
      Exit;
   End;

   Try

      cliente := TBaseLocalClientesVO.Create;

      cliente.STATUS      := Copy(Trim(cbbStatus.Text),1,1);
      cliente.cpf_cnpj    := Trim(edtCPF_CNPJ.Text);
      cliente.NOME        := Trim(edtNome.Text);
      cliente.contato     := Trim(edtContato.Text);
      cliente.logradouro  := Trim(edtLogradouro.Text);
      cliente.numero      := Trim(edtNumero.Text);
      cliente.complemento := Trim(edtComplemento.Text);
      cliente.bairro      := Trim(edtBairro.Text);
      cliente.cidade      := lkpMunicipio.KeyValue;
      cliente.fone_fixo   := edtFoneFixo.Text;
      cliente.celular     := edtCelular.Text;
      cliente.referencia  := Trim(edtReferencia.Text);


      if DAO = 'U' then Begin
         cliente.ID := idCliente;
         TBaseLocalClientesController.AlterarCliente(cliente);
      End else begin
         cliente.id := TBaseLocalClientesController.retornarGenerator;
         TBaseLocalClientesController.GravarCliente(cliente);
         DAO := 'U';
         idCliente := cliente.id;
      end;

      if Assigned(frmPesquisarClientes) then Begin

         frmPesquisarClientes.mkeDescricao.Text := Trim(edtCPF_CNPJ.Text);
         //frmPesquisarClientes.Confirmar;
         close;

      End;

   Finally

      FreeAndNil(cliente);

   End;

end;
procedure TfrmCadastrarClientes.speCancelarClick(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCadastrarClientes.SpeedButton5Click(Sender: TObject);
begin

   Pesquisar;

end;

procedure TfrmCadastrarClientes.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarClientes.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

end.
