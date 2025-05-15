unit untPreviaCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, baseLocalFormasPagamentoVO, generics.Collections,
  Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, unitConfiguracoes,
  baseLocalTotalTipoPagtoVO, baseLocalTotalTipoPagtoController;

type
  TfrmPreviaCaixa = class(TForm)
    edtData: TJvMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
  end;

var
  frmPreviaCaixa: TfrmPreviaCaixa;

implementation

{$R *.dfm}

uses untPrincipal;

{ TfrmPreviaCaixa }

procedure TfrmPreviaCaixa.Confirmar;
var
  i: Integer;
  movimento: TBaseLocalTotalTipoPagtoVO;
  TotalGerado: TObjectList<TBaseLocalFormasPagamentoVO>;
  Calculado, Declarado, Diferenca, Meio: AnsiString;
  TotCalculado, TotDeclarado, TotDiferenca, valor: Currency;
  Suprimento,Sangria,NaoFiscal,TotalVenda,Desconto,
  Acrescimo,Recebido,Troco,Cancelado,TotalFinal, SaldoCaixa, totalLiquido: AnsiString;
  texto, texto1, texto2: String;
begin
  {try

       Try
          // Trasnferindo Informações de Config para o CFe //

           frmPrincipal.PrepararImpressao;

          Texto := '';
          Texto := '</zera></ce>' +
                   '<n>FECHAMENTO DE CAIXA</n>'#10 +
                   '</linha_simples>'+#10+#10+
                   '</zera></ae>DATA DO MOVIMENTO : '+edtData.Text+#10+
                   '</zera></ae>DAta Do FECHAMENTO: '+DateToStr(Date)+#10+
                   '</zera></ae>OPERADOR: '+'DENNIS'+#10+
                   '</linha_simples>'+#10+#10;

       Except
          prcMsgAdv('Não foi possível imprimir o Encerramento do Movimento.');
          Exit;
       End;
    Suprimento := FloatToStrF(Movimento.TotalSuprimento,ffNumber,11,2);
    Suprimento := StringOfChar(' ', 13 - Length(Suprimento)) + Suprimento;
    Sangria    := FloatToStrF(Movimento.TotalSangria,ffNumber,11,2);
    Sangria    := StringOfChar(' ', 13 - Length(Sangria)) + Sangria;
    NaoFiscal  := FloatToStrF(Movimento.TotalNaoFiscal,ffNumber,11,2);
    NaoFiscal  := StringOfChar(' ', 13 - Length(NaoFiscal)) + NaoFiscal;

    Desconto   := FloatToStrF(Movimento.TotalDesconto,ffNumber,11,2);
    Desconto   := StringOfChar(' ', 13 - Length(Desconto)) + Desconto;
    Acrescimo  := FloatToStrF(Movimento.TotalAcrescimo,ffNumber,11,2);
    Acrescimo  := StringOfChar(' ', 13 - Length(Acrescimo)) + Acrescimo;
    Recebido   := FloatToStrF(Movimento.TotalRecebido,ffNumber,11,2);
    Recebido   := StringOfChar(' ', 13 - Length(Recebido)) + Recebido;
    Troco      := FloatToStrF(Movimento.TotalTroco,ffNumber,11,2);
    Troco      := StringOfChar(' ', 13 - Length(Troco)) + Troco;
    Cancelado  := FloatToStrF(Movimento.TotalCancelado,ffNumber,11,2);
    Cancelado  := StringOfChar(' ', 13 - Length(Cancelado)) + Cancelado;

    valor := 0.00;
    valor := Movimento.TotalVenda-Movimento.TotalDesconto;
    TotalVenda := FloatToStrF(valor,ffNumber,11,2);
    TotalVenda := StringOfChar(' ', 13 - Length(TotalVenda)) + TotalVenda;

    totalLiquido := FloatToStrF(Movimento.TotalVenda-Movimento.TotalCancelado-Movimento.TotalDesconto,ffNumber,11,2);
    totalLiquido := StringOfChar(' ', 13 - Length(totalLiquido)) + totalLiquido;

    TotalFinal := FloatToStrF(Movimento.TotalFinal,ffNumber,11,2);
    TotalFinal := StringOfChar(' ', 13 - Length(TotalFinal)) + TotalFinal;

    valor := 0.00;
    valor := Movimento.TotalVenda+Movimento.TotalSuprimento-Movimento.TotalSangria-Movimento.TotalCancelado-Movimento.TotalDesconto;
    SaldoCaixa := FloatToStrF(valor,ffNumber,11,2);
    SaldoCaixa := StringOfChar(' ', 13 - Length(SaldoCaixa)) + SaldoCaixa;

          texto1 := // '</zera></ae></logo>SANGRIA......: '+Sangria+#10+
                    // '</zera></ae></logo>NAO FISCAL...: '+NaoFiscal+#10+
                    '</zera></ae>TOTAL VENDA..: '+TotalVenda+#10+
                    // '</zera></ae></logo>DESCONTO.....: '+Desconto+#10+
                    // '</zera></ae></logo>ACRESCIMO....: '+Acrescimo+#10+
                    // '</zera></ae></logo>RECEBIDO.....: '+Recebido+#10+
                    // '</zera></ae></logo>TROCO........: '+Troco+#10+
                    '</zera></ae>CANCELADO....: '+Cancelado+#10+
                    '</zera></ae>VENDA LÍQUIDA: '+totalLiquido+#10+#10+
                    '</zera></ae>SUPRIMENTO...: '+Suprimento+#10+
                    '</zera></ae>SANGRIA......: '+Sangria+#10+
                    '</zera></ae>SALDO CAIXA..: '+SaldoCaixa+#10+#10+

                    '</zera></ad>CALCULADO  DECLARADO  DIFERENCA  '+#10;

    TotalGerado := TTotalTipoPagamentoController.EncerramentoTotal(Movimento.Id,1);

    if CDSResumo.Active then
      CDSResumo.EmptyDataSet
    else
      CDSResumo.CreateDataSet;

    //BY CLAUSQUELLER  - calcula a sangria e o suprimento.
    CDSResumo.Append;
    CDSResumoTIPO_PAGAMENTO.AsString := 'DINHEIRO';
    CDSResumoCALCULADO.AsFloat := Movimento.TotalSuprimento - movimento.TotalSangria;
    CDSResumo.Post;
    //****************************

    for i := 0 to Pred(TotalGerado.Count) do
    begin
      if CDSResumo.Locate('TIPO_PAGAMENTO',TMeiosPagamentoVO(TotalGerado.Items[I]).Descricao,[loCaseInsensitive]) then
      begin
        CDSResumo.Edit;
        CDSResumoCALCULADO.AsFloat := CDSResumoCALCULADO.AsFloat + TMeiosPagamentoVO(TotalGerado.Items[I]).Total;
        CDSResumo.Post;
      end
      else
      begin
        CDSResumo.Append;
        CDSResumoTIPO_PAGAMENTO.AsString := TMeiosPagamentoVO(TotalGerado.Items[I]).Descricao;
        CDSResumoCALCULADO.AsFloat := TMeiosPagamentoVO(TotalGerado.Items[I]).Total;
        CDSResumo.Post;
      end;
    end;

    {TotalDeclarado := TTotalTipoPagamentoController.EncerramentoTotal(Movimento.Id,2);

    for i := 0 to Pred(TotalDeclarado.Count) do
    begin
      if CDSResumo.Locate('TIPO_PAGAMENTO',TMeiosPagamentoVO(TotalDeclarado.Items[I]).Descricao,[loCaseInsensitive]) then
      begin
        CDSResumo.Edit;
        CDSResumoDECLARADO.AsFloat := CDSResumoDECLARADO.AsFloat + TMeiosPagamentoVO(TotalDeclarado.Items[I]).Total;
        CDSResumo.Post;
      end
      else
      begin
        CDSResumo.Append;
        CDSResumoTIPO_PAGAMENTO.AsString := TMeiosPagamentoVO(TotalDeclarado.Items[I]).Descricao;
        CDSResumoDECLARADO.AsFloat := TMeiosPagamentoVO(TotalDeclarado.Items[I]).Total;
        CDSResumo.Post;
      end;
    end;
    }
    //TotCalculado := 0;
   { TotDeclarado := 0;
    //TotDiferenca := 0;

    CDSResumo.First;

    while not CDSResumo.Eof do
    begin
      //Calculado := FloatToStrF(CDSResumoCALCULADO.AsFloat,ffNumber,9,2);
      //Calculado := StringOfChar(' ', 11 - Length(Calculado)) + Calculado;

      Declarado := FloatToStrF(CDSResumoDECLARADO.AsFloat,ffNumber,9,2);
      Declarado := StringOfChar(' ', 11 - Length(Declarado)) + Declarado;

      //Diferenca := FloatToStrF(CDSResumoDIFERENCA.AsFloat,ffNumber,9,2);
      //Diferenca := StringOfChar(' ', 11 - Length(Diferenca)) + Diferenca;

      Meio :=  fctPreencheEsquerda(15,' ',Copy(CDSResumoTIPO_PAGAMENTO.AsString,1,15));
      Meio := StringOfChar(' ', 10 - Length(Meio)) + Meio;

      //TotCalculado := TotCalculado + CDSResumoCALCULADO.AsFloat;
      TotDeclarado := TotDeclarado + CDSResumoDECLARADO.AsFloat;
      //TotDiferenca := TotDiferenca + CDSResumoDIFERENCA.AsFloat;

      texto1 := texto1 + '</zera></ae>'+(Meio+Calculado+Declarado+Diferenca)+#10;

      CDSResumo.Next;

    end;

    //DENNIS  FDataModule.ACBrECF.LinhaRelatorioGerencial(StringOfChar('-',48));

    //Calculado := FloatToStrF(TotCalculado,ffNumber,9,2);
    //Calculado := StringOfChar(' ', 12 - Length(Calculado)) + Calculado;
    Declarado := FloatToStrF(TotDeclarado,ffNumber,9,2);
    Declarado := StringOfChar(' ', 12 - Length(Declarado)) + Declarado;
    //Diferenca := FloatToStrF(TotDiferenca,ffNumber,9,2);
    //Diferenca := StringOfChar(' ', 12 - Length(Diferenca)) + Diferenca;

    texto1 := texto1 + '</linha_simples>'+#10+'</zera></ce>TOTAL......:'+Calculado+Declarado+Diferenca+#10+#10+#10+#10+
                       '</zera></ce>________________________________________'+#10+
                       '</zera></ce>VISTO DO CAIXA'+#10+#10+#10+
                       '</zera></ce>________________________________________'+#10+
                       '</zera></ce>VISTO DO SUPERVISOR'+#10+#10;

    frmPrincipal.ACBrPosPrinter1.ImprimirLinha(Texto+texto1+texto2 );
    frmPrincipal.ACBrPosPrinter1.CortarPapel(True);

  finally
    if Assigned(TotalGerado) then
      FreeAndNil(TotalGerado);
    if Assigned(TotalDeclarado) then
      FreeAndNil(TotalDeclarado);
  end; }
end;
end.
