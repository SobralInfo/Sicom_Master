unit untPesquisarProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask, PedidoProdutosVO, unitConfiguracoes,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, JvExDBGrids, JvDBGrid, BaseLocalUnidadesController,
  BaseLocalUnidadesVO, Vcl.Imaging.pngimage, RxDBCtrl, firedac.Comp.Client;

type
  TfrmPesquisarProdutos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Image1: TImage;
    mkeDescricao: TMaskEdit;
    Panel2: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    JvDBGrid1: TRxDBGrid;
    procedure mkeDescricaoChange(Sender: TObject);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image4Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarProdutos: TfrmPesquisarProdutos;

implementation

{$R *.dfm}

uses untPrincipal,untBalcao;

procedure TfrmPesquisarProdutos.Confirmar;
Var produto: TPedidoProdutosVO;
    unidade: TBaseLocalUnidadesVO;
    query: TFDQuery;
begin

   if frmPrincipal.qryProdutos.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   if origem = 'PEDIDO' then Begin

      if frmPrincipal.qryProdutosVALOR_UNITARIO.AsFloat <= 0.00 then Begin

         prcMsgAdv('Produto com valor de venda inválido.');
         Exit;

      End;

      frmBalcao.edtCodigoProduto.Text    := frmPrincipal.qryProdutosID.AsString;
      frmBalcao.edtDescricaoProduto.Text := Trim(frmPrincipal.qryProdutosDESCRICAO.AsString);
      frmBalcao.lblUnidade.Caption       := Trim(frmPrincipal.qryProdutosUNIDADE.AsString);
      frmBalcao.fatorUnidade             := frmPrincipal.qryProdutosFATOR.AsFloat;
      frmBalcao.lblValorUnitario.Caption := FormatFloat('###,#0.00',frmPrincipal.qryProdutosVALOR_UNITARIO.AsFloat);
      frmBalcao.idProduto := frmPrincipal.qryProdutosID.AsInteger;
      frmBalcao.AtualizarTotais;

      frmBalcao.edtQuantidade.SetFocus;
      frmBalcao.edtQuantidade.SelText;

   End;

   close;

end;

procedure TfrmPesquisarProdutos.Filtrar;
begin

   frmPrincipal.qryProdutos.Close;
   frmPrincipal.qryProdutos.Filtered := False;

   if origem = 'CADASTRO_PRODUTOS' then
      frmPrincipal.qryProdutos.Filter := ' ((Upper(referencia) like '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,80)+'%')+') or (Upper(descricao) LIKE '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,100)+'%')+') OR (Upper(codigo_barras) like '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,15)+'%')+'))'
   else
      frmPrincipal.qryProdutos.Filter := ' ((status = ''A'') AND (((Upper(referencia) like '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,80)+'%')+') or (Upper(descricao) LIKE '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,100)+'%')+') OR (Upper(codigo_barras) like '+QuotedStr(Copy(Trim(AnsiUpperCase(mkeDescricao.Text)),1,15)+'%')+'))))';


   frmPrincipal.qryProdutos.Filtered := True;

   frmPrincipal.qryProdutos.Open;

   lblTotal.Caption := 'Total de Produtos: '+frmPrincipal.qryProdutos.RecordCount.ToString;
   frmPrincipal.qryProdutos.First;

end;

procedure TfrmPesquisarProdutos.FormCreate(Sender: TObject);
begin

   frmPrincipal.qryProdutos.Close;
   frmPrincipal.qryProdutos.SQL.Clear;
   frmPrincipal.qryProdutos.SQL.Add('  select p.id, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.status, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.descricao, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.qtde_estoque, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.referencia, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.id_unidade, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.codigo_barras, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.valor_unitario, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.imprimir_cozinha, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.id_categoria, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.NCM, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.CEST, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.TAXA_PIS, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.TAXA_COFINS, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.TAXA_ICMS, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.CST_CSOSN, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.CST_PIS, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.CST_COFINS, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.ORIGEM, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.CFOP, ');
   frmPrincipal.qryProdutos.SQL.Add('         p.FISCAL, ');
   frmPrincipal.qryProdutos.SQL.Add('         u.sigla as unidade, ');
   frmPrincipal.qryProdutos.SQL.Add('         u.fator, ');
   frmPrincipal.qryProdutos.SQL.Add('         ''N'' AS kit ');
   frmPrincipal.qryProdutos.SQL.Add('    from produtos p, ');
   frmPrincipal.qryProdutos.SQL.Add('         unidade_produtos u ');
   frmPrincipal.qryProdutos.SQL.Add('   WHERE p.id_unidade = u.id ');
   frmPrincipal.qryProdutos.SQL.Add('   UNION ');
   frmPrincipal.qryProdutos.SQL.Add('  select Cast((k.id*-1) as integer) AS id, ');
   frmPrincipal.qryProdutos.SQL.Add('         k.status, ');
   frmPrincipal.qryProdutos.SQL.Add('         k.descricao, ');
   frmPrincipal.qryProdutos.SQL.Add('         0.00 AS qtde_estoque, ');
   frmPrincipal.qryProdutos.SQL.Add('         '''' AS referencia, ');
   frmPrincipal.qryProdutos.SQL.Add('         1 AS id_unidade, ');
   frmPrincipal.qryProdutos.SQL.Add('         k.gtin AS codigo_barras, ');
   frmPrincipal.qryProdutos.SQL.Add('         K.valor AS valor_unitario, ');
   frmPrincipal.qryProdutos.SQL.Add('         ''N'' AS imprimir_cozinha, ');
   frmPrincipal.qryProdutos.SQL.Add('         1 AS id_categoria, ');
   frmPrincipal.qryProdutos.SQL.Add('         '''' NCM, ');
   frmPrincipal.qryProdutos.SQL.Add('         '''' CEST, ');
   frmPrincipal.qryProdutos.SQL.Add('         0.00 TAXA_PIS, ');
   frmPrincipal.qryProdutos.SQL.Add('         0.00 TAXA_COFINS, ');
   frmPrincipal.qryProdutos.SQL.Add('         0.00 TAXA_ICMS, ');
   frmPrincipal.qryProdutos.SQL.Add('         '''' CST_CSOSN, ');
   frmPrincipal.qryProdutos.SQL.Add('         '''' CST_PIS, ');
   frmPrincipal.qryProdutos.SQL.Add('         '''' CST_COFINS, ');
   frmPrincipal.qryProdutos.SQL.Add('         0 ORIGEM, ');
   frmPrincipal.qryProdutos.SQL.Add('         '''' CFOP, ');
   frmPrincipal.qryProdutos.SQL.Add('         '''' FISCAL, ');
   frmPrincipal.qryProdutos.SQL.Add('         ''UND'' as unidade, ');
   frmPrincipal.qryProdutos.SQL.Add('         1 AS fator, ');
   frmPrincipal.qryProdutos.SQL.Add('         ''S'' AS kit ');
   frmPrincipal.qryProdutos.SQL.Add('    from kit_produto_cabecalho k ');
   frmPrincipal.qryProdutos.Open;

   Filtrar;

end;

procedure TfrmPesquisarProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_F12: Confirmar;
      VK_ESCAPE: close;

   end;

end;

procedure TfrmPesquisarProdutos.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarProdutos.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarProdutos.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarProdutos.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarProdutos.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarProdutos.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_DOWN then
      JvDBGrid1.SetFocus;

end;

procedure TfrmPesquisarProdutos.RxDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

end.
