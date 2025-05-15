unit untAlterarPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, unitConfiguracoes,
  JvExStdCtrls, JvEdit, JvValidateEdit, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TfrmAlterarPreco = class(TForm)
    Panel6: TPanel;
    Label3: TLabel;
    edtValor: TJvValidateEdit;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image3: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure Confirmar;
  public
    { Public declarations }

  end;

var
  frmAlterarPreco: TfrmAlterarPreco;

implementation

{$R *.dfm}

uses untImportarXML;

procedure TfrmAlterarPreco.Confirmar;
begin

   if edtValor.AsFloat <= 0.00 then Begin

     prcMsgAdv('Valor de venda não pode ser menor ou igual a zero.');
     Exit;

   End;

   frmImportarXML.qryItens.EdiT;
   frmImportarXML.qryItensPROD_VALOR_VENDA.AsFloat := edtValor.AsFloat;
   frmImportarXML.qryItens.Post;
   frmImportarXML.qryItens.Refresh;

   Close;

end;

procedure TfrmAlterarPreco.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case Key of

      VK_ESCAPE: close;
      VK_RETURN: Confirmar;

   end;

end;

procedure TfrmAlterarPreco.FormShow(Sender: TObject);
begin

   edtValor.SelectAll;

end;

procedure TfrmAlterarPreco.Image3Click(Sender: TObject);
begin

   close;

end;

procedure TfrmAlterarPreco.SpeedButton1Click(Sender: TObject);
begin

   Confirmar;

end;

end.
