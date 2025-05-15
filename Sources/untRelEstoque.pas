unit untRelEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, unitConfiguracoes,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, RLReport, Vcl.DBCtrls, JvExStdCtrls,
  JvEdit, JvValidateEdit, Vcl.Buttons, RLFilters, RLPDFFilter;

type
  TfrmRelEstoque = class(TForm)
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel5: TPanel;
    dtsRel: TDataSource;
    qryAUX: TFDQuery;
    qryRel: TFDQuery;
    Panel1: TPanel;
    RLReport1: TRLReport;
    chkAtivos: TCheckBox;
    chkInativos: TCheckBox;
    chkComSaldo: TCheckBox;
    chkEstoqueMinimo: TCheckBox;
    chkSemSaldo: TCheckBox;
    Label10: TLabel;
    lkpCategoria: TDBLookupComboBox;
    chkPromocao: TCheckBox;
    qryRelID: TIntegerField;
    qryRelSTATUS: TStringField;
    qryRelDESCRICAO: TStringField;
    qryRelQTDE_ESTOQUE: TFloatField;
    qryRelREFERENCIA: TStringField;
    qryRelID_UNIDADE: TIntegerField;
    qryRelCODIGO_BARRAS: TStringField;
    qryRelVALOR_UNITARIO: TFloatField;
    qryRelID_ORIGINAL: TStringField;
    qryRelIMPRIMIR_COZINHA: TStringField;
    qryRelID_CATEGORIA: TIntegerField;
    qryRelSIGLA: TStringField;
    qryRelCATEGORIA: TStringField;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    qryRelcalc_valor_medio: TFloatField;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    qryRelcalc_data_ult_entrada: TStringField;
    RLBand3: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel2: TRLLabel;
    qryCategoria: TFDQuery;
    dtsCategoria: TDataSource;
    qryCategoriaID: TIntegerField;
    qryCategoriaDESCRICAO: TStringField;
    Label1: TLabel;
    edtProduto: TJvValidateEdit;
    SpeedButton5: TSpeedButton;
    lblFiltro01: TRLLabel;
    lblFiltro02: TRLLabel;
    lblFiltro03: TRLLabel;
    lblFiltro04: TRLLabel;
    lblFiltro05: TRLLabel;
    lblFiltro06: TRLLabel;
    RLLabel1: TRLLabel;
    RLBand5: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLPDFFilter1: TRLPDFFilter;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image3Click(Sender: TObject);
    procedure chkAtivosClick(Sender: TObject);
    procedure chkInativosClick(Sender: TObject);
    procedure chkComSaldoClick(Sender: TObject);
    procedure chkSemSaldoClick(Sender: TObject);
    procedure qryRelCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Procedure Confirmar;
  public
    { Public declarations }
    Var idProduto: integer;
  end;

var
  frmRelEstoque: TfrmRelEstoque;

implementation

{$R *.dfm}

uses untPrincipal, untPesquisarProdutos;

procedure TfrmRelEstoque.chkAtivosClick(Sender: TObject);
begin

   if chkAtivos.Checked then
      chkInativos.Checked := False;

end;

procedure TfrmRelEstoque.chkComSaldoClick(Sender: TObject);
begin

   if chkComSaldo.Checked then
      chkSemSaldo.Checked := False;

end;

procedure TfrmRelEstoque.chkInativosClick(Sender: TObject);
begin

   if chkInativos.Checked then
      chkAtivos.Checked := False;

end;

procedure TfrmRelEstoque.chkSemSaldoClick(Sender: TObject);
begin

   if chkSemSaldo.Checked then
      chkComSaldo.Checked := False;

end;

procedure TfrmRelEstoque.Confirmar;
begin

   qryRel.Close;
   qryRel.SQL.Clear;
   qryRel.SQL.Add(' SELECT p.*, ');
   qryRel.SQL.Add('        u.sigla, ');
   qryRel.SQL.Add('        c.descricao AS categoria ');
   qryRel.SQL.Add('   FROM produtos p ');
   qryRel.SQL.Add('        LEFT JOIN categoria c ON p.id_categoria = c.id, ');
   qryRel.SQL.Add('        unidade_produtos u ');
   qryRel.SQL.Add('  WHERE p.id_unidade = u.id ');

   if chkAtivos.Checked then
      qryRel.SQL.Add(' AND p.status = ''A'' ');

   if chkInativos.Checked then
      qryRel.SQL.Add(' AND p.status = ''I'' ');

   if chkComSaldo.Checked then
      qryRel.SQL.Add(' AND p.qtde_estoque > 0 ');

   if chkSemSaldo.Checked then
      qryRel.SQL.Add(' AND p.qtde_estoque <= 0 ');

   if chkEstoqueMinimo.Checked then
      qryRel.SQL.Add(' AND p.qtde_estoque <= Coalesce(p.ESTOQUE_MINIMO,0) ');

   if lkpCategoria.KeyValue > 0 then
      qryRel.SQL.Add(' AND p.ID_CATEGORIA = '+IntToStr(lkpCategoria.KeyValue));

   if chkPromocao.Checked then Begin
      qryRel.SQL.Add(' AND p.id IN (SELECT * FROM RETORNAR_ID_PRODUTOS_PROMOCAO(:data)) ');
      qryRel.Params.ParamByName('data').AsDateTime := now;
   End;

   if idProduto > 0 then
      qryRel.SQL.Add(' AND p.id = '+IntToStr(idProduto));

   qryRel.Open;

   if qryRel.IsEmpty then Begin
      prcMsgAdv('Não foram encontrados registros com esses parâmetros.');
      Exit;
   End;

   lblFiltro01.Caption := 'Somente Produtos Ativos: NÃO';
   lblFiltro02.Caption := 'Somente Produtos Inativos: NÃO';
   lblFiltro03.Caption := 'Somente Produtos com Saldo: NÃO';
   lblFiltro04.Caption := 'Somente Produtos sem Saldo: NÃO';
   lblFiltro05.Caption := 'Somente Prod. c/ Est. Abaixo Mínimo: NÃO';
   lblFiltro06.Caption := 'Somente Produtos em Promoção: NÃO';

   if chkAtivos.Checked then
      lblFiltro01.Caption := 'Somente Produtos Ativos: SIM';

   if chkInativos.Checked then
      lblFiltro02.Caption := 'Somente Produtos Inativos: SIM';

   if chkComSaldo.Checked then
      lblFiltro03.Caption := 'Somente Produtos com Saldo: SIM';

   if chkSemSaldo.Checked then
      lblFiltro04.Caption := 'Somente Produtos sem Saldo: SIM';

   if chkEstoqueMinimo.Checked then
      lblFiltro05.Caption := 'Somente Prod. c/ Est. Abaixo Mínimo: SIM';

   if chkPromocao.Checked then
      lblFiltro06.Caption := 'Somente Produtos em Promoção: SIM';

   RLReport1.PreviewModal;

end;

procedure TfrmRelEstoque.edtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_DELETE: Begin
                    idProduto := 0;
                    edtProduto.Text := 'TODOS';
                 End;

   end;

end;

procedure TfrmRelEstoque.FormCreate(Sender: TObject);
begin

   qryCategoria.Close;
   qryCategoria.Open;

   lkpCategoria.KeyValue := 0;

end;

procedure TfrmRelEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmRelEstoque.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmRelEstoque.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmRelEstoque.qryRelCalcFields(DataSet: TDataSet);
Var query: TFDQuery;
begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add(' SELECT * FROM retornar_valor_medio('+qryRelID.AsString+') ');
      query.Open;

      qryRelcalc_valor_medio.AsFloat := query.FieldByName('valor').AsFloat;

      query.Close;
      query.SQL.Clear;
      query.SQL.Add(' SELECT * FROM RETORNAR_DT_ULT_MOVIMENTACAO('+qryRelID.AsString+') ');
      query.Open;

      if Trim(query.FieldByName('data').AsString) <> '' then
         qryRelcalc_data_ult_entrada.AsString := Copy(query.FieldByName('data').AsString,9,2)+'/'+
                                                 Copy(query.FieldByName('data').AsString,6,2)+'/'+
                                                 Copy(query.FieldByName('data').AsString,1,4);

   Finally

      FreeAndNil(query);

   End;

end;

procedure TfrmRelEstoque.SpeedButton5Click(Sender: TObject);
begin

   Application.CreateForm(TfrmPesquisarProdutos, frmPesquisarProdutos);
   frmPesquisarProdutos.origem := 'REL_ESTOQUE';
   frmPesquisarProdutos.ShowModal;

end;

end.
