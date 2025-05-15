unit untExportacaoDeClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, synacode,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,PedidoSqlVO, PedidoSqlController, unitConfiguracoes,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, PedidoClientesVO, PedidoClientesController,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, generics.collections, PedidoConexaoVO, PedidoConexaoController,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, IdCoder, IdCoderMIME,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls;

type

  ThreadSplashExportarClientes = class (TThread)
    public
       constructor creeate();
       procedure Execute; override;
  end;

  ThreadSplashExportarCloud = class (TThread)
    public
       constructor creeate();
       procedure Execute; override;
  end;

  TfrmExportacaoDeClientes = class(TForm)
    DBGrid1: TDBGrid;
    qryClientes: TFDQuery;
    dtsClientes: TDataSource;
    qryClientesID_CLIENTE: TIntegerField;
    qryClientesNOME: TStringField;
    qryClientesFANTASIA: TStringField;
    qryClientesCPF_CNPJ: TStringField;
    qryClientesLOGRADOURO: TStringField;
    qryClientesNUMERO: TStringField;
    qryClientesCOMPLEMENTO: TStringField;
    qryClientesBAIRRO: TStringField;
    qryClientesID_MUNICIPIO: TIntegerField;
    qryClientesCELULAR: TStringField;
    qryClientesFONE_FIXO: TStringField;
    qryClientesSTATUS: TStringField;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FThreadSplashExportarClientes: ThreadSplashExportarClientes;
    fThreadSplashExportarCloud: ThreadSplashExportarCloud;
  public
    { Public declarations }
    procedure ImportarClientes;
    procedure TestarConexao;
  end;

var
  frmExportacaoDeClientes: TfrmExportacaoDeClientes;

implementation

{$R *.dfm}

uses untSplash, untPrincipal;

procedure TfrmExportacaoDeClientes.FormCreate(Sender: TObject);
begin

   FThreadSplashExportarClientes := Nil;
   fThreadSplashExportarCloud := Nil;

   TestarConexao;

end;

procedure TfrmExportacaoDeClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmExportacaoDeClientes.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmExportacaoDeClientes.ImportarClientes;
Var sql: TPedidoSqlVO;
begin

   Try

      Try

         sql := TPedidoSqlVO.Create;
         sql :=  TPedidoSqlController.RetornarSQL(1);

         qryClientes.Close;
         qryClientes.SQL.Clear;
         qryClientes.SQL.Add(sql.sql_clientes);
         qryClientes.Open;

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

procedure TfrmExportacaoDeClientes.SpeedButton1Click(Sender: TObject);
Begin

   if fctMsgConfirmDefaultButtonYes('Confirma a exportação do cadastro de produtos para o servidor externo?') = false then
      Exit;

   fThreadSplashExportarCloud := ThreadSplashExportarCloud.creeate;
   frmSplash := TfrmSplash.Create(Self);
   frmSplash.JvGIFAnimator1.Visible := False;
   frmSplash.JvGIFAnimator2.Visible := True;
   frmSplash.ShowModal;

End;

procedure TfrmExportacaoDeClientes.SpeedButton3Click(Sender: TObject);
begin

   FThreadSplashExportarClientes := ThreadSplashExportarClientes.creeate;
   frmSplash := TfrmSplash.Create(Self);
   frmSplash.Timer2.Enabled := True;
   frmSplash.ShowModal;

end;

procedure TfrmExportacaoDeClientes.TestarConexao;
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

{ ThreadSplashExportarClientes }

constructor ThreadSplashExportarClientes.creeate;
begin

   inherited Create(false);

end;

procedure ThreadSplashExportarClientes.Execute;
begin

   Try
      frmExportacaoDeClientes.ImportarClientes;
   Finally
      frmSplash.Close;
   End;

end;

{ ThreadSplashExportarCloud }

constructor ThreadSplashExportarCloud.creeate;
begin

   inherited Create(false);

end;

procedure ThreadSplashExportarCloud.Execute;
Var listaClientes: TObjectList<TPedidoClientesVO>;
    pedido: TPedidoClientesVO;

begin

   Try

      frmExportacaoDeClientes.AlphaBlendValue := 80;
      frmExportacaoDeClientes.qryClientes.First;
      listaClientes := TObjectList<TPedidoClientesVO>.Create;

      while not(frmExportacaoDeClientes.qryClientes.Eof) do Begin

         pedido := TPedidoClientesVO.Create;

         pedido.id_cliente   := frmExportacaoDeClientes.qryClientesID_CLIENTE.AsInteger;
         pedido.nome         := Criptografa(Trim(frmExportacaoDeClientes.qryClientesNOME.AsString),150);
         pedido.fantasia     := Criptografa(Trim(frmExportacaoDeClientes.qryClientesFANTASIA.AsString),150);
         pedido.cpf_cnpj     := Criptografa(Trim(SoNumero(frmExportacaoDeClientes.qryClientesCPF_CNPJ.AsString)),150);
         pedido.logradouro   := Criptografa(Trim(frmExportacaoDeClientes.qryClientesLOGRADOURO.AsString),150);
         pedido.numero       := Criptografa(TRim(frmExportacaoDeClientes.qryClientesNUMERO.AsString),150);
         pedido.complemento  := Criptografa(Trim(frmExportacaoDeClientes.qryClientesCOMPLEMENTO.AsString),150);
         pedido.bairro       := Criptografa(Trim(frmExportacaoDeClientes.qryClientesBAIRRO.AsString),150);
         pedido.id_municipio := frmExportacaoDeClientes.qryClientesID_MUNICIPIO.AsInteger;
         pedido.celular      := Trim(SoNumero(frmExportacaoDeClientes.qryClientesCELULAR.AsString));
         pedido.fone_fixo    := COpy(Trim(SoNumero(frmExportacaoDeClientes.qryClientesFONE_FIXO.AsString)),1,10);
         pedido.status       := Trim(frmExportacaoDeClientes.qryClientesSTATUS.AsString);
         pedido.id_empresa   := frmPrincipal.idEmpresa;
         listaClientes.Add(pedido);
         frmExportacaoDeClientes.qryClientes.Next;

      End;

      TPedidoClientesController.GravarClientes(listaClientes);

   Finally

      frmSplash.Close;
      frmExportacaoDeClientes.AlphaBlendValue := 255;
      frmExportacaoDeClientes.qryClientes.First;

   End;

end;

end.
