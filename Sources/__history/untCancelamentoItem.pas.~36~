unit untCancelamentoItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, untPedidos,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, unitConfiguracoes, untTelaDePedido,
  Vcl.Imaging.pngimage;

type
  TfrmCancelamentoItem = class(TForm)
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
  frmCancelamentoItem: TfrmCancelamentoItem;

implementation

{$R *.dfm}

procedure TfrmCancelamentoItem.Cancelar;
Var valor: double;
begin

   if frmPedidos.qryItens.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   if fctMsgConfirmDefaultButtonYes('Confirma a exclusão do ítem selecionado?') = false then
      Exit;

   valor := frmPedidos.qryItensvlTotal.AsFloat;
   frmPedidos.qryItens.Delete;
   frmPedidos.total := frmPedidos.total - valor;

   if frmPedidos.qryItens.IsEmpty then Begin
      frmPedidos.desconto  := 0.00;
      frmPedidos.acrescimo := 0.00;
   End;

   frmPedidos.Totalizadores;

end;

procedure TfrmCancelamentoItem.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of
      VK_F12: Cancelar;
      VK_RETURN: Cancelar;
   end;

end;

procedure TfrmCancelamentoItem.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_DOWN: Begin
                  frmPedidos.qryItens.First;
                  DBGrid1.SetFocus;
               End;

   end;

end;

procedure TfrmCancelamentoItem.edtCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      FiltrarProduto;


end;

procedure TfrmCancelamentoItem.FiltrarProduto;
begin

   frmPedidos.qryItens.Filtered := False;
   frmPedidos.qryItens.Filter   := ' ((item = '+QuotedStr('#'+Trim(edtCodigo.Text))+') or (descricao LIKE '+QuotedStr(Copy(Trim(edtCodigo.Text),1,100)+'%')+') OR (gtin =  '+QuotedStr(Copy(Trim(edtCodigo.Text),1,15))+'))';
   frmPedidos.qryItens.Filtered := True;

   if not(frmPedidos.qryItens.IsEmpty) then Begin
      frmPedidos.qryItens.First;
      DBGrid1.SetFocus;
   End;

end;

procedure TfrmCancelamentoItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   frmPedidos.qryItens.Filtered := False;
   frmPedidos.qryItens.Filter   := '';
   frmPedidos.qryItens.Filtered := True;

   frmPedidos.qryItens.Last;

end;

procedure TfrmCancelamentoItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmCancelamentoItem.Image3Click(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCancelamentoItem.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCancelamentoItem.SpeedButton1Click(Sender: TObject);
begin

   Cancelar;

end;

end.
