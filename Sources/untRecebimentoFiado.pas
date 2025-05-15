unit untRecebimentoFiado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, untprincipal, acbrUtil,
  Vcl.StdCtrls, Vcl.DBCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, Vcl.Mask, unitConfiguracoes, BaseLocalEmpresaVO, BaseLocalEmpresaController,
  JvExMask, JvToolEdit, JvDBLookup, JvDBLookupComboEdit, JvExControls, baseLocalVendaCabecalhoVO, BaseLocalPedidoCabecalhoController,
  JvDBLookupTreeView, JvCombobox, JvDBCombobox, ACBrBase, ACBrEnterTab, baseLocalVendaCabecalhoController,
  Vcl.DBCGrids, Data.DB, Datasnap.DBClient, BaseLocalVendaDetalheController, BaseLocalVendaDetalheVO,
  BaseLocalTotalTipoPagtoController, BaseLocalTotalTipoPagtoVO, ACBrPosPrinter, generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, BaseLocalClientesController, BaseLocalClientesVO,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, BaseLocalFuncionariosController,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, BaseLocalFuncionariosVO,
  Vcl.Imaging.jpeg, JvExExtCtrls, JvExtComponent, JvPanel, FiadoVO, FiadoController;

type
  TfrmRecebimentoFiado = class(TForm)
    Panel1: TPanel;
    dtsPagamento: TDataSource;
    cdsPagamento: TClientDataSet;
    cdsPagamentoidPagamento: TIntegerField;
    cdsPagamentodescricao: TStringField;
    cdsPagamentovalor: TFloatField;
    cdsPagamentosequencia: TStringField;
    Label4: TLabel;
    qryFuncionarios: TFDQuery;
    qryFuncionariosID: TIntegerField;
    qryFuncionariosSTATUS: TStringField;
    qryFuncionariosCODIGO: TStringField;
    qryFuncionariosNOME: TStringField;
    qryFuncionariosPERCENTUAL_COMISSAO: TFloatField;
    Timer1: TTimer;
    Panel6: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Image3: TImage;
    edtRecebido: TJvValidateEdit;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    Label2: TLabel;
    DBText7: TDBText;
    DBText2: TDBText;
    Panel3: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image5: TImage;
    lkpFormaPG: TDBLookupComboBox;
    Panel4: TPanel;
    JvPanel1: TJvPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    lblTotalRecebido: TLabel;
    Image4: TImage;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvDBLookupComboEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBLookupComboEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtRecebidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lkpFormaPGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var ValorVenda, valorRecebido, valorRestante, valorTroco: double;
        sequencia: integer;
    procedure AtualizarTotais;
    procedure EfetuarPagamento;
    procedure GravarVenda;

  end;

var
  frmRecebimentoFiado: TfrmRecebimentoFiado;

implementation

{$R *.dfm}

uses untControleFiado;

procedure TfrmRecebimentoFiado.AtualizarTotais;
begin

   lblTotalRecebido.Caption := FormatFloat('###,#0.00', valorRecebido);

end;

procedure TfrmRecebimentoFiado.DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if key = VK_DELETE then Begin

      if ((Not(cdsPagamento.IsEmpty)) AND (edtRecebido.Enabled = True)) then Begin

         if fctMsgConfirmDefaultButtonNo('Confirma a exclusão do pagamento selecionado?') = false then
            Exit;

         valorRecebido := valorRecebido - cdsPagamentovalor.AsFloat;
         cdsPagamento.Delete;
         AtualizarTotais;
         cdsPagamento.Open;

      End;

   End;


end;

procedure TfrmRecebimentoFiado.edtRecebidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   case key of

      VK_RETURN: EfetuarPagamento;
      VK_F12: GravarVenda;

   end;

end;

procedure TfrmRecebimentoFiado.EfetuarPagamento;
begin

   if Trim(lkpFormaPG.Text) = '' then Begin
      prcMsgAdv('Informe a forma de pagamento.');
      lkpFormaPG.SetFocus;
      Exit;
   End;

   if edtRecebido.AsFloat <= 0 then Begin
      prcMsgAdv('Valor de Pagamento inválido.');
      edtRecebido.SelectAll;
      Exit;
   End;

   {
   if (((ValorVenda - valorRecebido - edtRecebido.AsFloat) < 0) AND (frmPrincipal.qryFormaPGPERMITE_TROCO.AsString <> 'S')) then Begin
      prcMsgAdv('Forma de pagamento não permite troco.');
      edtRecebido.SelectAll;
      exit;
   End;
   }

   valorRecebido := valorRecebido + edtRecebido.AsFloat;

   cdsPagamento.Append;
   cdsPagamentoidPagamento.AsInteger := lkpFormaPG.KeyValue;
   cdsPagamentodescricao.AsString    := Trim(lkpFormaPG.Text);
   cdsPagamentovalor.AsFloat         := edtRecebido.AsFloat;
   Inc(sequencia);
   cdsPagamentosequencia.AsString    := 'Del';
   cdsPagamento.Post;
   cdsPagamento.Open;

   AtualizarTotais;
   edtRecebido.Value := valorRestante;

   if lkpFormaPG.Enabled = True then Begin
      lkpFormaPG.SetFocus;
      Exit;
   End;



end;

procedure TfrmRecebimentoFiado.FormCreate(Sender: TObject);
begin

   cdsPagamento.Close;
   cdsPagamento.Open;

   frmPrincipal.qryFormaPG.Close;
   frmPrincipal.qryFormaPG.SQL.Clear;
   frmPrincipal.qryFormaPG.SQL.Add(' select id, prazo_parcelas, gerar_financeiro, status, nome, id_original, permite_troco, fidelidade, EMITIR_FISCAL, TIPO_PG_NFCE from formas_pagamento ');
   frmPrincipal.qryFormaPG.SQL.Add(' ORDER BY nome ');
   frmPrincipal.qryFormaPG.Open;

end;

procedure TfrmRecebimentoFiado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: GravarVenda;

   end;

end;

procedure TfrmRecebimentoFiado.FormShow(Sender: TObject);
begin

   //lkpFormaPG.SetFocus;

end;

procedure TfrmRecebimentoFiado.GravarVenda;
Var query: TFDQuery;
    idFiado: integer;
begin

   if cdsPagamento.IsEmpty then
      Exit;

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add(' INSERT INTO fiados ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' ID_VENDA, VALOR_VENDA, ID_CLIENTE, TIPO, DATA_PAGAMENTO ');
      query.SQL.Add(' ) ');
      query.SQL.Add(' VALUES ');
      query.SQL.Add(' ( ');
      query.SQL.Add(' 0, :VALOR_VENDA, :ID_CLIENTE, ''E'', :DATA_PAGAMENTO ');
      query.SQL.Add(' ) ');

      query.Params.ParamByName('VALOR_VENDA').AsFloat       := valorRecebido;
      query.Params.ParamByName('ID_CLIENTE').AsInteger      := frmControleFiado.qryClientesID.AsInteger;
      query.Params.ParamByName('DATA_PAGAMENTO').AsDateTime := Now;

      query.ExecSQL;

      lkpFormaPG.Enabled  := False;
      edtRecebido.Enabled := False;

      query.Close;
      query.SQL.Clear;
      query.SQL.Add(' SELECT MAX(id) AS id FROM fiados WHERE tipo = ''E'' ');
      query.Open;

      idFiado := query.FieldByName('id').AsInteger;

      cdsPagamento.First;

      while Not(cdsPagamento.Eof) do Begin

         query.Close;
         query.SQL.Clear;
         query.SQL.Add(' INSERT INTO recebimentos_fiado (id_recebimento, id_pagamento, valor) VALUES (:id_recebimento, :id_pagamento, :valor) ');
         query.Params.ParamByName('id_recebimento').AsInteger := idFiado;
         query.Params.ParamByName('id_pagamento').AsInteger   := cdsPagamentoidPagamento.AsInteger;
         query.Params.ParamByName('valor').AsFloat            := cdsPagamentovalor.AsFloat;

         Try
            query.ExecSQL;
            frmPrincipal.ConexaoLocal.Commit;
         Except
            frmPrincipal.ConexaoLocal.Rollback;
         End;

         cdsPagamento.Next;

      End;

      frmPrincipal.ImprimirComprovanteFiado(idFiado, frmControleFiado.qryClientesID.AsInteger, valorRecebido);
      frmControleFiado.Filtrar;

      Timer1.Enabled := True;

   Finally

      FreeAndNil(query)

   End;

end;

procedure TfrmRecebimentoFiado.Image1Click(Sender: TObject);
begin

   GravarVenda;

end;

procedure TfrmRecebimentoFiado.Image4Click(Sender: TObject);
begin

   CLOSE;

end;

procedure TfrmRecebimentoFiado.JvDBLookupComboEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if Not(Key in [#38..#40]) then
      Key := #0;

end;

procedure TfrmRecebimentoFiado.JvDBLookupComboEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin

   if Not(key in[#38..#40]) then
      key := #0;

end;

procedure TfrmRecebimentoFiado.lkpFormaPGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if key = VK_RETURN then Begin
      if Trim(lkpFormaPG.Text) = '' then Begin
         prcMsgAdv('Informe a forma de pagamento.');
         lkpFormaPG.SetFocus;
         Exit;
      End else
         edtRecebido.SetFocus;
   End;

end;

procedure TfrmRecebimentoFiado.Timer1Timer(Sender: TObject);
begin

   JvPanel1.Visible := True;
   Panel3.Visible   := FAlse;

   if JvPanel1.Color = $00666666 then
   begin
      JvPanel1.Color      := clWhite;
      JvPanel1.Font.Color := $00FF9933;
   end
   else
   begin
      JvPanel1.Font.Color := clWhite;
      JvPanel1.Color      := $00666666;
   end;

end;

end.
