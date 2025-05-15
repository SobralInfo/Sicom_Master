unit untCadastrarEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage, unitConfiguracoes,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, baseLocalEmpresaVO, baseLocalEmpresaController,
  Vcl.DBCtrls, JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TfrmCadastrarEmpresa = class(TForm)
    Label1: TLabel;
    edtRazaoSocial: TMaskEdit;
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
    edtFantasia: TMaskEdit;
    Label5: TLabel;
    edtFoneFixo: TMaskEdit;
    Label6: TLabel;
    edtCelular: TMaskEdit;
    Label7: TLabel;
    edtEmail: TMaskEdit;
    Label8: TLabel;
    edtSite: TMaskEdit;
    Label4: TLabel;
    edtCNPJ: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtLogradouro: TMaskEdit;
    edtNumero: TMaskEdit;
    edtComplemento: TMaskEdit;
    edtBairro: TMaskEdit;
    lkpUF: TComboBox;
    lkpMunicipio: TDBLookupComboBox;
    edtReferencia: TMaskEdit;
    Label16: TLabel;
    edtNSU: TJvValidateEdit;
    Label17: TLabel;
    cbbTipoRegime: TComboBox;
    Label19: TLabel;
    edtIE: TMaskEdit;
    Label3: TLabel;
    edtCEP: TMaskEdit;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure lkpUFChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var DAO: String;
        idEmpresa: integer;
    procedure Pesquisar;
    procedure Novo;
    procedure Salvar;
    procedure Cancelar;
    procedure HabilitarDesabilitarBotoes(tipo: string);
    procedure HabilitarDesabilitarCampos(tipo: string);
    procedure LimparCampos;
    procedure FiltrarMunicipio;
  end;

var
  frmCadastrarEmpresa: TfrmCadastrarEmpresa;

implementation

{$R *.dfm}

uses untPesquisarEmpresa, untPrincipal;

procedure TfrmCadastrarEmpresa.Cancelar;
begin

   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');
   LimparCampos;

end;

procedure TfrmCadastrarEmpresa.FiltrarMunicipio;
begin

   frmPrincipal.qryMunicipio.Close;
   frmPrincipal.qryMunicipio.Filtered := False;
   frmPrincipal.qryMunicipio.Filter := ' UPPER(UF_SIGLA) = '+QuotedStr(Trim(UpperCase(lkpUF.Text)));
   frmPrincipal.qryMunicipio.Filtered := True;
   frmPrincipal.qryMunicipio.Open;

end;

procedure TfrmCadastrarEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

     VK_ESCAPE: close;

   end;

end;

procedure TfrmCadastrarEmpresa.HabilitarDesabilitarBotoes(tipo: string);
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

procedure TfrmCadastrarEmpresa.HabilitarDesabilitarCampos(tipo: string);
begin

   if tipo = 'H' then Begin

      edtCNPJ.Enabled        := True;
      edtRazaoSocial.Enabled := True;
      edtFantasia.Enabled    := True;
      edtFoneFixo.Enabled    := True;
      edtCelular.Enabled     := True;
      edtEmail.Enabled       := True;
      edtSite.Enabled        := True;
      lkpUF.Enabled          := True;
      lkpMunicipio.Enabled   := True;
      edtNSU.Enabled         := True;
      edtLogradouro.Enabled  := True;
      edtNumero.Enabled      := True;
      edtComplemento.Enabled := True;
      edtBairro.Enabled      := True;
      edtReferencia.Enabled  := True;
      edtIE.Enabled          := True;
      cbbTipoRegime.Enabled  := True;
      edtCEP.Enabled         := True;

   End else if tipo = 'D' then Begin

      edtCNPJ.Enabled        := False;
      edtRazaoSocial.Enabled := False;
      edtFantasia.Enabled    := False;
      edtFoneFixo.Enabled    := False;
      edtCelular.Enabled     := False;
      edtEmail.Enabled       := False;
      edtSite.Enabled        := False;
      lkpUF.Enabled          := False;
      lkpMunicipio.Enabled   := False;
      edtNSU.Enabled         := False;
      edtLogradouro.Enabled  := False;
      edtNumero.Enabled      := False;
      edtComplemento.Enabled := False;
      edtBairro.Enabled      := False;
      edtReferencia.Enabled  := False;
      edtIE.Enabled          := False;
      cbbTipoRegime.Enabled  := False;
      edtCEP.Enabled         := False;

   End;


end;

procedure TfrmCadastrarEmpresa.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarEmpresa.LimparCampos;
begin

   edtCNPJ.Text        := '';
   edtRazaoSocial.Text := '';
   edtFantasia.Text    := '';
   edtFoneFixo.Text    := '';
   edtCelular.Text     := '';
   edtEmail.Text       := '';
   edtSite.Text        := '';
   edtIE.Text          := '';
   edtLogradouro.Text  := '';
   edtNumero.Text      := '';
   edtComplemento.Text := '';
   edtReferencia.Text  := '';
   edtBairro.Text      := '';
   edtCEP.Text         := '';
   idEmpresa           := 0;
   lkpUF.ItemIndex     := -1;
   lkpMunicipio.KeyValue := -1;
   cbbTipoRegime.ItemIndex := -1;
   edtNSU.Text         := '';
   DAO                 := '';

end;

procedure TfrmCadastrarEmpresa.lkpUFChange(Sender: TObject);
begin

   FiltrarMunicipio;

end;

procedure TfrmCadastrarEmpresa.Novo;
begin

   Try
      frmPrincipal.qryEmpresa.Refresh;
   Except
      frmPrincipal.qryEmpresa.Close;
      frmPrincipal.qryEmpresa.Open;
   End;

   if Not(frmPrincipal.qryEmpresa.IsEmpty) then Begin
      prcMsgAdv('Já consta uma empresa cadastrada.');
      Exit;
   End;

   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;
   edtCNPJ.SetFocus;
   DAO := '';


end;

procedure TfrmCadastrarEmpresa.Pesquisar;
begin

   Application.CreateForm(TfrmPesquisarEmpresa, frmPesquisarEmpresa);
   frmPesquisarEmpresa.origem := 'CADASTRO_EMPRESA';
   frmPesquisarEmpresa.ShowModal;

end;

procedure TfrmCadastrarEmpresa.Salvar;
var empresa: TBaseLocalEmpresaVO;
begin

   if Length(Trim(edtCNPJ.Text)) <> 14 then Begin
      prcMsgAdv('CNPJ inválido.');
      edtCNPJ.SetFocus;
      Exit;
   End;

   if Trim(edtRazaoSocial.Text) = '' then Begin
      prcMsgAdv('Informe a razão social da empresa.');
      edtRazaoSocial.SetFocus;
      Exit;
   End;

   if Trim(edtFantasia.Text) = '' then Begin
      prcMsgAdv('Informe o nome fantasia da empresa.');
      edtFantasia.SetFocus;
      Exit;
   End;

   if ((Trim(edtFoneFixo.Text) = '') and (Trim(edtCelular.Text) = '')) then Begin
      prcMsgAdv('Informe ao menos um telefone da empresa.');
      edtFoneFixo.SetFocus;
      Exit;
   End;

   if Trim(lkpUF.Text) = '' then Begin
      prcMsgAdv('Selecione a UF da empresa.');
      lkpUF.SetFocus;
      Exit;
   End;

   if Trim(lkpMunicipio.Text) = '' then Begin
      prcMsgAdv('Selecione o município da empresa.');
      lkpMunicipio.SetFocus;
      Exit;
   End;

   Try

      empresa := TBaseLocalEmpresaVO.Create;

      empresa.CNPJ         := Trim(edtCNPJ.Text);
      empresa.RAZAO_SOCIAL := Trim(edtRazaoSocial.Text);
      empresa.FANTASIA     := Trim(edtFantasia.Text);
      empresa.FONE         := Trim(edtFoneFixo.Text);
      empresa.CELULAR      := Trim(edtCelular.Text);
      empresa.EMAIL        := Trim(edtEmail.Text);
      empresa.SITE         := Trim(edtSite.Text);
      empresa.ULTIMO_NSU   := edtNSU.AsInteger;
      empresa.IE           := Trim(edtIE.Text);
      empresa.TIPO_REGIME  := StrToInt(Copy(cbbTipoRegime.Text,1,1));
      empresa.LOGRADOURO   := Trim(edtLogradouro.Text);
      empresa.NUMERO       := Trim(edtNumero.Text);
      empresa.COMPLEMENTO  := Trim(edtComplemento.Text);
      empresa.BAIRRO       := Trim(edtBairro.Text);
      empresa.CEP          := Trim(edtCEP.Text);
      empresa.CODIGO_CIDADE := lkpMunicipio.KeyValue;
      empresa.CODIGO_UF    := StrToInt(Copy(IntToStr(lkpMunicipio.KeyValue),1,2));
      empresa.UF           := Trim(Trim(lkpUF.Text));
      empresa.CIDADE       := Trim(lkpMunicipio.Text);

      case lkpUF.ItemIndex of
         5: empresa.CODIGO_UF := 23;
        19: empresa.CODIGO_UF := 24;
      end;

      empresa.CODIGO_CIDADE := lkpMunicipio.KeyValue;

      if DAO = 'U' then Begin
         empresa.ID        := idEmpresa;
         TBaseLocalEmpresaController.AlterarEmpresa(empresa);
      End else
         TBaseLocalEmpresaController.GravarEmpresa(empresa);

   Finally

      FreeAndNil(empresa);

   End;

end;

procedure TfrmCadastrarEmpresa.speCancelarClick(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCadastrarEmpresa.SpeedButton5Click(Sender: TObject);
begin

   Pesquisar;

end;

procedure TfrmCadastrarEmpresa.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarEmpresa.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

end.
