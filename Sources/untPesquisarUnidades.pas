unit untPesquisarUnidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, unitConfiguracoes,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Mask, Vcl.Imaging.pngimage, BaseLocalUnidadesVO,
  Vcl.ExtCtrls, RxDBCtrl;

type
  TfrmPesquisarUnidades = class(TForm)
    Panel1: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    mkeDescricao: TMaskEdit;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    JvDBGrid1: TRxDBGrid;
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure mkeDescricaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarUnidades: TfrmPesquisarUnidades;

implementation

{$R *.dfm}

uses untPrincipal, untCadastrarUnidades, untImportarXML, untPadraoImpXml;

procedure TfrmPesquisarUnidades.Confirmar;
begin

   if frmPrincipal.qryUnidades.IsEmpty then Begin
      prcMsgAdv('Selecione uma unidade.');
      EXit;
   End;

   if origem = 'NOTA_ENTRADA_PRODUTO' then Begin

      frmImportarXML.qryItens.Edit;
      frmImportarXML.qryItensPROD_ID_UNIDADE_PRODUTO.AsInteger := frmPrincipal.qryUnidadesID.AsInteger;
      frmImportarXML.qryItenscalUnidadeProd.AsString := frmPrincipal.qryUnidadesSIGLA.AsString+' (x'+
                                                        FormatFloat('#0.00',frmPrincipal.qryUnidadesFATOR.AsFloat)+')';
      frmImportarXML.qryItens.Post;

      frmImportarXML.qryItens.Refresh;

   End;

   if origem = 'NOTA_ENTRADA' then Begin

      frmImportarXML.qryItens.Edit;
      frmImportarXML.qryItensPROD_ID_UNIDADE_ENTRADA.AsInteger := frmPrincipal.qryUnidadesID.AsInteger;
      frmImportarXML.qryItensFATOR_UNIDADE.AsInteger           := frmPrincipal.qryUnidadesFATOR.AsInteger;
      frmImportarXML.qryItenscalcUnidadeEntrada.AsString       := frmPrincipal.qryUnidadesSIGLA.AsString+' (x'+
                                                                  FormatFloat('#0.00',frmPrincipal.qryUnidadesFATOR.AsFloat)+')';
      frmImportarXML.qryItens.Post;

      frmImportarXML.qryItens.Refresh;

   End;

   if origem = 'PADRAO_XML_PRODUTO' then Begin

      frmPadraoImpXml.idUnidadeProduto := frmPrincipal.qryUnidadesID.AsInteger;
      frmPadraoImpXml.idFatorProduto   := frmPrincipal.qryUnidadesFATOR.AsFloat;
      frmPadraoImpXml.edtUnidadeProduto.Text := frmPrincipal.qryUnidadesSIGLA.AsString;

   End;

   if origem = 'PADRAO_XML_ENTRADA' then Begin

      frmPadraoImpXml.idUndEntrada    := frmPrincipal.qryUnidadesID.AsInteger;
      frmPadraoImpXml.idFatorEntrada  := frmPrincipal.qryUnidadesFATOR.AsFloat;
      frmPadraoImpXml.edtUnidadeEntrada.Text := frmPrincipal.qryUnidadesSIGLA.AsString;

   End;

   if origem = 'CADASTRO_UNIDADES' then Begin

      frmCadastrarUnidades.HabilitarDesabilitarBotoes('E');
      frmCadastrarUnidades.HabilitarDesabilitarCampos('H');
      frmCadastrarUnidades.LimparCampos;
      frmCadastrarUnidades.DAO := 'U';

      if frmPrincipal.qryUnidadesSTATUS.AsString = 'A' then
         frmCadastrarUnidades.cbbStatus.ItemIndex := 0
      else
         frmCadastrarUnidades.cbbStatus.ItemIndex := 1;

      if frmPrincipal.qryUnidadesPODE_FRACIONAR.AsString = 'S' then
         frmCadastrarUnidades.cbbFracionar.ItemIndex := 0
      else
         frmCadastrarUnidades.cbbFracionar.ItemIndex := 1;

      frmCadastrarUnidades.edtDescricao.Text := Trim(frmPrincipal.qryUnidadesDESCRICAO.AsString);
      frmCadastrarUnidades.edtSigla.Text     := Trim(frmPrincipal.qryUnidadesSIGLA.AsString);
      frmCadastrarUnidades.edtFator.AsFloat  := frmPrincipal.qryUnidadesFATOR.AsFloat;
      frmCadastrarUnidades.idUnidade         := frmPrincipal.qryUnidadesID.AsInteger;

   End;

   close;

end;

procedure TfrmPesquisarUnidades.Filtrar;
begin

   frmPrincipal.qryUnidades.Close;
   frmPrincipal.qryUnidades.Filtered := False;

   if origem = 'CADASTRO_UNIDADES' then
      frmPrincipal.qryUnidades.Filter := ' UPPER(descricao) LIKE '+QuotedStr(UpperCase(Trim(mkeDescricao.Text))+'%')
   else
      frmPrincipal.qryUnidades.Filter := ' status = ''A'' AND UPPER(descricao) LIKE '+QuotedStr(UpperCase(Trim(mkeDescricao.Text))+'%');

   frmPrincipal.qryUnidades.Filtered := True;

   frmPrincipal.qryUnidades.Open;

   lblTotal.Caption := 'Total de Unidades: '+frmPrincipal.qryUnidades.RecordCount.ToString;

   frmPrincipal.qryUnidades.First;

end;

procedure TfrmPesquisarUnidades.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_F12: Confirmar;
      VK_ESCAPE: Close;

   end;

end;

procedure TfrmPesquisarUnidades.FormShow(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarUnidades.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarUnidades.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarUnidades.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarUnidades.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarUnidades.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarUnidades.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   case key of

      VK_DOWN: JvDBGrid1.SetFocus;

   end;

end;

end.
