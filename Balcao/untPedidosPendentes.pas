unit untPedidosPendentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage, BaseLocalPedidoCabecalhoController,
  Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, untPrincipal, BaseLocalPedidoDetalheController,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, unitConfiguracoes, BaseLocalPedidoDetalheVO,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, generics.collections,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, BaseLocalClientesVO,
  BaseLocalFuncionariosVO, BaseLocalFuncionariosController, BaseLocalClientesController;

type
  TfrmPedidosPendentes = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel5: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    qryGrid: TFDQuery;
    dtsGrid: TDataSource;
    qryGridPEDIDO: TIntegerField;
    qryGridNOME: TStringField;
    qryGridDATA_ABERTURA: TSQLTimeStampField;
    qryGridSTATUS: TStringField;
    qryGridTOTAL_ITENS: TFloatField;
    qryGridID_CLIENTE: TIntegerField;
    qryGridID_FUNCIONARIO: TIntegerField;
    qryGridVALOR_LIQUIDO: TFloatField;
    qryGridVALOR_TOTAL: TFloatField;
    qryGridVALOR_DESCONTO: TFloatField;
    qryGridCONTATO: TStringField;
    qryGridTAXA_ENTREGA: TFloatField;
    qryGridcalcDesconto: TFloatField;
    qryGridcalcAcrescimo: TFloatField;
    qryItens: TFDQuery;
    qryItensID: TIntegerField;
    qryItensID_PEDIDO: TIntegerField;
    qryItensID_PRODUTO: TIntegerField;
    qryItensQUANTIDADE: TFloatField;
    qryItensVALOR_UNITARIO: TFloatField;
    qryItensOBSERVACAO: TStringField;
    qryItensDESCRICAO: TStringField;
    qryItensUNIDADE: TStringField;
    qryItensFATOR_UNIDADE: TFloatField;
    qryItensDESCONTO_ITEM: TFloatField;
    qryItensVALOR_TOTAL: TFloatField;
    qryItensIMPRESSO_COZINHA: TStringField;
    qryItensPRODUTO: TStringField;
    qryItensSIGLA: TStringField;
    qryItensCODIGO_BARRAS: TStringField;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure qryGridCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Alterar;
    procedure CancelarPedido;

  end;

var
  frmPedidosPendentes: TfrmPedidosPendentes;

implementation

{$R *.dfm}

uses untBalcao;

procedure TfrmPedidosPendentes.Alterar;
begin

   if qryGrid.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

  Application.CreateForm(TfrmBalcao, frmBalcao);
  frmBalcao.idPedido                      := qryGridPEDIDO.AsInteger;
  frmBalcao.idCliente                     := qryGridID_CLIENTE.AsInteger;
  frmBalcao.lkpFuncionarios.KeyValue      := qryGridID_FUNCIONARIO.AsInteger;
  frmBalcao.idFuncionario                 := qryGridID_FUNCIONARIO.AsInteger;
  frmBalcao.edtVendedor.Text              := qryGridID_FUNCIONARIO.AsString;
  frmBalcao.edtCodCliente.Text            := qryGridID_CLIENTE.AsString;
  frmBalcao.edtTaxaEntrega.AsFloat        := qryGridTAXA_ENTREGA.AsFloat;
  frmBalcao.edtContato.Text               := Trim(qryGridCONTATO.AsString);
  frmBalcao.lblSubtotal.Caption           := FormatFloat('###,#0.00',qryGridVALOR_TOTAL.AsFloat);
  frmBalcao.lblDescontoAcrescimo.Caption  := '0,00';

  if qryGridVALOR_DESCONTO.AsFloat > 0 then
     frmBalcao.lblDescontoAcrescimo.Caption  := '+'+FormatFloat('###,#0.00',qryGridVALOR_DESCONTO.AsFloat)
  else if qryGridVALOR_DESCONTO.AsFloat < 0 then
     frmBalcao.lblDescontoAcrescimo.Caption  := FormatFloat('###,#0.00',qryGridVALOR_DESCONTO.AsFloat);

  frmBalcao.lblTotalGeral.Caption         := FormatFloat('###,#0.00',qryGridVALOR_LIQUIDO.AsFloat);

  frmBalcao.RefreshItens;
  frmBalcao.ShowModal;

end;

procedure TfrmPedidosPendentes.CancelarPedido;
begin

   if qryGrid.IsEmpty then Begin
      prcMsgAdv('Selecione um registro');
      Exit;
   End;
   {
   if TBaseLocalUsuariosController.VerificarPermissao(frmPrincipal.idUser, 'filtro_acesso_canc_pedido') = false then Begin
      prcMsgAdv('Usuário sem permissão de acesso a função.');
      Exit;
   End;
   }
   if fctMsgConfirmDefaultButtonNo('Confirma o cancelamento do pedido selecionado?') = false then
      Exit;

   Try
      TBaseLocalPedidoCabecalhoController.MudarStatusPedido(qryGridPEDIDO.AsString, 'C');
      prcMsgInf('Registro cancelado com sucesso.');
      qryGrid.Refresh;
   Except
      prcMsgAdv('Falha ao alterar o status do pedido.');
   End;

end;

procedure TfrmPedidosPendentes.FormCreate(Sender: TObject);
begin

   qryGrid.Close;
   qryGrid.Open;

end;

procedure TfrmPedidosPendentes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F2: Alterar;
      VK_F3: CancelarPedido;

   end;

end;


procedure TfrmPedidosPendentes.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPedidosPendentes.qryGridCalcFields(DataSet: TDataSet);
begin

   if qryGridVALOR_DESCONTO.AsFloat > 0 then
      qryGridcalcAcrescimo.AsFloat := qryGridVALOR_DESCONTO.AsFloat
   else if qryGridVALOR_DESCONTO.AsFloat < 0 then
      qryGridcalcDesconto.AsFloat := qryGridVALOR_DESCONTO.AsFloat * -1
end;

end.
