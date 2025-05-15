unit untEntradaXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrDFe, ACBrNFe, pcnConversao, pcnConversaoNFe,
  ACBrDFeSSL, BaseLocalEmpresaVO, BaseLocalEmpresaController, BaseLocalParametrosController,
  BaseLocalParametrosVO, Vcl.Buttons, Xml.xmldom, Xml.XMLIntf, firedac.Comp.Client, DateUtils ,
  Xml.XMLDoc, Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, unitConfiguracoes,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.DBCGrids, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  RLReport;

type
  TfrmEntradaXML = class(TForm)
    ACBrNFe: TACBrNFe;
    dtsNFe: TDataSource;
    qryNFe: TFDQuery;
    qryNFeCODIGO: TIntegerField;
    qryNFeCOD_EMP: TIntegerField;
    qryNFeCHAVE_ACESSO: TStringField;
    qryNFeSERIE: TStringField;
    qryNFeNUMERO: TIntegerField;
    qryNFeCNPJ_EMIT: TStringField;
    qryNFeRAZAO_EMIT: TStringField;
    qryNFeIE_EMIT: TStringField;
    qryNFeDATA_EMISSAO: TDateField;
    qryNFeTIPO_OPERACAO: TStringField;
    qryNFeVALOR_TOTAL: TFMTBCDField;
    qryNFeSITUACAO: TStringField;
    qryNFeSTATUS: TIntegerField;
    qryNFePROTOCOLO: TStringField;
    qryNFeDATA_REC: TDateField;
    qryNFeMANIFESTACAO: TStringField;
    qryNFeDOWNLOAD: TStringField;
    qryNFeAMBIENTE: TStringField;
    qryNFeVISIVEL: TStringField;
    qryNFeNSU: TIntegerField;
    qryNFeDATA_DOWNLOAD: TDateField;
    qryNFeIMPORTADA: TStringField;
    Panel9: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    DBCtrlGrid3: TDBCtrlGrid;
    DBText10: TDBText;
    DBText13: TDBText;
    imgUnlock: TImage;
    DBText1: TDBText;
    DBText2: TDBText;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    Image2: TImage;
    Panel6: TPanel;
    Label3: TLabel;
    Image3: TImage;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBText6: TDBText;
    qryRel: TFDQuery;
    dtsRel: TDataSource;
    qryRelID: TIntegerField;
    qryRelDATA_PEDIDO: TSQLTimeStampField;
    qryRelDATA_CHEGADA: TSQLTimeStampField;
    qryRelNUMERO_NOTA: TStringField;
    qryRelID_FORNECEDOR: TIntegerField;
    qryRelSTATUS: TStringField;
    qryRelOUTROS: TFloatField;
    qryRelDESCONTO: TFloatField;
    qryRelFRETE: TFloatField;
    qryRelVALOR_NOTA: TFloatField;
    qryRelID_USUARIO: TIntegerField;
    qryRelSERIE: TStringField;
    qryRelCHAVE_NFE: TStringField;
    qryRelTP_NF: TStringField;
    qryRelVALOR_TOTAL_NOTA: TFloatField;
    qryRelQTD_PROD: TIntegerField;
    qryRelID_1: TIntegerField;
    qryRelID_CABECALHO: TIntegerField;
    qryRelID_PRODUTO: TIntegerField;
    qryRelSEQUENCIA: TIntegerField;
    qryRelQTREAL: TFloatField;
    qryRelVL_UNITARIO: TFloatField;
    qryRelVL_FRETE: TFloatField;
    qryRelVL_IPI: TFloatField;
    qryRelVL_ICMS: TFloatField;
    qryRelVL_DESCONTO: TFloatField;
    qryRelVL_ICMS_SUBST: TFloatField;
    qryRelVL_ISENTO: TFloatField;
    qryRelVL_PIS: TFloatField;
    qryRelVL_COFINS: TFloatField;
    qryRelVL_SEGURO: TFloatField;
    qryRelVL_OUTROS: TFloatField;
    qryRelCODIGO_ORIGEM: TStringField;
    qryRelUND: TStringField;
    qryRelPROD_ID_UNIDADE_PRODUTO: TIntegerField;
    qryRelPROD_ID_UNIDADE_ENTRADA: TIntegerField;
    qryRelPROD_DESCRICAO: TStringField;
    qryRelPROD_VALOR_VENDA: TFloatField;
    qryRelID_2: TIntegerField;
    qryRelIDUNIDADEPROD: TIntegerField;
    qryRelUNIDADEPRODUTO: TStringField;
    qryRelFATORPRODUTO: TFloatField;
    qryRelIDUNIDADEENTRADA: TIntegerField;
    qryRelUNIDADEENTRADA: TStringField;
    Panel2: TPanel;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    qryRelNOME: TStringField;
    qryRelFANTASIA: TStringField;
    qryRelEMAIL: TStringField;
    qryRelCPF_CNPJ: TStringField;
    qryRelINSCRICAO_ESTADUAL: TStringField;
    qryRelTIPO_PESSOA: TStringField;
    qryRelDATA_CADASTRO: TDateField;
    qryRelLOGRADOURO: TStringField;
    qryRelNUMERO: TStringField;
    qryRelCOMPLEMENTO: TStringField;
    qryRelCEP: TStringField;
    qryRelBAIRRO: TStringField;
    qryRelCIDADE: TStringField;
    qryRelUF: TStringField;
    qryRelCELULAR: TStringField;
    qryRelCODIGO_IBGE_CIDADE: TIntegerField;
    qryRelCODIGO_IBGE_UF: TIntegerField;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    qryRelID_3: TIntegerField;
    qryRelSTATUS_1: TStringField;
    qryRelDESCRICAO: TStringField;
    qryRelQTDE_ESTOQUE: TFloatField;
    qryRelREFERENCIA: TStringField;
    qryRelID_UNIDADE: TIntegerField;
    qryRelCODIGO_BARRAS: TStringField;
    qryRelVALOR_UNITARIO: TFloatField;
    qryRelID_ORIGINAL: TStringField;
    qryRelIMPRIMIR_COZINHA: TStringField;
    RLDraw1: TRLDraw;
    qryRelcalcUnidadeEntrada: TStringField;
    qryRelFATOR_UNIDADE: TFloatField;
    qryRelFATORENTRADA: TFloatField;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBText12: TRLDBText;
    qryRelcalcEndereco: TStringField;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    qryNFecalcImportada: TStringField;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText7: TDBText;
    DBText8: TDBText;
    Image5: TImage;
    DBText9: TDBText;
    DBText11: TDBText;
    Image6: TImage;
    DBText12: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    DBText16: TDBText;
    lblImportada: TDBText;
    Panel11: TPanel;
    RLReport2: TRLReport;
    RLBand5: TRLBand;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLBand6: TRLBand;
    RLDraw2: TRLDraw;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText28: TRLDBText;
    RLDBText29: TRLDBText;
    RLDBText30: TRLDBText;
    RLDBText31: TRLDBText;
    RLDBText32: TRLDBText;
    RLBand7: TRLBand;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLBand8: TRLBand;
    RLDBResult3: TRLDBResult;
    RLDBResult4: TRLDBResult;
    Panel12: TPanel;
    Panel8: TPanel;
    Image4: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure imgUnlockClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure qryRelCalcFields(DataSet: TDataSet);
    procedure qryNFeCalcFields(DataSet: TDataSet);
    procedure DBCtrlGrid3PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Var empresa: TBaseLocalEmpresaVO;
        XMLDocument1: TXMLDocument;
    Procedure ObterXML;
    Procedure ConfigurarAcbr;
    Procedure NotaJaCadastrada;
    procedure Download(CodigoNotaFiscal: integer; ChaveNF: String; Refresh: Boolean;
  mostrarMensagem: Boolean = True);
    procedure Manifestar(CodigoNotaFiscal, TipoManifestacao: integer; ChaveNF: String;
  Refresh: Boolean; mostrarMensagem: Boolean = True; Justificativa: String = '');
var

  end;

var
  frmEntradaXML: TfrmEntradaXML;

implementation

{$R *.dfm}

uses untPrincipal, untImportarXML;

{ TfrmEntradaXML }

procedure TfrmEntradaXML.ConfigurarAcbr;
Var parametro: TBaseLocalParametrosVO;

begin

   Try

    Try

      parametro := TBaseLocalParametrosVO.Create;
      parametro := TBaseLocalParametrosController.retornarParametros;

      // Configura o componente ACBr
      ACBrNFe.Configuracoes.Geral.VersaoDF := ve400;
      ACBrNFe.Configuracoes.Arquivos.PathSchemas := ExtractFilePath(Application.ExeName) + 'SCHEMAS\';

      // Configurações para utilização de comunicação com webservice utilizando arquivo PFX
      //if (ZQueryEmpresaCERTIFICADO.asstring <> '') then
      begin
        ACBrNFe.Configuracoes.Geral.SSLCryptLib := cryWinCrypt;
        ACBrNFe.Configuracoes.Geral.SSLHttpLib := httpWinHttp;
        ACBrNFe.Configuracoes.Geral.SSLXmlSignLib := xsLibXml2;

        // Configuração do certificado
        //ACBrNFe.Configuracoes.Certificados.ArquivoPFX := parametro.CERTIFICADO;
        ACBrNFe.Configuracoes.Certificados.NumeroSerie :=  parametro.CERTIFICADO;
        //ACBrNFe.Configuracoes.Certificados.Senha := ''; //ZQueryEmpresaSENHA.asstring;
        //ACBrNFe.Configuracoes.Certificados.NumeroSerie := '';
      end;
      {else
        // Configurações para utilização de comunicação com webservice com a Capicom
        if (ZQueryEmpresaNUMERO_SERIE.asstring <> '') then
        begin
          ACBrNFe.Configuracoes.Geral.SSLCryptLib := cryCapicom;
          ACBrNFe.Configuracoes.Geral.SSLHttpLib := httpWinHttp;
          ACBrNFe.Configuracoes.Geral.SSLXmlSignLib := xsMsXmlCapicom;

          // Configuração do certificado
          ACBrNFe.Configuracoes.Certificados.NumeroSerie := ZQueryEmpresaNUMERO_SERIE.asstring;
          ACBrNFe.Configuracoes.Certificados.ArquivoPFX := '';
          ACBrNFe.Configuracoes.Certificados.Senha := '';
        end;
       }
      // Ambiente do webservice: produção ou homologação
      //if trim(ZQueryEmpresaAMBIENTE_DANFE.asstring) = 'H' then
       // ACBrNFe.Configuracoes.WebServices.Ambiente := taHomologacao;
      //else
       ACBrNFe.Configuracoes.WebServices.Ambiente := taProducao;

      //case ZQueryEmpresaFORMA_EMISSAO_DANFE.AsInteger of
      // 1:
          ACBrNFe.Configuracoes.Geral.FormaEmissao := teNormal;
      {  2:
          ACBrNFe.Configuracoes.Geral.FormaEmissao := teContingencia;
        3:
          ACBrNFe.Configuracoes.Geral.FormaEmissao := teSCAN;
        4:
          ACBrNFe.Configuracoes.Geral.FormaEmissao := teDPEC;
        5:
          ACBrNFe.Configuracoes.Geral.FormaEmissao := teFSDA;
        6:
          ACBrNFe.Configuracoes.Geral.FormaEmissao := teSVCAN;
        7:
          ACBrNFe.Configuracoes.Geral.FormaEmissao := teSVCRS;
        8:
          ACBrNFe.Configuracoes.Geral.FormaEmissao := teSVCSP;
        9:
          ACBrNFe.Configuracoes.Geral.FormaEmissao := teOffLine;
      end;
      }
      ACBrNFe.Configuracoes.Arquivos.Salvar := False;
      ACBrNFe.Configuracoes.Geral.Salvar := False;
      {
      if trim(LeIni('General', 'EscalaImpDFe')) = '0' then
      begin
        ACBrNFeDANFe.NovaEscala := 96;
        ACBrNFeDANFe.AlterarEscalaPadrao := False;
      end
      else
      begin
        ACBrNFeDANFe.AlterarEscalaPadrao := True;
        ACBrNFeDANFe.NovaEscala := strtointdef(trim(LeIni('General', 'EscalaImpDFe')), 96);
      end;

      // Se não está configurado o caminho do xml então salva na pasta "NotasFonnecedores" na pasta do App
      if (ZQueryEmpresaCAMINHO.asstring = '') then
      begin
        ACBrNFe.Configuracoes.Arquivos.PathSalvar := ExtractFilePath(Application.ExeName) + 'NotasFornecedores\' +
          ZQueryEmpresaCNPJ.asstring + '\Temp';
        ACBrNFe.Configuracoes.Arquivos.DownloadDFe.PathDownload := ExtractFilePath(Application.ExeName) +
          'NotasFornecedores\' + ZQueryEmpresaCNPJ.asstring;
      end
      else
      begin
        // Se usuário configurou caminho para o xml então o utiliza
        ACBrNFe.Configuracoes.Arquivos.PathSalvar := ZQueryEmpresaCAMINHO.asstring + '\' +
          ZQueryEmpresaCNPJ.asstring + '\Temp';
        ACBrNFe.Configuracoes.Arquivos.DownloadDFe.PathDownload := ZQueryEmpresaCAMINHO.asstring + '\' +
          ZQueryEmpresaCNPJ.asstring;
      end;}

    Except
       on e:exception do
          ShowMessage('Erro: '+e.Message);
    End;
   Finally

      FreeAndNil(parametro)

   End;
end;

procedure TfrmEntradaXML.DBCtrlGrid3PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin

   if qryNFeIMPORTADA.AsString = 'S' then
      lblImportada.Font.Color := $00CE0000
   else
      lblImportada.Font.Color := $000D0DFF;

end;

procedure TfrmEntradaXML.Download(CodigoNotaFiscal: integer; ChaveNF: String;
  Refresh, mostrarMensagem: Boolean);
var
  i: integer;
  ArqXML: TStringStream;
begin
  // Configura o componente acbr
  ConfigurarAcbr;

  try
    // Oculta o diálogo para limpar os logs anteriores
    //OcultarDialogoProcessamento;
    Screen.Cursor := crHourGlass;
    //Mensagem('Efetuando conexão no webservice da receita ...');
    //ExibirDialogoProcessamento;

    try
      //GerarLogNF(CodigoNotaFiscal, 2);
      //Mensagem('Efetuando download da nota fiscal ' + ChaveNF);

      ACBrNFe.Configuracoes.Arquivos.Salvar := True;
      ACBrNFe.Configuracoes.Geral.Salvar := True;

      Manifestar(CodigoNotaFiscal, 1, ChaveNF, True, True, '');

      // Efetua o download pelo webservice
      Try
         //ACBrNFe.DistribuicaoDFePorNSU(empresa.CODIGO_UF, EMPRESA.CNPJ, qryNFeNSU.AsString);
         ACBrNFe.DistribuicaoDFePorChaveNFe (empresa.CODIGO_UF, empresa.CNPJ, ChaveNF);
         ACBrNFe.WebServices.DistribuicaoDFe.Executar;
      Except
         on e:exception do Begin
            ShowMessage(e.Message);
            Exit;
         End;
      End;

      with ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt do
      begin
        // Download efetuado
        if (cStat = 138) then
        begin
          for i := 0 to docZip.Count - 1 do
          begin

            // Verifica se o arquivo é o xml da NFE (-nfe.xml)
            if docZip.Items[i].schema = schprocNFe then
            begin
              // Extrai o arquivo xml
              ArqXML := TStringStream.create(docZip.Items[i].Xml);
              XMLDocument1 := TXMLDocument.Create(Nil);
              XMLDocument1.LoadFromStream(ArqXML);

              // Salva o xml no disco
               XMLDocument1.SaveToFile(ACBrNFe.Configuracoes.Arquivos.DownloadDFe.PathDownload + ChaveNF);

              // Backup do xml
              //if (ZQueryEmpresaCAMINHO_COPIA_XML.asstring <> '') then
              begin
                //Mensagem('Copiando ' + ZQueryEmpresaCAMINHO_COPIA_XML.asstring + ChaveNF + '-nfe.xml');
                XMLDocument1.SaveToFile(ExtractFilePath(Application.ExeName)+'XML_NF_ENTRADA\' + ChaveNF + '-nfe.xml');
              end;

              ArqXML.Free;

              // Download disponibilizado
              if (cStat = 138) then
              begin
                // Atualiza o banco de dados local informando que foi efetuado download
                //UpdateDownload(CodigoNotaFiscal);
                //GerarLogNF(CodigoNotaFiscal, 4);
                //Mensagem('Download efetuado -> NF ' + ChaveNF + ' CSTAT: ' + inttostr(cStat) + ' - ' +
                //  xMotivo);

                //if mostrarMensagem then
                prcMsgInf('Download realizado com sucesso.');

                // Atualiza dados da query
                if (Refresh) then
                begin
                  //ZQueryNF.Refresh;
                  //CalcularTotais;
                end;
              end
              else
              begin
                prcMsgAdv('Download não efetuado.' + #13 + xMotivo);
              end;
            end; //else
              //Manifestar(CodigoNotaFiscal, 0, ChaveNF, True, True, '');

          end;
        end
        else
        begin
          //Mensagem('Download não efetuado -> NF ' + ChaveNF + ' CSTAT: ' +
          //  inttostr(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat) + ' - ' +
          //  ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo);

          if (cStat = 137) then
             prcMsgAdv('Não foi possível baixar o XML.'+#13+'Tente novamente mais tarde.')
          else
             prcMsgAdv('Download não efetuado.' + #13 + xMotivo);

          //GerarLogNF(CodigoNotaFiscal, 6, ' CSTAT: ' + inttostr(cStat) + ' - ' + xMotivo);
        end;
      end;
    except
      on E: Exception do
      begin
        //GerarLogNF(CodigoNotaFiscal, 6, E.Message);
        //Mensagem('Não foi possível efetuar o download do XML desta nota fiscal, motivo ->  ' + E.Message);

        if mostrarMensagem then
          showmessage('Ocorreu um problema ao realizar a operação: ' + E.Message);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmEntradaXML.FormCreate(Sender: TObject);
begin

   qryNFe.Close;
   qryNFe.Open;

   empresa := TBaseLocalEmpresaController.retornarDadosEmpresa;

end;

procedure TfrmEntradaXML.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmEntradaXML.Image1Click(Sender: TObject);
Var query: TFDQuery;
begin

   NotaJaCadastrada;

   if Not(qryRel.IsEmpty) then
      Exit;

   Application.CreateForm(TfrmImportarXML, frmImportarXML);
   frmImportarXML.ImportarProdutos(qryNFeCHAVE_ACESSO.AsString);
   frmImportarXML.ShowModal;

end;

procedure TfrmEntradaXML.Image2Click(Sender: TObject);
begin

   ObterXML;

end;

procedure TfrmEntradaXML.Image3Click(Sender: TObject);
begin

   close;

end;

procedure TfrmEntradaXML.Image4Click(Sender: TObject);
begin
   ObterXML;
end;

procedure TfrmEntradaXML.imgUnlockClick(Sender: TObject);
begin

   if Not(qryNFe.IsEmpty) Then
     Download(qryNFeCODIGO.AsInteger, Trim(qryNFeCHAVE_ACESSO.AsString) , True, True);

end;

procedure TfrmEntradaXML.Manifestar(CodigoNotaFiscal, TipoManifestacao: integer;
  ChaveNF: String; Refresh, mostrarMensagem: Boolean; Justificativa: String);
var
  i, IdLote: integer;
  Xml: string;
begin
  // Configura o componente acbr
  //ConfigurarAcbr;

  // Gera log de manifestacao da nota
  //GerarLogNF(CodigoNotaFiscal, 1);

  // Oculta o diálogo para limpar os logs anteriores
  //OcultarDialogoProcessamento;

  // Inicialização do número do lote
  IdLote := 0;
  //Mensagem('Enviando evento para o web service da receita ...');
  //ExibirDialogoProcessamento;

  // zQueryNF.DisableControls;
  ACBrNFe.EventoNFe.Evento.Clear;
  Application.ProcessMessages;

  try
    //Mensagem('Adicinado ao lote a NF ' + ChaveNF);

    // Gera o número de lote
    if (ACBrNFe.EventoNFe.IdLote = 0) then
    begin
      IdLote := CodigoNotaFiscal;
      ACBrNFe.EventoNFe.IdLote := IdLote;
    end;

    // Cria o evendo de manifestação
    with ACBrNFe.EventoNFe.Evento.New do
    begin
      // Chave da NFe
      infEvento.chNFe := ChaveNF;

      // CNPJ da empressa destinada
      infEvento.cnpj := empresa.CNPJ;

      // data e hora
      infEvento.dhEvento := now;

      // Órgao 91 fixo
      infEvento.cOrgao := 91;

      case TipoManifestacao of
        // Confirmação de operação
        1:
          infEvento.tpEvento := teManifDestConfirmacao;
        // Ciência da operação
        0:
          infEvento.tpEvento := teManifDestCiencia;
        // Operação não realizada
        2:
        begin
          infEvento.tpEvento := teManifDestOperNaoRealizada;
          infEvento.detEvento.xJust := Justificativa;
        end;
        // Desconhecimento da operação
        3:
          infEvento.tpEvento := teManifDestDesconhecimento;
      end;
    end;

    //Mensagem('Enviando lote para web service da receita ...');
    Application.ProcessMessages;

    ACBrNFe.Configuracoes.Arquivos.Salvar := True;
    ACBrNFe.Configuracoes.Geral.Salvar := True;

    // Envia o lote de manifesto para o webservice
    ACBrNFe.EnviarEvento(IdLote);
    //Mensagem('Processando o retorno do webservice...');

    // Captura os retornos do webservice
    for i := 0 to ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Count - 1 do
    begin
      // Seta o ponteiro da query zQueryNF apontando para a nota retornada pelo webservice
      // (zQueryNF.Locate('CHAVE', ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[i].RetInfEvento.chNFe, [])) then
      // gin

      // Exbibe no log para o usuário o cStat e o xMotivo do webservice
      //Mensagem('NF: ' + ZQueryNFCHAVE.asstring + ' - CSTAT: ' +
      //  inttostr(ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[i].RetInfEvento.cStat) + ' - ' +
      //  ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[i].RetInfEvento.xMotivo);

      // Atualiza no banco de dados local caso a nota tenha sido manifestada com sucesso
      if (ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[i].RetInfEvento.cStat = 135) or
      // Evento vinculado
        (ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[i].RetInfEvento.cStat = 655) or
      // Manifestação após final da operação
        (ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[i].RetInfEvento.cStat = 573) then
      // Duplicidade de evento (já manifestada)
      begin
        //UpdateManifestar(CodigoNotaFiscal, TipoManifestacao);
        //GerarLogNF(CodigoNotaFiscal, 3);

        //if mostrarMensagem then
        //  showmessage('Operação realizada com sucesso!');
      end
      else
      begin
        if mostrarMensagem then
          //showmessage('Operação não realizada: ' + #13 +
          //  ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[i].RetInfEvento.xMotivo);
          //Abort;
      end;
    end;

    Xml := ExtractFileDir(Application.ExeName) + '\' + ChaveNF + '-resNFe.xml';

    if FileExists(Xml) then
      DeleteFile(PWideChar(Xml));

    // Atualiza dados da query
    if (Refresh) then
    begin
      //ZQueryNF.Refresh;
      //CalcularTotais;
    end;
  except
    on E: Exception do
    begin
      //GerarLogNF(CodigoNotaFiscal, 5, E.Message);
      //Mensagem('Erro: ' + E.Message);

      if mostrarMensagem then
        showmessage('Ocorreu um problema ao realizar a operação: ' + E.Message);
    end;
  end;
end;

procedure TfrmEntradaXML.NotaJaCadastrada;
begin

   qryRel.Close;
   qryRel.SQL.Clear;
   qryRel.SQL.Add('   SELECT ne.*, ');
   qryRel.SQL.Add('          nd.*, ');
   qryRel.SQL.Add('          f.*, ');
   qryRel.SQL.Add('          p.*, ');
   qryRel.SQL.Add('          u.id AS idUnidadeProd, ');
   qryRel.SQL.Add('          u.sigla AS unidadeProduto, ');
   qryRel.SQL.Add('          u.fator AS fatorProduto, ');
   qryRel.SQL.Add('          u1.id AS idUnidadeEntrada, ');
   qryRel.SQL.Add('          u1.sigla AS unidadeEntrada, ');
   qryRel.SQL.Add('          nd.fator_unidade AS fatorEntrada  ');
   qryRel.SQL.Add('     FROM nota_entrada_cabecalho ne INNER JOIN nota_entrada_detalhe nd ON ne.id = nd.id_cabecalho ');
   qryRel.SQL.Add('                                           INNER JOIN produtos p ON nd.id_produto = p.id ');
   qryRel.SQL.Add('                                           INNER JOIN fornecedores f ON ne.id_fornecedor = f.id ');
   qryRel.SQL.Add('                                           INNER JOIN unidade_produtos u ON p.id_unidade = u.id  ');
   qryRel.SQL.Add('                                           INNER JOIN unidade_produtos u1 ON nd.prod_id_unidade_entrada = u1.id  ');
   qryRel.SQL.Add('    WHERE ne.numero_nota = :nota AND f.cpf_cnpj = :cnpj ');

   qryRel.Params.ParamByName('nota').AsString := Trim(qryNFeNUMERO.AsString);
   qryRel.Params.ParamByName('cnpj').AsString := Trim(qryNFeCNPJ_EMIT.AsString);
   qryRel.Open;

   if Not(qryRel.IsEmpty) then
      RLReport1.PreviewModal;

end;

procedure TfrmEntradaXML.ObterXML;
var
  ultNSU: string;
  i, Count, CountTotal: integer;
  cStat: integer;
  iConsultas: integer;
  sAmbiente: String;
  bExisteNota: Boolean;
  dDataIniBusca: TDateTime;
  query: TFDQuery;

Procedure AtualizarNSU(nsu: integer);
Var query: TFDQuery;
Begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add(' UPDATE empresa SET ultimo_nsu = :nsu ');
      query.Params.ParamByName('nsu').AsInteger := nsu;

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         empresa := TBaseLocalEmpresaController.retornarDadosEmpresa;
      Except
      End;

   Finally

      FreeAndNil(query);

   End;

End;

Procedure Bloqueio_Baixar_XML;
Var query: TFDQuery;
Begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add(' UPDATE empresa SET DATA_HORA_BLOQUEIO_XML = :data ');
      query.Params.ParamByName('data').AsDateTime := IncHour(NOW, 1);

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         empresa := TBaseLocalEmpresaController.retornarDadosEmpresa;
      Except
      End;

   Finally

      FreeAndNil(query);

   End;

End;

Function ExisteNotaComNSU(chave: String; nsu: integer): Boolean;
Var query: TFDQuery;
Begin

   Try

      Result := False;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add(' SELECT * FROM MANIFESTACAO_NFE WHERE chave_acesso = :chave AND nsu = :nsu ');
      query.Params.ParamByName('chave').AsString := chave;
      query.Params.ParamByName('nsu').AsInteger  := nsu;
      query.Open;

      if Not(query.IsEmpty) then
         Result := True;

   Finally

      FreeAndNil(query);

   End;

End;

Function ExisteNota(chave, cnpj: String): Boolean;
Var query: TFDQuery;
Begin

   Try

      Result := False;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add(' SELECT * FROM MANIFESTACAO_NFE WHERE chave_acesso = :chave AND cnpj_emit = :cnpj ');
      query.Params.ParamByName('chave').AsString := chave;
      query.Params.ParamByName('cnpj').AsString  := cnpj;
      query.Open;

      if Not(query.IsEmpty) then
         Result := True;

   Finally

      FreeAndNil(query);

   End;

End;


begin
   {
   if Not(empresa.DATA_HORA_BLOQUEIO_XML <= Now) then Begin
      prcMsgAdv('Próxima consulta para baixar XML deverá ser após as '+DateTimeToStr(empresa.DATA_HORA_BLOQUEIO_XML));
      Exit;
   end;
   }
  // Configura o componente acbr
  ConfigurarAcbr;

  // Inicializa contador de consultas ao webservice
  iConsultas := 0;
  CountTotal := 0;

  // CStat 138 = resposta do webservice quando existem novas notas fiscais disponíveis
  cStat := 138;
  bExisteNota := True;
  //ZQueryNF.DisableControls;

  try

    // Altera o cursor do mouse
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    try
      // Efetua até 20 consultas ao webservice enquanto o retorno do mesmo for 138
     // while (cStat = 138) and (iConsultas < 20) do Begin

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      ultNSU := empresa.ULTIMO_NSU.ToString;
      {
      With query do Begin

         sql.Add(' SELECT MAX(nsu) AS nsu, data_download FROM manifestacao_nfe GROUP BY data_download ');
         Open;

         if Not(query.IsEmpty) then
            ultNSU := inttostr(query.FieldByName('nsu').AsInteger);

      end;
      }
      bExisteNota := True;

      while {(cStat = 138) and }(bExisteNota) and (iConsultas < 20) do
      begin
        // Incrementa o número de consultas efetuadas no webservice
        inc(iConsultas);

        // Verifica qual o ambiente do webservice  "Produção" ou "Homologação"
        if (ACBrNFe.Configuracoes.WebServices.Ambiente = taProducao) then
          sAmbiente := 'P'
        else
          sAmbiente := 'H';

        // Obtém o número do último NSU no banco de dados local
        //empresa.ULTIMO_NSU.ToString;

        // Dispara a consulta ao webservice
        Try
           ACBrNFe.DistribuicaoDFePorNSU(empresa.CODIGO_UF, EMPRESA.CNPJ, ultNSU);
        Except
           if ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 656 then Begin
              Bloqueio_Baixar_XML;
              prcMsgAdv('Limite de consumo por hora estourado. Tente novamente em 1 hora.');
              Exit;
              //AtualizarNSU(ultNSU.ToInteger);
           end;
        end;

        if ultNSU = '0' then Begin
           ultNSU := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU;
           AtualizarNSU(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU.ToInteger);
        end;

        // Inicializa o contador de notas fiscais disponívels
        Count := 0;

        // Captura o cStat retornado pelo webservice
        cStat := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat;
        //ultNSU := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU;

        bExisteNota := False;

        if cStat = 137 then Begin
           if Not(ultNSU.ToInteger < ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU.ToInteger) then
              AtualizarNSU(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU.ToInteger)
           else Begin
              AtualizarNSU(ultNSU.ToInteger + 1);
              ultNSU := IntToStr(ultNSU.ToInteger + 1);
              bExisteNota := True;
           end;

        end;

        // 138 = Novas notas fiscais disponíveis
        if (cStat = 138) then
        begin
          // Verifica se tem notas

          // Percorre a lista de NFe
          for i := 0 to ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count - 1 do
          begin
            // Armazena o NSU
            if (trim(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].nsu) <> '') then
              ultNSU := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].nsu;

            if ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU.ToInteger > ultNSU.toInteger then Begin

               bExisteNota := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count > 0;
               ultNSU := FormatFloat('#0', ultNSU.toInteger + 1);

            End;

            if Not(ExisteNota(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.chDFe,
                              ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.cnpjcpf)) Then Begin

                if (ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].nsu <> '') and
                  (ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.chDFe <> '') then
                begin
                  if not ExisteNotaComNSU(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.chDFe,
                    strtointdef(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].NSU, 0)) then
                  begin
                    dDataIniBusca := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.dhEmi;

                    // Incrementa contador de notas
                    inc(Count);

                    // Inclui os dados de resumo da NFe no banco de dados
                    with query do
                    begin

                      close;
                      sql.Clear;
                      sql.Add(' INSERT INTO MANIFESTACAO_NFE ');
                      sql.Add(' (  ');
                      sql.Add(' COD_EMP, CHAVE_ACESSO, SERIE, NUMERO, CNPJ_EMIT, RAZAO_EMIT, IE_EMIT, DATA_EMISSAO, ');
                      sql.Add(' TIPO_OPERACAO, VALOR_TOTAL, SITUACAO, STATUS, NSU, PROTOCOLO, DATA_REC, MANIFESTACAO, ');
                      sql.Add(' DOWNLOAD, AMBIENTE, VISIVEL, IMPORTADA ');
                      sql.Add(' )  ');
                      sql.Add(' VALUES ');
                      sql.Add(' (  ');
                      sql.Add(' :ID_EMPRESA, :CHAVE, :SERIE, :NUMERO, :CNPJ, :NOME, :IE, :EMISSAO, :TIPO, :VALOR, :SITUACAO, ');
                      sql.Add(' :STATUS, :NSU, :PROTOCOLO, :DATAREC, :MANIFESTACAO, :DOWNLOAD, :AMBIENTE, :VISIVEL, :IMPORTADA ');
                      sql.Add(' )  ');

                      Parambyname('ID_EMPRESA').AsInteger := frmPrincipal.qryEmpresaID.AsInteger;
                      Parambyname('NSU').AsInteger :=
                        strtointdef(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].nsu, 0);
                      Parambyname('CHAVE').asstring := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i]
                        .resDFe.chDFe;
                      Parambyname('SERIE').asstring :=
                        Copy(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.chDFe, 23, 3);
                      Parambyname('NUMERO').asstring :=
                        Copy(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.chDFe, 26, 9);
                      Parambyname('CNPJ').asstring := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i]
                        .resDFe.cnpjcpf;
                      Parambyname('NOME').asstring :=
                        AnsiUpperCase(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.xNome);
                      Parambyname('IE').asstring := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i]
                        .resDFe.IE;
                      Parambyname('EMISSAO').AsDateTime := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip
                        [i].resDFe.dhEmi;
                      Parambyname('VALOR').AsCurrency := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip
                        [i].resDFe.vNF;
                      Parambyname('DATAREC').AsDateTime := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip
                        [i].resDFe.dhRecbto;
                      Parambyname('PROTOCOLO').asstring := ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip
                        [i].resDFe.nProt;
                      Parambyname('AMBIENTE').asstring := sAmbiente;

                      // Verifica se é uma NFe de Entrada ou Saída
                      case ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.tpNF of
                        tnEntrada:
                          Parambyname('TIPO').asstring := 'E';
                        tnSaida:
                          Parambyname('TIPO').asstring := 'S';
                      end;

                      // Verifica qual é a situação da NFe
                      case ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.cSitDFe of
                        snAutorizado:
                          Parambyname('SITUACAO').asstring := 'Autorizado';
                        snDenegado:
                          Parambyname('SITUACAO').asstring := 'Denegado';
                        snCancelado:
                          Parambyname('SITUACAO').asstring := 'Cancelado';
                        snEncerrado:
                          Parambyname('SITUACAO').asstring := 'Encerrado';
                      end;

                      if ExisteNota(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.chDFe,
                                    ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.cnpjcpf) then
                        Parambyname('VISIVEL').asstring := 'N'
                      else
                        Parambyname('VISIVEL').asstring := 'S';

                      Parambyname('IMPORTADA').asstring := 'N';
                      ExecSQL;
                    end;

                    if Not(ExisteNota(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.chDFe,
                                  ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.cnpjcpf)) then
                       Download (strtoint(Copy(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.chDFe,26,9)),
                                               ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.chDFe, True, false);

                  end;
                end
                else
                begin
                  with query do
                  begin
                     close;
                     sql.Clear;
                     sql.Add(' INSERT INTO MANIFESTACAO_NFE ');
                     sql.Add(' (  ');
                     sql.Add(' COD_EMP, CHAVE_ACESSO, SERIE, NUMERO, CNPJ_EMIT, RAZAO_EMIT, IE_EMIT, DATA_EMISSAO, ');
                     sql.Add(' TIPO_OPERACAO, VALOR_TOTAL, SITUACAO, STATUS, NSU, PROTOCOLO, DATA_REC, MANIFESTACAO, ');
                     sql.Add(' DOWNLOAD, AMBIENTE, VISIVEL, IMPORTADA ');
                     sql.Add(' )  ');
                     sql.Add(' VALUES ');
                     sql.Add(' (  ');
                     sql.Add(' :ID_EMPRESA, :CHAVE, :SERIE, :NUMERO, :CNPJ, :NOME, :IE, :EMISSAO, :TIPO, :VALOR, :SITUACAO, ');
                     sql.Add(' :STATUS, :NSU, :PROTOCOLO, :DATAREC, :MANIFESTACAO, :DOWNLOAD, :AMBIENTE, :VISIVEL, :IMPORTADA ');
                     sql.Add(' )  ');

                     Parambyname('ID_EMPRESA').AsInteger := frmPrincipal.qryEmpresaID.AsInteger;
                     Parambyname('NSU').AsInteger :=
                     strtointdef(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].nsu, 0);
                     Parambyname('CHAVE').asstring := 'Chave de acesso';
                     Parambyname('SERIE').asstring := '0';
                     Parambyname('NUMERO').asstring := '0';
                     Parambyname('CNPJ').asstring := 'CNPJ';
                     Parambyname('NOME').asstring := 'Nome';
                     Parambyname('IE').asstring := 'IE';
                     Parambyname('EMISSAO').AsDateTime := 0;
                     Parambyname('VALOR').AsCurrency := 0;
                     Parambyname('DATAREC').AsDateTime := 0;
                     Parambyname('PROTOCOLO').asstring := '0';

                     case ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.tpNF of
                      tnEntrada:
                        Parambyname('TIPO').asstring := 'E';
                      tnSaida:
                        Parambyname('TIPO').asstring := 'S';
                    else
                      Parambyname('TIPO').asstring := 'N';
                    end;

                    case ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[i].resDFe.cSitDFe of
                      snAutorizado:
                        Parambyname('SITUACAO').asstring := 'Autorizado';
                      snDenegado:
                        Parambyname('SITUACAO').asstring := 'Denegado';
                      snCancelado:
                        Parambyname('SITUACAO').asstring := 'Cancelado';
                      snEncerrado:
                        Parambyname('SITUACAO').asstring := 'Encerrado';
                    else
                      Parambyname('SITUACAO').asstring := 'Nenhuma';
                    end;

                    Parambyname('AMBIENTE').asstring := sAmbiente;
                    Parambyname('VISIVEL').asstring := 'N';
                    Parambyname('IMPORTADA').asstring := 'N';
                    ExecSQL;
                  end;

                  Application.ProcessMessages;

                end;

            end;

          end;

          qryNFe.Close;
          qryNFe.Open;

          {
          frmPrincipal.ListarNotas;
          frmProcessamento.LQtd.Caption := 'Novas notas encontradas: ' + inttostr(Count);

          if Count > 0 then
            frmProcessamento.LQtd.Font.Color := clGreen
          else
            frmProcessamento.LQtd.Font.Color := clBlack;

          Mensagem('Foram encontradas ' + inttostr(Count) + ' novas nota(s) fiscal(s).');
          }
          CountTotal := CountTotal + Count;

        end
        else
        begin
          // Nenhum Documento Localizado para o Destinatário
          if (ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 137) then
            //Mensagem('Nenhum documento foi localizado.')
          else
            //Mensagem(' Não foi possível realizar a consulta. cStat:' +
            //  inttostr(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.cStat) + ' - Motivo: ' +
            //  ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo);
        end;
      end;

      //Mensagem('Fim do processamento: no total foram encontradas ' + inttostr(CountTotal) +
      //  ' novas nota(s) fiscal(s).');

      if CountTotal > 0 then
        prcMsgInf('Consulta retornou ' + inttostr(CountTotal) + ' nova(s) nota(s) fiscal(s).')
      else Begin
         if ultNSU = '1' then
            AtualizarNSU(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU.ToInteger)
         else
            AtualizarNSU(ultNSU.ToInteger + 1);
         prcMsgAdv('Não foram localizadas novas notas fiscais.');
      end;

     //end;

      // Atualiza os dados
      //frmPrincipal.ListarNotas;
    except
      on E: Exception do
      begin
        //Mensagem(E.Message);

        //if mostrarMensagem then
          showmessage('Ocorreu um problema ao realizar a operação: ' + E.Message);
          AtualizarNSU(ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU.ToInteger);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    //ZQueryNF.EnableControls;
  end;

end;
procedure TfrmEntradaXML.qryNFeCalcFields(DataSet: TDataSet);
begin

   qryNFecalcImportada.AsString := 'Pendente';

   if qryNFeIMPORTADA.AsString = 'S' then
      qryNFecalcImportada.AsString := 'Importada';

end;

procedure TfrmEntradaXML.qryRelCalcFields(DataSet: TDataSet);
begin

   qryRelcalcEndereco.AsString := Trim(qryRelLOGRADOURO.AsString)+', '+
                                  Trim(qryRelNUMERO.AsString)+' '+
                                  Trim(qryRelCOMPLEMENTO.AsString)+' '+
                                  Trim(qryRelBAIRRO.AsString)+' '+
                                  Trim(qryRelCIDADE.AsString)+'-'+
                                  Trim(qryRelUF.AsString);


   qryRelcalcUnidadeEntrada.AsString := Trim(qryRelUNIDADEENTRADA.AsString)+
                                        ' (x'+FormatFloat('#0.00',qryRelFATORENTRADA.AsFloat)+')';

end;

end.
