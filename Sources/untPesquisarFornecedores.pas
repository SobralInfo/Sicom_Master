unit untPesquisarFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,  unitConfiguracoes,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Mask, Vcl.Imaging.pngimage, untPrincipal,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, untBiblioteca,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, BaseLocalClientesController,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RxDBCtrl;

type
  TfrmPesquisarFornecedores = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Image1: TImage;
    mkeDescricao: TMaskEdit;
    Panel2: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    imgNovo: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    qryFornecedores: TFDQuery;
    dtsFornecedores: TDataSource;
    qryFornecedoresID: TIntegerField;
    qryFornecedoresNOME: TStringField;
    qryFornecedoresFANTASIA: TStringField;
    qryFornecedoresEMAIL: TStringField;
    qryFornecedoresCPF_CNPJ: TStringField;
    qryFornecedoresINSCRICAO_ESTADUAL: TStringField;
    qryFornecedoresTIPO_PESSOA: TStringField;
    qryFornecedoresDATA_CADASTRO: TDateField;
    qryFornecedoresLOGRADOURO: TStringField;
    qryFornecedoresNUMERO: TStringField;
    qryFornecedoresCOMPLEMENTO: TStringField;
    qryFornecedoresCEP: TStringField;
    qryFornecedoresBAIRRO: TStringField;
    qryFornecedoresCIDADE: TStringField;
    qryFornecedoresUF: TStringField;
    qryFornecedoresCELULAR: TStringField;
    qryFornecedoresCODIGO_IBGE_CIDADE: TIntegerField;
    qryFornecedoresCODIGO_IBGE_UF: TIntegerField;
    RxDBGrid1: TRxDBGrid;
    qryFornecedorescalcCPF_CNPJ: TStringField;
    procedure mkeDescricaoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image4Click(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure qryFornecedoresCalcFields(DataSet: TDataSet);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  frmPesquisarFornecedores: TfrmPesquisarFornecedores;

implementation

{$R *.dfm}

uses untCadastrarFornecedores, untTelaDePedido, untEntradaManual,
  untLancamentoFinanceiro, untFiltrarLancFinanceiros;

{ TfrmPesquisarFornecedores }

procedure TfrmPesquisarFornecedores.Confirmar;
begin

   if qryFornecedores.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   if origem = 'CADASTRO_FORNECEDOR' then Begin

      frmCadastrarFornecedores.HabilitarDesabilitarBotoes('E');
      frmCadastrarFornecedores.HabilitarDesabilitarCampos('H');
      frmCadastrarFornecedores.LimparCampos;
      frmCadastrarFornecedores.DAO := 'U';

      if Length(qryFornecedoresCPF_CNPJ.AsString) > 11 then
         frmCadastrarFornecedores.rdbCNPJ.Checked  := True
      else
         frmCadastrarFornecedores.rdbCPF.Checked := True;

      frmCadastrarFornecedores.edtCPF_CNPJ.Text        := Trim(qryFornecedoresCPF_CNPJ.AsString);
      frmCadastrarFornecedores.edtRazaoSocial.Text     := Trim(qryFornecedoresNOME.AsString);
      frmCadastrarFornecedores.edtfantasia.Text        := Trim(qryFornecedoresFANTASIA.AsString);
      frmCadastrarFornecedores.edtLogradouro.Text      := Trim(qryFornecedoresLOGRADOURO.AsString);
      frmCadastrarFornecedores.edtNumero.Text          := Trim(qryFornecedoresNUMERO.AsString);
      frmCadastrarFornecedores.edtComplemento.Text     := Trim(qryFornecedoresCOMPLEMENTO.AsString);
      frmCadastrarFornecedores.edtBairro.Text          := Trim(qryFornecedoresBAIRRO.AsString);
      frmCadastrarFornecedores.idFornecedor            := qryFornecedoresID.AsInteger;
      frmCadastrarFornecedores.edtCelular.Text         := Trim(qryFornecedoresCELULAR.AsString);
      frmCadastrarFornecedores.idFornecedor            := qryFornecedoresID.AsInteger;

      frmCadastrarFornecedores.lkpUF.ItemIndex         := -1;
      frmCadastrarFornecedores.lkpUF.ItemIndex         := TBiblioteca.RetornarIDporUF(TBaseLocalClientesController.RetornarUFporID(qryFornecedoresCODIGO_IBGE_CIDADE.AsInteger));
      frmCadastrarFornecedores.FiltrarMunicipio;
      frmCadastrarFornecedores.lkpMunicipio.KeyValue   := qryFornecedoresCODIGO_IBGE_CIDADE.AsInteger;


   End;

   if origem = 'LANC_FINANCEIRO' then begin

      frmLancamentoFinanceiro.idClienteFornecedor := qryFornecedoresID.AsInteger;
      frmLancamentoFinanceiro.edtClienteFornecedor.Text  := Trim(qryFornecedoresNOME.AsString);

   end;

   if origem = 'ENTRADA_MANUAL' then Begin

      frmEntradaManual.idFornecedor := qryFornecedoresID.AsInteger;
      frmEntradaManual.edtFornecedor.Text := Trim(qryFornecedoresNOME.AsString);

   End;

   if origem = 'FILTRO_LANC_FINANCEIRO' then Begin

      frmFiltrarLancFinanceiros.idClienteFornecedor := qryFornecedoresID.AsInteger;
      frmFiltrarLancFinanceiros.edtClienteFornecedor.Text := Trim(qryFornecedoresNOME.AsString);

   End;

   close;

end;

procedure TfrmPesquisarFornecedores.Filtrar;
begin

   qryFornecedores.Filtered := False;

   if origem = 'CADASTRO_FORNECEDOR' then
      qryFornecedores.Filter := ' ((celular like '+QuotedStr('%'+Trim(Copy(mkeDescricao.Text,1,11))+'%')+
                                ') or (cpf_cnpj like '+QuotedStr(Trim(Copy(mkeDescricao.Text,1,14))+'%')+
                                ') OR (UPPER(FANTASIA) LIKE '+QuotedStr(UpperCase(Trim(mkeDescricao.Text))+'%')+'))';

   qryFornecedores.Filtered := True;

   lblTotal.Caption := 'Total de Clientes: '+qryFornecedores.RecordCount.ToString;
   qryFornecedores.First;

end;

procedure TfrmPesquisarFornecedores.FormCreate(Sender: TObject);
begin

   qryFornecedores.Close;
   qryFornecedores.Open;

end;

procedure TfrmPesquisarFornecedores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case Key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmPesquisarFornecedores.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarFornecedores.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarFornecedores.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarFornecedores.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   Confirmar;

end;

procedure TfrmPesquisarFornecedores.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarFornecedores.NovoCliente;
begin

end;

procedure TfrmPesquisarFornecedores.qryFornecedoresCalcFields(
  DataSet: TDataSet);
begin

   qryFornecedorescalcCPF_CNPJ.AsString := TBiblioteca.mascaraCPFCNPJ(qryFornecedoresCPF_CNPJ.AsString);

end;

procedure TfrmPesquisarFornecedores.RxDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   case key of

      VK_RETURN, VK_F12: Confirmar;
      VK_ESCAPE: close;

   end;

end;

end.
