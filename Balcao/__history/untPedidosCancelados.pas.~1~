unit untPedidosCancelados;

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
  TfrmPedidosCancelados = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
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
    procedure qryGridCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidosCancelados: TfrmPedidosCancelados;

implementation

{$R *.dfm}

uses untTelaDePedido, untPedidos, untMenuPrincipal;


procedure TfrmPedidosCancelados.FormCreate(Sender: TObject);
begin

   qryGrid.Close;
   qryGrid.Open;

end;

procedure TfrmPedidosCancelados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;


procedure TfrmPedidosCancelados.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPedidosCancelados.qryGridCalcFields(DataSet: TDataSet);
begin

   if qryGridVALOR_DESCONTO.AsFloat > 0 then
      qryGridcalcAcrescimo.AsFloat := qryGridVALOR_DESCONTO.AsFloat
   else if qryGridVALOR_DESCONTO.AsFloat < 0 then
      qryGridcalcDesconto.AsFloat := qryGridVALOR_DESCONTO.AsFloat * -1
end;

end.
