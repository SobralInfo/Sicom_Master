unit untObservacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmObservacao = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Panel1: TPanel;
    mmoObs: TMemo;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image3Click(Sender: TObject);
    procedure cek(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
    var tipo: string;
  end;

var
  frmObservacao: TfrmObservacao;

implementation

{$R *.dfm}

uses untTelaDePedido, untPedidos;

procedure TfrmObservacao.Confirmar;
begin

   if tipo = 'V' then Begin
      frmPedidos.qryItens.Edit;
      frmPedidos.qryItensobservacao.AsString := Trim(mmoObs.Lines.Text);
      frmPedidos.qryItens.Post;
   end else
      frmTelaDePedido.obsProduto := Trim(mmoObs.Lines.Text);

   close;

end;

procedure TfrmObservacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: Confirmar;
      VK_RETURN :Confirmar;

   end;

end;

procedure TfrmObservacao.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmObservacao.cek(Sender: TObject);
begin

   close;

end;

end.
