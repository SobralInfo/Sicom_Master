unit untPesquisarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask, unitConfiguracoes,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, JvExDBGrids, JvDBGrid, untBiblioteca,
  Vcl.Imaging.pngimage, BaseLocalClientesController, Vcl.Buttons, RxDBCtrl;

type
  TfrmPesquisarClientes = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    lblTotal: TLabel;
    mkeDescricao: TMaskEdit;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    imgNovo: TImage;
    JvDBGrid1: TRxDBGrid;
    procedure mkeDescricaoChange(Sender: TObject);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Image4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure imgNovoClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Var origem: string;
    procedure Filtrar;
    procedure Confirmar;
    procedure NovoCliente;
  end;

var
  frmPesquisarClientes: TfrmPesquisarClientes;

implementation

{$R *.dfm}

uses untPrincipal, untPedidos, untCadastrarClientes, untTelaDePedido,
  untControleFiado, untRelVendasPorPeriodo, untLancamentoFinanceiro,
  untFiltrarLancFinanceiros, untCadastroParametros;

procedure TfrmPesquisarClientes.Confirmar;
begin

   if frmPrincipal.qryClientes.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   if origem = 'CADASTRO_CLIENTES' then Begin

      frmCadastrarClientes.HabilitarDesabilitarBotoes('E');
      frmCadastrarClientes.HabilitarDesabilitarCampos('H');
      frmCadastrarClientes.LimparCampos;
      frmCadastrarClientes.DAO := 'U';

      if frmPrincipal.qryClientesSTATUS.AsString = 'A' then
         frmCadastrarClientes.cbbStatus.ItemIndex := 0
      else
         frmCadastrarClientes.cbbStatus.ItemIndex := 1;

      if Length(frmPrincipal.qryClientesCPF_CNPJ.AsString) > 11 then
         frmCadastrarClientes.rdbCNPJ.Checked  := True
      else
         frmCadastrarClientes.rdbCPF.Checked := True;

      frmCadastrarClientes.edtCPF_CNPJ.Text        := Trim(frmPrincipal.qryClientesCPF_CNPJ.AsString);
      frmCadastrarClientes.edtNome.Text            := Trim(frmPrincipal.qryClientesNOME.AsString);
      frmCadastrarClientes.edtContato.Text         := Trim(frmPrincipal.qryClientesCONTATO.AsString);
      frmCadastrarClientes.edtLogradouro.Text      := Trim(frmPrincipal.qryClientesLOGRADOURO.AsString);
      frmCadastrarClientes.edtNumero.Text          := Trim(frmPrincipal.qryClientesNUMERO.AsString);
      frmCadastrarClientes.edtComplemento.Text     := Trim(frmPrincipal.qryClientesCOMPLEMENTO.AsString);
      frmCadastrarClientes.edtBairro.Text          := Trim(frmPrincipal.qryClientesBAIRRO.AsString);
      frmCadastrarClientes.idCliente               := frmPrincipal.qryClientesID.AsInteger;
      frmCadastrarClientes.edtCelular.Text         := Trim(frmPrincipal.qryClientesCELULAR.AsString);
      frmCadastrarClientes.edtFoneFixo.Text        := Trim(frmPrincipal.qryClientesFONE_FIXO.AsString);
      frmCadastrarClientes.edtReferencia.Text      := Trim(frmPrincipal.qryClientesREFERENCIA.AsString);

      try
         StrToDate(frmPrincipal.qryClientesDATA_NASCIMENTO.AsString);
         if frmPrincipal.qryClientesDATA_NASCIMENTO.AsDateTime < strtodate('01/01/1900') then
            frmCadastrarClientes.mkeDataNacimento.Text   := ''
         else
            frmCadastrarClientes.mkeDataNacimento.Text   := Trim(frmPrincipal.qryClientesDATA_NASCIMENTO.AsString);
      except
         frmCadastrarClientes.mkeDataNacimento.Text   := '';
      end;

      frmCadastrarClientes.lkpUF.ItemIndex         := -1;
      frmCadastrarClientes.lkpUF.ItemIndex         := TBiblioteca.RetornarIDporUF(TBaseLocalClientesController.RetornarUFporID(frmPrincipal.qryClientesCIDADE.AsInteger));
      //frmCadastrarClientes.FiltrarMunicipio;
      frmCadastrarClientes.lkpMunicipio.KeyValue   := frmPrincipal.qryClientesCIDADE.AsInteger;

   End else if origem = 'PEDIDO' then Begin

      frmTelaDePedido.edtCodCliente.Text := frmPrincipal.qryClientesID.AsString;
      frmTelaDePedido.idCliente          := frmPrincipal.qryClientesID.AsInteger;

   End else if origem = 'FIADO' then Begin

      //frmControleFiado.lblCliente.Caption := Trim(frmPrincipal.qryClientesNOME.AsString);
      frmControleFiado.idCliente          := frmPrincipal.qryClientesID.AsInteger;
      frmControleFiado.ListarCliente;
      frmControleFiado.Filtrar;

   End else if origem = 'RELVENPERIODO' then Begin

      //frmControleFiado.lblCliente.Caption := Trim(frmPrincipal.qryClientesNOME.AsString);
      frmRelVendasPorPeriodo.idCliente          := frmPrincipal.qryClientesID.AsInteger;
      frmRelVendasPorPeriodo.edtCliente.Text    := trim(frmPrincipal.qryClientesNOME.AsString);

   end else if origem = 'LANC_FINANCEIRO' then begin

      frmLancamentoFinanceiro.idClienteFornecedor := frmPrincipal.qryClientesID.AsInteger;
      frmLancamentoFinanceiro.edtClienteFornecedor.Text  := trim(frmPrincipal.qryClientesNOME.AsString);

   end else if origem = 'FILTRO_PARAMETROS' then begin

      frmCadastroParametros.idCliente := frmPrincipal.qryClientesID.AsInteger;
      frmCadastroParametros.edtClienteFornecedor.Text  := trim(frmPrincipal.qryClientesNOME.AsString);

   end else if origem = 'FILTRO_LANC_FINANCEIRO' then begin

      frmFiltrarLancFinanceiros.idClienteFornecedor := frmPrincipal.qryClientesID.AsInteger;
      frmFiltrarLancFinanceiros.edtClienteFornecedor.Text  := trim(frmPrincipal.qryClientesNOME.AsString);

   end else Begin

      frmPedidos.idCliente                 := frmPrincipal.qryClientesID.AsInteger;
      frmPedidos.lblNomeCliente.Caption    := Trim(FormataNome(frmPrincipal.qryClientesNOME.AsString));
      frmPedidos.lblCPFCNPJCliente.Caption := TBiblioteca.mascaraCPFCNPJ(Trim(frmPrincipal.qryClientesCPF_CNPJ.AsString));

      frmPedidos.lblCliente.Visible        := True;
      frmPedidos.lblCPFCNPJ.Visible        := True;
      frmPedidos.lblNomeCliente.Visible    := True;
      frmPedidos.lblCPFCNPJCliente.Visible := True;

   End;

   close;

end;

procedure TfrmPesquisarClientes.Filtrar;
begin

   frmPrincipal.qryClientes.Filtered := False;

   if origem = 'CADASTRO_CLIENTES' then
      frmPrincipal.qryClientes.Filter := ' ((celular like '+QuotedStr('%'+Trim(Copy(mkeDescricao.Text,1,11))+'%')+
                                                ') or (fone_fixo like '+QuotedStr('%'+Trim(Copy(mkeDescricao.Text,1,10))+'%')+
                                                ') or (cpf_cnpj like '+QuotedStr(Trim(Copy(mkeDescricao.Text,1,14))+'%')+
                                                ') OR (UPPER(nome) LIKE '+QuotedStr(UpperCase(Trim(mkeDescricao.Text))+'%')+'))'
   else
      frmPrincipal.qryClientes.Filter := ' status = ''A'' AND ((celular like '+QuotedStr('%'+Trim(Copy(mkeDescricao.Text,1,11))+'%')+
                                                                ') or (fone_fixo like '+QuotedStr('%'+Trim(Copy(mkeDescricao.Text,1,10))+'%')+
                                                                ') or (cpf_cnpj like '+QuotedStr(Trim(Copy(mkeDescricao.Text,1,14))+'%')+
                                                               ') OR (UPPER(nome) LIKE '+QuotedStr(UpperCase(Trim(mkeDescricao.Text))+'%')+'))';

   frmPrincipal.qryClientes.Filtered := True;

   lblTotal.Caption := 'Total de Clientes: '+frmPrincipal.qryClientes.RecordCount.ToString;
   frmPrincipal.qryClientes.First;

end;

procedure TfrmPesquisarClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   frmPrincipal.qryClientes.Close;

end;

procedure TfrmPesquisarClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_F12, VK_RETURN: Confirmar;
      VK_ESCAPE: close;
      VK_F2: NovoCliente;

   end;

end;

procedure TfrmPesquisarClientes.FormShow(Sender: TObject);
begin
   frmPrincipal.qryClientes.Close;
   frmPrincipal.qryClientes.Open;
   Filtrar;
   if Assigned(frmPedidos) then
      imgNovo.Visible := True;
end;

procedure TfrmPesquisarClientes.Image3Click(Sender: TObject);
begin
   Confirmar;
end;

procedure TfrmPesquisarClientes.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarClientes.imgNovoClick(Sender: TObject);
begin

   NovoCliente;

end;

procedure TfrmPesquisarClientes.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarClientes.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarClientes.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarClientes.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_DOWN then
      JvDBGrid1.SetFocus;

end;

procedure TfrmPesquisarClientes.NovoCliente;
begin

   if imgNovo.Visible = false then
      Exit;

   Application.CreateForm(TfrmCadastrarClientes, frmCadastrarClientes);
   frmCadastrarClientes.ShowModal;
   frmPrincipal.qryClientes.Refresh;

end;

procedure TfrmPesquisarClientes.RxDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarClientes.speNovoClick(Sender: TObject);
begin

   NovoCliente;

end;

end.
