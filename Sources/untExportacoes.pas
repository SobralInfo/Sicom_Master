unit untExportacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage, untSQLs,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmExportacoes = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportacoes: TfrmExportacoes;

implementation

{$R *.dfm}

uses untConexao, untExportacaoDeProdutos, untExportacaoDeClientes,
  untExportacaoDeFormaPagamento, untExportacaoDeFuncionarios;

procedure TfrmExportacoes.SpeedButton1Click(Sender: TObject);
begin

   Application.CreateForm(TfrmConexao, frmConexao);
   frmConexao.ShowModal;

end;

procedure TfrmExportacoes.SpeedButton2Click(Sender: TObject);
begin

   Application.CreateForm(TfrmSQLs, frmSQLs);
   frmSQLs.ShowModal;

end;

procedure TfrmExportacoes.SpeedButton3Click(Sender: TObject);
begin

   Application.CreateForm(TfrmExportacaoDeProdutos, frmExportacaoDeProdutos);
   frmExportacaoDeProdutos.ShowModal;

end;

procedure TfrmExportacoes.SpeedButton4Click(Sender: TObject);
begin

   Application.CreateForm(TfrmExportacaoDeClientes, frmExportacaoDeClientes);
   frmExportacaoDeClientes.ShowModal;

end;

procedure TfrmExportacoes.SpeedButton5Click(Sender: TObject);
begin

   Application.CreateForm(TfrmExportacaoDeFormaPagamento, frmExportacaoDeFormaPagamento);
   frmExportacaoDeFormaPagamento.ShowModal;

end;

procedure TfrmExportacoes.SpeedButton6Click(Sender: TObject);
begin

   Application.CreateForm(TfrmExportacaoDeFuncionarios, frmExportacaoDeFuncionarios);
   frmExportacaoDeFuncionarios.ShowModal;

end;

end.
