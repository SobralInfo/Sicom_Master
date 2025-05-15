unit untPequisarEntradaManual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask, unitConfiguracoes,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, JvExDBGrids, JvDBGrid, untBiblioteca,
  Vcl.Imaging.pngimage, Vcl.Buttons, RxDBCtrl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPequisarEntradaManual = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    lblTotal: TLabel;
    mkeDescricao: TMaskEdit;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    imgNovo: TImage;
    JvDBGrid1: TRxDBGrid;
    qryEntrada: TFDQuery;
    dtsEntrada: TDataSource;
    qryEntradaID: TIntegerField;
    qryEntradaDATA_PEDIDO: TSQLTimeStampField;
    qryEntradaDATA_CHEGADA: TSQLTimeStampField;
    qryEntradaNUMERO_NOTA: TStringField;
    qryEntradaID_FORNECEDOR: TIntegerField;
    qryEntradaSTATUS: TStringField;
    qryEntradaOUTROS: TFloatField;
    qryEntradaDESCONTO: TFloatField;
    qryEntradaFRETE: TFloatField;
    qryEntradaVALOR_NOTA: TFloatField;
    qryEntradaID_USUARIO: TIntegerField;
    qryEntradaSERIE: TStringField;
    qryEntradaCHAVE_NFE: TStringField;
    qryEntradaTP_NF: TStringField;
    qryEntradaVALOR_TOTAL_NOTA: TFloatField;
    qryEntradaQTD_PROD: TIntegerField;
    qryEntradaID_1: TIntegerField;
    qryEntradaID_CABECALHO: TIntegerField;
    qryEntradaID_PRODUTO: TIntegerField;
    qryEntradaSEQUENCIA: TIntegerField;
    qryEntradaQTREAL: TFloatField;
    qryEntradaVL_UNITARIO: TFloatField;
    qryEntradaVL_FRETE: TFloatField;
    qryEntradaVL_IPI: TFloatField;
    qryEntradaVL_ICMS: TFloatField;
    qryEntradaVL_DESCONTO: TFloatField;
    qryEntradaVL_ICMS_SUBST: TFloatField;
    qryEntradaVL_ISENTO: TFloatField;
    qryEntradaVL_PIS: TFloatField;
    qryEntradaVL_COFINS: TFloatField;
    qryEntradaVL_SEGURO: TFloatField;
    qryEntradaVL_OUTROS: TFloatField;
    qryEntradaCODIGO_ORIGEM: TStringField;
    qryEntradaUND: TStringField;
    qryEntradaFATOR_UNIDADE: TFloatField;
    qryEntradaPROD_ID_UNIDADE_PRODUTO: TIntegerField;
    qryEntradaPROD_ID_UNIDADE_ENTRADA: TIntegerField;
    qryEntradaPROD_DESCRICAO: TStringField;
    qryEntradaPROD_VALOR_VENDA: TFloatField;
    qryEntradaNOME: TStringField;
    qryEntradaDESCRICAO: TStringField;
    qryGrid: TFDQuery;
    dtsGrid: TDataSource;
    qryGridID: TIntegerField;
    qryGridDATA_PEDIDO: TSQLTimeStampField;
    qryGridDATA_CHEGADA: TSQLTimeStampField;
    qryGridNUMERO_NOTA: TStringField;
    qryGridID_FORNECEDOR: TIntegerField;
    qryGridSTATUS: TStringField;
    qryGridOUTROS: TFloatField;
    qryGridDESCONTO: TFloatField;
    qryGridFRETE: TFloatField;
    qryGridVALOR_NOTA: TFloatField;
    qryGridID_USUARIO: TIntegerField;
    qryGridSERIE: TStringField;
    qryGridCHAVE_NFE: TStringField;
    qryGridTP_NF: TStringField;
    qryGridVALOR_TOTAL_NOTA: TFloatField;
    qryGridQTD_PROD: TIntegerField;
    qryGridNOME: TStringField;
    procedure mkeDescricaoChange(Sender: TObject);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Image4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPequisarEntradaManual: TfrmPequisarEntradaManual;

implementation

{$R *.dfm}

uses untPrincipal, untEntradaManual;

procedure TfrmPequisarEntradaManual.Confirmar;
begin

   if qryGrid.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   if origem = 'ENTRADA_MANUAL' then Begin

      qryEntrada.Close;
      qryEntrada.SQL.Clear;
      qryEntrada.SQL.Add('  SELECT c.*, ');
      qryEntrada.SQL.Add('         d.*, ');
      qryEntrada.SQL.Add('         f.nome, ');
      qryEntrada.SQL.Add('         p.descricao  ');
      qryEntrada.SQL.Add('    FROM nota_entrada_cabecalho c, ');
      qryEntrada.SQL.Add('         nota_entrada_detalhe d, ');
      qryEntrada.SQL.Add('         fornecedores f, ');
      qryEntrada.SQL.Add('         produtos p ');
      qryEntrada.SQL.Add('   WHERE c.id = d.id_cabecalho ');
      qryEntrada.SQL.Add('     AND c.id_fornecedor = f.id ');
      qryEntrada.SQL.Add('    AND d.id_produto = p.id ');
      qryEntrada.SQL.Add('    and c.id = '+qryGridID.AsString);
      qryEntrada.Open;

      frmEntradaManual.Novo;

      frmEntradaManual.edtFornecedor.Text := Trim(qryEntradaNOME.AsString);
      frmEntradaManual.idFornecedor       := qryEntradaID_FORNECEDOR.AsInteger;
      frmEntradaManual.edtNumeroNota.Text := Trim(qryEntradaNUMERO_NOTA.AsString);
      frmEntradaManual.lblEntrada.caption := 'Entrada realizada em '+FormatDateTime('DD/MM/YYYY', qryEntradaDATA_CHEGADA.AsDateTime);

      qryEntrada.First;
      frmEntradaManual.qryGrid.Close;
      frmEntradaManual.qryGrid.Open;

      while Not(qryEntrada.Eof) do Begin

        frmEntradaManual.qryGrid.Append;

        frmEntradaManual.qryGridID.AsInteger           := frmEntradaManual.qryGrid.RecordCount + 1;
        frmEntradaManual.qryGridDESCRICAO.AsString     := Trim(qryEntradaDESCRICAO.AsString);
        frmEntradaManual.qryGridVALOR_UNITARIO.AsFloat := qryEntradaVL_UNITARIO.AsFloat;
        frmEntradaManual.qryGridQUANTIDADE.AsFloat     := qryEntradaQTREAL.AsFloat;
        frmEntradaManual.qryGridVALOR_TOTAL.AsFloat    := (qryEntradaVL_UNITARIO.AsFloat*qryEntradaQTREAL.AsFloat);
        frmEntradaManual.qryGridID_PRODUTO.AsInteger   := qryEntradaID_PRODUTO.AsInteger;
        frmEntradaManual.qryGridVALOR_VENDA.AsFloat    := qryEntradaPROD_VALOR_VENDA.AsFloat;
        frmEntradaManual.qryGridID_UNIDADE.AsInteger   := qryEntradaPROD_ID_UNIDADE_PRODUTO.AsInteger;
        frmEntradaManual.qryGridFATOR.AsFloat          := 1.00;
        frmEntradaManual.qryGridUNIDADE.AsString       := qryEntradaUND.AsString;

        Try
           frmEntradaManual.qryGrid.Post;
           frmEntradaManual.AtualizarTotal(qryEntradaVL_UNITARIO.AsFloat*qryEntradaQTREAL.AsFloat);
           frmEntradaManual.idProduto := 0;
           frmEntradaManual.idUnidade := 0;
           frmEntradaManual.unidade   := '';
           frmEntradaManual.edtProduto.Text := '';
           frmEntradaManual.edtValor.AsFloat := 0.00;
           frmEntradaManual.edtQtde.AsFloat  := 0.00;
           frmEntradaManual.edtTotal.AsFloat := 0.00;
           frmEntradaManual.qryGrid.First;
        Except
        End;

        qryEntrada.Next;

      End;

      frmEntradaManual.habilitarDesabilitarCampos('D');
      frmEntradaManual.speNovo.Enabled := True;
      frmEntradaManual.speSalvar.Enabled := False;

   End;

   close;

end;

procedure TfrmPequisarEntradaManual.Filtrar;
begin

   qryGrid.Filtered := False;
   qryGrid.Filter := ' NOME like '+QuotedStr('%'+Trim(Copy(mkeDescricao.Text,1,13))+'%');
   qryGrid.Filtered := True;

   lblTotal.Caption := 'Total de Entradas: '+qryGrid.RecordCount.ToString;
   qryGrid.First;

end;

procedure TfrmPequisarEntradaManual.FormCreate(Sender: TObject);
begin

   Try
      qryGrid.Close;
      qryGrid.Open;
   Except
      qryGrid.Close;
      qryGrid.Open;
   End;

end;

procedure TfrmPequisarEntradaManual.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_F12, VK_RETURN: Confirmar;
      VK_ESCAPE: close;

   end;

end;

procedure TfrmPequisarEntradaManual.FormShow(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPequisarEntradaManual.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPequisarEntradaManual.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPequisarEntradaManual.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPequisarEntradaManual.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPequisarEntradaManual.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_DOWN then
      JvDBGrid1.SetFocus;

end;

procedure TfrmPequisarEntradaManual.RxDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

end.
