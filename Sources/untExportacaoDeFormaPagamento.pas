unit untExportacaoDeFormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, PedidoSqlController,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, PedidoSqlVO, PedidoFormaPagamentoVO,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Buttons, generics.collections,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, FireDAC.Comp.DataSet, PedidoFormaPagamentoController,
  PedidoConexaoVO, PedidoConexaoController, UNITcONFIGURACOES;

type

  ThreadSplashExportarCloud = class (TThread)
    public
       constructor creeate();
       procedure Execute; override;
  end;

  ThreadSplashExportarFuncionarios = class (TThread)
    public
       constructor creeate();
       procedure Execute; override;
  end;

  TfrmExportacaoDeFormaPagamento = class(TForm)
    dtFormaPG: TDataSource;
    qryFormaPG: TFDQuery;
    DBGrid1: TDBGrid;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    qryFormaPGID: TIntegerField;
    qryFormaPGDESCRICAO: TStringField;
    qryFormaPGSTATUS: TStringField;
    qryFormaPGPERMITE_TROCO: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FThreadSplashExportarFuncionarios: ThreadSplashExportarFuncionarios;
    fThreadSplashExportarCloud: ThreadSplashExportarCloud;
  public
    { Public declarations }
    procedure ImportarFuncionarios;
    procedure TestarConexao;
  end;

var
  frmExportacaoDeFormaPagamento: TfrmExportacaoDeFormaPagamento;

implementation

{$R *.dfm}

uses untSplash, untPrincipal;


{ TfrmExportacaoDeFuncionarios }

procedure TfrmExportacaoDeFormaPagamento.FormCreate(Sender: TObject);
begin

   FThreadSplashExportarFuncionarios := Nil;
   fThreadSplashExportarCloud := Nil;

   TestarConexao;

end;

procedure TfrmExportacaoDeFormaPagamento.ImportarFuncionarios;
Var sql: TPedidoSqlVO;
begin

   Try

      Try

         sql := TPedidoSqlVO.Create;
         sql :=  TPedidoSqlController.RetornarSQL(1);

         qryFormaPG.Close;
         qryFormaPG.SQL.Clear;
         qryFormaPG.SQL.Add(sql.sql_forma_pagamento);
         qryFormaPG.Open;

      Except

         on e: exception do Begin
            showmessage('Erro: '+e.Message);
            Exit;
         End;

      end;

   finally
      FreeAndNil(sql);
      frmSplash.Close;
   End;

end;

{ ThreadSplashExportarFuncionarios }

constructor ThreadSplashExportarFuncionarios.creeate;
begin

   inherited Create(false);

end;

procedure ThreadSplashExportarFuncionarios.Execute;
begin

   Try
      frmExportacaoDeFormaPagamento.ImportarFuncionarios;
   Finally
      FreeAndNil(frmSplash);
   End;


end;

procedure TfrmExportacaoDeFormaPagamento.SpeedButton1Click(Sender: TObject);
Begin

   if fctMsgConfirmDefaultButtonYes('Confirma a exportação do cadastro de forma de pagamento para o servidor externo?') = false then
      Exit;

   fThreadSplashExportarCloud := ThreadSplashExportarCloud.creeate;
   frmSplash := TfrmSplash.Create(Self);
   frmSplash.JvGIFAnimator1.Visible := False;
   frmSplash.JvGIFAnimator2.Visible := True;
   frmSplash.ShowModal;

end;


procedure TfrmExportacaoDeFormaPagamento.SpeedButton3Click(Sender: TObject);
begin

   FThreadSplashExportarFuncionarios := ThreadSplashExportarFuncionarios.creeate;
   frmSplash := TfrmSplash.Create(Self);
   frmSplash.Timer2.Enabled := True;
   frmSplash.ShowModal;

end;

procedure TfrmExportacaoDeFormaPagamento.TestarConexao;
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

{ ThreadSplashExportarCloud }

constructor ThreadSplashExportarCloud.creeate;
begin

   inherited Create(false);

end;

procedure ThreadSplashExportarCloud.Execute;
Var listaFormaPagamento: TObjectList<TPedidoFormaPagamentoVO>;
    pedido: TPedidoFormaPagamentoVO;
begin

   Try

      frmExportacaoDeFormaPagamento.AlphaBlendValue := 80;
      frmExportacaoDeFormaPagamento.qryFormaPG.First;
      listaFormaPagamento := TObjectList<TPedidoFormaPagamentoVO>.Create;

      while not(frmExportacaoDeFormaPagamento.qryFormaPG.Eof) do Begin

         pedido := TPedidoFormaPagamentoVO.Create;

         pedido.ID_FORMA_PAGAMENTO := frmExportacaoDeFormaPagamento.qryFormaPGID.AsInteger;
         pedido.DESCRICAO          := Trim(frmExportacaoDeFormaPagamento.qryFormaPGDESCRICAO.AsString);
         pedido.status             := Trim(frmExportacaoDeFormaPagamento.qryFormaPGSTATUS.AsString);
         pedido.PERMITE_TROCO      := Trim(frmExportacaoDeFormaPagamento.qryFormaPGPERMITE_TROCO.AsString);
         pedido.id_empresa         := frmPrincipal.idEmpresa;
         listaFormaPagamento.Add(pedido);
         frmExportacaoDeFormaPagamento.qryFormaPG.Next;

      End;

      TPedidoFormaPagamentoController.GravarFormaDePagamento(listaFormaPagamento);

   Finally

      frmSplash.Close;
      frmExportacaoDeFormaPagamento.AlphaBlendValue := 255;
      frmExportacaoDeFormaPagamento.qryFormaPG.First;

   End;



end;

end.
