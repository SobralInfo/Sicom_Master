unit untConexao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, unitConfiguracoes,
  pedidoConexaoVO, pedidoConexaoController, untBiblioteca;

type
  TfrmConexao = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    mkeCaminho: TMaskEdit;
    SpeedButton2: TSpeedButton;
    mkeUsuario: TMaskEdit;
    mkeSenha: TMaskEdit;
    OpenDialog1: TOpenDialog;
    mkeServidor: TMaskEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VAr idConexao: integer;
  end;

var
  frmConexao: TfrmConexao;

implementation

{$R *.dfm}

uses untPrincipal;

procedure TfrmConexao.FormCreate(Sender: TObject);
var conexao: TPedidoConexaoVO;
begin

   idConexao := 0;

   Try

      conexao := TPedidoConexaoVO.Create;
      conexao :=  TPedidoConexaoController.RetornarConexao;

      mkeCaminho.Text  := DesCriptografa(Trim(conexao.caminho_banco),2);
      mkeUsuario.Text  := Trim(conexao.login);
      mkeSenha.Text    := Trim(conexao.senha);
      mkeServidor.Text := Trim(conexao.servidor);

      if conexao.id > 0 then
         idConexao := conexao.id;

   Finally

      FreeAndNil(conexao);

   End;
end;

procedure TfrmConexao.SpeedButton1Click(Sender: TObject);
Var conexao: TPedidoConexaoVO;
begin

   frmPrincipal.Conexao.Connected := False;
   frmPrincipal.Conexao.Params.Add('Server='+Trim(mkeServidor.Text));
   frmPrincipal.Conexao.Params.Database := Trim(mkeCaminho.Text);
   frmPrincipal.Conexao.Params.UserName := Trim(mkeUsuario.Text);
   frmPrincipal.Conexao.Params.Password := Trim(mkeSenha.Text);
   frmPrincipal.Conexao.Params.DriverID := 'FB';

   Try
      frmPrincipal.Conexao.Connected := True;
   Except
      on e:exception do Begin
         prcMsgAdv('Erro ao conectar: '+e.Message);
      End;
   End;

   conexao := TPedidoConexaoVO.Create;

   conexao.id_empresa    := frmPrincipal.idEmpresa;
   conexao.caminho_banco := Criptografa(Trim(mkeCaminho.Text),2);
   conexao.login         := Trim(mkeUsuario.Text);
   conexao.senha         := Trim(mkeSenha.Text);
   conexao.servidor      := Trim(mkeServidor.Text);

   if idConexao > 0 then Begin
      conexao.id := idConexao;
      TPedidoConexaoController.AlterarPedidoConexao(conexao);
   end else
      TPedidoConexaoController.GravarPedidoConexao(conexao);

end;

procedure TfrmConexao.SpeedButton2Click(Sender: TObject);
begin

   OpenDialog1.Execute;
   mkeCaminho.Text := OpenDialog1.FileName;

end;

end.
