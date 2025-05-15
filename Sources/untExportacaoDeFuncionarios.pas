unit untExportacaoDeFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, PedidoSqlController,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, PedidoSqlVO, PedidoFuncionariosVO,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Buttons, generics.collections,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client, FireDAC.Comp.DataSet, PedidoFuncionariosController,
  PedidoConexaoVO, PedidoConexaoController, unitConfiguracoes;

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

  TfrmExportacaoDeFuncionarios = class(TForm)
    dtsFuncionarios: TDataSource;
    qryFuncionarios: TFDQuery;
    qryFuncionariosID: TIntegerField;
    qryFuncionariosNOME: TStringField;
    qryFuncionariosSTATUS: TStringField;
    DBGrid1: TDBGrid;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
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
  frmExportacaoDeFuncionarios: TfrmExportacaoDeFuncionarios;

implementation

{$R *.dfm}

uses untSplash, untPrincipal;


{ TfrmExportacaoDeFuncionarios }

procedure TfrmExportacaoDeFuncionarios.FormCreate(Sender: TObject);
begin

   FThreadSplashExportarFuncionarios := Nil;
   fThreadSplashExportarCloud := Nil;

   TestarConexao;

end;

procedure TfrmExportacaoDeFuncionarios.ImportarFuncionarios;
Var sql: TPedidoSqlVO;
begin

   Try

      Try

         sql := TPedidoSqlVO.Create;
         sql :=  TPedidoSqlController.RetornarSQL(1);

         qryFuncionarios.Close;
         qryFuncionarios.SQL.Clear;
         qryFuncionarios.SQL.Add(sql.sql_funcionarios);
         qryFuncionarios.Open;

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
      frmExportacaoDeFuncionarios.ImportarFuncionarios;
   Finally
      FreeAndNil(frmSplash);
   End;


end;

procedure TfrmExportacaoDeFuncionarios.SpeedButton1Click(Sender: TObject);
Begin

   if fctMsgConfirmDefaultButtonYes('Confirma a exportação do cadastro de funcionários para o servidor externo?') = false then
      Exit;

   fThreadSplashExportarCloud := ThreadSplashExportarCloud.creeate;
   frmSplash := TfrmSplash.Create(Self);
   frmSplash.JvGIFAnimator1.Visible := False;
   frmSplash.JvGIFAnimator2.Visible := True;
   frmSplash.ShowModal;


End;

procedure TfrmExportacaoDeFuncionarios.SpeedButton3Click(Sender: TObject);
begin

   FThreadSplashExportarFuncionarios := ThreadSplashExportarFuncionarios.creeate;
   frmSplash := TfrmSplash.Create(Self);
   frmSplash.Timer2.Enabled := True;
   frmSplash.ShowModal;

end;

procedure TfrmExportacaoDeFuncionarios.TestarConexao;
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
Var listaFuncionarios: TObjectList<TPedidoFuncionariosVO>;
    pedido: TPedidoFuncionariosVO;
begin

   Try

      frmExportacaoDeFuncionarios.AlphaBlendValue := 80;
      frmExportacaoDeFuncionarios.qryFuncionarios.First;
      listaFuncionarios := TObjectList<TPedidoFuncionariosVO>.Create;

      while not(frmExportacaoDeFuncionarios.qryFuncionarios.Eof) do Begin

         pedido := TPedidoFuncionariosVO.Create;

         pedido.id_funcionario := frmExportacaoDeFuncionarios.qryFuncionariosID.AsInteger;
         pedido.nome           := Trim(frmExportacaoDeFuncionarios.qryFuncionariosNOME.AsString);
         pedido.status         := Trim(frmExportacaoDeFuncionarios.qryFuncionariosSTATUS.AsString);
         pedido.id_empresa     := frmPrincipal.idEmpresa;
         listaFuncionarios.Add(pedido);
         frmExportacaoDeFuncionarios.qryFuncionarios.Next;

      End;

      TPedidoFuncionariosController.GravarFuncionarios(listaFuncionarios);

   Finally

      frmSplash.Close;
      frmExportacaoDeFuncionarios.AlphaBlendValue := 255;
      frmExportacaoDeFuncionarios.qryFuncionarios.First;

   End;

end;

end.
