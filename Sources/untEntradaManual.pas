unit untEntradaManual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, unitConfiguracoes,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, JvExStdCtrls, JvEdit, JvValidateEdit,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, BaseLocalProdutosController,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, NotaEntradaCabecalhoVO, NotaEntradaDetalheVO,
  Vcl.Menus;

type
  TfrmEntradaManual = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edtProduto: TMaskEdit;
    Label5: TLabel;
    edtValor: TJvValidateEdit;
    speConfirmar: TSpeedButton;
    DBGrid1: TDBGrid;
    speProduto: TSpeedButton;
    qryGrid: TFDMemTable;
    dtsGrid: TDataSource;
    qryGridID: TIntegerField;
    qryGridDESCRICAO: TStringField;
    qryGridQUANTIDADE: TFloatField;
    qryGridVALOR_UNITARIO: TFloatField;
    qryGridVALOR_TOTAL: TFloatField;
    edtQtde: TJvValidateEdit;
    Label4: TLabel;
    edtTotal: TJvValidateEdit;
    Label6: TLabel;
    Label1: TLabel;
    speFornecedor: TSpeedButton;
    edtFornecedor: TMaskEdit;
    lblTotal: TLabel;
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    qryGridID_PRODUTO: TIntegerField;
    Label7: TLabel;
    edtValorVenda: TJvValidateEdit;
    qryGridVALOR_VENDA: TFloatField;
    Label8: TLabel;
    edtNumeroNota: TMaskEdit;
    mkeDataChegada: TMaskEdit;
    Label9: TLabel;
    qryGridUNIDADE: TStringField;
    qryGridID_UNIDADE: TIntegerField;
    qryGridFATOR: TFloatField;
    Label10: TLabel;
    edtUnidade: TMaskEdit;
    lblEntrada: TLabel;
    PopupMenu1: TPopupMenu;
    ExcluirProduto1: TMenuItem;
    Label11: TLabel;
    cbbTipo: TComboBox;
    procedure Image1Click(Sender: TObject);
    procedure speFornecedorClick(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure speProdutoClick(Sender: TObject);
    procedure speConfirmarClick(Sender: TObject);
    procedure edtQtdeChange(Sender: TObject);
    procedure edtValorChange(Sender: TObject);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorVendaKeyPress(Sender: TObject; var Key: Char);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure speSalvarClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ExcluirProduto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var idFornecedor, idProduto, idUnidade: integer;
        unidade: string;
        qtdeAtual: double;
    procedure Novo;
    procedure Salvar;
    procedure cancelar;
    procedure habilitarDesabilitarCampos(tipo: String);
    procedure LimparCampos;
    procedure AtualizarTotal(valor: double);
    procedure InserirProduto;
    procedure PesquisarProduto;
  end;

var
  frmEntradaManual: TfrmEntradaManual;

implementation

{$R *.dfm}

uses untPrincipal, untPesquisarFornecedores, untPesquisarProdutos,
  untPequisarEntradaManual;

procedure TfrmEntradaManual.AtualizarTotal(valor: double);
begin

   lblTotal.Caption := FormatFloat('###,#0.00', (stringParaFloat(lblTotal.Caption) + valor));

end;

procedure TfrmEntradaManual.cancelar;
begin

   habilitarDesabilitarCampos('D');
   LimparCampos;
   speNovo.Enabled := True;
   speSalvar.Enabled := False;
   speCancelar.Enabled := False;

end;

procedure TfrmEntradaManual.edtProdutoKeyPress(Sender: TObject; var Key: Char);
begin

   if key = #13 then
      PesquisarProduto;

end;

procedure TfrmEntradaManual.edtQtdeChange(Sender: TObject);
begin

   edtTotal.AsFloat := edtQtde.AsFloat * edtValor.AsFloat;

end;

procedure TfrmEntradaManual.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin

   if key = #13 then
      edtValor.SetFocus;

end;

procedure TfrmEntradaManual.edtValorChange(Sender: TObject);
begin

   edtTotal.AsFloat := edtQtde.AsFloat * edtValor.AsFloat;

end;

procedure TfrmEntradaManual.edtValorKeyPress(Sender: TObject; var Key: Char);
begin

   if key = #13 then
      edtValorVenda.SetFocus;

end;

procedure TfrmEntradaManual.edtValorVendaKeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      InserirProduto;

end;

procedure TfrmEntradaManual.ExcluirProduto1Click(Sender: TObject);
begin

   if not qryGrid.IsEmpty then
      qryGrid.Delete;

end;

procedure TfrmEntradaManual.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case Key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmEntradaManual.habilitarDesabilitarCampos(tipo: String);
begin

   if tipo = 'H' then Begin

      edtFornecedor.Enabled := True;
      speFornecedor.Enabled := True;
      speConfirmar.Enabled  := True;
      edtProduto.Enabled    := True;
      speProduto.Enabled    := True;
      edtQtde.Enabled       := True;
      edtValor.Enabled      := True;
      edtTotal.Enabled      := True;
      DBGrid1.Enabled       := True;
      edtUnidade.Enabled    := True;
      edtValorVenda.Enabled := True;
      edtNumeroNota.Enabled := True;
      cbbTipo.Enabled       := True;
      mkeDataChegada.Enabled:= True;
      qryGrid.Close;
      qryGrid.Open;

   End else Begin

      edtFornecedor.Enabled := False;
      speFornecedor.Enabled := False;
      speConfirmar.Enabled  := False;
      edtProduto.Enabled    := False;
      speProduto.Enabled    := False;
      edtQtde.Enabled       := False;
      edtValor.Enabled      := False;
      edtTotal.Enabled      := False;
      DBGrid1.Enabled       := False;
      edtValorVenda.Enabled := False;
      edtUnidade.Enabled    := False;
      edtNumeroNota.Enabled := False;
      cbbTipo.Enabled       := False;
      mkeDataChegada.Enabled:= False;

   End;

end;

procedure TfrmEntradaManual.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmEntradaManual.InserirProduto;
begin

   if idProduto <= 0 then Begin

      prcMsgAdv('Selecione um produto.');
      Exit;

   End;

   if edtQtde.AsFloat <= 0.000 then Begin

      prcMsgAdv('Informe a quantidade do ítem');
      Exit;

   End;

   if edtValor.AsFloat <= 0.00 then Begin

      prcMsgAdv('Informe o valor do ítem');
      Exit;

   End;

   if edtValorVenda.AsFloat <= 0.00 then Begin

      prcMsgAdv('Informe o valor de venda.');
      Exit;

   End;

   if cbbTipo.ItemIndex = 1 then begin

      if edtQtde.AsFloat > qtdeAtual then begin

         prcMsgAdv('Quantidade informada não pode ser maior que a quantidade no estoque.');
         Exit;

      end;

   end;

   qryGrid.Append;

   qryGridID.AsInteger := qryGrid.RecordCount + 1;
   qryGridDESCRICAO.AsString := Trim(edtProduto.Text);
   qryGridVALOR_UNITARIO.AsFloat := edtValor.AsFloat;
   qryGridQUANTIDADE.AsFloat := edtQtde.AsFloat;
   qryGridVALOR_TOTAL.AsFloat := edtTotal.AsFloat;
   qryGridID_PRODUTO.AsInteger := idProduto;
   qryGridVALOR_VENDA.AsFloat  := edtValorVenda.AsFloat;
   qryGridID_UNIDADE.AsInteger := idUnidade;
   qryGridFATOR.AsFloat := 1.00;
   qryGridUNIDADE.AsString := unidade;

   Try
      qryGrid.Post;
      AtualizarTotal(edtTotal.AsFloat);
      idProduto := 0;
      idUnidade := 0;
      unidade   := '';
      edtProduto.Text := '';
      edtValor.AsFloat := 0.00;
      edtQtde.AsFloat  := 0.00;
      edtTotal.AsFloat := 0.00;
      qryGrid.First;
      edtProduto.SetFocus;
   Except
      prcMsgAdv('Falha ao inserir o produto.');
   End;

end;

procedure TfrmEntradaManual.LimparCampos;
begin

   edtFornecedor.Text := '';
   edtProduto.Text    := '';
   edtNumeroNota.Text := '';
   cbbTipo.ItemIndex  := -1;
   mkeDataChegada.Text:= '';
   edtUnidade.Text    := '';
   edtValor.AsFloat   := 0.00;
   edtQtde.AsFloat    := 0.00;
   edtTotal.AsFloat   := 0.00;
   lblTotal.Caption   := '0.00';
   lblEntrada.Caption := '';
   idFornecedor := 0;
   idProduto := 0;
   qryGrid.Close;

end;

procedure TfrmEntradaManual.Novo;
begin

   LimparCampos;
   habilitarDesabilitarCampos('H');
   speNovo.Enabled     := False;
   speSalvar.Enabled   := True;
   speCancelar.Enabled := True;
   edtProduto.SetFocus;

end;

procedure TfrmEntradaManual.PesquisarProduto;
begin

   Application.CreateForm(TfrmPesquisarProdutos, frmPesquisarProdutos);
   frmPesquisarProdutos.origem := 'ENTRADA_MANUAL';
   frmPesquisarProdutos.ShowModal;

end;

procedure TfrmEntradaManual.Salvar;
Var query: TFDQuery;
    transacao: TFDTransaction;
    IdPedido, id: integer;
    tipoEntrada: string;

begin

   if idFornecedor <= 0 then Begin

      prcMsgAdv('Selecione um fornecedor.');
      edtFornecedor.SetFocus;
      Exit;

   End;

   if Trim(cbbTipo.Text) = '' then Begin

      prcMsgAdv('Selecione o tipo.');
      cbbTipo.SetFocus;
      Exit;

   End;

   if Trim(edtNumeroNota.Text) = '' then Begin

      prcMsgAdv('Informe o número da nota.');
      edtNumeroNota.SetFocus;
      Exit;

   End;

   Try
      StrToDate(mkeDataChegada.Text);
   Except
      prcMsgAdv('Informe a data de chegada.');
      Exit;
   end;

   if qryGrid.IsEmpty then Begin

      prcMsgAdv('Informe um produto na Nota.');
      edtProduto.SetFocus;
      Exit;

   End;

   Try

      transacao := TFDTransaction.Create(Nil);
      transacao.Connection := frmPrincipal.ConexaoLocal;

      transacao.StartTransaction;

      query := TFDQuery.Create(transacao);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add('SELECT gen_id(GEN_NOTA_ENTRADA_CABECALHO_ID, 1) AS id from rdb$database;');
      query.Open;

      IdPedido := query.FieldByName('id').AsInteger;

      query.Close;
      query.SQL.Clear;
      query.SQl.Add(' INSERT INTO nota_entrada_cabecalho ');
      query.SQl.Add(' ( ');
      query.SQl.Add(' ID, DATA_PEDIDO, DATA_CHEGADA, DATA_ENTRADA, NUMERO_NOTA, ID_FORNECEDOR, STATUS, OUTROS, DESCONTO, ');
      query.SQl.Add(' FRETE, VALOR_NOTA, ID_USUARIO, SERIE, CHAVE_NFE, TP_NF, VALOR_TOTAL_NOTA, QTD_PROD, TIPO  ');
      query.SQl.Add(' )  ');
      query.SQl.Add(' VALUES ');
      query.SQl.Add(' (  ');
      query.SQl.Add(' :ID, :DATA_PEDIDO, :DATA_CHEGADA, :DATA_ENTRADA, :NUMERO_NOTA, :ID_FORNECEDOR, :STATUS, :OUTROS, :DESCONTO, ');
      query.SQl.Add(' :FRETE, :VALOR_NOTA, :ID_USUARIO, :SERIE, :CHAVE_NFE, :TP_NF, :VALOR_TOTAL_NOTA, :QTD_PROD, :TIPO ');
      query.SQl.Add(' ) ');

      query.Params.ParamByName('ID').AsInteger             := IdPedido;
      query.Params.ParamByName('DATA_PEDIDO').AsDate       := Date;
      query.Params.ParamByName('DATA_ENTRADA').AsDate      := Date;
      query.Params.ParamByName('DATA_CHEGADA').AsDate      := StrToDate(mkeDataChegada.Text);
      query.Params.ParamByName('NUMERO_NOTA').AsInteger    := StrToInt(edtNumeroNota.Text);
      query.Params.ParamByName('ID_FORNECEDOR').AsInteger  := idFornecedor;
      query.Params.ParamByName('STATUS').AsString          := 'F';
      query.Params.ParamByName('OUTROS').AsFloat           := 0.00;
      query.Params.ParamByName('DESCONTO').AsFloat         := 0.00;
      query.Params.ParamByName('FRETE').AsFloat            := 0.00;
      query.Params.ParamByName('VALOR_NOTA').AsFloat       := StringParaFloat(lblTotal.Caption);
      query.Params.ParamByName('ID_USUARIO').AsInteger     := frmPrincipal.idUser;
      query.Params.ParamByName('SERIE').AsString           := '';
      query.Params.ParamByName('CHAVE_NFE').AsString       := '';
      query.Params.ParamByName('TP_NF').AsString           := 'E';
      query.Params.ParamByName('VALOR_TOTAL_NOTA').AsFloat := StringParaFloat(lblTotal.Caption);
      query.Params.ParamByName('QTD_PROD').AsInteger       := qryGrid.RecordCount;
      query.Params.ParamByName('TIPO').AsString            := Copy(trim(cbbTipo.Text),1,1);

      query.ExecSQL;

      qryGrid.First;
      id := 1;

      tipoEntrada := Copy(trim(cbbTipo.Text),1,1);

      while Not(qryGrid.Eof) do Begin

         query := TFDQuery.Create(transacao);
         query.Connection := frmPrincipal.ConexaoLocal;

         query.SQl.Add(' INSERT INTO nota_entrada_detalhe ');
         query.SQl.Add(' (   ');
         query.SQl.Add(' ID_CABECALHO, ID_PRODUTO, SEQUENCIA, QTREAL, VL_UNITARIO, VL_FRETE, VL_IPI, ');
         query.SQl.Add(' VL_ICMS, VL_DESCONTO, VL_ICMS_SUBST, VL_ISENTO, VL_PIS, VL_COFINS, VL_SEGURO,  ');
         query.SQl.Add(' VL_OUTROS, CODIGO_ORIGEM, UND, FATOR_UNIDADE, PROD_ID_UNIDADE_PRODUTO, ');
         query.SQl.Add(' PROD_ID_UNIDADE_ENTRADA, PROD_DESCRICAO, PROD_VALOR_VENDA  ');
         query.SQl.Add(' )  ');
         query.SQl.Add(' VALUES ');
         query.SQl.Add(' (  ');
         query.SQl.Add(' :ID_CABECALHO, :ID_PRODUTO, :SEQUENCIA, :QTREAL, :VL_UNITARIO, :VL_FRETE, :VL_IPI, ');
         query.SQl.Add(' :VL_ICMS, :VL_DESCONTO, :VL_ICMS_SUBST, :VL_ISENTO, :VL_PIS, :VL_COFINS, :VL_SEGURO, ');
         query.SQl.Add(' :VL_OUTROS, :CODIGO_ORIGEM, :UND, :FATOR_UNIDADE, :PROD_ID_UNIDADE_PRODUTO,  ');
         query.SQl.Add(' :PROD_ID_UNIDADE_ENTRADA, :PROD_DESCRICAO, :PROD_VALOR_VENDA  ');
         query.SQl.Add(' ) ');

         query.Params.ParamByName('ID_CABECALHO').AsInteger       := IdPedido;

         query.Params.ParamByName('SEQUENCIA').AsInteger               := id;
         query.Params.ParamByName('QTREAL').AsFloat                    := qryGridQUANTIDADE.AsFloat;
         query.Params.ParamByName('VL_UNITARIO').AsFloat               := qryGridVALOR_UNITARIO.AsFloat;
         query.Params.ParamByName('ID_PRODUTO').AsInteger              := qryGridID_PRODUTO.AsInteger;
         query.Params.ParamByName('VL_FRETE').AsFloat                  := 0.00;
         query.Params.ParamByName('VL_IPI').AsFloat                    := 0.00;
         query.Params.ParamByName('VL_ICMS').AsFloat                   := 0.00;
         query.Params.ParamByName('VL_DESCONTO').AsFloat               := 0.00;
         query.Params.ParamByName('VL_ICMS_SUBST').AsFloat             := 0.00;
         query.Params.ParamByName('VL_ISENTO').AsFloat                 := 0.00;
         query.Params.ParamByName('VL_PIS').AsFloat                    := 0.00;
         query.Params.ParamByName('VL_COFINS').AsFloat                 := 0.00;
         query.Params.ParamByName('VL_SEGURO').AsFloat                 := 0.00;
         query.Params.ParamByName('VL_OUTROS').AsFloat                 := 0.00;
         query.Params.ParamByName('CODIGO_ORIGEM').AsString            := '';
         query.Params.ParamByName('PROD_DESCRICAO').AsString           := '';
         query.Params.ParamByName('UND').AsString                      := qryGridUNIDADE.AsString;
         query.Params.ParamByName('FATOR_UNIDADE').AsFloat             := qryGridFATOR.AsFloat;
         query.Params.ParamByName('PROD_ID_UNIDADE_PRODUTO').AsInteger := qryGridID_UNIDADE.AsInteger;
         query.Params.ParamByName('PROD_ID_UNIDADE_ENTRADA').AsInteger := qryGridID_UNIDADE.AsInteger;
         query.Params.ParamByName('PROD_VALOR_VENDA').AsFloat          := qryGridVALOR_VENDA.AsFloat;

         query.ExecSQL;

         TBaseLocalProdutosController.GravarMovimetacaoProduto(qryGridID_PRODUTO.AsInteger,
                                                               (qryGridQUANTIDADE.AsFloat*qryGridFATOR.AsFloat),
                                                               qryGridFATOR.AsFloat,
                                                               'C',
                                                               qryGridID_UNIDADE.asinteger,
                                                               IdPedido,
                                                               idFornecedor,
                                                               qryGridVALOR_VENDA.AsFloat,
                                                               tipoEntrada);

         inc(id);
         qryGrid.Next;

      End;

      transacao.Commit;
      habilitarDesabilitarCampos('D');
      LimparCampos;
      speNovo.Enabled := True;
      speSalvar.Enabled := False;
      speCancelar.Enabled := False;
      prcMsgInf('Entrada de Nota realizada com sucesso.');

   Except

      on e:exception do Begin
         transacao.Rollback;
         prcMsgAdv('Falha ao inserir a nota fiscal.'+#13+e.Message);
      End;

   End;

end;

procedure TfrmEntradaManual.speCancelarClick(Sender: TObject);
begin

   cancelar;

end;

procedure TfrmEntradaManual.speConfirmarClick(Sender: TObject);
begin

   InserirProduto;

end;

procedure TfrmEntradaManual.SpeedButton5Click(Sender: TObject);
begin

   Application.CreateForm(TfrmPequisarEntradaManual, frmPequisarEntradaManual);
   frmPequisarEntradaManual.origem := 'ENTRADA_MANUAL';
   frmPequisarEntradaManual.ShowModal;

end;

procedure TfrmEntradaManual.speFornecedorClick(Sender: TObject);
begin

   Application.CreateForm(TfrmPesquisarFornecedores, frmPesquisarFornecedores);
   frmPesquisarFornecedores.origem := 'ENTRADA_MANUAL';
   frmPesquisarFornecedores.ShowModal;

end;

procedure TfrmEntradaManual.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmEntradaManual.speProdutoClick(Sender: TObject);
begin

   PesquisarProduto;

end;

procedure TfrmEntradaManual.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

end.
