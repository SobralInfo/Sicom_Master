unit untCancelamentoItemPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, untPedidos,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, unitConfiguracoes, untTelaDePedido,
  Vcl.Imaging.pngimage, BaseLocalPedidoDetalheController;

type
  TfrmCancelamentoItemPedido = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtCodigo: TEdit;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltrarProduto;
    procedure Cancelar;
    Var tipo: String;
  end;

var
  frmCancelamentoItemPedido: TfrmCancelamentoItemPedido;

implementation

{$R *.dfm}

procedure TfrmCancelamentoItemPedido.Cancelar;
Var valor: double;
begin

   if frmTelaDePedido.qryItens.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   if fctMsgConfirmDefaultButtonYes('Confirma a exclusão do ítem selecionado?') = false then
      Exit;

   valor := frmPedidos.qryItensvlTotal.AsFloat;

   if frmTelaDePedido.qryItensDESCONTO_ITEM.AsFloat > 0 then Begin

      if ((Copy(Trim(frmTelaDePedido.lblDescontoAcrescimo.Caption),1,1) = '-') or
          (Copy(Trim(frmTelaDePedido.lblDescontoAcrescimo.Caption),1,1) = '+')) then
         frmTelaDePedido.lblDescontoAcrescimo.Caption := Copy(Trim(frmTelaDePedido.lblDescontoAcrescimo.Caption),1,1)+
                                                            FormatFloat('###,#0.00',StringParaFloat(Copy(frmTelaDePedido.lblDescontoAcrescimo.Caption,2,20)) -
                                                            frmTelaDePedido.qryItensDESCONTO_ITEM.AsFloat)
      else
         frmTelaDePedido.lblDescontoAcrescimo.Caption := FormatFloat('###,#0.00',StringParaFloat(frmTelaDePedido.lblDescontoAcrescimo.Caption) -
                                                            frmTelaDePedido.qryItensDESCONTO_ITEM.AsFloat);

      if StringParaFloat(Copy(frmTelaDePedido.lblDescontoAcrescimo.Caption,2,20)) = 0.00 then
         frmTelaDePedido.lblDescontoAcrescimo.Caption := '0,00';

   End;

   //frmTelaDePedido.lblDescontoAcrescimo.Caption := FormatFloat('###,#0.00',stringparaFloat(frmTelaDePedido.lblDescontoAcrescimo.Caption) - frmTelaDePedido.qryItensDESCONTO_ITEM.AsFloat);
   frmTelaDePedido.lblSubtotal.Caption          := FormatFloat('###,#0.00',stringparaFloat(frmTelaDePedido.lblSubtotal.Caption) -
                                                                                          (frmTelaDePedido.qryItensVALOR_TOTAL.AsFloat+
                                                                                           frmTelaDePedido.qryItensDESCONTO_ITEM.AsFloat));


   tBaseLocalPedidoDetalheController.ExcluirItemPedidoDetalhe(frmTelaDePedido.qryItensID.AsInteger);
   frmTelaDePedido.qryItens.close;
   frmTelaDePedido.qryItens.Open;
   frmTelaDePedido.qryItens.Last;

   if frmTelaDePedido.qryItens.IsEmpty then Begin
      frmTelaDePedido.lblSubtotal.Caption          := '0,00';
      frmTelaDePedido.lblDescontoAcrescimo.Caption := '0,00';
   End;

   frmTelaDePedido.lblTotalGeral.Caption        := FormatFloat('###,#0.00',StringParaFloat(frmTelaDePedido.lblSubtotal.Caption) +
                                                                           StringParaFloat(frmTelaDePedido.lblDescontoAcrescimo.Caption));

   frmTelaDePedido.GravarPedido(False);

end;

procedure TfrmCancelamentoItemPedido.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of
      VK_F12: Cancelar;
      VK_RETURN: Cancelar;
   end;

end;

procedure TfrmCancelamentoItemPedido.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_DOWN: Begin
                  frmTelaDePedido.qryItens.First;
                  DBGrid1.SetFocus;
               End;

   end;

end;

procedure TfrmCancelamentoItemPedido.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      FiltrarProduto;


end;

procedure TfrmCancelamentoItemPedido.FiltrarProduto;
begin

   frmTelaDePedido.qryItens.Filtered := False;
   frmTelaDePedido.qryItens.Filter   := ' ((item = '+QuotedStr('#'+Trim(edtCodigo.Text))+') or (descricao LIKE '+QuotedStr(Copy(Trim(edtCodigo.Text),1,100)+'%')+') OR (gtin =  '+QuotedStr(Copy(Trim(edtCodigo.Text),1,15))+'))';
   frmTelaDePedido.qryItens.Filtered := True;

   if not(frmTelaDePedido.qryItens.IsEmpty) then Begin
      frmTelaDePedido.qryItens.First;
      DBGrid1.SetFocus;
   End;

end;

procedure TfrmCancelamentoItemPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   frmTelaDePedido.qryItens.Filtered := False;
   frmTelaDePedido.qryItens.Filter   := '';
   frmTelaDePedido.qryItens.Filtered := True;

   frmTelaDePedido.qryItens.Last;

end;

procedure TfrmCancelamentoItemPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmCancelamentoItemPedido.Image3Click(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCancelamentoItemPedido.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCancelamentoItemPedido.SpeedButton1Click(Sender: TObject);
begin

   Cancelar;

end;

end.
