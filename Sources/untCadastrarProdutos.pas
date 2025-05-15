unit untCadastrarProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, unitConfiguracoes,
  Vcl.Imaging.pngimage, Vcl.DBCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, BaseLocalProdutosVO, BaseLocalProdutosController,
  Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ACBrBase, ACBrSocket, ACBrNCMs;

type
  TfrmCadastrarProdutos = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    edtDescricao: TMaskEdit;
    edtValor: TJvValidateEdit;
    Label5: TLabel;
    edtEstoque: TJvValidateEdit;
    Label6: TLabel;
    lkpUnidade: TDBLookupComboBox;
    Label7: TLabel;
    Label4: TLabel;
    edtCodigoBarras: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtReferencia: TMaskEdit;
    cbbStatus: TComboBox;
    Label3: TLabel;
    cbbImprimirCozinha: TComboBox;
    Label10: TLabel;
    lkpCategoria: TDBLookupComboBox;
    qryCategoria: TFDQuery;
    dtsCategoria: TDataSource;
    qryCategoriaID: TIntegerField;
    qryCategoriaSTATUS: TStringField;
    qryCategoriaDESCRICAO: TStringField;
    Label11: TLabel;
    edtEstoqueMinimo: TJvValidateEdit;
    qryOrigem: TFDQuery;
    qryOrigemID: TIntegerField;
    qryOrigemCODIGO: TIntegerField;
    qryOrigemDESCRICAO: TStringField;
    qryOrigemcalcDescricao: TStringField;
    dtsOrigem: TDataSource;
    dtsCFOP: TDataSource;
    qryCFOP: TFDQuery;
    qryCFOPID: TIntegerField;
    qryCFOPCFOP: TIntegerField;
    qryCFOPDESCRICAO: TStringField;
    qryCFOPcalcDescricao: TStringField;
    qryCSTPIS: TFDQuery;
    qryCSTPIScalcDescricao: TStringField;
    qryCSTPISCST: TStringField;
    qryCSTPISDESCRICAO: TStringField;
    qryCSTPISSTATUS: TStringField;
    dtsCSTPIS: TDataSource;
    dtsCSTCOFINS: TDataSource;
    qryCSTCOFINS: TFDQuery;
    qryCSTCOFINScalcDescricao: TStringField;
    qryCSTCOFINSCST: TStringField;
    qryCSTCOFINSDESCRICAO: TStringField;
    qryCSTCOFINSSTATUS: TStringField;
    qryCSTICMS: TFDQuery;
    qryCSTICMSCST: TIntegerField;
    qryCSTICMSDESCRICAO: TStringField;
    qryCSTICMScalcDescricao: TStringField;
    dtsCSTICMS: TDataSource;
    dtsAliqICMS: TDataSource;
    qryAliqICMS: TFDQuery;
    qryAliqICMSID: TIntegerField;
    qryAliqICMSVALOR: TFloatField;
    qryAliqPIS: TFDQuery;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    dtsAliqPIS: TDataSource;
    dtsAliqCOFINS: TDataSource;
    qryAliqCOFINS: TFDQuery;
    IntegerField2: TIntegerField;
    FloatField2: TFloatField;
    ACBrNCMs1: TACBrNCMs;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    speNcm: TSpeedButton;
    speCest: TSpeedButton;
    lkpOrigem: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    lkpCST_PIS: TDBLookupComboBox;
    lkpAliquotaPIS: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label19: TLabel;
    lkpCST_COFINS: TDBLookupComboBox;
    lkpAliquotaCOFINS: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    lkpAliquotaICMS: TDBLookupComboBox;
    lkpCST_CSOSN: TDBLookupComboBox;
    edtNCM: TMaskEdit;
    edtCEST: TMaskEdit;
    lkpCFOP: TDBLookupComboBox;
    chkFiscais: TCheckBox;
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure speNovoClick(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure chkFiscaisClick(Sender: TObject);
    procedure qryOrigemCalcFields(DataSet: TDataSet);
    procedure qryCFOPCalcFields(DataSet: TDataSet);
    procedure qryCSTPISCalcFields(DataSet: TDataSet);
    procedure qryCSTCOFINSCalcFields(DataSet: TDataSet);
    procedure qryCSTICMSCalcFields(DataSet: TDataSet);
    procedure speNcmClick(Sender: TObject);
    procedure speCestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar;
    procedure Novo;
    procedure Salvar;
    procedure Cancelar;
    procedure HabilitarDesabilitarBotoes(tipo: string);
    procedure HabilitarDesabilitarCampos(tipo: string);
    procedure LimparCampos;
    Var DAO: string;
        idProduto: integer;
  end;

var
  frmCadastrarProdutos: TfrmCadastrarProdutos;

implementation

{$R *.dfm}

uses untPesquisarProdutos, untPrincipal, untPesquisarNCM, untPesquisarCEST;

procedure TfrmCadastrarProdutos.Cancelar;
begin

   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');

end;

procedure TfrmCadastrarProdutos.chkFiscaisClick(Sender: TObject);
begin
   if chkFiscais.Checked then Begin

      lkpOrigem.Enabled          := True;
      lkpCFOP.Enabled            := True;
      lkpCST_PIS.Enabled         := True;
      lkpCST_COFINS.Enabled      := True;
      lkpCST_CSOSN.Enabled       := True;
      lkpAliquotaICMS.Enabled    := True;
      lkpAliquotaPIS.Enabled     := True;
      lkpAliquotaCOFINS.Enabled  := True;
      edtNCM.Enabled             := True;
      edtCEST.Enabled            := True;
      speCest.Enabled            := True;
      speNcm.Enabled             := True;
      Try
         lkpOrigem.SetFocus;
      Except
      End;

   End else Begin

      lkpOrigem.Enabled          := False;
      lkpCFOP.Enabled            := False;
      lkpCST_PIS.Enabled         := False;
      lkpCST_COFINS.Enabled      := False;
      lkpCST_CSOSN.Enabled       := False;
      lkpAliquotaICMS.Enabled    := False;
      lkpAliquotaPIS.Enabled     := False;
      lkpAliquotaCOFINS.Enabled  := False;
      edtNCM.Enabled             := False;
      edtCEST.Enabled            := False;
      speCest.Enabled            := False;
      speNcm.Enabled             := False;

   End;

   lkpOrigem.KeyValue         := -1;
   lkpCFOP.KeyValue           := -1;
   edtNCM.Text                := '';
   edtCEST.Text               := '';
   lkpCST_CSOSN.KeyValue      := -1;
   lkpAliquotaICMS.KeyValue   := -1;
   lkpCST_PIS.KeyValue        := -1;
   lkpAliquotaPIS.KeyValue    := -1;
   lkpCST_COFINS.KeyValue     := -1;
   lkpAliquotaCOFINS.KeyValue := -1;
end;

procedure TfrmCadastrarProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmCadastrarProdutos.HabilitarDesabilitarBotoes(tipo: string);
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

procedure TfrmCadastrarProdutos.HabilitarDesabilitarCampos(tipo: string);
begin

   if tipo = 'H' then Begin

      cbbStatus.Enabled          := True;
      cbbImprimirCozinha.Enabled := True;
      edtDescricao.Enabled       := True;
      lkpUnidade.Enabled         := True;
      edtCodigoBarras.Enabled    := True;
      edtReferencia.Enabled      := True;
      edtValor.Enabled           := True;
      edtEstoqueMinimo.Enabled   := True;
      edtEstoque.Enabled         := True;
      lkpCategoria.Enabled       := True;

      frmPrincipal.qryUnidades.Close;
      frmPrincipal.qryUnidades.Filtered := False;
      frmPrincipal.qryUnidades.Filter := ' status = ''A'' ';
      frmPrincipal.qryUnidades.Filtered := True;
      frmPrincipal.qryUnidades.Open;
      chkFiscais.Enabled         := True;

      qryOrigem.Close;
      qryOrigem.Open;

      qryCFOP.Close;
      qryCFOP.Open;

      qryCSTPIS.Close;
      qryCSTPIS.Open;

      qryCSTCOFINS.Close;
      qryCSTCOFINS.Open;

      qryCSTICMS.Close;
      qryCSTICMS.Open;

      qryAliqICMS.Close;
      qryAliqICMS.Open;

      qryAliqPIS.Close;
      qryAliqPIS.Open;

      qryAliqCOFINS.Close;
      qryAliqCOFINS.Open;

      qryCategoria.Close;
      qryCategoria.Open;

   End else if tipo = 'D' then Begin

      cbbStatus.Enabled          := False;
      cbbImprimirCozinha.Enabled := False;
      edtDescricao.Enabled       := False;
      lkpUnidade.Enabled         := False;
      edtCodigoBarras.Enabled    := False;
      edtReferencia.Enabled      := False;
      edtValor.Enabled           := False;
      edtEstoqueMinimo.Enabled   := False;
      edtEstoque.Enabled         := False;
      lkpCategoria.Enabled       := False;

      chkFiscais.Enabled         := False;
      lkpOrigem.Enabled          := False;
      lkpCFOP.Enabled            := False;
      lkpCST_PIS.Enabled         := False;
      lkpCST_COFINS.Enabled      := False;
      lkpCST_CSOSN.Enabled       := False;
      lkpAliquotaICMS.Enabled    := False;
      lkpAliquotaPIS.Enabled     := False;
      lkpAliquotaCOFINS.Enabled  := False;
      edtNCM.Enabled             := False;
      edtCEST.Enabled            := False;
      speCest.Enabled            := False;
      speNcm.Enabled             := False;
      chkFiscais.Checked := False;

      qryCategoria.Close;

   End;

end;

procedure TfrmCadastrarProdutos.Image1Click(Sender: TObject);
begin

   Close;

end;

procedure TfrmCadastrarProdutos.LimparCampos;
begin

   cbbStatus.ItemIndex     := -1;
   edtDescricao.Text       := '';
   lkpUnidade.KeyValue     := -1;
   edtCodigoBarras.Text    := '';
   edtReferencia.Text      := '';
   edtEstoque.AsFloat      := 0.000;
   edtEstoqueMinimo.AsFloat:= 0.000;
   edtValor.AsFloat        := 0.00;
   idProduto               := 0;
   DAO                     := '';
   lkpCategoria.KeyValue   := -1;

   lkpOrigem.KeyValue         := -1;
   lkpCFOP.KeyValue           := -1;
   edtNCM.Text                := '';
   edtCEST.Text               := '';
   lkpCST_CSOSN.KeyValue      := -1;
   lkpAliquotaICMS.KeyValue   := -1;
   lkpCST_PIS.KeyValue        := -1;
   lkpAliquotaPIS.KeyValue    := -1;
   lkpCST_COFINS.KeyValue     := -1;
   lkpAliquotaCOFINS.KeyValue := -1;

end;

procedure TfrmCadastrarProdutos.Novo;
begin

   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;
   cbbStatus.ItemIndex := 0;
   cbbStatus.SetFocus;
   DAO := 'N';

end;

procedure TfrmCadastrarProdutos.Pesquisar;
begin

   Application.CreateForm(TfrmPesquisarProdutos, frmPesquisarProdutos);
   frmPesquisarProdutos.origem := 'CADASTRO_PRODUTOS';
   frmPesquisarProdutos.ShowModal;

end;

procedure TfrmCadastrarProdutos.qryCFOPCalcFields(DataSet: TDataSet);
begin
   qryCFOPcalcDescricao.AsString := Trim(qryCFOPCFOP.AsString) + ' ' + Trim(qryCFOPDESCRICAO.AsString);
end;

procedure TfrmCadastrarProdutos.qryCSTCOFINSCalcFields(DataSet: TDataSet);
begin
   qryCSTCOFINScalcDescricao.AsString := Trim(qryCSTCOFINSCST.AsString) + ' ' + Trim(qryCSTCOFINSDESCRICAO.AsString);
end;

procedure TfrmCadastrarProdutos.qryCSTICMSCalcFields(DataSet: TDataSet);
begin
   qryCSTICMScalcDescricao.AsString := Trim(qryCSTICMSCST.AsString) + ' ' + Trim(qryCSTICMSDESCRICAO.AsString);
end;

procedure TfrmCadastrarProdutos.qryCSTPISCalcFields(DataSet: TDataSet);
begin
   qryCSTPIScalcDescricao.AsString := Trim(qryCSTPISCST.AsString) + ' ' + Trim(qryCSTPISDESCRICAO.AsString);
end;

procedure TfrmCadastrarProdutos.qryOrigemCalcFields(DataSet: TDataSet);
begin
   qryOrigemcalcDescricao.AsString := Trim(qryOrigemCODIGO.AsString) + ' ' + Trim(qryOrigemDESCRICAO.AsString);
end;

procedure TfrmCadastrarProdutos.Salvar;
var produto: TBaseLocalProdutosVO;
begin

   if cbbStatus.ItemIndex < 0 then Begin
      prcMsgAdv('Informe o status da unidade.');
      cbbStatus.SetFocus;
      Exit;
   End;

   if Trim(edtDescricao.Text) = '' then Begin
      prcMsgAdv('Informe a descrição da unidade.');
      edtDescricao.SetFocus;
      Exit;
   End;

   if Trim(cbbImprimirCozinha.Text) = '' then Begin
      prcMsgAdv('Informe se imprime na cozinha.');
      cbbImprimirCozinha.SetFocus;
      Exit;
   End;

   if lkpUnidade.KeyValue <= 0 then Begin
      prcMsgAdv('Informe a unidade do produto.');
      lkpUnidade.SetFocus;
      Exit;
   End;

   if Trim(edtCodigoBarras.Text) = '' then Begin
      prcMsgAdv('Informe o código de barras do produto.');
      edtCodigoBarras.SetFocus;
      Exit;
   End;

   if edtValor.AsFloat <= 0 then Begin
      prcMsgAdv('Informe o valor do produto.');
      edtValor.SetFocus;
      Exit;
   End;

   if Trim(lkpCategoria.Text) = '' then Begin
      prcMsgAdv('Selecione a categoria do produto.');
      lkpCategoria.SetFocus;
      Exit;
   End;

   if chkFiscais.Checked then Begin

      if Trim(lkpOrigem.Text) = '' then Begin

         prcMsgAdv('Selecione a origem do produto.');
         lkpOrigem.SetFocus;
         Exit;

      End;

      if Trim(lkpCFOP.Text) = '' then Begin

         prcMsgAdv('Selecione o CFOP do produto.');
         lkpCFOP.SetFocus;
         Exit;

      End;

      if Trim(edtNCM.Text) = '' then Begin

         prcMsgAdv('Selecione o NCM do produto.');
         edtNCM.SetFocus;
         Exit;

      End;

      if Trim(edtCEST.Text) = '' then Begin

         prcMsgAdv('Selecione o CEST do produto.');
         edtCEST.SetFocus;
         Exit;

      End;

      if Trim(lkpCST_CSOSN.Text) = '' then Begin

         prcMsgAdv('Selecione o CST/CSOSN do produto.');
         lkpCST_CSOSN.SetFocus;
         Exit;

      End;

      if Trim(lkpAliquotaICMS.Text) = '' then Begin

         prcMsgAdv('Selecione a alíquota do ICMS do produto.');
         lkpAliquotaICMS.SetFocus;
         Exit;

      End;

      if Trim(lkpCST_PIS.Text) = '' then Begin

         prcMsgAdv('Selecione o CST do PIS do produto.');
         lkpCST_PIS.SetFocus;
         Exit;

      End;

      if Trim(lkpAliquotaPIS.Text) = '' then Begin

         prcMsgAdv('Selecione a alíquota do PIS do produto.');
         lkpAliquotaPIS.SetFocus;
         Exit;

      End;

      if Trim(lkpCST_COFINS.Text) = '' then Begin

         prcMsgAdv('Selecione o CST do COFINS do produto.');
         lkpCST_COFINS.SetFocus;
         Exit;

      End;

      if Trim(lkpAliquotaCOFINS.Text) = '' then Begin

         prcMsgAdv('Selecione a alíquota do COFINS do produto.');
         lkpAliquotaCOFINS.SetFocus;
         Exit;

      End;

   End;


   Try

      produto := TBaseLocalProdutosVO.Create;

      produto.STATUS          := Copy(Trim(cbbStatus.Text),1,1);
      produto.descricao       := Trim(edtDescricao.Text);
      produto.id_unidade      := lkpUnidade.KeyValue;
      produto.codigo_barras   := Trim(edtCodigoBarras.Text);
      produto.referencia      := Trim(edtReferencia.Text);
      produto.qtde_estoque    := edtEstoque.AsFloat;
      produto.EstoqueMinimo   := edtEstoqueMinimo.AsFloat;
      produto.valor_unitario  := edtValor.AsFloat;
      produto.ImprimirCozinha := Copy(Trim(cbbImprimirCozinha.Text),1,1);
      produto.idCategoria     := lkpCategoria.KeyValue;

      produto.origem          := StrToInt(lkpOrigem.KeyValue);
      produto.cfop            := Trim(lkpCFOP.KeyValue);
      produto.ncm             := Trim(edtNCM.Text);
      produto.cest            := Trim(edtCEST.Text);
      produto.cst_csosn       := Trim(lkpCST_CSOSN.KeyValue);

      if lkpAliquotaICMS.KeyValue > 0 then
         produto.taxa_icms       := strtofloat(lkpAliquotaICMS.Text);

      produto.cst_pis         := Trim(lkpCST_PIS.KeyValue);

      if lkpAliquotaPIS.KeyValue > 0 then
         produto.taxa_pis        := strtofloat(lkpAliquotaPIS.Text);

      produto.cst_cofins      := Trim(lkpCST_COFINS.KeyValue);

      if lkpAliquotaCOFINS.KeyValue > 0 then
         produto.taxa_cofins     := strtofloat(lkpAliquotaCOFINS.Text);

      if chkFiscais.Checked then
         produto.fiscal       := 'S'
      else
         produto.fiscal       := 'N';

      if DAO = 'U' then Begin
         produto.ID := idProduto;
         TBaseLocalProdutosController.AlterarProduto(produto);
      End else begin
         produto.id := TBaseLocalProdutosController.retornarGenerator;
         TBaseLocalProdutosController.GravarProduto(produto);
         idProduto  := produto.id;
         DAO := 'U';
      end;

   Finally

      FreeAndNil(produto);

   End;

end;

procedure TfrmCadastrarProdutos.speCancelarClick(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCadastrarProdutos.speNcmClick(Sender: TObject);
begin
   Application.CreateForm(TfrmPesquisarNCM, frmPesquisarNCM);
   frmPesquisarNCM.origem := 'PRODUTOS';
   frmPesquisarNCM.ShowModal;
end;

procedure TfrmCadastrarProdutos.speCestClick(Sender: TObject);
begin
   Application.CreateForm(TfrmPesquisarCEST, frmPesquisarCEST);
   frmPesquisarCEST.origem := 'PRODUTOS';
   frmPesquisarCEST.ShowModal;
end;

procedure TfrmCadastrarProdutos.SpeedButton5Click(Sender: TObject);
begin

   Pesquisar;

end;

procedure TfrmCadastrarProdutos.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarProdutos.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

end.
