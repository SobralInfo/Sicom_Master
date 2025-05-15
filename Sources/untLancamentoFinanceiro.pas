unit untLancamentoFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExStdCtrls, JvEdit,
  JvValidateEdit, unitconfiguracoes;

type
  TfrmLancamentoFinanceiro = class(TForm)
    Panel3: TPanel;
    Label3: TLabel;
    Image1: TImage;
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    Label4: TLabel;
    lkpContaFinanceira: TDBLookupComboBox;
    Label2: TLabel;
    edtDocumento: TEdit;
    mkeVencimento: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    mmoObservacoes: TMemo;
    qryContas: TFDQuery;
    dtsContas: TDataSource;
    qryContasID: TIntegerField;
    qryContasTIPO: TStringField;
    qryContasDESCRICAO: TStringField;
    edtClienteFornecedor: TEdit;
    spbPesquisar: TSpeedButton;
    rdbCliente: TRadioButton;
    rdbFornecedor: TRadioButton;
    edtValor: TJvValidateEdit;
    qryAUX: TFDQuery;
    qryDAO: TFDQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    edtParcela: TEdit;
    procedure Image1Click(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure spbPesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    var DAO, tipoClienteFornecedor: string;
        idClienteFornecedor, idLancamento: integer;
    procedure Novo;
    procedure Salvar;
    procedure Cancelar;
    procedure HabilitarDesabilitarBotoes(tipo: string);
    procedure HabilitarDesabilitarCampos(tipo: string);
    procedure LimparCampos;
  end;

var
  frmLancamentoFinanceiro: TfrmLancamentoFinanceiro;

implementation

{$R *.dfm}

uses untPesquisarClientes, untPesquisarFornecedores,
  untConsultarLancFinanceiros;

procedure TfrmLancamentoFinanceiro.Cancelar;
begin
   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');
end;

procedure TfrmLancamentoFinanceiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: close;
   end;
end;

procedure TfrmLancamentoFinanceiro.HabilitarDesabilitarBotoes(tipo: string);
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

procedure TfrmLancamentoFinanceiro.HabilitarDesabilitarCampos(tipo: string);
begin
   if tipo = 'H' then
      begin
         lkpContaFinanceira.Enabled := true;
         rdbCliente.Enabled := true;
         rdbFornecedor.Enabled :=true;
         edtClienteFornecedor.Enabled := true;
         edtDocumento.Enabled := true;
         mkeVencimento.Enabled := true;
         edtValor.Enabled := true;
         mmoObservacoes.Enabled := true;
         edtParcela.Enabled := true;
      end
   else
      begin
         lkpContaFinanceira.Enabled := false;
         rdbCliente.Enabled := false;
         rdbFornecedor.Enabled :=false;
         edtClienteFornecedor.Enabled := false;
         edtDocumento.Enabled := false;
         mkeVencimento.Enabled := false;
         edtValor.Enabled := false;
         mmoObservacoes.Enabled := false;
         edtParcela.Enabled := false;
      end;
end;

procedure TfrmLancamentoFinanceiro.Image1Click(Sender: TObject);
begin
   close;
end;

procedure TfrmLancamentoFinanceiro.LimparCampos;
begin
   lkpContaFinanceira.KeyValue := -1;
   rdbCliente.Checked := true;
   edtClienteFornecedor.Text := '';
   edtDocumento.Text := '';
   mkeVencimento.Text := '';
   edtValor.AsFloat := 0.00;
   mmoObservacoes.Lines.Text := '';
   idClienteFornecedor := 0;
   edtParcela.Text := '';
end;

procedure TfrmLancamentoFinanceiro.Novo;
begin
   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;

   qryContas.Close;
   qryContas.Open;

   try
      lkpContaFinanceira.SetFocus;
   except
   end;
   DAO := 'N';
end;

procedure TfrmLancamentoFinanceiro.Salvar;
begin

   if Trim(lkpContaFinanceira.Text) = '' then
      begin
         prcMsgAdv('Selecione o tipo de conta financeira.');
         lkpContaFinanceira.SetFocus;
         exit;
      end;

   if idClienteFornecedor <= 0 then
      begin
         prcMsgAdv('Informe o cliente/Fornecedor.');
         edtClienteFornecedor.SetFocus;
         exit;
      end;

   try
      StrToDate(mkeVencimento.Text);
   except
      prcMsgAdv('Informe a data de vencimento.');
      mkeVencimento.SetFocus;
      exit;
   end;

   if edtValor.AsFloat <= 0.00 then
      begin
         prcMsgAdv('Informe o valor do documento.');
         edtValor.SetFocus;
         exit;
      end;

   if DAO = 'N' then
      begin
         qryDAO.Close;
         qryDAO.SQL.Clear;
         qryDAO.SQL.Add(' INSERT INTO lancamentos_financeiros ');
         qryDAO.SQL.Add(' (  ');
         qryDAO.SQL.Add(' id_conta_financeira, id_cliente_fornecedor, descricao_cliente_fornecedor, ');
         qryDAO.SQL.Add(' tipo_cliente_fornecedor, descricao_documento, data_vencimento, data_entrada, ');
         qryDAO.SQL.Add(' valor_documento, observacoes, status, parcela, tipo_lancamento ');
         qryDAO.SQL.Add(' )    ');
         qryDAO.SQL.Add(' VALUES   ');
         qryDAO.SQL.Add(' (    ');
         qryDAO.SQL.Add(' :id_conta_financeira, :id_cliente_fornecedor, :descricao_cliente_fornecedor, ');
         qryDAO.SQL.Add(' :tipo_cliente_fornecedor, :descricao_documento, :data_vencimento, :data_entrada, ');
         qryDAO.SQL.Add(' :valor_documento, :observacoes, ''A'', :parcela, :tipo_lancamento ');
         qryDAO.SQL.Add(' )  ');
         qryDAO.Params.ParamByName('data_entrada').AsDateTime := date;
      End
   else
      begin
         qryDAO.Close;
         qryDAO.SQL.Clear;
         qryDAO.SQL.Add(' Update lancamentos_financeiros Set id_conta_financeira = :id_conta_financeira, ');
         qryDAO.SQL.Add('                                    id_cliente_fornecedor = :id_cliente_fornecedor, ');
         qryDAO.SQL.Add('                                    descricao_cliente_fornecedor = :descricao_cliente_fornecedor, ');
         qryDAO.SQL.Add('                                    tipo_cliente_fornecedor = :tipo_cliente_fornecedor, ');
         qryDAO.SQL.Add('                                    descricao_documento = :descricao_documento, ');
         qryDAO.SQL.Add('                                    data_vencimento = :data_vencimento, ');
         qryDAO.SQL.Add('                                    valor_documento = :valor_documento, ');
         qryDAO.SQL.Add('                                    observacoes = :observacoes, ');
         qryDAO.SQL.Add('                                    tipo_lancamento = :tipo_lancamento, ');
         qryDAO.SQL.Add('                                    parcela = :parcela ');
         qryDAO.SQL.Add('  Where id = :id ');
         qryDAO.Params.ParamByName('id').Asinteger := idLancamento;
      end;

   qryDAO.Params.ParamByName('id_conta_financeira').AsInteger := lkpContaFinanceira.KeyValue;
   qryDAO.Params.ParamByName('id_cliente_fornecedor').AsInteger := idClienteFornecedor;
   qryDAO.Params.ParamByName('descricao_cliente_fornecedor').AsString := Trim(edtClienteFornecedor.Text);
   if rdbCliente.Checked then
      qryDAO.Params.ParamByName('tipo_cliente_fornecedor').AsString := 'C'
   else
      qryDAO.Params.ParamByName('tipo_cliente_fornecedor').AsString := 'F';
   qryDAO.Params.ParamByName('descricao_documento').AsString := Trim(edtDocumento.Text);
   qryDAO.Params.ParamByName('data_vencimento').AsDate := strtodate(mkeVencimento.Text);
   qryDAO.Params.ParamByName('valor_documento').AsFloat := edtValor.AsFloat;
   qryDAO.Params.ParamByName('observacoes').AsString := Trim(mmoObservacoes.Lines.Text);
   qryDAO.Params.ParamByName('parcela').AsString := Trim(edtParcela.Text);
   qryDAO.Params.ParamByName('tipo_lancamento').AsString := Trim(qryContasTIPO.AsString);
   Try
      qryDAO.ExecSQL;;
      prcMsgInf('Registro atualizado com sucesso.');
      frmConsultarLancFinanceiros.qryListagem.Refresh;
      Cancelar;
   Except
      on e:exception do begin
         prcMsgAdv('Falha ao atualizar o registro.'+#13+'Erro: '+ e.Message);
      end;
   End;

end;

procedure TfrmLancamentoFinanceiro.spbPesquisarClick(Sender: TObject);
begin
   if rdbCliente.Checked then
      begin
         Application.CreateForm(TfrmPesquisarClientes, frmPesquisarClientes);
         frmPesquisarClientes.origem := 'LANC_FINANCEIRO';
         frmPesquisarClientes.ShowModal;
      end
   else
      begin
         Application.CreateForm(TfrmPesquisarFornecedores, frmPesquisarFornecedores);
         frmPesquisarFornecedores.origem := 'LANC_FINANCEIRO';
         frmPesquisarFornecedores.ShowModal;
      end;
end;

procedure TfrmLancamentoFinanceiro.speCancelarClick(Sender: TObject);
begin
   Cancelar;
end;

procedure TfrmLancamentoFinanceiro.speNovoClick(Sender: TObject);
begin
   Novo;
end;

procedure TfrmLancamentoFinanceiro.speSalvarClick(Sender: TObject);
begin
   Salvar;
end;

end.
