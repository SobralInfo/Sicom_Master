unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, inifiles,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.ExtCtrls,
  Vcl.StdCtrls, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    ConexaoLocal: TFDConnection;
    dtsClientes: TDataSource;
    qryClientes: TFDQuery;
    qryClientesID: TIntegerField;
    qryClientesSTATUS: TStringField;
    qryClientesCPF_CNPJ: TStringField;
    qryClientesNOME: TStringField;
    qryClientesLOGRADOURO: TStringField;
    qryClientesNUMERO: TStringField;
    qryClientesCOMPLEMENTO: TStringField;
    qryClientesBAIRRO: TStringField;
    qryClientesCIDADE: TIntegerField;
    qryClientesCONTATO: TStringField;
    qryClientesFONE_FIXO: TStringField;
    qryClientesREFERENCIA: TStringField;
    qryClientesCELULAR: TStringField;
    qryClientescalcCPFCNPJ: TStringField;
    dtsMunicipio: TDataSource;
    qryMunicipio: TFDQuery;
    qryMunicipioID: TIntegerField;
    qryMunicipioCID_CODIGO: TStringField;
    qryMunicipioUF_SIGLA: TStringField;
    qryMunicipioCID_NOME: TStringField;
    qryFuncionarios: TFDQuery;
    qryFuncionariosID: TIntegerField;
    qryFuncionariosSTATUS: TStringField;
    qryFuncionariosCODIGO: TStringField;
    qryFuncionariosNOME: TStringField;
    qryFuncionariosPERCENTUAL_COMISSAO: TFloatField;
    dtsFuncionarios: TDataSource;
    dtsUnidades: TDataSource;
    qryUnidades: TFDQuery;
    qryUnidadesID: TIntegerField;
    qryUnidadesSTATUS: TStringField;
    qryUnidadesDESCRICAO: TStringField;
    qryUnidadesSIGLA: TStringField;
    qryUnidadesFATOR: TFloatField;
    qryUnidadesPODE_FRACIONAR: TStringField;
    qryUnidadescalcSTATUS: TStringField;
    qryProdutos: TFDQuery;
    qryProdutosID: TIntegerField;
    qryProdutosSTATUS: TStringField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosQTDE_ESTOQUE: TFloatField;
    qryProdutosREFERENCIA: TStringField;
    qryProdutosID_UNIDADE: TIntegerField;
    qryProdutosCODIGO_BARRAS: TStringField;
    qryProdutosVALOR_UNITARIO: TFloatField;
    qryProdutosUNIDADE: TStringField;
    qryProdutosFATOR: TFloatField;
    qryProdutosIMPRIMIR_COZINHA: TStringField;
    qryProdutosID_CATEGORIA: TIntegerField;
    qryProdutosKIT: TStringField;
    dtsProdutos: TDataSource;
    dtsParametros: TDataSource;
    qryParametros: TFDQuery;
    qryParametrosID: TIntegerField;
    qryParametrosBASE_LOCAL: TStringField;
    qryParametrosCAIXA: TStringField;
    qryParametrosTIPO_DESCONTO_PEDIDO: TStringField;
    qryParametrosTIPO_IMPRESSAO: TIntegerField;
    qryParametrosCERTIFICADO: TStringField;
    qryParametrosID_UNIDADE_PADRAO_ENTRADA: TIntegerField;
    qryParametrosID_UNIDADE_PADRAO_PRODUTO: TIntegerField;
    qryParametrosCRITICAR_ESTOQUE: TStringField;
    qryParametrosMENSAGEM_IMPRIMIR: TStringField;
    Panel2: TPanel;
    lblCaption: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image22: TImage;
    Panel7: TPanel;
    Image12: TImage;
    Panel1: TPanel;
    CategoryPanelGroup1: TCategoryPanelGroup;
    CategoryPanel2: TCategoryPanel;
    SpeedButton6: TSpeedButton;
    Image9: TImage;
    CategoryPanel1: TCategoryPanel;
    SpeedButton5: TSpeedButton;
    Image3: TImage;
    SpeedButton1: TSpeedButton;
    Image4: TImage;
    qryUsuarios: TFDQuery;
    qryUsuariosID: TIntegerField;
    qryUsuariosSTATUS: TStringField;
    qryUsuariosCODIGO: TStringField;
    qryUsuariosNOME: TStringField;
    qryUsuariosPW: TStringField;
    qryUsuariosCPF: TStringField;
    qryUsuarioscalcUsuario: TStringField;
    qryUsuariosFILTRO_CADASTRO_EMPRESA: TStringField;
    qryUsuariosFILTRO_CADASTRO_USUARIOS: TStringField;
    qryUsuariosFILTRO_CADASTRO_FUNCIONARIOS: TStringField;
    qryUsuariosFILTRO_CADASTRO_CLIENTES: TStringField;
    qryUsuariosFILTRO_CADASTRO_UNIDADES: TStringField;
    qryUsuariosFILTRO_CADASTRO_PRODUTOS: TStringField;
    qryUsuariosFILTRO_CADASTRO_PAGAMENTOS: TStringField;
    qryUsuariosFILTRO_ACESSO_VENDAS: TStringField;
    qryUsuariosFILTRO_ACESSO_EXPORTACOES: TStringField;
    qryUsuariosFILTRO_ACESSO_RELATORIOS: TStringField;
    qryUsuariosFILTRO_ACESSO_CONFIGURACOES: TStringField;
    qryUsuariosFILTRO_ACESSO_PED_ATIVOS: TStringField;
    qryUsuariosFILTRO_ACESSO_PED_CANCELADOS: TStringField;
    qryUsuariosFILTRO_ACESSO_CANC_VENDA: TStringField;
    qryUsuariosFILTRO_ACESSO_CANC_PEDIDO: TStringField;
    qryUsuariosFILTRO_GERAR_PEDIDO: TStringField;
    qryUsuariosFILTRO_ACESSO_FECHAMENTO: TStringField;
    qryUsuariosCADASTRO_FORNECEDORES: TStringField;
    qryUsuariosCADASTRO_CATEGORIA: TStringField;
    qryUsuariosCADASTRO_KIT_PRODUTOS: TStringField;
    qryUsuariosCADASTRO_CAIXAS: TStringField;
    qryUsuariosCADASTRO_PROMOCOES: TStringField;
    qryUsuariosENTRADA_MANUAL: TStringField;
    qryUsuariosIMPORTACAO_DE_XML: TStringField;
    qryUsuariosFIADO: TStringField;
    qryUsuariosREL_VENDAS_POR_PERIODO: TStringField;
    qryUsuariosREL_PRODUTOS_MAIS_VENDIDOS: TStringField;
    qryUsuariosREL_ESTOQUE_PRODUTOS: TStringField;
    qryUsuariosREL_CONTROLE_FIADO_CLIENTE: TStringField;
    qryUsuariosBLOQUEAR_CLIENTE_VENDA_FIADO: TStringField;
    qryUsuariosRECEBIMENTO_DE_PG_FIADOS: TStringField;
    qryUsuariosCANCELAR_VENDA: TStringField;
    qryUsuariosFECHAMENTO_DE_CAIXA: TStringField;
    dtsUsuarios: TDataSource;
    qryEmpresa: TFDQuery;
    qryEmpresaID: TIntegerField;
    qryEmpresaCNPJ: TStringField;
    qryEmpresaRAZAO_SOCIAL: TStringField;
    qryEmpresaFANTASIA: TStringField;
    qryEmpresaFONE: TStringField;
    qryEmpresaCELULAR: TStringField;
    qryEmpresaEMAIL: TStringField;
    qryEmpresaSITE: TStringField;
    qryEmpresaBASE_LOCAL: TStringField;
    qryEmpresaULTIMO_NSU: TIntegerField;
    qryEmpresaCODIGO_UF: TIntegerField;
    qryEmpresaDATA_HORA_BLOQUEIO_XML: TSQLTimeStampField;
    qryEmpresaID_MUNICIPIO: TIntegerField;
    dtsEmpresa: TDataSource;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    StatusBar1: TStatusBar;
    procedure Image2Click(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var idUser, idEmpresa: integer;
        vgbLOGIN: boolean;
        bd: string;
    procedure ImprimirPedido(id:integer);
    procedure CarregarRest;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untBalcao, untPedidosPendentes, untPedidosCancelados, untLogin;

procedure TfrmPrincipal.CarregarRest;
begin

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
VAR con : TIniFile;
    server, database : string;

Begin
   {
   frmPrincipal.Height := frmPrincipal.Height - 5;
   frmPrincipal.Width  := frmPrincipal.Width;
   frmPrincipal.Left   := 0;
   frmPrincipal.Top    := 0;  }
   //ShowScrollBar(DBCtrlGrid1.handle, SB_HORZ, False);

  // associa o arquivo de configuração a variável
   con:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'conexao.ini');
  //variável param recebe 12345
   server   := con.readstring('caminho_server','Servidor','');
   database := con.readstring('caminho_server','BD','');

  ConexaoLocal.Close();
  ConexaoLocal.Params.Values['Database'] := database;
  ConexaoLocal.Params.Values['User_Name'] := 'sysdba';
  ConexaoLocal.Params.Values['Server'] := server;
  ConexaoLocal.Params.Values['Password'] := 'masterkey';
  ConexaoLocal.Params.Values['DriverID'] := 'FB';

  Try

    ConexaoLocal.Open();
    Application.Run;

    SetWindowLong(frmPrincipal.Handle,
                  GWL_STYLE,
                  GetWindowLong(Handle,GWL_STYLE) and not WS_CAPTION);
    Height := ClientHeight;

  except
    Application.MessageBox(pchar('Erro na Conexao com o Banco de Dados'),pchar('Aviso Do Sistema'),MB_ICONINFORMATION+MB_OK);
    Application.ProcessMessages;
    Application.Terminate;
    raise;
  End;

   if not vgbLOGIN   then begin
      frmLogin := TfrmLogin.Create(Self);
      frmLogin.ShowModal;
   end;

   if not vgbLOGIN then
      Application.Terminate;

   qryParametros.Close;
   qryParametros.Open;

   qryEmpresa.Close;
   qryEmpresa.Open;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

   lblCaption.Caption := frmPrincipal.qryEmpresaFANTASIA.AsString;

end;

procedure TfrmPrincipal.Image22Click(Sender: TObject);
begin

   frmPrincipal.WindowState := wsMinimized;

end;

procedure TfrmPrincipal.Image2Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPrincipal.ImprimirPedido(id: integer);
begin

end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin

   Application.CreateForm(TfrmPedidosPendentes, frmPedidosPendentes);
   frmPedidosPendentes.ShowModal;

end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
begin

   Application.CreateForm(TfrmBalcao, frmBalcao);
   frmBalcao.ShowModal;

end;

procedure TfrmPrincipal.SpeedButton6Click(Sender: TObject);
begin

   Application.CreateForm(TfrmPedidosCancelados, frmPedidosCancelados);
   frmPedidosCancelados.ShowModal;

end;

end.
