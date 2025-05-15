unit untExportarVendasFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, untPrincipal,
  Vcl.StdCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,  Math, unitConfiguracoes,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, RxDBCtrl, ACBrBase, ACBrValidador;

type
  TfrmExportarVendasFinanceiro = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    GridList: TRxDBGrid;
    qryListagem: TFDQuery;
    dtsListagem: TDataSource;
    qryListagemDATA: TSQLTimeStampField;
    qryListagemBRUTO: TFloatField;
    qryListagemACRESCIMO: TFloatField;
    qryListagemDESCONTO: TFloatField;
    qryListagemTOTAL: TFloatField;
    Panel1: TPanel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    qryAUX1: TFDQuery;
    qryAUX2: TFDQuery;
    ACBrValidador1: TACBrValidador;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
  end;

var
  frmExportarVendasFinanceiro: TfrmExportarVendasFinanceiro;

implementation

{$R *.dfm}

procedure TfrmExportarVendasFinanceiro.Confirmar;
var qtdeParcelas, contador, contaFinanceira, idClientePadrao, prazo, i, idCliente : integer;
    nomeCliente, NomeClientePadrao: string;
    usouTroco, permiteTroco: boolean;
    transacao: TFDTransaction;
begin
   qryAUX1.Close;
   qryAUX1.SQL.Clear;
   qryAUX1.SQL.Add('select cl.id, cl.nome from clientes cl inner join configuracoes c on cl.id = c.id_cli_padrao_lanc_financ');
   qryAUX1.Open;

   if qryAUX1.IsEmpty then
      begin
         prcMsgAdv('Cliente padrão para lançamento financeiro não cadastrado.');
         exit;
      end;

   idClientePadrao := qryAUX1.FieldByName('id').AsInteger;
   NomeClientePadrao := trim(qryAUX1.FieldByName('nome').AsString);

   qryAUX1.Close;
   qryAUX1.SQL.Clear;
   qryAUX1.SQL.Add('select cf.id, cf.descricao from contas_financeiras cf inner join configuracoes c on cf.id = c.id_conta_financeira_padrao');
   qryAUX1.Open;

   if qryAUX1.IsEmpty then
      begin
         prcMsgAdv('Conta Financeira padrão para lançamento financeiro não cadastrada.');
         exit;
      end;

   contaFinanceira := qryAUX1.FieldByName('id').AsInteger;

   if qryListagem.IsEmpty then
      begin
        prcMsgAdv('Nenhum registro para ser exportado.');
        exit;
      end;

   if fctMsgConfirmDefaultButtonYes('Confirma a exportação das vendas para o financeiro?') = false then
      exit;

   while not qryListagem.Eof do
      begin
         qryAUX1.Close;
         qryAUX1.SQL.Clear;
         qryAUX1.SQL.Add('  select ttp.*, vc.id_cliente, vc.troco ');
         qryAUX1.SQL.Add('    from total_tipo_pgto ttp inner join venda_cabecalho vc on ttp.id_venda_cabecalho = vc.id and vc.exportado_financeiro = ''N'' and vc.status = ''F'' ');
         qryAUX1.SQL.Add('   where vc.data_hora_venda >= :data1 and vc.data_hora_venda <=:data2 ');
         qryAUX1.Params.ParamByName('data1').AsDateTime := StrToDateTime(Copy(qryListagemDATA.AsString,1,10)+' 00:00:00');
         qryAUX1.Params.ParamByName('data2').AsDateTime := StrToDateTime(Copy(qryListagemDATA.AsString,1,10)+' 23:59:59');
         qryAUX1.Open;

         prazo := 0;
         permiteTroco := false;

         if trim(qryAUX1.FieldByName('ID_FORMA_PAGAMENTO').AsString) <> '' then
            begin
               qryAUX2.Close;
               qryAUX2.SQL.Clear;
               qryAUX2.SQL.Add('SELECT Coalesce(prazo_parcelas,0) as prazo, permite_troco FROM formas_pagamento where id = ' + qryAUX1.FieldByName('ID_FORMA_PAGAMENTO').AsString);
               qryAUX2.Open;

               if not(qryAUX2.IsEmpty) then begin
                  prazo := qryAUX2.FieldByName('prazo').AsInteger;
                  permiteTroco := qryAUX2.FieldByName('permite_troco').AsBoolean;
               end;
            end;

         usouTroco := false;


         while not qryAUX1.Eof do
            begin
              if qryAUX1.FieldByName('id_forma_pagamento').AsInteger > 0 then
                 begin
                   qtdeParcelas := qryAUX1.fieldbyname('qtde_parcelas').asinteger;
                   contador := 0;

                   if qryAUX1.FieldByName('id_cliente').AsInteger > 0 then
                      begin
                         qryAUX2.Close;
                         qryAUX2.SQL.Clear;
                         qryAUX2.SQL.Add('select cl.id, cl.nome from clientes cl where cl.id = ' + qryAUX1.FieldByName('id_cliente').AsString );
                         qryAUX2.Open;

                         if not qryAUX2.IsEmpty then
                            begin
                              idCliente := qryAUX2.FieldByName('id').AsInteger;
                              NomeCliente:= trim(qryAUX2.FieldByName('nome').AsString);
                            end;
                      end
                   else
                      begin
                         idCliente := idClientePadrao;
                         nomeCliente := NomeClientePadrao;
                      end;

                   for I := 0 to qtdeParcelas - 1 do
                        begin
                           transacao := TFDTransaction.Create(frmPrincipal.ConexaoLocal);
                           transacao.Connection := frmPrincipal.ConexaoLocal;
                           transacao.StartTransaction;
                           try
                              inc(contador);
                              qryAUX2.Close;
                              qryAUX2.SQL.Clear;
                              qryAUX2.SQL.Add(' INSERT INTO lancamentos_financeiros ');
                              qryAUX2.SQL.Add(' (  ');
                              qryAUX2.SQL.Add(' id_conta_financeira, id_cliente_fornecedor, descricao_cliente_fornecedor, ');
                              qryAUX2.SQL.Add(' tipo_cliente_fornecedor, descricao_documento, data_vencimento, data_entrada, ');
                              qryAUX2.SQL.Add(' valor_documento, observacoes, status, tipo_lancamento, parcela, id_forma_pagto ');
                              qryAUX2.SQL.Add(' )    ');
                              qryAUX2.SQL.Add(' VALUES   ');
                              qryAUX2.SQL.Add(' (    ');
                              qryAUX2.SQL.Add(' :id_conta_financeira, :id_cliente_fornecedor, :descricao_cliente_fornecedor, ');
                              qryAUX2.SQL.Add(' :tipo_cliente_fornecedor, :descricao_documento, :data_vencimento, :data_entrada, ');
                              qryAUX2.SQL.Add(' :valor_documento, :observacoes, ''A'', ''R'', :parcela, :id_forma_pagto ');
                              qryAUX2.SQL.Add(' )  ');
                              qryAUX2.Params.ParamByName('data_entrada').AsDateTime := qryListagemDATA.AsDateTime;
                              qryAUX2.Params.ParamByName('id_conta_financeira').AsInteger := contaFinanceira;
                              qryAUX2.Params.ParamByName('id_cliente_fornecedor').AsInteger := idCliente;
                              qryAUX2.Params.ParamByName('descricao_cliente_fornecedor').AsString := Trim(NomeCliente);
                              qryAUX2.Params.ParamByName('tipo_cliente_fornecedor').AsString := 'C';
                              qryAUX2.Params.ParamByName('descricao_documento').AsString := 'Venda ' + Trim(qryAUX1.fieldByname('id_venda_cabecalho').asstring);
                              qryAUX2.Params.ParamByName('data_vencimento').AsDate := qryListagemDATA.AsDateTime + (prazo  * contador);

                              if (( qryAUX1.FieldByName('troco').AsFloat > 0 ) and ( not usouTroco )) then
                                 begin
                                    qryAUX2.Params.ParamByName('valor_documento').AsFloat := SimpleRoundTo((qryAUX1.FieldByName('valor').AsFloat -
                                                                                                            qryAUX1.FieldByName('troco').AsFloat) /qtdeParcelas, -2);
                                    usouTroco := true;
                                 end
                              else
                                 qryAUX2.Params.ParamByName('valor_documento').AsFloat := SimpleRoundTo(qryAUX1.FieldByName('valor').AsFloat/qtdeParcelas, -2);

                              qryAUX2.Params.ParamByName('parcela').AsString := contador.ToString + '/' + qtdeParcelas.ToString;
                              qryAUX2.Params.ParamByName('observacoes').AsString := '';
                              qryAUX2.Params.ParamByName('id_forma_pagto').AsInteger := qryAUX1.fieldByname('ID_FORMA_PAGAMENTO').asinteger;
                              qryAUX2.ExecSQL;

                              if qtdeParcelas = (I+1) then
                                 begin
                                    qryAUX2.Close;
                                    qryAUX2.SQL.Clear;
                                    qryAUX2.SQL.Add(' update venda_cabecalho set exportado_financeiro = ''S'' where id = ' + qryAUX1.fieldByname('id_venda_cabecalho').asstring);
                                    qryAUX2.ExecSQL;
                                 end;

                              transacao.Commit;
                           except
                              transacao.Rollback;
                           end;
                        end;
                 end
              else
                  begin
                    if qtdeParcelas = 1 then
                       begin
                          qryAUX2.Close;
                          qryAUX2.SQL.Clear;
                          qryAUX2.SQL.Add(' update venda_cabecalho set exportado_financeiro = ''S'' where id = ' + qryAUX1.fieldByname('id_venda_cabecalho').asstring);
                          qryAUX2.ExecSQL;
                       end;
                  end;
               qryAUX1.Next;
            end;

         qryListagem.Next;
         GridList.SetFocus;
         Application.ProcessMessages;
      end;
   qryListagem.Refresh;
   prcMsgInf('Registros exportados com sucesso.');

end;

procedure TfrmExportarVendasFinanceiro.FormCreate(Sender: TObject);
begin
   qryListagem.Close;
   qryListagem.Open;
end;

procedure TfrmExportarVendasFinanceiro.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: close;
      VK_F12: Confirmar;
   end;
end;

procedure TfrmExportarVendasFinanceiro.Image1Click(Sender: TObject);
begin
   close;
end;

procedure TfrmExportarVendasFinanceiro.Image3Click(Sender: TObject);
begin
   Confirmar;
end;

procedure TfrmExportarVendasFinanceiro.Image4Click(Sender: TObject);
begin
   close;
end;

end.
