unit untRelVendasPorFormaPG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf, unitConfiguracoes,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, RLFilters, RLPDFFilter, Vcl.Imaging.pngimage,
  Vcl.DBCtrls;

type
  TfrmRelVendasPorFormaPG = class(TForm)
    dtpDataIni: TDateTimePicker;
    dtpDataFim: TDateTimePicker;
    Panel1: TPanel;
    rlSintetico: TRLReport;
    qryRelAnal: TFDQuery;
    dtsRelAnal: TDataSource;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    qryAUX: TFDQuery;
    GroupBox1: TGroupBox;
    rdbAnalitico: TRadioButton;
    rdbSintetico: TRadioButton;
    lblPeriodo: TRLLabel;
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
    Panel5: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    qryRelAnalCLIENTE: TStringField;
    qryRelAnalFORMA_PG: TStringField;
    qryRelAnalDATA_HORA_VENDA: TSQLTimeStampField;
    qryRelAnalVALOR: TFloatField;
    qryRelAnalDESCONTO: TFloatField;
    qryRelAnalACRESCIMO: TFloatField;
    qryRelAnalVALOR_FINAL: TFloatField;
    qryRelSint: TFDQuery;
    dtsRelSint: TDataSource;
    qryRelSintFORMA_PG: TStringField;
    qryRelSintVALOR: TFloatField;
    qryRelSintDESCONTO: TFloatField;
    qryRelSintACRESCIMO: TFloatField;
    qryRelSintVALOR_FINAL: TFloatField;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand3: TRLBand;
    RLDBResult1: TRLDBResult;
    rlAnalitico: TRLReport;
    RLBand6: TRLBand;
    RLLabel2: TRLLabel;
    lblPeriodo2: TRLLabel;
    RLBand7: TRLBand;
    RLSystemInfo2: TRLSystemInfo;
    RLGroup2: TRLGroup;
    qryRelAnalID_PEDIDO: TIntegerField;
    RLGroup3: TRLGroup;
    RLBand8: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLBand10: TRLBand;
    RLDBResult2: TRLDBResult;
    RLBand9: TRLBand;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLBand11: TRLBand;
    RLDBText12: TRLDBText;
    RLBand12: TRLBand;
    RLBand13: TRLBand;
    RLBand14: TRLBand;
    RLDBResult3: TRLDBResult;
    RLBand15: TRLBand;
    RLBand16: TRLBand;
    RLLabel8: TRLLabel;
    RLDBText13: TRLDBText;
    RLLabel15: TRLLabel;
    lkpFormaPG: TDBLookupComboBox;
    Label4: TLabel;
    qryFormaPG: TFDQuery;
    dtsFormaPG: TDataSource;
    qryFormaPGID: TIntegerField;
    qryFormaPGNOME: TStringField;
    chkSangria: TCheckBox;
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
  frmRelVendasPorFormaPG: TfrmRelVendasPorFormaPG;

implementation

{$R *.dfm}

uses untPrincipal;

procedure TfrmRelVendasPorFormaPG.Confirmar;
Var qtde, valor: double;
begin

   if dtpDataIni.Date > dtpDataFim.Date then Begin

      prcMsgAdv('Data inicial não pode ser maior que a data final.');
      Exit;

   End;

   if rdbAnalitico.Checked then Begin

      qryRelAnal.Close;
      qryRelAnal.SQL.Clear;
      qryRelAnal.SQL.Add('      SELECT Coalesce(cl.nome, ''Cliente não informado'') AS cliente,  ');
      qryRelAnal.SQL.Add('             case when ttp.id_forma_pagamento > 0 then ');
      qryRelAnal.SQL.Add('               fp.nome ');
      qryRelAnal.SQL.Add('              else ');
      qryRelAnal.SQL.Add('               ''FIADO''  ');
      qryRelAnal.SQL.Add('             end as forma_pg, ');
      qryRelAnal.SQL.Add('             c.data_hora_venda, ');
      qryRelAnal.SQL.Add('             ttp.valor, ');
      qryRelAnal.SQL.Add('             c.desconto, ');
      qryRelAnal.SQL.Add('             c.acrescimo, ');
      qryRelAnal.SQL.Add('             ttp.valor as valor_final, ');
      qryRelAnal.SQL.Add('             c.id as id_pedido ');
      qryRelAnal.SQL.Add('        FROM venda_cabecalho c  ');
      qryRelAnal.SQL.Add('             LEFT JOIN clientes cl ON c.id_cliente = cl.id ');
      qryRelAnal.SQL.Add('             LEFT JOIN total_tipo_pgto ttp ON c.id = ttp.id_venda_cabecalho ');
      qryRelAnal.SQL.Add('             left join formas_pagamento fp ON ttp.id_forma_pagamento = fp.id ');
      qryRelAnal.SQL.Add('       WHERE c.status = ''F'' ');
      qryRelAnal.SQL.Add('         AND c.data_hora_venda between :dtIni AND :dtFim ');

      if lkpFormaPG.KeyValue >= 0 then
      qryRelAnal.SQL.Add('         AND ttp.ID_FORMA_PAGAMENTO = '+IntToStr(lkpFormaPG.KeyValue));

      qryRelAnal.SQL.Add(' union ');

      qryRelAnal.SQL.Add('      SELECT ''Suprimento - Entrada'' AS cliente,  ');
      qryRelAnal.SQL.Add('             fp.nome as forma_pg, ');
      qryRelAnal.SQL.Add('             su.data as data_hora_venda, ');
      qryRelAnal.SQL.Add('             su.valor, ');
      qryRelAnal.SQL.Add('             0.00 as desconto, ');
      qryRelAnal.SQL.Add('             0.00 as acrescimo, ');
      qryRelAnal.SQL.Add('             su.valor as valor_final, ');
      qryRelAnal.SQL.Add('             0 as id_pedido ');
      qryRelAnal.SQL.Add('        FROM suprimento su ');
      qryRelAnal.SQL.Add('             inner join formas_pagamento fp on su.id_forma_pg = fp.id  ');
      qryRelAnal.SQL.Add('       WHERE su.data between :dtIni AND :dtFim ');

      if lkpFormaPG.KeyValue >= 0 then
      qryRelAnal.SQL.Add('         AND su.ID_FORMA_Pg = '+IntToStr(lkpFormaPG.KeyValue));

      if chkSangria.Checked then
        begin
          qryRelAnal.SQL.Add(' union ');

          qryRelAnal.SQL.Add('SELECT sa.descricao AS cliente, ');
          qryRelAnal.SQL.Add('       ''SANGRIA'' as forma_pg, ');
          qryRelAnal.SQL.Add('       sa.data as data_hora_venda, ');
          qryRelAnal.SQL.Add('       sa.valor, ');
          qryRelAnal.SQL.Add('       0.00 as desconto, ');
          qryRelAnal.SQL.Add('       0.00 as acrescimo, ');
          qryRelAnal.SQL.Add('       sa.valor as valor_final, ');
          qryRelAnal.SQL.Add('       0 as id_pedido ');
          qryRelAnal.SQL.Add('  FROM sangria sa ');
          qryRelAnal.SQL.Add(' WHERE sa.data between :dtIni AND :dtFim ');
        end;

      qryRelAnal.SQL.Add('       ORDER BY 1, 2  ');
      qryRelAnal.Params.ParamByName('dtIni').AsDateTime := StrToDateTime(datetostr(dtpDataIni.Date)+' 00:00:00');
      qryRelAnal.Params.ParamByName('dtfim').AsDateTime := StrToDateTime(datetostr(dtpDataFim.Date)+' 23:59:59');
      qryRelAnal.Open;

      if Not(qryRelAnal.IsEmpty) then Begin

         lblPeriodo2.Caption          := 'Período: '+DateToStr(dtpDataIni.Date)+' à '+DateToStr(dtpDataFim.Date);
         rlAnalitico.PreviewModal;

      End else
         prcMsgAdv('Nenhum registro localizado no período.');

   End else Begin

      qryRelSint.Close;
      qryRelSint.SQL.Clear;
      qryRelSint.SQL.Add('  SELECT case when ttp.id_forma_pagamento > 0 then  ');
      qryRelSint.SQL.Add('           fp.nome ');
      qryRelSint.SQL.Add('              else ');
      qryRelSint.SQL.Add('           ''FIADO'' ');
      qryRelSint.SQL.Add('           end as forma_pg, ');
      qryRelSint.SQL.Add('           SUM(ttp.valor) as valor,  ');
      qryRelSint.SQL.Add('           SUM(c.desconto) as desconto,  ');
      qryRelSint.SQL.Add('           SUM(c.acrescimo) as acrescimo,   ');
      qryRelSint.SQL.Add('           SUM(ttp.valor) as valor_final ');
      qryRelSint.SQL.Add('      FROM venda_cabecalho c ');
      qryRelSint.SQL.Add('           LEFT JOIN clientes cl ON c.id_cliente = cl.id ');
      qryRelSint.SQL.Add('           LEFT JOIN total_tipo_pgto ttp ON c.id = ttp.id_venda_cabecalho  ');
      qryRelSint.SQL.Add('           left join formas_pagamento fp ON ttp.id_forma_pagamento = fp.id ');
      qryRelSint.SQL.Add('     WHERE c.status = ''F''  ');
      qryRelSint.SQL.Add('       AND c.data_hora_venda between :dtIni AND :dtFim ');

      if lkpFormaPG.KeyValue >= 0 then
      qryRelSint.SQL.Add('       AND ttp.ID_FORMA_PAGAMENTO = '+IntToStr(lkpFormaPG.KeyValue));

      qryRelSint.SQL.Add('  GROUP BY fp.nome, ttp.id_forma_pagamento, forma_pg ');

      qryRelSint.SQL.Add('  UNION ');

      qryRelSint.SQL.Add('    SELECT fp.nome as forma_pg, ');
      qryRelSint.SQL.Add('           SUM(su.valor) as valor,  ');
      qryRelSint.SQL.Add('           SUM(0.00) as desconto,  ');
      qryRelSint.SQL.Add('           SUM(0.00) as acrescimo,   ');
      qryRelSint.SQL.Add('           SUM(su.valor) as valor_final ');
      qryRelSint.SQL.Add('      FROM suprimento su ');
      qryRelSint.SQL.Add('           inner join formas_pagamento fp on su.id_forma_pg = fp.id  ');
      qryRelSint.SQL.Add('     WHERE su.data between :dtIni AND :dtFim ');

      if lkpFormaPG.KeyValue >= 0 then
      qryRelSint.SQL.Add('       AND SU.ID_FORMA_PG = '+IntToStr(lkpFormaPG.KeyValue));

      if chkSangria.Checked then
        begin
          qryRelSint.SQL.Add(' union ');

          qryRelSint.SQL.Add('SELECT sa.descricao AS cliente, ');
          qryRelSint.SQL.Add('       ''SANGRIA'' as forma_pg, ');
          qryRelSint.SQL.Add('       sa.data as data_hora_venda, ');
          qryRelSint.SQL.Add('       sa.valor, ');
          qryRelSint.SQL.Add('       0.00 as desconto, ');
          qryRelSint.SQL.Add('       0.00 as acrescimo, ');
          qryRelSint.SQL.Add('       sa.valor as valor_final, ');
          qryRelSint.SQL.Add('       0 as id_pedido ');
          qryRelSint.SQL.Add('  FROM sangria sa ');
          qryRelSint.SQL.Add(' WHERE sa.data between :dtIni AND :dtFim ');
        end;

      qryRelSint.SQL.Add('  GROUP BY fp.nome ');

      qryRelSint.SQL.Add('  ORDER BY 1 ');

      qryRelSint.Params.ParamByName('dtIni').AsDateTime := StrToDateTime(datetostr(dtpDataIni.Date)+' 00:00:00');
      qryRelSint.Params.ParamByName('dtfim').AsDateTime := StrToDateTime(datetostr(dtpDataFim.Date)+' 23:59:59');
      qryRelSint.Open;

      if Not(qryRelSint.IsEmpty) then Begin

         lblPeriodo.Caption          := 'Período: '+DateToStr(dtpDataIni.Date)+' à '+DateToStr(dtpDataFim.Date);
         rlSintetico.PreviewModal;

      End else
         prcMsgAdv('Nenhum registro localizado no período.');
   End;

end;

procedure TfrmRelVendasPorFormaPG.FormCreate(Sender: TObject);
begin

   dtpDataIni.Date := Date;
   dtpDataFim.Date := Date;

   qryFormaPG.Close;
   qryFormaPG.Open;

   lkpFormaPG.KeyValue := -1;

end;

procedure TfrmRelVendasPorFormaPG.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmRelVendasPorFormaPG.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmRelVendasPorFormaPG.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmRelVendasPorFormaPG.Image4Click(Sender: TObject);
begin

   close;

end;

end.
