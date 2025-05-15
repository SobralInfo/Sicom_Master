unit untReimpressaoDeVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, untIntegracaoFidelidade,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit, BaseLocalVendaCabecalhoController,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, unitConfiguracoes, baselocalpedidoCabecalhoController, generics.Collections,
  BaseLocalVendaCabecalhoVO, BaseLocalProdutosController, BaseLocalVendaDetalheController, BaseLocalVendaDetalheVO;

type
  TfrmReimpressaoDeVendas = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    edtVenda: TJvEdit;
    Label1: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure edtVendaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
  end;

var
  frmReimpressaoDeVendas: TfrmReimpressaoDeVendas;

implementation

{$R *.dfm}

uses untPrincipal;

procedure TfrmReimpressaoDeVendas.Confirmar;
Var venda: TBaseLocalVendaCabecalhoVO;
    i: Integer;
begin

   if Trim(edtVenda.Text) = '' then Begin

      prcMsgAdv('Informe uma venda.');
      Exit;

   End;

   if fctMsgConfirmDefaultButtonNo('Confirma a reimpressão da venda?') = false then
      Exit;

   Try

      venda := TBaseLocalVendaCabecalhoVO.Create;
      venda := TBaseLocalVendaCabecalhoController.RetornarIDPorNumeroPedido(StrToInt(edtVenda.Text));

      if venda.ID > 0 then Begin

         if venda.STATUS = 'C' then Begin
            prcMsgAdv('Venda já consta como cancelada.');
            Exit;
         End;

         if venda.STATUS <> 'F' then Begin
            prcMsgAdv('Venda não localizada..');
            Exit;
         End;

         frmPrincipal.ImprimirVenda(venda.ID, '');

      End else
         prcMsgAdv('Venda não localizada.');

   Finally
      FreeAndNil(venda);
   End;

end;

procedure TfrmReimpressaoDeVendas.edtVendaKeyPress(Sender: TObject;
  var Key: Char);
begin

   if  not ( Key in ['0'..'9', Chr(8)] ) then
      Key := #0

end;

procedure TfrmReimpressaoDeVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmReimpressaoDeVendas.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmReimpressaoDeVendas.Image3Click(Sender: TObject);
begin

   confirmar;

end;

procedure TfrmReimpressaoDeVendas.Image4Click(Sender: TObject);
begin

   close;

end;

end.
