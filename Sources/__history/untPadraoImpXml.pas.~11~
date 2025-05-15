unit untPadraoImpXml;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit,
  JvValidateEdit, Vcl.Mask, Vcl.Buttons;

type
  TfrmPadraoImpXml = class(TForm)
    Label5: TLabel;
    edtValor: TJvValidateEdit;
    Label13: TLabel;
    edtUnidadeProduto: TMaskEdit;
    Label1: TLabel;
    edtUnidadeEntrada: TMaskEdit;
    SpeedButton1: TSpeedButton;
    speProduto: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure speProdutoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idUnidadeProduto, idUndEntrada: integer;
    idFatorEntrada, idFatorProduto: double;
  end;

var
  frmPadraoImpXml: TfrmPadraoImpXml;

implementation

{$R *.dfm}

uses untImportarXML, untPesquisarUnidades;

procedure TfrmPadraoImpXml.SpeedButton1Click(Sender: TObject);
begin
   frmImportarXML.qryItens.First;
   while not frmImportarXML.qryItens.Eof do begin
      frmImportarXML.qryItens.EdiT;
      frmImportarXML.qryItensPROD_VALOR_VENDA.AsFloat := edtValor.AsFloat;
      frmImportarXML.qryItensPROD_ID_UNIDADE_PRODUTO.AsInteger := idUnidadeProduto;
      frmImportarXML.qryItensPROD_ID_UNIDADE_ENTRADA.AsInteger := idUnidadeProduto;
      frmImportarXML.qryItenscalUnidadeProd.AsString := edtUnidadeProduto.Text+' (x'+
                                                        FormatFloat('#0.00',idFatorProduto)+')';
      frmImportarXML.qryItenscalcUnidadeEntrada.AsString := edtUnidadeEntrada.Text+' (x'+
                                                            FormatFloat('#0.00',idFatorEntrada)+')';
      frmImportarXML.qryItens.Post;
      frmImportarXML.qryItens.Next;
   end;
   frmImportarXML.Refresh;
   close;
end;

procedure TfrmPadraoImpXml.SpeedButton2Click(Sender: TObject);
begin
   Application.CreateForm(TfrmPesquisarUnidades, frmPesquisarUnidades);
   frmPesquisarUnidades.origem := 'PADRAO_XML_ENTRADA';
   frmPesquisarUnidades.ShowModal;
end;

procedure TfrmPadraoImpXml.speProdutoClick(Sender: TObject);
begin
   Application.CreateForm(TfrmPesquisarUnidades, frmPesquisarUnidades);
   frmPesquisarUnidades.origem := 'PADRAO_XML_PRODUTO';
   frmPesquisarUnidades.ShowModal;
end;

end.
