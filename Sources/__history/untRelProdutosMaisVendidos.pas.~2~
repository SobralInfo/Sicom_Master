unit untRelProdutosMaisVendidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf, unitConfiguracoes,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, RLFilters, RLPDFFilter, Vcl.Imaging.pngimage;

type
  TfrmRelProdutosMaisVendidos = class(TForm)
    dtpDataIni: TDateTimePicker;
    dtpDataFim: TDateTimePicker;
    Panel1: TPanel;
    rlRelatorio: TRLReport;
    dtsRel: TDataSource;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    qryAUX: TFDQuery;
    lblPeriodo: TRLLabel;
    RLBand4: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel7: TRLLabel;
    RLBand5: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLPDFFilter1: TRLPDFFilter;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    qryRel: TFDQuery;
    qryRelDESCRICAO_PRODUTO: TStringField;
    qryRelTOTAL: TFloatField;
    RLDBResult1: TRLDBResult;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
  end;

var
  frmRelProdutosMaisVendidos: TfrmRelProdutosMaisVendidos;

implementation

{$R *.dfm}

uses untPrincipal;

procedure TfrmRelProdutosMaisVendidos.Confirmar;
Var qtde, valor: double;
begin

   if dtpDataIni.Date > dtpDataFim.Date then Begin

      prcMsgAdv('Data inicial não pode ser maior que a data final.');
      Exit;

   End;

   qryRel.Close;
   qryRel.SQL.Clear;

   qryRel.SQL.Add('   SELECT d.descricao_produto, ');
   qryRel.SQL.Add('          SUM(d.quantidade) AS total ');
   qryRel.SQL.Add('     FROM venda_cabecalho c, ');
   qryRel.SQL.Add('          venda_detalhe d, ');
   qryRel.SQL.Add('          produtos p  ');
   qryRel.SQL.Add('    WHERE c.id = d.id_venda_cabecalho ');
   qryRel.SQL.Add('      AND d.id_produto = p.id ');
   qryRel.SQL.Add('      AND c.status = ''F'' ');
   qryRel.SQL.Add('      AND c.data_hora_venda BETWEEN :dtIni AND :dtfim ');
   qryRel.SQL.Add('     GROUP BY d.descricao_produto, d.quantidade  ');
   qryRel.SQL.Add('     ORDER BY SUM(d.quantidade) DESC ');

   qryRel.Params.ParamByName('dtIni').AsDateTime := StrToDateTime(datetostr(dtpDataIni.Date)+' 00:00:00');
   qryRel.Params.ParamByName('dtfim').AsDateTime := StrToDateTime(datetostr(dtpDataFim.Date)+' 23:59:59');

   qryRel.Open;

   if Not(qryRel.IsEmpty) then Begin

      lblPeriodo.Caption          := 'Período: '+DateToStr(dtpDataIni.Date)+' à '+DateToStr(dtpDataFim.Date);
      rlRelatorio.PreviewModal;

   End else
      prcMsgAdv('Nenhum registro localizado no período.');

end;

procedure TfrmRelProdutosMaisVendidos.FormCreate(Sender: TObject);
begin

   dtpDataIni.Date := Date;
   dtpDataFim.Date := Date;

end;

procedure TfrmRelProdutosMaisVendidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmRelProdutosMaisVendidos.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmRelProdutosMaisVendidos.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmRelProdutosMaisVendidos.Image4Click(Sender: TObject);
begin

   close;

end;

end.
