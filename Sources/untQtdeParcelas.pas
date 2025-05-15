unit untQtdeParcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, unitConfiguracoes,
  JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TfrmQtdeParcelas = class(TForm)
    Label1: TLabel;
    edtParcelas: TJvValidateEdit;
    Panel1: TPanel;
    Label4: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    procedure edtParcelasKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQtdeParcelas: TfrmQtdeParcelas;

implementation

{$R *.dfm}

uses untFinalizarVenda;

procedure TfrmQtdeParcelas.edtParcelasKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      begin
         if edtParcelas.AsFloat <= 0 then
            begin
              prcMsgAdv('Informe a quantidade de parcelas.');
              exit;
            end;
         frmFinalizarVenda.qtdeParcelas := edtParcelas.AsInteger;
         close;
      end;
end;

end.
