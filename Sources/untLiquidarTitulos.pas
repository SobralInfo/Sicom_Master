unit untLiquidarTitulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExStdCtrls, JvEdit, JvValidateEdit,
  Vcl.Mask, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, unitConfiguracoes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmLiquidarTitulos = class(TForm)
    Panel3: TPanel;
    lblCaption: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label4: TLabel;
    edtClienteFornecedor: TEdit;
    Label5: TLabel;
    mkeDtVencimento: TMaskEdit;
    Label6: TLabel;
    edtValor: TJvValidateEdit;
    Label1: TLabel;
    mkeDtPagamento: TMaskEdit;
    Label2: TLabel;
    edtValorPago: TJvValidateEdit;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel2: TPanel;
    qryAUX: TFDQuery;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
  end;

var
  frmLiquidarTitulos: TfrmLiquidarTitulos;

implementation

{$R *.dfm}

uses untConsultarLancFinanceiros;

procedure TfrmLiquidarTitulos.Confirmar;
begin
   try
      StrToDate(mkeDtPagamento.Text);
   except
      prcMsgAdv('Data de Pagamento inválida.');
      mkeDtPagamento.SetFocus;
      exit;
   end;

   if StrToDate(mkeDtPagamento.Text) < StrToDate(mkeDtVencimento.Text) then
      begin
        prcMsgAdv('Data de pagamento não pode ser menor que a data de vencimento.');
        mkeDtPagamento.SetFocus;
        exit;
      end;

   if edtValorPago.AsFloat < edtValor.AsFloat then
      begin
        prcMsgAdv('Valor Pago não pode ser menor que o valor do documento.');
        edtValorPago.SetFocus;
        exit;
      end;

   try
      qryAUX.Close;
      qryAUX.SQL.Clear;
      qryAUX.SQL.Add('Update lancamentos_financeiros set status = ''P'', data_pagamento = :data_pagamento, valor_pago = :valor_pago where id = :id');
      qryAUX.Params.ParamByName('data_pagamento').AsDate := strtodate(mkeDtPagamento.Text);
      qryAUX.Params.ParamByName('valor_pago').AsFloat := edtValorPago.AsFloat;
      qryAUX.Params.ParamByName('id').AsInteger := frmConsultarLancFinanceiros.qryListagemID.AsInteger;
      qryAUX.ExecSQL;

      prcMsgInf('Título liquidado com sucesso.');
      frmConsultarLancFinanceiros.qryListagem.Refresh;
      close;
   except
      on e:exception do begin
         prcMsgErro('Falha ao liquidar o título.'+#13+e.Message);
      end;
   end;

end;

procedure TfrmLiquidarTitulos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: close;
      VK_F12: Confirmar;
   end;
end;

procedure TfrmLiquidarTitulos.Image1Click(Sender: TObject);
begin
   close;
end;

procedure TfrmLiquidarTitulos.Image3Click(Sender: TObject);
begin
   Confirmar;
end;

procedure TfrmLiquidarTitulos.Image4Click(Sender: TObject);
begin
   close;
end;

end.
