unit untCadastrarKit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, Vcl.Mask,
  Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, unitConfiguracoes,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadastrarKit = class(TForm)
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    JvDBGrid1: TRxDBGrid;
    Label4: TLabel;
    Label1: TLabel;
    cbbStatus: TComboBox;
    edtDescricao: TMaskEdit;
    Label3: TLabel;
    edtGTIN: TMaskEdit;
    PopupMenu1: TPopupMenu;
    InserirProduto1: TMenuItem;
    qryProdutos: TFDQuery;
    dtsProdutos: TDataSource;
    qryProdutosID: TIntegerField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosSIGLA: TStringField;
    qryProdutosVALOR: TFloatField;
    lblTotal: TLabel;
    qryProdutosQUANTIDADE: TFloatField;
    ExcluirProduto1: TMenuItem;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure InserirProduto1Click(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure ExcluirProduto1Click(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
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
    Procedure Somar;
    Var DAO: String;
        idKit: integer;
  end;

var
  frmCadastrarKit: TfrmCadastrarKit;

implementation

{$R *.dfm}

uses untPesquisarProdutos, untPrincipal, untPequisarKitProdutos;

procedure TfrmCadastrarKit.Cancelar;
begin

   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');

end;

procedure TfrmCadastrarKit.ExcluirProduto1Click(Sender: TObject);
Var query: TFDQuery;
begin

   if qryProdutos.IsEmpty then Begin
      prcMsgAdv('Selecione um registro.');
      Exit;
   End;

   if fctMsgConfirmDefaultButtonYes('Confirma a exclusão do registro selecionado?') = false then
      Exit;

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add(' DELETE FROM kit_produto_detalhe WHERE id = '+qryProdutosID.AsString);
      query.ExecSQL;
      frmPrincipal.ConexaoLocal.Commit;

      qryProdutos.Refresh;

   Finally

      FreeAndNil(query)

   End;

end;

procedure TfrmCadastrarKit.FiltrarGrid;
begin

   qryProdutos.Close;
   qryProdutos.SQL.Clear;
   qryProdutos.SQL.Add(' SELECT d.id, ');
   qryProdutos.SQL.Add('       p.descricao, ');
   qryProdutos.SQL.Add('       u.sigla, ');
   qryProdutos.SQL.Add('       d.quantidade, ');
   qryProdutos.SQL.Add('       d.valor  ');
   qryProdutos.SQL.Add('  FROM kit_produto_detalhe d, ');
   qryProdutos.SQL.Add('       produtos p,  ');
   qryProdutos.SQL.Add('       unidade_produtos u ');
   qryProdutos.SQL.Add(' WHERE d.id_produto = p.id ');
   qryProdutos.SQL.Add('   AND p.id_unidade = u.id ');
   qryProdutos.SQL.Add('   AND d.id_kit_cabecalho = '+idKit.ToString);
   qryProdutos.SQL.Add(' ORDER BY p.descricao ');
   qryProdutos.Open;

   Somar;

end;

procedure TfrmCadastrarKit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmCadastrarKit.HabilitarDesabilitarBotoes(tipo: String);
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

procedure TfrmCadastrarKit.HabilitarDesabilitarCampos(tipo: String);
begin

   if tipo = 'H' then Begin
      cbbStatus.Enabled := True;
      edtDescricao.Enabled := True;
      edtGTIN.Enabled := True;
      JvDBGrid1.Enabled := True;
   End else Begin
      cbbStatus.Enabled := False;
      edtDescricao.Enabled := False;
      edtGTIN.Enabled := False;
      JvDBGrid1.Enabled := False;
   End;

end;

procedure TfrmCadastrarKit.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarKit.InserirProduto1Click(Sender: TObject);
begin

   if DAO = 'N' then Begin
      prcMsgAdv('Clique em salvar para adicionar um produto.');
      Exit;
   End;

   Application.CreateForm(TfrmPesquisarProdutos, frmPesquisarProdutos);
   frmPesquisarProdutos.origem := 'CADASTRO_KIT';
   frmPesquisarProdutos.ShowModal;

end;

procedure TfrmCadastrarKit.LimparCampos;
begin

   cbbStatus.ItemIndex := -1;
   edtDescricao.Text   := '';
   edtGTIN.Text        := '';
   lblTotal.Caption    := '';
   qryProdutos.close;

end;

procedure TfrmCadastrarKit.Novo;
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
     query.SQL.Add('SELECT gen_id(GEN_KIT_PRODUTO_CABECALHO_ID, 1) AS id from rdb$database;');
     query.Open;
     idKit := query.FieldByName('id').AsInteger;

  Finally

     FreeAndNil(query)

  End;

end;

procedure TfrmCadastrarKit.Pesquisar;
begin

end;

procedure TfrmCadastrarKit.Salvar;
Var query: TFDQuery;

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

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      if DAO = 'U' then Begin

         query.SQL.Add(' UPDATE KIT_PRODUTO_CABECALHO SET status = :status, ');
         query.SQL.Add('                                  descricao = :descricao, ');
         query.SQL.Add('                                  gtin = :gtin  ');
         query.SQL.Add('  WHERE id = :id ');

      End else Begin

         query.SQL.Add(' INSERT INTO KIT_PRODUTO_CABECALHO ');
         query.SQL.Add(' (  ');
         query.SQL.Add(' id, status, descricao, gtin, valor ');
         query.SQL.Add(' )  ');
         query.SQL.Add(' VALUES  ');
         query.SQL.Add(' (  ');
         query.SQL.Add(' :id, :status, :descricao, :gtin, 0.00 ');
         query.SQL.Add(' ) ');

      End;

      query.Params.ParamByName('id').AsInteger         := idKit;
      query.Params.ParamByName('status').AsString      := Copy(cbbStatus.Text,1,1);
      query.Params.ParamByName('descricao').AsString   := Trim(edtDescricao.Text);
      query.Params.ParamByName('gtin').AsString        := Trim(edtGTIN.Text);

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;

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

procedure TfrmCadastrarKit.Somar;
Var total: double;
    query: TFDQuery;
begin

   qryProdutos.First;
   total := 0.00;

   while Not(qryProdutos.Eof) do Begin
      total := total + (qryProdutosVALOR.AsFloat*qryProdutosQUANTIDADE.AsFloat);
      qryProdutos.Next;
   End;

   Try
      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;
      query.SQL.Add('UPDATE KIT_PRODUTO_CABECALHO SET valor = :valor WHERE id = '+idKit.ToString);
      query.Params.ParamByName('valor').AsFloat := total;
      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
      Except
      End;
   Finally
      FreeAndNil(query);
   End;

   lblTotal.Caption := FormatFloat('###,#0.00', total);
   qryProdutos.First;

end;

procedure TfrmCadastrarKit.speCancelarClick(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCadastrarKit.SpeedButton5Click(Sender: TObject);
begin

   Application.CreateForm(TfrmPequisarKitProdutos, frmPequisarKitProdutos);
   frmPequisarKitProdutos.origem := 'CADASTRO_KIT';
   frmPequisarKitProdutos.ShowModal;

end;

procedure TfrmCadastrarKit.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarKit.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

end.
