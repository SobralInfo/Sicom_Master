unit untCancelamentoDeVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit, BaseLocalVendaCabecalhoController,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, unitConfiguracoes, baselocalpedidoCabecalhoController,
  BaseLocalVendaCabecalhoVO,FireDAC.Comp.Client, pcnConversaoNFe, pcnConversao, untIntegracaoFidelidade;

type
  TfrmCancelamentoDeVenda = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    edtVenda: TJvEdit;
    Label1: TLabel;
    chkNFCe: TCheckBox;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure edtVendaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
  end;

var
  frmCancelamentoDeVenda: TfrmCancelamentoDeVenda;

implementation

{$R *.dfm}

uses untPrincipal, untPedidos;

procedure TfrmCancelamentoDeVenda.Confirmar;
var
 sChave,
 sProtocolo,
 sJustificativa,
 sCnpj,
 sNumeroProtocolo,
 sXMLCancelamento,
 sMotivoStatus  : string;
 iCodigoStatus,
 idCabecalho: integer;
 iNumeroLote : Integer;
 dDataHoraEvento : TdateTime;
 mes, caminho: String;
 venda: TBaseLocalVendaCabecalhoVO;
 query: TFDQuery;
 fidelidade: TLancamentos;
 valor: double;

Procedure RetornarDadosCancelamento;
Var query: TFDQuery;


Begin

  Try

   Query := TFDQuery.Create(nil);
   Query.Connection := frmPrincipal.ConexaoLocal;
   Query.sql.Text := ' select CHAVE_NFCE, VALOR_VENDA from VENDA_CABECALHO WHERE numero_nfce = '+edtVenda.Text;
   Query.Open;

   if Not(query.IsEmpty) then Begin
      sChave := Trim(query.FieldByName('CHAVE_NFCE').AsString);
      valor  := query.FieldByName('VALOR_VENDA').Asfloat;
   End else Begin
      sChave := '';
      valor  := 0.00;
   End;

  Finally
     FreeAndNil(query);
  End;

End;

Procedure CancelarNFCe;
begin
  Try

    FrmPedidos.InicializarNFCe;

    Try
       frmPrincipal.PrepararImpressao(false);
       frmPrincipal.ACBrPosPrinter1.IgnorarTags             := False;
       frmPrincipal.ACBrPosPrinter1.ControlePorta           := False;
       frmPrincipal.ACBrNFeDANFeESCPOS1.ImprimeEmUmaLinha   := True;
       frmPrincipal.ACBrNFeDANFeESCPOS1.ImprimeDescAcrescItem := True;
       //FCaixa.ACBrNFe.DANFE.ImprimirItens := True;
    Except
       prcMsgAdv('Erro na configuração da impressora não fiscal.');
    End;


    RetornarDadosCancelamento;

    FrmPedidos.ACBrNFe.NotasFiscais.Clear;
    mes := Copy(sChave,3,4);
    caminho := ExtractFilePath(Application.ExeName)+'Vendas\NFCE20'+mes+'\'+sChave+'-nfe.xml';
    //caminho := 'C:\Users\sobra\OneDrive\PDV ASK (Novo)\Sources\Vendas\NFCE202112\24211244449939000103650050000500011581352805-nfe.XML';
    FrmPedidos.ACBrNFe.NotasFiscais.LoadFromFile(caminho);

    FrmPedidos.ACBrNFe.EventoNFe.Evento.Clear;
    FrmPedidos.ACBrNFe.EventoNFe.idLote := StrToInt('1') ;

    with FrmPedidos.ACBrNFe.EventoNFe.Evento.Add do
    begin
     infEvento.dhEvento := now;
     infEvento.tpEvento := teCancelamento;
     infEvento.detEvento.xJust := 'Cancelamento de NFCe';
    end;

    Try

       FrmPedidos.ACBrNFe.Configuracoes.Geral.VersaoDF := ve400;
       FrmPedidos.ACBrNFe.EnviarEvento(StrToInt('1'));

    Finally

       FrmPedidos.ACBrNFe.Configuracoes.Geral.VersaoDF := ve400;

    end;

  Except
     on E: Exception do Begin
        prcMsgAdv('Falha ao efetuar o cancelamento da NFCe.'+#13+'Motivo: '+e.Message);
        abort;
     end;

  End;


  if FrmPedidos.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat = 135 Then Begin

     Try
        FrmPedidos.ACBrNFe.ImprimirEvento;
     Except
        prcMsgAdv('Não foi possível imprimir o cancelamento.');
     end;

     close;

  end else Begin
     prcMsgAdv('Não foi possível efetuar o cancelamento da NFCe.'+#13+FrmPedidos.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
     //ConsultarNFCe(sChave, idCabecalho);
  end;


end;

begin

   if Trim(edtVenda.Text) = '' then Begin

      prcMsgAdv('Informe uma venda.');
      Exit;

   End;

   if fctMsgConfirmDefaultButtonNo('Confirma o cancelamento da venda?') = false then
      Exit;

   Try

      venda := TBaseLocalVendaCabecalhoVO.Create;

      if chkNFCe.Checked then
         venda := TBaseLocalVendaCabecalhoController.RetornarIDPorNumeroPedido(StrToInt(edtVenda.Text), True)
      else
         venda := TBaseLocalVendaCabecalhoController.RetornarIDPorNumeroPedido(StrToInt(edtVenda.Text), False);

      if venda.ID > 0 then Begin

         if venda.STATUS = 'C' then Begin
            prcMsgAdv('Venda já consta como cancelada.');
            Exit;
         End;

         if venda.STATUS <> 'F' then Begin
            prcMsgAdv('Venda não localizada..');
            Exit;
         End;

         if venda.CHAVE_NFCE <> '' then
            CancelarNFCe;

         TBaseLocalVendaCabecalhoController.MudarStatusVenda(venda.ID.ToString, 'C');

         if venda.CHAVE_NFCE = '' then
            frmPrincipal.ImprimirCancelamentoDeVenda(venda.ID);

         try
            Try
               fidelidade := TLancamentos.Create;
               fidelidade.id_cliente     := -1;
               fidelidade.tipo           := 'X';
               fidelidade.valor_compra   := venda.VALOR_VENDA*-1;
               fidelidade.pontuacao      := Trunc(valor*-1);
               fidelidade.data_compra    := Date;
               fidelidade.id_funcionario := 0;
               TLancamentos.GravarLancamento(fidelidade);
            Finally
               FreeAndNil(fidelidade);
            End;
         except
         end;

      End else
         prcMsgAdv('Venda não localizada.');

   Finally
      FreeAndNil(venda);
   End;

end;

procedure TfrmCancelamentoDeVenda.edtVendaKeyPress(Sender: TObject;
  var Key: Char);
begin

   if  not ( Key in ['0'..'9', Chr(8)] ) then
      Key := #0

end;

procedure TfrmCancelamentoDeVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmCancelamentoDeVenda.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCancelamentoDeVenda.Image3Click(Sender: TObject);
begin

   confirmar;

end;

procedure TfrmCancelamentoDeVenda.Image4Click(Sender: TObject);
begin

   close;

end;

end.
