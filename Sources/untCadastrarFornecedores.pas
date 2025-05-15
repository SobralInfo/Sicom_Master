unit untCadastrarFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, FornecedoresVO, unitConfiguracoes,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, FornecedoresController;

type
  TfrmCadastrarFornecedores = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    edtIE: TMaskEdit;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    edtCPF_CNPJ: TMaskEdit;
    rdbCPF: TRadioButton;
    rdbCNPJ: TRadioButton;
    edtLogradouro: TMaskEdit;
    edtNumero: TMaskEdit;
    edtComplemento: TMaskEdit;
    edtBairro: TMaskEdit;
    edtRazaoSocial: TMaskEdit;
    lkpUF: TComboBox;
    lkpMunicipio: TDBLookupComboBox;
    Panel1: TPanel;
    edtReferencia: TMaskEdit;
    edtCelular: TMaskEdit;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    edtfantasia: TMaskEdit;
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure lkpUFChange(Sender: TObject);
    procedure rdbCPFClick(Sender: TObject);
    procedure rdbCNPJClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Var DAO: String;
        idFornecedor: integer;
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
  frmCadastrarFornecedores: TfrmCadastrarFornecedores;

implementation

{$R *.dfm}

uses untPesquisarFornecedores, untPesquisarClientes, untPrincipal;

procedure TfrmCadastrarFornecedores.CANCELAR;
begin

   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');

end;

procedure TfrmCadastrarFornecedores.FiltrarMunicipio;
begin

   frmPrincipal.qryMunicipio.Close;
   frmPrincipal.qryMunicipio.Filtered := False;
   frmPrincipal.qryMunicipio.Filter := ' UPPER(UF_SIGLA) = '+QuotedStr(Trim(UpperCase(lkpUF.Text)));
   frmPrincipal.qryMunicipio.Filtered := True;
   frmPrincipal.qryMunicipio.Open;

end;

procedure TfrmCadastrarFornecedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmCadastrarFornecedores.HabilitarDesabilitarBotoes(tipo: string);
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

procedure TfrmCadastrarFornecedores.HabilitarDesabilitarCampos(tipo: string);
begin

   if tipo = 'H' then Begin

      rdbCPF.Enabled          := True;
      rdbCNPJ.Enabled         := True;
      edtCPF_CNPJ.Enabled     := True;
      edtIE.Enabled           := True;
      edtfantasia.Enabled     := True;
      edtRazaoSocial.Enabled  := True;
      edtLogradouro.Enabled   := True;
      edtNumero.Enabled       := True;
      edtComplemento.Enabled  := True;
      edtReferencia.Enabled   := True;
      edtCelular.Enabled      := True;
      edtBairro.Enabled       := True;
      lkpUF.Enabled           := True;
      lkpMunicipio.Enabled    := True;

   End else if tipo = 'D' then Begin

      rdbCPF.Enabled          := False;
      rdbCNPJ.Enabled         := False;
      edtCPF_CNPJ.Enabled     := False;
      edtIE.Enabled           := False;
      edtfantasia.Enabled     := False;
      edtRazaoSocial.Enabled  := False;
      edtLogradouro.Enabled   := False;
      edtNumero.Enabled       := False;
      edtComplemento.Enabled  := False;
      edtBairro.Enabled       := False;
      lkpUF.Enabled           := False;
      lkpMunicipio.Enabled    := False;
      edtReferencia.Enabled   := False;
      edtCelular.Enabled      := False;

   End;

end;

procedure TfrmCadastrarFornecedores.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarFornecedores.LimparCampos;
begin

   rdbCPF.Checked          := True;
   edtCPF_CNPJ.Text        := '';
   edtIE.Text              := '';
   edtfantasia.Text        := '';
   edtRazaoSocial.Text     := '';
   edtLogradouro.Text      := '';
   edtNumero.Text          := '';
   edtComplemento.Text     := '';
   edtBairro.Text          := '';
   lkpUF.ItemIndex         := -1;
   lkpMunicipio.KeyValue   := -1;
   idFornecedor            := 0;
   edtReferencia.Text      := '';
   edtCelular.Text         := '';
   DAO                     := '';

end;

procedure TfrmCadastrarFornecedores.lkpUFChange(Sender: TObject);
begin

   FiltrarMunicipio;

end;

procedure TfrmCadastrarFornecedores.Novo;
begin

   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;
   DAO := 'N';

end;

procedure TfrmCadastrarFornecedores.Pesquisar;
begin

   Application.CreateForm(TfrmPesquisarFornecedores, frmPesquisarFornecedores);
   frmPesquisarFornecedores.origem := 'CADASTRO_FORNECEDOR';
   frmPesquisarFornecedores.ShowModal;

end;

procedure TfrmCadastrarFornecedores.rdbCNPJClick(Sender: TObject);
begin

   edtCPF_CNPJ.Text     := '';
   edtCPF_CNPJ.EditMask := '99.999.999/9999-99;0;_';

   Try
      edtCPF_CNPJ.SetFocus;
   Except
   End;


end;

procedure TfrmCadastrarFornecedores.rdbCPFClick(Sender: TObject);
begin

   edtCPF_CNPJ.Text     := '';
   edtCPF_CNPJ.EditMask := '999.999.999-99;0;_';

   Try
      edtCPF_CNPJ.SetFocus;
   Except
   End;

end;

procedure TfrmCadastrarFornecedores.Salvar;
var fornecedor: TFornecedoresVO;

begin

   if ((Length(Trim(edtCPF_CNPJ.Text)) <> 14) and (rdbCNPJ.Checked)) then Begin
      prcMsgAdv('CNPJ inválido.');
      edtCPF_CNPJ.SetFocus;
      Exit;
   End;

   if TFornecedoresController.VerificarSeCNPJExiste(Trim(edtCPF_CNPJ.Text)) then Begin
      prcMsgAdv('CPF/CNPJ já cadastrado.');
      edtCPF_CNPJ.SetFocus;
      Exit;
   End;

   if ((Length(Trim(edtCPF_CNPJ.Text)) <> 11) and (rdbCPF.Checked)) then Begin
      prcMsgAdv('CPF inválido.');
      edtCPF_CNPJ.SetFocus;
      Exit;
   End;

   if Trim(edtRazaoSocial.Text) = '' then Begin
      prcMsgAdv('Informe a razão social.');
      edtRazaoSocial.SetFocus;
      Exit;
   End;

   if Trim(edtfantasia.Text) = '' then Begin
      prcMsgAdv('Informe o nome fantasia.');
      edtfantasia.SetFocus;
      Exit;
   End;

   if Trim(lkpMunicipio.Text) = '' then Begin
      prcMsgAdv('Selecione a cidade.');
      lkpMunicipio.SetFocus;
      Exit;
   End;

   Try

      fornecedor := TFornecedoresVO.Create;

      fornecedor.cpf_cnpj    := Trim(edtCPF_CNPJ.Text);
      fornecedor.NOME        := Trim(edtRazaoSocial.Text);
      fornecedor.FANTASIA    := Trim(edtfantasia.Text);
      fornecedor.logradouro  := Trim(edtLogradouro.Text);
      fornecedor.numero      := Trim(edtNumero.Text);
      fornecedor.complemento := Trim(edtComplemento.Text);
      fornecedor.bairro      := Trim(edtBairro.Text);
      fornecedor.cidade      := lkpMunicipio.KeyValue;
      fornecedor.celular     := edtCelular.Text;
      fornecedor.CODIGO_IBGE_CIDADE := lkpMunicipio.KeyValue;
      fornecedor.CODIGO_IBGE_UF     := StrToInt(Copy(lkpMunicipio.KeyValue,1,2));
      fornecedor.CIDADE      := Trim(lkpMunicipio.Text);
      fornecedor.UF          := Trim(frmPrincipal.qryMunicipioUF_SIGLA.AsString);


      if DAO = 'U' then Begin
         fornecedor.ID := idFornecedor;
         TFornecedoresController.AlterarFornecedor(fornecedor);
         prcMsgInf('Registro alterado com sucesso.');
      End else Begin
         fornecedor.ID := TFornecedoresController.retornarGenerator;
         TFornecedoresController.InserirFornecedor(fornecedor);
         idFornecedor := fornecedor.ID;
         DAO := 'U';
         prcMsgInf('Registro inserido com sucesso.');
      End;

      if Assigned(frmPesquisarClientes) then Begin

         frmPesquisarClientes.mkeDescricao.Text := Trim(edtCelular.Text);
         //frmPesquisarClientes.Confirmar;
         close;

      End;

   Finally

      FreeAndNil(fornecedor);

   End;

end;

procedure TfrmCadastrarFornecedores.speCancelarClick(Sender: TObject);
begin

   CANCELAR;

end;

procedure TfrmCadastrarFornecedores.SpeedButton5Click(Sender: TObject);
begin

   Pesquisar;

end;

procedure TfrmCadastrarFornecedores.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarFornecedores.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

end.
