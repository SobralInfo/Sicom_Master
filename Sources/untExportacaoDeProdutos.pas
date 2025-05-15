unit untExportacaoDeProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, pedidoUsuarioController, PedidoProdutosVO,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, generics.collections, PedidoSqlVO,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, PedidoSqlController,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, unitConfiguracoes,
  Vcl.StdCtrls, Vcl.Buttons, PedidoConexaoVO, PedidoConexaoController, PedidoProdutosController;

type

  ThreadSplashExportarProdutos = class (TThread)
    public
       constructor creeate();
       procedure Execute; override;
  end;

  ThreadSplashExportarCloud = class (TThread)
    public
       constructor creeate();
       procedure Execute; override;
  end;


  ThreadSplashRetornarProdutos = class (TThread)
    public
       constructor creeate();
       procedure Execute; override;
  end;

  TfrmExportacaoDeProdutos = class(TForm)
    DBGrid1: TDBGrid;
    SpeedButton3: TSpeedButton;
    dtsProdutos: TDataSource;
    qryProduto: TFDQuery;
    qryProdutoID: TIntegerField;
    qryProdutoSTATUS: TStringField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoPRECO: TFloatField;
    qryProdutoQUANTIDADE: TFloatField;
    dtsLista: TDataSource;
    qryLista: TFDMemTable;
    qryListadescricao: TStringField;
    SpeedButton1: TSpeedButton;
    qryProdutoFATOR: TFloatField;
    qryProdutoUNIDADE: TStringField;
    qryProdutoGTIN: TStringField;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FThreadSplashExportarProdutos: ThreadSplashExportarProdutos;
    fThreadSplashRetornarProdutos: ThreadSplashRetornarProdutos;
    fThreadSplashExportarCloud: ThreadSplashExportarCloud;
  public
    { Public declarations }
    procedure ImportarProdutos;
    procedure ListarProdutos;
    procedure TestarConexao;
  end;

var
  frmExportacaoDeProdutos: TfrmExportacaoDeProdutos;

implementation

{$R *.dfm}

uses untPrincipal, untSplash;

procedure TfrmExportacaoDeProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   FreeAndNil(qryProduto);
   FreeAndNil(qryLista);
   FreeAndNil(FThreadSplashExportarProdutos);
   FreeAndNil(fThreadSplashRetornarProdutos);

end;

procedure TfrmExportacaoDeProdutos.FormCreate(Sender: TObject);
begin

   FThreadSplashExportarProdutos := Nil;
   fThreadSplashRetornarProdutos := Nil;

   TestarConexao;
   qryLista := frmPrincipal.RefreshQuery(qryLista);

end;

procedure TfrmExportacaoDeProdutos.ImportarProdutos;
Var sql: TPedidoSqlVO;
begin

   Try

      Try

         frmPrincipal.Conexao.Connected := False;
         frmPrincipal.Conexao.Connected := True;

         sql := TPedidoSqlVO.Create;
         sql :=  TPedidoSqlController.RetornarSQL(1);

         qryProduto.Close;
         qryProduto.SQL.Clear;
         qryProduto.SQL.Add(sql.sql_produtos);
         qryProduto.Open;

      Except

         on e: exception do Begin
            prcMsgErro('Erro: '+e.Message);
            //Exit;
         End;

      end;

   finally
      FreeAndNil(sql);
      //frmSplash.Close;
   End;

end;

procedure TfrmExportacaoDeProdutos.ListarProdutos;

begin



end;

procedure TfrmExportacaoDeProdutos.SpeedButton1Click(Sender: TObject);
Begin

   if fctMsgConfirmDefaultButtonYes('Confirma a exportação do cadastro de produtos para o servidor externo?') = false then
      Exit;

   fThreadSplashExportarCloud := ThreadSplashExportarCloud.creeate;
   frmSplash := TfrmSplash.Create(Self);
   frmSplash.JvGIFAnimator1.Visible := False;
   frmSplash.JvGIFAnimator2.Visible := True;
   frmSplash.ShowModal;

End;

procedure TfrmExportacaoDeProdutos.SpeedButton3Click(Sender: TObject);

begin

   FThreadSplashExportarProdutos := ThreadSplashExportarProdutos.creeate;
   frmSplash := TfrmSplash.Create(Self);
   frmSplash.JvGIFAnimator1.Visible := True;
   frmSplash.JvGIFAnimator2.Visible := False;
   frmSplash.Timer2.Enabled := True;
   frmSplash.ShowModal;

end;

procedure TfrmExportacaoDeProdutos.SpeedButton4Click(Sender: TObject);
Begin

   FThreadSplashRetornarProdutos := ThreadSplashRetornarProdutos.creeate;
   frmSplash := TfrmSplash.Create(Self);
   frmSplash.ShowModal;

end;

procedure TfrmExportacaoDeProdutos.TestarConexao;
var conexao: TPedidoConexaoVO;
begin

   Try

      conexao := TPedidoConexaoVO.Create;
      conexao :=  TPedidoConexaoController.RetornarConexao;

      frmPrincipal.Conexao.Connected := False;
      frmPrincipal.Conexao.Params.Add('Server='+TRim(conexao.servidor));
      frmPrincipal.Conexao.Params.Database := Trim(DesCriptografa(conexao.caminho_banco,2));
      frmPrincipal.Conexao.Params.UserName := Trim(conexao.login);
      frmPrincipal.Conexao.Params.Password := Trim(conexao.senha);
      frmPrincipal.Conexao.Params.DriverID := 'FB';

      Try
         frmPrincipal.Conexao.Connected := True;
      Except
      End;

   Finally

      FreeAndNil(conexao);

   End;

end;
{ ThreadSplash }

constructor ThreadSplashExportarProdutos.creeate;
begin

   inherited Create(false);

end;

procedure ThreadSplashExportarProdutos.Execute;
begin

   Try
      frmExportacaoDeProdutos.ImportarProdutos;
   Finally
      //if Assigned(frmSplash) then
      frmSplash.Close;
   End;

end;

{ ThreadSplashRetornarProdutos }

constructor ThreadSplashRetornarProdutos.creeate;
begin

   inherited Create(false);

end;

procedure ThreadSplashRetornarProdutos.Execute;
Var lista: TObjectList<TPedidoProdutosVO>;
    I: Integer;
begin

   Try

      lista :=  TObjectList<TPedidoProdutosVO>.Create;
      lista := TPedidoProdutosController.RetornarListaDeProdutos;

      frmExportacaoDeProdutos.qryLista.Active := False;
      frmExportacaoDeProdutos.qryLista.Open;
      frmExportacaoDeProdutos.qryLista.EmptyDataSet;
      frmExportacaoDeProdutos.qryLista.Close;
      frmExportacaoDeProdutos.qryLista.Open;

      for I := 0 to lista.Count - 1 do Begin

         frmExportacaoDeProdutos.qryLista.Append;
         frmExportacaoDeProdutos.qryListadescricao.AsString := Trim(lista.Items[i].descricao);
         frmExportacaoDeProdutos.qryLista.Post;

      End;

      frmExportacaoDeProdutos.qryLista.Open;
      frmExportacaoDeProdutos.qryLista.Active := True;
      frmExportacaoDeProdutos.qryLista.First;

   Finally

      FreeAndNil(lista);
      if frmSplash <> Nil then
         frmSplash.Close;

   End;

end;

{ ThreadSplashExportarCloud }

constructor ThreadSplashExportarCloud.creeate;
begin

   inherited Create(false);

end;

procedure ThreadSplashExportarCloud.Execute;
Var listaProdutos: TObjectList<TPedidoProdutosVO>;
    pedido: TPedidoProdutosVO;
begin

   Try

      frmExportacaoDeProdutos.AlphaBlendValue := 80;
      listaProdutos := TObjectList<TPedidoProdutosVO>.Create;

      while not(frmExportacaoDeProdutos.qryProduto.Eof) do Begin

         //if Trim(frmExportacaoDeProdutos.qryProdutoDESCRICAO.AsString) <> '' then Begin
            pedido := TPedidoProdutosVO.Create;
            pedido.id_produto     := Trim(frmExportacaoDeProdutos.qryProdutoID.AsString);
            pedido.descricao      := Criptografa(Trim(frmExportacaoDeProdutos.qryProdutoDESCRICAO.AsString),150);
            pedido.gtin           := Trim(frmExportacaoDeProdutos.qryProdutoGTIN.AsString);
            pedido.valor_unitario := frmExportacaoDeProdutos.qryProdutoPRECO.AsFloat;
            pedido.qtde_estoque   := frmExportacaoDeProdutos.qryProdutoQUANTIDADE.AsFloat;
            pedido.unidade        := Trim(frmExportacaoDeProdutos.qryProdutoUNIDADE.AsString);
            pedido.status         := Trim(frmExportacaoDeProdutos.qryProdutoSTATUS.AsString);
            pedido.id_empresa     := frmPrincipal.idEmpresa;
            pedido.fator_unidade  := frmExportacaoDeProdutos.qryProdutoFATOR.AsFloat;
            listaProdutos.Add(pedido);
         //End;

         frmExportacaoDeProdutos.qryProduto.Next;

      End;

      TPedidoProdutosController.GravarProduto(listaProdutos);

   Finally

      if True then

      frmSplash.Close;
      frmExportacaoDeProdutos.AlphaBlendValue := 255;
      frmExportacaoDeProdutos.qryProduto.First;

   End;

end;
end.
