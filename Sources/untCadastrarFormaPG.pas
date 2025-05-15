unit untCadastrarFormaPG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, BaseLocalFormasPagamentoController,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, BaseLocalFormasPagamentoVO, unitConfiguracoes,
  JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TfrmCadastrarFormaPG = class(TForm)
    SpeedButton5: TSpeedButton;
    speCancelar: TSpeedButton;
    speSalvar: TSpeedButton;
    speNovo: TSpeedButton;
    Panel4: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Panel1: TPanel;
    edtDescricao: TMaskEdit;
    Label4: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    cbbStatus: TComboBox;
    cbbTroco: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    cbbTipoPgNFCe: TComboBox;
    cbbEmitirNFCe: TComboBox;
    Label7: TLabel;
    cbbFinanceiro: TComboBox;
    edtPrazo: TJvValidateEdit;
    Label8: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Novo;
    procedure Salvar;
    procedure Pesquisar;
    procedure Cancelar;
    procedure HabilitarDesabilitarBotoes(tipo: String);
    procedure HabilitarDesabilitarCampos(tipo: String);
    procedure LimparCampos;
    var DAO: String;
        idFormaPG: integer;
  end;

var
  frmCadastrarFormaPG: TfrmCadastrarFormaPG;

implementation

{$R *.dfm}

uses untPesquisarFormaPG;

procedure TfrmCadastrarFormaPG.Cancelar;
begin

   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');

end;

procedure TfrmCadastrarFormaPG.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmCadastrarFormaPG.HabilitarDesabilitarBotoes(tipo: String);
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

procedure TfrmCadastrarFormaPG.HabilitarDesabilitarCampos(tipo: String);
begin

   if tipo = 'H' then Begin

      cbbStatus.Enabled       := True;
      edtDescricao.Enabled    := True;
      cbbTroco.Enabled        := True;
      cbbTipoPgNFCe.Enabled   := True;
      cbbEmitirNFCe.Enabled   := True;
      cbbFinanceiro.Enabled   := True;
      edtPrazo.Enabled        := True;

   End else if tipo = 'D' then Begin

      cbbStatus.Enabled       := False;
      edtDescricao.Enabled    := False;
      cbbTroco.Enabled        := False;
      cbbTipoPgNFCe.Enabled   := False;
      cbbEmitirNFCe.Enabled   := False;
      cbbFinanceiro.Enabled   := False;
      edtPrazo.Enabled        := False;

   End;

end;

procedure TfrmCadastrarFormaPG.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarFormaPG.LimparCampos;
begin

   cbbStatus.ItemIndex := -1;
   edtDescricao.Text   := '';
   cbbTroco.ItemIndex  := -1;
   cbbTipoPgNFCe.ItemIndex := -1;
   cbbEmitirNFCe.ItemIndex := -1;
   cbbFinanceiro.ItemIndex := -1;
   edtPrazo.AsInteger := 0;

end;

procedure TfrmCadastrarFormaPG.Novo;
begin

   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;
   cbbStatus.ItemIndex := 0;
   cbbStatus.SetFocus;
   DAO := 'N';

end;

procedure TfrmCadastrarFormaPG.Pesquisar;
begin

   Application.CreateForm(TfrmPesquisarFormaPG, frmPesquisarFormaPG);
   frmPesquisarFormaPG.ShowModal;

end;

procedure TfrmCadastrarFormaPG.Salvar;
var formaPG: TBaseLocalFormasPagamentoVO;
begin

   if cbbStatus.ItemIndex < 0 then Begin
      prcMsgAdv('Informe o status da forma de pagamento.');
      cbbStatus.SetFocus;
      Exit;
   End;

   if Trim(edtDescricao.Text) = '' then Begin
      prcMsgAdv('Informe a descrição da forma de pagamento.');
      edtDescricao.SetFocus;
      Exit;
   End;

   if cbbTroco.ItemIndex < 0 then Begin
      prcMsgAdv('Informe se a forma de pagamento permite troco.');
      cbbTroco.SetFocus;
      Exit;
   End;

   if cbbFinanceiro.ItemIndex < 0 then Begin
      prcMsgAdv('Informe se a forma de pagamento gera financeiro.');
      cbbFinanceiro.SetFocus;
      Exit;
   End;

   if edtPrazo.Text = '' then Begin
      prcMsgAdv('Informe prazo das parcelas.');
      edtPrazo.SetFocus;
      Exit;
   End;

   if cbbTipoPgNFCe.Text = '' then Begin
      prcMsgAdv('Informe o tipo de pagamento da NFCe.');
      cbbTipoPgNFCe.SetFocus;
      Exit;
   End;

   if cbbEmitirNFCe.ItemIndex < 0 then Begin
      prcMsgAdv('Informe se a forma de pagamento emite NFCe.');
      cbbEmitirNFCe.SetFocus;
      Exit;
   End;

   Try

      formaPG := TBaseLocalFormasPagamentoVO.Create;

      formaPG.STATUS        := Copy(Trim(cbbStatus.Text),1,1);
      formaPG.nome          := Trim(edtDescricao.Text);
      formaPG.permite_troco := Copy(Trim(cbbTroco.Text),1,1);
      formaPG.tipo_pagamento_nfce := StrToInt(Copy(Trim(cbbTipoPgNFCe.Text),1,2));
      formaPG.EMITIR_FISCAL := Copy(Trim(cbbEmitirNFCe.Text),1,1);
      formaPG.GERAR_FINANCEIRO := Copy(Trim(cbbFinanceiro.Text),1,1);
      formaPG.PRAZO_PARCELAS := edtPrazo.AsInteger;


      if DAO = 'U' then Begin
         formaPG.ID := idFormaPG;
         TBaseLocalFormasPagamentoController.AlterarFormaPG(formaPG);
      End else begin
         formaPG.id := TBaseLocalFormasPagamentoController.retornarGenerator;
         TBaseLocalFormasPagamentoController.GravarFormaPG(formaPG);
         idFormaPG := formaPG.id;
         DAO := 'U';
      end;

   Finally

      FreeAndNil(formaPG);

   End;

end;

procedure TfrmCadastrarFormaPG.speCancelarClick(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCadastrarFormaPG.SpeedButton5Click(Sender: TObject);
begin

   Pesquisar;

end;

procedure TfrmCadastrarFormaPG.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarFormaPG.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

end.
