unit untSQLs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, pedidoSQLvo, PEDIdosqlController,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, unitConfiguracoes,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmSQLs = class(TForm)
    GroupBox1: TGroupBox;
    mmoProdutos: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    mmoClientes: TMemo;
    Panel2: TPanel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    mmoFuncionarios: TMemo;
    Panel3: TPanel;
    Label3: TLabel;
    qryProduto: TFDQuery;
    qryProdutoID: TIntegerField;
    qryProdutoSTATUS: TStringField;
    qryProdutoDESCRICAO: TStringField;
    qryProdutoPRECO: TFloatField;
    qryProdutoQUANTIDADE: TFloatField;
    qryProdutoFATOR: TFloatField;
    qryProdutoUNIDADE: TStringField;
    qryFuncionarios: TFDQuery;
    qryFuncionariosID: TIntegerField;
    qryFuncionariosNOME: TStringField;
    qryFuncionariosSTATUS: TStringField;
    SpeedButton4: TSpeedButton;
    qryClientes: TFDQuery;
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
    GroupBox4: TGroupBox;
    mmoFormaPagamento: TMemo;
    Panel4: TPanel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    qryFormaPG: TFDQuery;
    qryFormaPGID: TIntegerField;
    qryFormaPGDESCRICAO: TStringField;
    qryFormaPGSTATUS: TStringField;
    qryFormaPGPERMITE_TROCO: TStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idSQL: integer;
  end;

var
  frmSQLs: TfrmSQLs;

implementation

{$R *.dfm}

procedure TfrmSQLs.FormCreate(Sender: TObject);
var sql: TPedidoSqlVO;
begin

   Try

      sql := TPedidoSqlVO.Create;
      sql :=  TPedidoSqlController.RetornarSQL(1);

      mmoProdutos.Lines.Text       := Trim(sql.sql_produtos);
      mmoFuncionarios.Lines.Text   := Trim(sql.sql_funcionarios);
      mmoClientes.Lines.Text       := Trim(sql.sql_clientes);
      mmoFormaPagamento.Lines.Text := Trim(sql.sql_forma_pagamento);
      idSQL := sql.id;

   Finally

      FreeAndNil(sql);

   End;

end;

procedure TfrmSQLs.SpeedButton1Click(Sender: TObject);
begin

   Try
      qryProduto.Close;
      qryProduto.SQL.Clear;
      qryProduto.SQL.Add(Trim(mmoProdutos.Lines.Text));
      qryProduto.Open;
      prcMsgInf('SQL validado com sucesso.');
   Except
      on e: exception do
         prcMsgAdv('Erro no SQL: '+E.Message);
   End;

end;

procedure TfrmSQLs.SpeedButton2Click(Sender: TObject);
begin

   Try
      qryClientes.Close;
      qryClientes.SQL.Clear;
      qryClientes.SQL.Add(Trim(mmoClientes.Lines.Text));
      qryClientes.Open;
      prcMsgInf('SQL validado com sucesso.');
   Except
      on e: exception do
         prcMsgAdv('Erro no SQL: '+E.Message);
   End;

end;

procedure TfrmSQLs.SpeedButton3Click(Sender: TObject);
begin

   Try
      qryFuncionarios.Close;
      qryFuncionarios.SQL.Clear;
      qryFuncionarios.SQL.Add(Trim(mmoFuncionarios.Lines.Text));
      qryFuncionarios.Open;
      prcMsgInf('SQL validado com sucesso.');
   Except
      on e: exception do
         prcMsgAdv('Erro no SQL: '+E.Message);
   End;

end;

procedure TfrmSQLs.SpeedButton4Click(Sender: TObject);
Var sql: TPedidoSqlVO;
begin

   Try

      sql := TPedidoSqlVO.Create;

      sql.sql_produtos           := Trim(mmoProdutos.Lines.Text);
      SQL.sql_funcionarios       := Trim(mmoFuncionarios.Lines.Text);
      SQL.sql_clientes           := Trim(mmoClientes.Lines.Text);
      SQL.sql_forma_pagamento    := Trim(mmoFormaPagamento.Lines.Text);

      if idSQL > 0 then Begin
         sql.id := idSQL;
         idSQL  := TPedidoSqlController.AlterarSQL(SQL).id;
      End else
         idSQL := TPedidoSqlController.GravarSQL(SQL).id;

   Finally

   End;

end;
procedure TfrmSQLs.SpeedButton5Click(Sender: TObject);
begin

   Try
      qryFormaPG.Close;
      qryFormaPG.SQL.Clear;
      qryFormaPG.SQL.Add(Trim(mmoFormaPagamento.Lines.Text));
      qryFormaPG.Open;
      prcMsgInf('SQL validado com sucesso.');
   Except
      on e: exception do
         prcMsgAdv('Erro no SQL: '+E.Message);
   End;

end;

end.
