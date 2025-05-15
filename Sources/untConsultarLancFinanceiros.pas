unit untConsultarLancFinanceiros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, unitConfiguracoes,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, RxDBCtrl, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmConsultarLancFinanceiros = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    qryListagem: TFDQuery;
    dtsListagem: TDataSource;
    qryListagemID: TIntegerField;
    qryListagemID_CONTA_FINANCEIRA: TIntegerField;
    qryListagemID_CLIENTE_FORNECEDOR: TIntegerField;
    qryListagemDESCRICAO_CLIENTE_FORNECEDOR: TStringField;
    qryListagemTIPO_CLIENTE_FORNECEDOR: TStringField;
    qryListagemDESCRICAO_DOCUMENTO: TStringField;
    qryListagemDATA_VENCIMENTO: TSQLTimeStampField;
    qryListagemDATA_ENTRADA: TSQLTimeStampField;
    qryListagemVALOR_DOCUMENTO: TFloatField;
    qryListagemOBSERVACOES: TStringField;
    qryListagemSTATUS: TStringField;
    qryListagemDATA_PAGAMENTO: TSQLTimeStampField;
    qryListagemVALOR_PAGO: TFloatField;
    qryListagemID_TOTAL_TIPO_PAGTO: TIntegerField;
    PopupMenu1: TPopupMenu;
    NovoLa1: TMenuItem;
    EditarLanamento1: TMenuItem;
    CancelarLanamento1: TMenuItem;
    N1: TMenuItem;
    FiltrarConsulta1: TMenuItem;
    Panel6: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    lblFiltroClienteFornecedor: TLabel;
    lblFiltrosPeriodo: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblTotalReceitas: TLabel;
    lblTotalDespesas: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lblSaldo: TLabel;
    Label11: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Panel4: TPanel;
    Panel7: TPanel;
    GridList: TRxDBGrid;
    qryListagemTIPO_LANCAMENTO: TStringField;
    qryListagemCONTAFINANCEIRA: TStringField;
    qryListagemTIPOLANCAMENTO: TStringField;
    lblStatus: TLabel;
    Label18: TLabel;
    DBText1: TDBText;
    qryListagemcalcStatus: TStringField;
    DBText2: TDBText;
    DBText3: TDBText;
    Label19: TLabel;
    Label20: TLabel;
    DBText4: TDBText;
    qryAUX: TFDQuery;
    qryListagemPARCELA: TStringField;
    Label4: TLabel;
    Label21: TLabel;
    DBText5: TDBText;
    N2: TMenuItem;
    LiquidarTtuloSelecionado1: TMenuItem;
    LiquidarTtulosConsultados1: TMenuItem;
    qryListagemID_FORMA_PAGTO: TIntegerField;
    qryListagemFORMAPAGTO: TStringField;
    Label23: TLabel;
    Label25: TLabel;
    DBText6: TDBText;
    procedure NovoLa1Click(Sender: TObject);
    procedure EditarLanamento1Click(Sender: TObject);
    procedure FiltrarConsulta1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure GridListDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qryListagemCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure CancelarLanamento1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LiquidarTtuloSelecionado1Click(Sender: TObject);
    procedure LiquidarTtulosConsultados1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dtFiltroIni, dtFiltroFim: TDate;
    idClienteFornecedor, idStatus: integer;
    tipoClienteFornecedor: string;
  end;

var
  frmConsultarLancFinanceiros: TfrmConsultarLancFinanceiros;

implementation

{$R *.dfm}

uses untLancamentoFinanceiro, untPrincipal, untFiltrarLancFinanceiros,
  untLiquidarTitulos;

procedure TfrmConsultarLancFinanceiros.CancelarLanamento1Click(Sender: TObject);
begin
   if qryListagem.IsEmpty then
      begin
        prcmsgAdv('Selecione um registro.');
        exit;
      end;

   if trim(qryListagemSTATUS.AsString) = 'P' then
      begin
        prcMsgAdv('Registro já consta como pago.');
        exit;
      end;

   if trim(qryListagemSTATUS.AsString) = 'C' then
      begin
        prcMsgAdv('Registro já consta como cancelado.');
        exit;
      end;

   if fctMsgConfirmDefaultButtonYes('Confirma o cancelamento do registro selecionado?') = false then
      exit;

   qryAUX.Close;
   qryAUX.SQL.Clear;
   qryAUX.SQL.Add('Update LANCAMENTOS_FINANCEIROS set status = ''C'' where id = ' + qryListagemID.AsString);

   try
      qryAUX.ExecSQL;
      prcMsgInf('Registro cancelado com sucesso.');
      qryListagem.Refresh;
   except
      prcMsgErro('Falha ao cancelar o registro');
   end;

   qryListagem.Refresh;

end;

procedure TfrmConsultarLancFinanceiros.EditarLanamento1Click(Sender: TObject);
begin
   if qryListagem.IsEmpty then
      begin
        prcmsgAdv('Selecione um registro.');
        exit;
      end;

   if trim(qryListagemSTATUS.AsString) = 'P' then
      begin
        prcMsgAdv('Registro consta como pago.');
        exit;
      end;

   if trim(qryListagemSTATUS.AsString) = 'C' then
      begin
        prcMsgAdv('Registro consta como cancelado.');
        exit;
      end;

   Application.CreateForm(TfrmLancamentoFinanceiro, frmLancamentoFinanceiro);
   frmLancamentoFinanceiro.Novo;
   frmLancamentoFinanceiro.DAO := 'U';
   frmLancamentoFinanceiro.idLancamento := qryListagemID.AsInteger;
   frmLancamentoFinanceiro.idClienteFornecedor := qryListagemID_CLIENTE_FORNECEDOR.AsInteger;
   frmLancamentoFinanceiro.lkpContaFinanceira.KeyValue := qryListagemID_CONTA_FINANCEIRA.AsInteger;
   if qryListagemTIPO_CLIENTE_FORNECEDOR.AsString = 'C' then
      frmLancamentoFinanceiro.rdbCliente.Checked := true
   else
      frmLancamentoFinanceiro.rdbFornecedor.Checked := true;
   frmLancamentoFinanceiro.edtClienteFornecedor.Text := trim(qryListagemDESCRICAO_CLIENTE_FORNECEDOR.AsString);
   frmLancamentoFinanceiro.edtDocumento.Text := trim(qryListagemDESCRICAO_DOCUMENTO.AsString);
   frmLancamentoFinanceiro.mkeVencimento.Text := trim(qryListagemDATA_VENCIMENTO.AsString);
   frmLancamentoFinanceiro.edtValor.AsFloat := qryListagemVALOR_DOCUMENTO.AsFloat;
   frmLancamentoFinanceiro.mmoObservacoes.Lines.Text := trim(qryListagemOBSERVACOES.AsString);
   frmLancamentoFinanceiro.edtParcela.Text := trim(qryListagemPARCELA.AsString);
   frmLancamentoFinanceiro.ShowModal;
end;

procedure TfrmConsultarLancFinanceiros.FiltrarConsulta1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmFiltrarLancFinanceiros, frmFiltrarLancFinanceiros);
   frmFiltrarLancFinanceiros.mkeDtIni.Text := DateToStr(dtFiltroIni);
   frmFiltrarLancFinanceiros.mkeDtFim.Text := DateToStr(dtFiltroFim);

   if tipoClienteFornecedor = 'C' then
      frmFiltrarLancFinanceiros.rdbCliente.Checked := true
   else
      frmFiltrarLancFinanceiros.rdbFornecedor.Checked := true;

   frmFiltrarLancFinanceiros.edtClienteFornecedor.Text := trim(lblFiltroClienteFornecedor.Caption);
   frmFiltrarLancFinanceiros.idClienteFornecedor := idClienteFornecedor;

   frmFiltrarLancFinanceiros.cbbStatus.ItemIndex := idStatus;

   frmFiltrarLancFinanceiros.ShowModal;
end;

procedure TfrmConsultarLancFinanceiros.FormCreate(Sender: TObject);
begin
   dtFiltroIni := date;
   dtFiltroFim := date;
   tipoClienteFornecedor := 'C';
   idClienteFornecedor := 0;
   idStatus := 0;
   lblFiltrosPeriodo.Caption := DateToStr(date) + ' à ' + DateToStr(date);
   qryListagem.Close;
   qryListagem.Open;
end;

procedure TfrmConsultarLancFinanceiros.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: close;
   end;
end;

procedure TfrmConsultarLancFinanceiros.GridListDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   {
   if gdSelected in State then
    Begin
      GridList.Canvas.FillRect(Rect);
      GridList.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
   else
   }
   if ((not qryListagem.Eof) and (qryListagemSTATUS.AsString = 'P')) then
    begin
       GridList.canvas.font.color := $00A00000;
       GridList.Canvas.FillRect(Rect);
       GridList.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
   else
   if ((not qryListagem.Eof) and (qryListagemSTATUS.AsString = 'A') and (qryListagemDATA_VENCIMENTO.AsDateTime < date)) then
    begin
       GridList.canvas.font.color := $000404FF;
       GridList.Canvas.FillRect(Rect);
       GridList.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
   else
   if ((not qryListagem.Eof) and (qryListagemSTATUS.AsString = 'C')) then
    begin
       GridList.canvas.font.color := $007300E6;
       GridList.Canvas.FillRect(Rect);
       GridList.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
   else if ((not qryListagem.Eof) and (qryListagemSTATUS.AsString = 'A') and (qryListagemDATA_VENCIMENTO.AsDateTime >= date)) then
    begin
       GridList.canvas.font.color := $006E6E6E;
       GridList.Canvas.FillRect(Rect);
       GridList.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

    if gdSelected in State then Begin
       if ((not qryListagem.Eof) and (qryListagemSTATUS.AsString = 'P')) then
         GridList.Canvas.Brush.Color := $00A00000
       else if ((not qryListagem.Eof) and (qryListagemSTATUS.AsString = 'A') and (qryListagemDATA_VENCIMENTO.AsDateTime < date)) then
         GridList.Canvas.Brush.Color := $000404FF
       else if ((not qryListagem.Eof) and (qryListagemSTATUS.AsString = 'C')) then
         GridList.Canvas.Brush.Color := $007300E6
       else if ((not qryListagem.Eof) and (qryListagemSTATUS.AsString = 'A') and (qryListagemDATA_VENCIMENTO.AsDateTime >= date)) then
         GridList.Canvas.Brush.Color := $006E6E6E;
       GridList.Canvas.font.Color := clWhite;
       GridList.Canvas.FillRect(Rect);
       GridList.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmConsultarLancFinanceiros.Image1Click(Sender: TObject);
begin
   close;
end;

procedure TfrmConsultarLancFinanceiros.LiquidarTtulosConsultados1Click(
  Sender: TObject);
begin
   if qryListagem.IsEmpty then
      begin
        prcmsgAdv('Selecione um registro.');
        exit;
      end;

   if fctMsgConfirmDefaultButtonYes('Confirma a liquidação dos títulos listados?') = false then
      exit;

   qryListagem.First;

   while not(qryListagem.Eof) do
      begin
         if qryListagemSTATUS.AsString = 'A' then
            begin
               qryAUX.Close;
               qryAUX.SQL.Clear;
               qryAUX.SQL.Add('Update lancamentos_financeiros set status = ''P'', data_pagamento = :data_pagamento, valor_pago = :valor_pago where id = :id');
               qryAUX.Params.ParamByName('data_pagamento').AsDate := qryListagemDATA_VENCIMENTO.AsDateTime;
               qryAUX.Params.ParamByName('valor_pago').AsFloat := qryListagemVALOR_DOCUMENTO.AsFloat;
               qryAUX.Params.ParamByName('id').AsInteger := qryListagemID.AsInteger;
               qryAUX.ExecSQL;
            end;

         qryListagem.Refresh;
         GridList.SetFocus;
         Application.ProcessMessages;

         qryListagem.Next;
      end;
   qryListagem.First;
end;

procedure TfrmConsultarLancFinanceiros.LiquidarTtuloSelecionado1Click(
  Sender: TObject);
begin
   if qryListagem.IsEmpty then
      begin
        prcmsgAdv('Selecione um registro.');
        exit;
      end;

   if trim(qryListagemSTATUS.AsString) = 'P' then
      begin
        prcMsgAdv('Registro consta como pago.');
        exit;
      end;

   if trim(qryListagemSTATUS.AsString) = 'C' then
      begin
        prcMsgAdv('Registro consta como cancelado.');
        exit;
      end;

   if fctMsgConfirmDefaultButtonYes('Confirma a liquidação do título selecionado?') = false then
      exit;

   Application.CreateForm(TfrmLiquidarTitulos, frmLiquidarTitulos);
   frmLiquidarTitulos.edtClienteFornecedor.Text := trim(qryListagemDESCRICAO_CLIENTE_FORNECEDOR.AsString);
   frmLiquidarTitulos.mkeDtVencimento.Text := qryListagemDATA_VENCIMENTO.AsString;
   frmLiquidarTitulos.edtValor.AsFloat := qryListagemVALOR_DOCUMENTO.AsFloat;
   frmLiquidarTitulos.ShowModal;
end;

procedure TfrmConsultarLancFinanceiros.NovoLa1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmLancamentoFinanceiro, frmLancamentoFinanceiro);
   frmLancamentoFinanceiro.Novo;
   frmLancamentoFinanceiro.ShowModal;
end;

procedure TfrmConsultarLancFinanceiros.qryListagemCalcFields(DataSet: TDataSet);
begin
  if qryListagemSTATUS.AsString = 'P' then
   qryListagemcalcStatus.AsString := 'PAGO'
  else if ((qryListagemSTATUS.AsString = 'A') and (qryListagemDATA_VENCIMENTO.AsDateTime < date)) then
   qryListagemcalcStatus.AsString := 'ATRASO'
  else if qryListagemSTATUS.AsString = 'C' then
   qryListagemcalcStatus.AsString := 'CANCELADO'
  else
   qryListagemcalcStatus.AsString := 'ABERTO';
end;

end.
