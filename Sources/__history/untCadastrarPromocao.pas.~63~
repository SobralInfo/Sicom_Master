unit untCadastrarPromocao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, unitConfiguracoes,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, RxDBCtrl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, untPrincipal,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus;

type
  TfrmCadastrarPromocao = class(TForm)
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    cbbStatus: TComboBox;
    Label1: TLabel;
    edtDescricao: TMaskEdit;
    mkeDtIni: TMaskEdit;
    Label3: TLabel;
    mkeDtFim: TMaskEdit;
    Label5: TLabel;
    qryProdutos: TFDQuery;
    dtsProdutos: TDataSource;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosSIGLA: TStringField;
    qryProdutosVALOR_UNITARIO: TFloatField;
    qryProdutosVALOR: TFloatField;
    JvDBGrid1: TRxDBGrid;
    qryProdutosQTDE_ESTOQUE: TFloatField;
    lblTotal: TLabel;
    chkPromocao: TCheckBox;
    PopupMenu1: TPopupMenu;
    AplicarDescontoPercentualTodosProdutos1: TMenuItem;
    qryProdutosID_PRODUTO: TIntegerField;
    qryProdutosID_PROD_ORIGINAL: TIntegerField;
    FiltrarProduto1: TMenuItem;
    N1: TMenuItem;
    CancelarDescontoaplicado1: TMenuItem;
    qryProdutosID: TIntegerField;
    AlterarValordePromoo1: TMenuItem;
    AplicarDescontoPercentualPorCategoria1: TMenuItem;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure speNovoClick(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure chkPromocaoClick(Sender: TObject);
    procedure AplicarDescontoPercentualTodosProdutos1Click(Sender: TObject);
    procedure CancelarDescontoaplicado1Click(Sender: TObject);
    procedure FiltrarProduto1Click(Sender: TObject);
    procedure AlterarValordePromoo1Click(Sender: TObject);
    procedure AplicarDescontoPercentualPorCategoria1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HabilitarDesabilitarBotoes(tipo: String);
    procedure HabilitarDesabilitarCampos(tipo: String);
    procedure LimparCampos;
    procedure FiltrarGrid;
    procedure Novo;
    procedure Salvar;
    procedure Cancelar;
    procedure Pesquisar;
    Var DAO: String;
        idPromocao: integer;
  end;

var
  frmCadastrarPromocao: TfrmCadastrarPromocao;

implementation

{$R *.dfm}

uses untPercDescontoPromocao, untPesquisarProdutos, untPesquisarPromocao,
  untInserirProdutoPromocao, untPercDescontoPorCategoria;

procedure TfrmCadastrarPromocao.AlterarValordePromoo1Click(Sender: TObject);
begin

  Application.CreateForm(TfrmInserirProdutoPromocao, frmInserirProdutoPromocao);
  frmInserirProdutoPromocao.edtProduto.Text := Trim(qryProdutosDESCRICAO.AsString);
  frmInserirProdutoPromocao.edtValor.AsFloat:= qryProdutosVALOR_UNITARIO.AsFloat;
  frmInserirProdutoPromocao.edtValorPromocao.AsFloat := qryProdutosVALOR.AsFloat;
  frmInserirProdutoPromocao.idProduto := qryProdutosID_PROD_ORIGINAL.AsInteger;
  frmInserirProdutoPromocao.ShowModal;

end;

procedure TfrmCadastrarPromocao.AplicarDescontoPercentualPorCategoria1Click(
  Sender: TObject);
begin

   Application.CreateForm(TfrmPercDescontoPorCategoria, frmPercDescontoPorCategoria);
   frmPercDescontoPorCategoria.ShowModal;

end;

procedure TfrmCadastrarPromocao.AplicarDescontoPercentualTodosProdutos1Click(
  Sender: TObject);
begin

   if DAO = 'N' then Begin
      prcMsgAdv('Clique em salvar antes de inserir o percentual.');
      Exit;
   End;

   Application.CreateForm(TfrmPercDescontoPromocao, frmPercDescontoPromocao);
   chkPromocao.Checked := True;
   chkPromocao.Checked := False;
   frmPercDescontoPromocao.ShowModal;

end;

procedure TfrmCadastrarPromocao.Cancelar;
begin

   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');

end;

procedure TfrmCadastrarPromocao.CancelarDescontoaplicado1Click(Sender: TObject);
Var query: TFDQuery;
begin

   if qryProdutosVALOR.AsFloat > 0.00 then Begin

      if fctMsgConfirmDefaultButtonYes('Confirma o cancelamento do desconto aplicado?') = True then Begin

         Try

            query := TFDQuery.Create(Nil);
            query.Connection := frmPrincipal.ConexaoLocal;

            query.SQL.Add('DELETE FROM promocao_detalhe WHERE id = '+qryProdutosID.AsString);

            Try

               query.ExecSQL;
               prcMsgInf('Desconto cancelado com sucesso.');

            Except

               prcMsgErro('Falha ao cancelar o desconto.');

            End;

            qryProdutos.Refresh;

         Finally

            FreeAndNil(query);

         End;

      End;

   End;

end;

procedure TfrmCadastrarPromocao.chkPromocaoClick(Sender: TObject);
begin

   FiltrarGrid;

end;

procedure TfrmCadastrarPromocao.FiltrarGrid;
begin

   qryProdutos.Close;
   qryProdutos.SQL.Clear;
   qryProdutos.SQL.Add('   SELECT p.descricao, ');
   qryProdutos.SQL.Add('          u.sigla, ');
   qryProdutos.SQL.Add('          p.valor_unitario, ');
   qryProdutos.SQL.Add('          p.qtde_estoque, ');
   qryProdutos.SQL.Add('          p.id AS id_prod_original, ');
   qryProdutos.SQL.Add('          d.* ');

   if chkPromocao.Checked  = false then
      qryProdutos.SQL.Add('     FROM produtos p LEFT JOIN promocao_detalhe d ON d.id_produto = p.id AND d.id_cabecalho = '+idPromocao.ToString)
   else
      qryProdutos.SQL.Add('     FROM produtos p INNER JOIN promocao_detalhe d ON d.id_produto = p.id AND d.id_cabecalho = '+idPromocao.ToString);
   qryProdutos.SQL.Add('                     INNER JOIN unidade_produtos u ON p.id_unidade = u.id ');
   qryProdutos.SQL.Add(' ORDER BY p.descricao ');

   Try
      qryProdutos.Open;
   Except

      FreeAndNil(qryProdutos);

      qryProdutos := TFDQuery.Create(Nil);
      qryProdutos.Connection := frmPrincipal.ConexaoLocal;

      qryProdutos.Close;
      qryProdutos.SQL.Clear;
      qryProdutos.SQL.Add('   SELECT p.descricao, ');
      qryProdutos.SQL.Add('          u.sigla, ');
      qryProdutos.SQL.Add('          p.valor_unitario, ');
      qryProdutos.SQL.Add('          p.qtde_estoque, ');
      qryProdutos.SQL.Add('          p.id AS id_prod_original, ');
      qryProdutos.SQL.Add('          d.* ');

      if chkPromocao.Checked  = false then
         qryProdutos.SQL.Add('     FROM produtos p LEFT JOIN promocao_detalhe d ON d.id_produto = p.id AND d.id_cabecalho = '+idPromocao.ToString)
      else
         qryProdutos.SQL.Add('     FROM produtos p INNER JOIN promocao_detalhe d ON d.id_produto = p.id AND d.id_cabecalho = '+idPromocao.ToString);
      qryProdutos.SQL.Add('                     INNER JOIN unidade_produtos u ON p.id_unidade = u.id ');
      qryProdutos.SQL.Add(' ORDER BY p.descricao ');

      qryProdutos.Open;

   End;

end;

procedure TfrmCadastrarPromocao.FiltrarProduto1Click(Sender: TObject);
begin

   Application.CreateForm(TfrmPesquisarProdutos, frmPesquisarProdutos);
   frmPesquisarProdutos.origem := 'CADASTRO_PROMOCAO';
   frmPesquisarProdutos.ShowModal;

end;

procedure TfrmCadastrarPromocao.FormCreate(Sender: TObject);
begin

   qryProdutos.Close;

end;

procedure TfrmCadastrarPromocao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmCadastrarPromocao.HabilitarDesabilitarBotoes(tipo: String);
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

procedure TfrmCadastrarPromocao.HabilitarDesabilitarCampos(tipo: String);
begin

   if tipo = 'H' then Begin
      cbbStatus.Enabled := True;
      edtDescricao.Enabled := True;
      mkeDtIni.Enabled := True;
      mkeDtFim.Enabled := True;
      chkPromocao.Enabled := True;
      JvDBGrid1.Enabled := True;
   End else Begin
      cbbStatus.Enabled := False;
      edtDescricao.Enabled := False;
      mkeDtIni.Enabled := False;
      mkeDtFim.Enabled := False;
      chkPromocao.Enabled := False;
      JvDBGrid1.Enabled := False;
   End;

end;

procedure TfrmCadastrarPromocao.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarPromocao.LimparCampos;
begin

   cbbStatus.ItemIndex := -1;
   edtDescricao.Text   := '';
   mkeDtIni.Text       := '';
   mkeDtFim.Text       := '';
   chkPromocao.Checked := True;
   qryProdutos.close;

end;

procedure TfrmCadastrarPromocao.Novo;
Var query: TFDQuery;
begin

  Try

     HabilitarDesabilitarBotoes('N');
     HabilitarDesabilitarCampos('H');
     LimparCampos;
     cbbStatus.ItemIndex := 0;
     cbbStatus.SetFocus;
     DAO := 'N';

     query := TFDQuery.Create(Nil);
     query.Connection := frmPrincipal.ConexaoLocal;
     query.SQL.Add('SELECT gen_id(gen_promocao_cabecalho_id, 1) AS id from rdb$database;');
     query.Open;
     idPromocao := query.FieldByName('id').AsInteger;

  Finally

     FreeAndNil(query)

  End;

end;

procedure TfrmCadastrarPromocao.Pesquisar;
begin

   chkPromocao.Checked := False;
   chkPromocao.Checked := True;
   Application.CreateForm(TfrmPesquisarPromocao, frmPesquisarPromocao);
   frmPesquisarPromocao.origem := 'PROMOCAO';
   frmPesquisarPromocao.ShowModal;

end;

procedure TfrmCadastrarPromocao.Salvar;
Var query: TFDQuery;

Function VerificarLiberada(id: integer): boolean;
Var query: TFDQuery;
Begin

   Try

      Result := False;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add('SELECT * FROM PROMOCAO_CABECALHO WHERE status = ''L'' AND id <> '+id.ToString);
      query.Open;

      if Not(query.IsEmpty) then
         Result := True;

   Finally

      FreeAndNil(query);

   End;

End;

begin

   if cbbStatus.ItemIndex < 0 then Begin
      prcMsgAdv('Informe O status da promoção.');
      cbbStatus.SetFocus;
      Exit;
   End;

   if Trim(edtDescricao.Text) = '' then Begin
      prcMsgAdv('Informe o nome da promoção.');
      edtDescricao.SetFocus;
      Exit;
   End;

   if Length(SoNumero(mkeDtIni.Text)) <> 14 then Begin
      prcMsgAdv('Data/Hora início promoção inválida.');
      mkeDtIni.SetFocus;
      Exit;
   End;

   Try
      StrToDateTime(mkeDtIni.Text);
   Except
      prcMsgAdv('Data/Hora início promoção inválida.');
      mkeDtIni.SetFocus;
      Exit;
   End;

   if Length(SoNumero(mkeDtFim.Text)) <> 14 then Begin
      prcMsgAdv('Data/Hora encerramento promoção inválida.');
      mkeDtFim.SetFocus;
      Exit;
   End;

   Try
      StrToDateTime(mkeDtFim.Text);
   Except
      prcMsgAdv('Data/Hora encerramento promoção inválida.');
      mkeDtFim.SetFocus;
      Exit;
   End;

   if ((VerificarLiberada(idPromocao)) AND (cbbStatus.ItemIndex = 1)) then Begin
      prcMsgAdv('Já consta uma promoção liberada. Somente pode haver uma promoção liberada.');
      Exit;
   end;

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      if DAO = 'U' then Begin

         query.SQL.Add(' UPDATE promocao_cabecalho SET status = :status, ');
         query.SQL.Add('                               descricao = :descricao, ');
         query.SQL.Add('                               data_inicio = :data_inicio, ');
         query.SQL.Add('                               data_fim = :data_fim  ');
         query.SQL.Add('  WHERE id = :id ');

      End else Begin

         query.SQL.Add(' INSERT INTO promocao_cabecalho ');
         query.SQL.Add(' (  ');
         query.SQL.Add(' id, status, descricao, data_inicio, data_fim  ');
         query.SQL.Add(' )  ');
         query.SQL.Add(' VALUES  ');
         query.SQL.Add(' (  ');
         query.SQL.Add(' :id, :status, :descricao, :data_inicio, :data_fim ');
         query.SQL.Add(' ) ');

      End;

      query.Params.ParamByName('id').AsInteger           := idPromocao;
      query.Params.ParamByName('status').AsString        := Copy(cbbStatus.Text,1,1);
      query.Params.ParamByName('descricao').AsString     := Trim(edtDescricao.Text);
      query.Params.ParamByName('data_inicio').AsDateTime := StrToDateTime(mkeDtIni.Text);
      query.Params.ParamByName('data_fim').AsDateTime    := StrToDateTime(mkeDtFim.Text);

      Try
         query.ExecSQL;

         if DAO = 'N' then
            prcMsgInf('Registro inserido com sucesso.')
         else
            prcMsgInf('Registro alterado com sucesso.');

         DAO := 'U';
      Except

         ON E:Exception do
            prcMsgErro('Falha ao gravar o registro.'+#13+e.Message);

      End;

      FiltrarGrid;

   Finally

      FreeAndNil(query)

   End;

end;

procedure TfrmCadastrarPromocao.speCancelarClick(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCadastrarPromocao.SpeedButton5Click(Sender: TObject);
begin

   Pesquisar;

end;

procedure TfrmCadastrarPromocao.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarPromocao.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

end.
