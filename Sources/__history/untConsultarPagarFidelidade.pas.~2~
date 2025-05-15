unit untConsultarPagarFidelidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, RxToolEdit,
  RxCurrEdit, Vcl.ExtCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, unitConfiguracoes;

type
  TfrmConsultarPagarFidelidade = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    PnlCab: TPanel;
    LblTitulo: TLabel;
    EdCpfCliFid: TMaskEdit;
    EdNomCliFid: TMaskEdit;
    EdPntCliFid: TMaskEdit;
    EdPntDinCliFid: TMaskEdit;
    EdValDisVen: TMaskEdit;
    edtValor: TJvValidateEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarPagarFidelidade: TfrmConsultarPagarFidelidade;

implementation

{$R *.dfm}

uses untFinalizarVenda;

procedure TfrmConsultarPagarFidelidade.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: begin
                    frmFinalizarVenda.lkpFormaPG.KeyValue := 0;
                    close;
                 end;

   end;

end;

procedure TfrmConsultarPagarFidelidade.edtValorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_RETURN then begin

      if edtValor.AsFloat > StringParaFloat(EdValDisVen.Text) then begin
         prcMsgAdv('Valor informado maior que o valor disponível.');
         exit;
      end;

      frmFinalizarVenda.edtRecebido.Value := edtValor.AsFloat;
      frmFinalizarVenda.EfetuarPagamento;
      close;

   end;

end;

end.
