unit untRelFiado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RLReport;

type
  TfrmRelFiado = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Label1: TLabel;
    SpeedButton5: TSpeedButton;
    edtProduto: TJvValidateEdit;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    chkPromocao: TCheckBox;
    CheckBox1: TCheckBox;
    qryRel: TFDQuery;
    dtsRel: TDataSource;
    Panel1: TPanel;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    lblFiltro01: TRLLabel;
    RLLabel1: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLBand3: TRLBand;
    RLLabel7: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel2: TRLLabel;
    RLBand5: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLGroup1: TRLGroup;
    qryRelID: TIntegerField;
    qryRelID_VENDA: TIntegerField;
    qryRelVALOR_VENDA: TFloatField;
    qryRelDATA_VENDA: TSQLTimeStampField;
    qryRelID_CLIENTE: TIntegerField;
    qryRelTIPO: TStringField;
    qryRelDATA_PAGAMENTO: TSQLTimeStampField;
    qryRelOBSERVACAO: TStringField;
    qryRelTOTAL_VENDA: TFloatField;
    qryRelDATA_HORA_VENDA: TSQLTimeStampField;
    qryRelID_VENDA_1: TIntegerField;
    qryRelNOME: TStringField;
    qryRelCELULAR: TStringField;
    qryRelDESCRICAO: TStringField;
    qryRelID_1: TIntegerField;
    qryRelVALOR_UNITARIO: TFloatField;
    qryRelQUANTIDADE: TFloatField;
    qryRelVALOR_TOTAL: TFloatField;
    RLBand6: TRLBand;
    RLDBText2: TRLDBText;
    RLBand7: TRLBand;
    RLDBText3: TRLDBText;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText4: TRLDBText;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Confirmar;
  end;

var
  frmRelFiado: TfrmRelFiado;

implementation

{$R *.dfm}

procedure TfrmRelFiado.Confirmar;
begin

   qryRel.Close;
   qryRel.SQL.Clear;
   qryRel.SQL.Add('   SELECT f.*, ');
   qryRel.SQL.Add('          vc.data_hora_venda, ');
   qryRel.SQL.Add('          f.id_venda, ');
   qryRel.SQL.Add('          c.nome, ');
   qryRel.SQL.Add('          c.celular, ');
   qryRel.SQL.Add('          p.descricao, ');
   qryRel.SQL.Add('          vd.id, ');
   qryRel.SQL.Add('          vd.valor_unitario, ');
   qryRel.SQL.Add('          vd.quantidade, ');
   qryRel.SQL.Add('          vd.valor_total ');
   qryRel.SQL.Add('     FROM fiados f inner join clientes c ON f.id_cliente = c.id ');
   qryRel.SQL.Add('                   left join venda_cabecalho vc on f.id_venda = vc.id  ');
   qryRel.SQL.Add('                   left join venda_detalhe vd ON f.id_venda = vd.id_venda_cabecalho ');
   qryRel.SQL.Add('                   left join produtos p on vd.id_produto = p.id ');
   qryRel.SQL.Add(' ORDER BY f.id DESC ');
   qryRel.Open;

   RLReport1.PreviewModal;

end;

procedure TfrmRelFiado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmRelFiado.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmRelFiado.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

end.
