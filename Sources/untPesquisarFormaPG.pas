unit untPesquisarFormaPG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, JvExDBGrids, JvDBGrid, unitConfiguracoes,
  Vcl.Imaging.pngimage, BaseLocalFormasPagamentoController, BaseLocalFormasPagamentoVO,
  RxDBCtrl;

type
  TfrmPesquisarFormaPG = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    mkeDescricao: TMaskEdit;
    Panel2: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    JvDBGrid1: TRxDBGrid;
    procedure mkeDescricaoChange(Sender: TObject);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure JvDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarFormaPG: TfrmPesquisarFormaPG;

implementation

{$R *.dfm}

uses untPrincipal, untCadastrarFormaPG, untFinalizarVenda;

procedure TfrmPesquisarFormaPG.Confirmar;
begin

   if frmPrincipal.qryFormaPG.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   frmCadastrarFormaPG.HabilitarDesabilitarBotoes('E');
   frmCadastrarFormaPG.HabilitarDesabilitarCampos('H');
   frmCadastrarFormaPG.LimparCampos;
   frmCadastrarFormaPG.DAO := 'U';

   if frmPrincipal.qryFormaPGSTATUS.AsString = 'A' then
      frmCadastrarFormaPG.cbbStatus.ItemIndex := 0
   else
      frmCadastrarFormaPG.cbbStatus.ItemIndex := 1;

   if frmPrincipal.qryFormaPGPERMITE_TROCO.AsString = 'S' then
      frmCadastrarFormaPG.cbbTroco.ItemIndex := 0
   else
      frmCadastrarFormaPG.cbbTroco.ItemIndex := 1;

   frmCadastrarFormaPG.edtDescricao.Text := Trim(frmPrincipal.qryFormaPGNOME.AsString);
   frmCadastrarFormaPG.idFormaPG         := frmPrincipal.qryFormaPGID.AsInteger;

   case frmPrincipal.qryFormaPGTIPO_PG_NFCE.AsInteger of
      1: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 0;
      2: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 1;
      3: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 2;
      4: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 3;
      5: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 4;
      10: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 5;
      11: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 6;
      12: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 7;
      13: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 8;
      15: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 9;
      16: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 10;
      17: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 11;
      18: frmCadastrarFormaPG.cbbTipoPgNFCe.ItemIndex := 12;
   end;

   if frmPrincipal.qryFormaPGEMITIR_FISCAL.AsString = 'S' then
      frmCadastrarFormaPG.cbbEmitirNFCe.ItemIndex := 0
   else
      frmCadastrarFormaPG.cbbEmitirNFCe.ItemIndex := 1;

   if frmPrincipal.qryFormaPGGERAR_FINANCEIRO.AsString = 'S' then
      frmCadastrarFormaPG.cbBfINANCEIRO.ItemIndex := 0
   else
      frmCadastrarFormaPG.cbBfINANCEIRO.ItemIndex := 1;

   frmCadastrarFormaPG.edtPrazo.AsInteger := frmPrincipal.qryFormaPGPRAZO_PARCELAS.AsInteger;

   close;

end;

procedure TfrmPesquisarFormaPG.Filtrar;
begin

   frmPrincipal.qryFormaPG.close;
   frmPrincipal.qryFormaPG.Filtered := False;
   frmPrincipal.qryFormaPG.Filter := ' UPPER(nome) LIKE '+QuotedStr(UpperCase(Trim(mkeDescricao.Text))+'%');
   frmPrincipal.qryFormaPG.Filtered := True;
   frmPrincipal.qryFormaPG.Open;

   lblTotal.Caption := 'Total de Formas de Pagamento: '+frmPrincipal.qryFormaPG.RecordCount.ToString;
   frmPrincipal.qryFormaPG.First;

end;

procedure TfrmPesquisarFormaPG.FormCreate(Sender: TObject);
begin

   if Assigned(frmFinalizarVenda) then Begin

      frmPrincipal.qryFormaPG.Close;
      frmPrincipal.qryFormaPG.SQL.Clear;
      frmPrincipal.qryFormaPG.SQL.Add(' select id, prazo_parcelas, gerar_financeiro, status, nome, id_original, permite_troco, FIDELIDADE, EMITIR_FISCAL, TIPO_PG_NFCE from formas_pagamento WHERE STATUS = ''A'' ');
      frmPrincipal.qryFormaPG.SQL.Add(' UNION ');
      frmPrincipal.qryFormaPG.SQL.Add(' SELECT 0 AS ID, 0 as prazo_parcelas, ''N'' as gerar_financeiro, ''A'', status, ''FIADO'' AS nome, null id_original, ''N'' AS permite_troco, NULL AS FIDELIDADE, '''' EMITIR_FISCAL, '''' TIPO_PG_NFCE FROM configuracoes ');
      frmPrincipal.qryFormaPG.SQL.Add(' ORDER BY 3 ');
      frmPrincipal.qryFormaPG.Open;

   End else Begin

      frmPrincipal.qryFormaPG.Close;
      frmPrincipal.qryFormaPG.SQL.Clear;
      frmPrincipal.qryFormaPG.SQL.Add(' select id, prazo_parcelas, gerar_financeiro, status, nome, id_original, permite_troco, fidelidade, EMITIR_FISCAL, TIPO_PG_NFCE from formas_pagamento ');
      frmPrincipal.qryFormaPG.SQL.Add(' ORDER BY nome ');
      frmPrincipal.qryFormaPG.Open;

   End;

   Filtrar;

end;

procedure TfrmPesquisarFormaPG.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: confirmar;

   end;

end;

procedure TfrmPesquisarFormaPG.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarFormaPG.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarFormaPG.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarFormaPG.JvDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case Key of

      VK_RETURN: Confirmar;

   end;

end;

procedure TfrmPesquisarFormaPG.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarFormaPG.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_DOWN then
      JvDBGrid1.SetFocus;

end;

end.
