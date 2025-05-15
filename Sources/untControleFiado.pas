unit untControleFiado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids, untPrincipal,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,  BaseLocalUsuariosController,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.DBCGrids, Vcl.Imaging.pngimage,
  RxDBCtrl, Vcl.Buttons, unitConfiguracoes,
  Vcl.Menus;

type
  ThreadControleFiado= class (TThread)
    public
       constructor creeate();
       procedure Execute; override;
  end;


type
  TfrmControleFiado = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    qryGrid: TFDQuery;
    dtsGrid: TDataSource;
    qryGridID: TIntegerField;
    qryGridID_VENDA: TIntegerField;
    qryGridVALOR_VENDA: TFloatField;
    qryGridDATA_VENDA: TSQLTimeStampField;
    Panel4: TPanel;
    dtsItens: TDataSource;
    qryItens: TFDQuery;
    qryItensDESCRICAO: TStringField;
    qryItensVALOR_UNITARIO: TFloatField;
    qryItensQUANTIDADE: TFloatField;
    qryItensVALOR_TOTAL: TFloatField;
    qryItensSIGLA: TStringField;
    Panel6: TPanel;
    Label3: TLabel;
    Image1: TImage;
    lblTotalCompras: TLabel;
    lblTotalRecebimentos: TLabel;
    lblSaldoFinal: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    qryGridID_CLIENTE: TIntegerField;
    qryGridTIPO: TStringField;
    qryGridDATA_PAGAMENTO: TSQLTimeStampField;
    qryGridOBSERVACAO: TStringField;
    qryGridNOME: TStringField;
    qryGridLOGRADOURO: TStringField;
    qryGridNUMERO: TStringField;
    qryGridCOMPLEMENTO: TStringField;
    qryGridBAIRRO: TStringField;
    qryGridCID_NOME: TStringField;
    qryGridcalcEndereco: TStringField;
    qryGridcalcTipo: TStringField;
    dtsClientes: TDataSource;
    qryClientes: TFDQuery;
    qryClientesID: TIntegerField;
    qryClientesNOME: TStringField;
    qryClientesFONE_FIXO: TStringField;
    qryClientesCELULAR: TStringField;
    qryClientesLOGRADOURO: TStringField;
    qryClientesNUMERO: TStringField;
    qryClientesCOMPLEMENTO: TStringField;
    qryClientesBAIRRO: TStringField;
    qryClientesCID_NOME: TStringField;
    Panel7: TPanel;
    DBCtrlGrid2: TDBCtrlGrid;
    DBText6: TDBText;
    DBText8: TDBText;
    DBText3: TDBText;
    Panel8: TPanel;
    Panel9: TPanel;
    DBCtrlGrid3: TDBCtrlGrid;
    DBText10: TDBText;
    DBText13: TDBText;
    Panel10: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    imgRed: TImage;
    imgGreen: TImage;
    Label14: TLabel;
    Label15: TLabel;
    qryRec: TFDQuery;
    dtsRec: TDataSource;
    qryRecNOME: TStringField;
    qryRecVALOR: TFloatField;
    imgLaranja: TImage;
    imgCancel: TImage;
    imgLixo: TImage;
    qryGridTOTAL_VENDA: TFloatField;
    imgLock: TImage;
    qryClientesBLOQUEADO: TStringField;
    imgUnlock: TImage;
    Panel11: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    PopupMenu1: TPopupMenu;
    MostrarObservao1: TMenuItem;
    qryGridobs_fiado: TStringField;
    Panel1: TPanel;
    lblVenda: TLabel;
    lblDtVenda: TLabel;
    lbl01: TLabel;
    lbl02: TLabel;
    spePrint: TSpeedButton;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText7: TDBText;
    DBText2: TDBText;
    Panel5: TPanel;
    lblTotal: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    lblEntrada: TLabel;
    lblVlFiado: TLabel;
    pnlRecebimento: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    lblDtRecebimento: TLabel;
    DBCtrlGrid4: TDBCtrlGrid;
    DBText11: TDBText;
    DBText14: TDBText;
    Panel12: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure qryGridAfterScroll(DataSet: TDataSet);
    procedure qryGridBeforeScroll(DataSet: TDataSet);
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryGridCalcFields(DataSet: TDataSet);
    procedure qryClientesAfterOpen(DataSet: TDataSet);
    procedure qryClientesBeforeOpen(DataSet: TDataSet);
    procedure qryClientesBeforeClose(DataSet: TDataSet);
    procedure qryClientesAfterClose(DataSet: TDataSet);
    procedure qryClientesAfterScroll(DataSet: TDataSet);
    procedure qryClientesBeforeScroll(DataSet: TDataSet);
    procedure image(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure imgCancelClick(Sender: TObject);
    procedure DBCtrlGrid3PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure imgUnlockClick(Sender: TObject);
    procedure imgLockClick(Sender: TObject);
    procedure MostrarObservao1Click(Sender: TObject);
    procedure spePrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    FThreadControleFiado: ThreadControleFiado;
    Var idCliente: integer;
    procedure RetornarItens;
    procedure FiltrarCliente;
    procedure Filtrar;
    procedure ListarCliente;
    procedure Excluir;
    procedure BloquearDesbloquearCliente(id: integer);
  end;

var
  frmControleFiado: TfrmControleFiado;

implementation

{$R *.dfm}

uses untPesquisarClientes, untRecebimentoFiado, untObservacao, untSplash;

procedure TfrmControleFiado.image(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin

   imgRed.Visible     := False;
   imgGreen.Visible   := False;
   imgLaranja.Visible := False;
   imgCancel.Visible  := False;
   imgLixo.Visible    := False;

   if Not(qryGrid.IsEmpty) then
      imgCancel.Visible  := True;

   if qryGridTIPO.AsString = 'E' then Begin
      imgRed.Visible := False;
      imgGreen.Visible := True;
   end else if qryGridTIPO.AsString = 'S' then Begin
      imgGreen.Visible := False;
      imgRed.Visible := True;
   End else if qryGridTIPO.AsString = 'C' then Begin
      imgLaranja.Visible := False;
      imgLaranja.Visible := True;
      imgCancel.Visible  := False;
      imgLixo.Visible    := True;
   End;

end;

procedure TfrmControleFiado.BloquearDesbloquearCliente(id: integer);
Var query: TFDQuery;
begin

   if TBaseLocalUsuariosController.VerificarPermissao(frmPrincipal.idUser, 'Bloquear_Cliente_Venda_Fiado') = false then Begin
      prcMsgAdv('Usuário sem permissão de acesso a função.');
      Exit;
   End;

   if qryClientesBLOQUEADO.AsString = 'S' then Begin
      if fctMsgConfirmDefaultButtonYes('Confirma o desbloqueio do cliente selecionado?') = false then
         Exit;
   End else Begin
      if fctMsgConfirmDefaultButtonYes('Confirma o bloqueio do cliente selecionado?') = false then
         Exit;
   End;

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      if qryClientesBLOQUEADO.AsString = 'S' then
         query.SQL.Add(' UPDATE clientes SET bloqueado = ''N'' WHERE id = '+qryClientesID.AsString)
      else
         query.SQL.Add(' UPDATE clientes SET bloqueado = ''S'' WHERE id = '+qryClientesID.AsString);

      Try

         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         qryClientes.Refresh;
      Finally

         frmPrincipal.ConexaoLocal.Rollback;
         FreeAndNil(query)

      End;

   Finally

      FreeAndNil(query)

   End;

end;

procedure TfrmControleFiado.DBCtrlGrid3PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin

   if qryClientesBLOQUEADO.AsString = 'S' then Begin
      imgLock.Visible := True;
      imgUnlock.Visible := False;
   end else Begin
      imgLock.Visible := False;
      imgUnlock.Visible := True;
   End;

end;

procedure TfrmControleFiado.Excluir;
Var query: TFDQuery;
begin

   if fctMsgConfirmDefaultButtonNo('Confirma a exclusão do registro?') = False then
      Exit;

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add('  UPDATE fiados SET tipo = ''C'' WHERE id = '+qryGridID.AsString);

      Try
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         qryGrid.Refresh;
         Filtrar;
      Except
         frmPrincipal.ConexaoLocal.Rollback;
      End;


   Finally

      FreeAndNil(query)

   End;

end;

procedure TfrmControleFiado.Filtrar;
Var query: TFDQuery;
    saldo: double;
begin

   if Not(qryClientesID.AsInteger > 0) then
      Exit;

   qryGrid.Close;
   qryGrid.SQL.Clear;
   qryGrid.SQL.Add('  SELECT f.*, ');
   qryGrid.SQL.Add('        c.nome,  ');
   qryGrid.SQL.Add('        c.logradouro, ');
   qryGrid.SQL.Add('        c.numero, ');
   qryGrid.SQL.Add('        c.complemento,  ');
   qryGrid.SQL.Add('        c.bairro, ');
   qryGrid.SQL.Add('        ci.cid_nome   ');
   qryGrid.SQL.Add('   FROM fiados f INNER JOIN clientes c ON f.id_cliente = c.id ');
   qryGrid.SQL.Add('                 INNER JOIN cidade ci ON cast(c.cidade AS varchar(7)) = ci.cid_codigo ');
   qryGrid.SQL.Add('     AND f.id_cliente = '+qryClientesID.AsString);
   qryGrid.SQL.Add('  ORDER BY f.id DESC');
   qryGrid.Open;

   Try

      saldo := 0.00;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Clear;
      query.SQL.Add(' SELECT Coalesce(SUM(VALOR_VENDA),0.00) AS total ');
      query.SQL.Add('   FROM fiados f INNER JOIN clientes c ON f.id_cliente = c.id ');
      query.SQL.Add('                 INNER JOIN cidade ci ON cast(c.cidade AS varchar(7)) = ci.cid_codigo ');
      query.SQL.Add('     AND f.id_cliente = '+qryClientesID.AsString);
      query.SQL.Add('     AND f.tipo = ''S'' ');
      query.Open;

      lblTotalCompras.Caption := FormatFloat('###,#0.00', query.FieldByName('total').AsFloat);

      saldo := saldo - query.FieldByName('total').AsFloat;

      query.Close;
      query.SQL.Clear;
      query.SQL.Add(' SELECT Coalesce(SUM(VALOR_VENDA),0.00) AS total ');
      query.SQL.Add('   FROM fiados f INNER JOIN clientes c ON f.id_cliente = c.id ');
      query.SQL.Add('                 INNER JOIN cidade ci ON cast(c.cidade AS varchar(7)) = ci.cid_codigo ');
      query.SQL.Add('     AND f.id_cliente = '+qryClientesID.AsString);
      query.SQL.Add('     AND f.tipo = ''E'' ');
      query.Open;

      lblTotalRecebimentos.Caption := FormatFloat('###,#0.00', query.FieldByName('total').AsFloat);

      saldo := saldo + query.FieldByName('total').AsFloat;
      lblSaldoFinal.Caption := FormatFloat('###,#0.00', saldo);

   Finally

      FreeAndNil(query)

   End;

end;

procedure TfrmControleFiado.FiltrarCliente;
begin

   Application.CreateForm(TfrmPesquisarClientes, frmPesquisarClientes);
   frmPesquisarClientes.origem := 'FIADO';
   frmPesquisarClientes.ShowModal;

end;

procedure TfrmControleFiado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //FThreadControleFiado.Free;
end;

procedure TfrmControleFiado.FormCreate(Sender: TObject);
begin
   idCliente := 0;
end;

procedure TfrmControleFiado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F1: Begin
         idCliente := 0;
         ListarCliente;
         //Filtrar;
      End;

   end;

end;

procedure TfrmControleFiado.FormShow(Sender: TObject);
begin
  //ListarCliente;
  DBCtrlGrid3.SetFocus;
end;

procedure TfrmControleFiado.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmControleFiado.imgCancelClick(Sender: TObject);
begin

   Excluir;

end;

procedure TfrmControleFiado.imgLockClick(Sender: TObject);
begin

   BloquearDesbloquearCliente(qryClientesID.AsInteger);

end;

procedure TfrmControleFiado.imgUnlockClick(Sender: TObject);
begin

   BloquearDesbloquearCliente(qryClientesID.AsInteger);

end;

procedure TfrmControleFiado.Label15Click(Sender: TObject);
begin

   idCliente := 0;
   ListarCliente;

end;

procedure TfrmControleFiado.ListarCliente;
begin
   {
   FThreadControleFiado := ThreadControleFiado.creeate;
   frmSplash := TfrmSplash.Create(Self);
   frmSplash.Timer2.Enabled := True;
   frmSplash.ShowModal;
   }
   frmControleFiado.qryClientes.Close;
   frmControleFiado.qryClientes.SQL.Clear;
   frmControleFiado.qryClientes.SQL.Add('   SELECT DISTINCT(c.id), ');
   frmControleFiado.qryClientes.SQL.Add('          c.nome, ');
   frmControleFiado.qryClientes.SQL.Add('          c.fone_fixo, ');
   frmControleFiado.qryClientes.SQL.Add('          c.celular, ');
   frmControleFiado.qryClientes.SQL.Add('          c.logradouro, ');
   frmControleFiado.qryClientes.SQL.Add('          c.numero, ');
   frmControleFiado.qryClientes.SQL.Add('          c.complemento, ');
   frmControleFiado.qryClientes.SQL.Add('          c.bairro, ');
   frmControleFiado.qryClientes.SQL.Add('          c.bloqueado, ');
   frmControleFiado.qryClientes.SQL.Add('          ci.cid_nome ');
   frmControleFiado.qryClientes.SQL.Add('     FROM fiados f INNER JOIN clientes c ON f.id_cliente = c.id ');
   frmControleFiado.qryClientes.SQL.Add('                   LEFT JOIN cidade ci ON cast(c.cidade AS varchar(7)) = ci.cid_codigo ');

   if frmControleFiado.idCliente > 0 then
      frmControleFiado.qryClientes.SQL.Add('    WHERE f.id_cliente = '+frmControleFiado.idCliente.ToString);

   frmControleFiado.qryClientes.SQL.Add(' ORDER BY c.nome ');
   frmControleFiado.qryClientes.Open;
end;

procedure TfrmControleFiado.MostrarObservao1Click(Sender: TObject);
begin
  if trim(qryGridobs_fiado.AsString) = '' then begin
     prcMsgAdv('Não existe observação para esse lançamento.');
     exit;
  end;
  frmObservacao := tfrmObservacao.create(self);
  frmObservacao.mmoObs.Lines.Text := qryGridobs_fiado.AsString;
  frmObservacao.mmoObs.ReadOnly := true;
  frmObservacao.ShowModal;
end;

procedure TfrmControleFiado.qryClientesAfterClose(DataSet: TDataSet);
begin

   Filtrar;

end;

procedure TfrmControleFiado.qryClientesAfterOpen(DataSet: TDataSet);
begin

   Filtrar;

end;

procedure TfrmControleFiado.qryClientesAfterScroll(DataSet: TDataSet);
begin

   Filtrar;

end;

procedure TfrmControleFiado.qryClientesBeforeClose(DataSet: TDataSet);
begin

   Filtrar;

end;

procedure TfrmControleFiado.qryClientesBeforeOpen(DataSet: TDataSet);
begin

   Filtrar;

end;

procedure TfrmControleFiado.qryClientesBeforeScroll(DataSet: TDataSet);
begin

   Filtrar;

end;

procedure TfrmControleFiado.qryGridAfterScroll(DataSet: TDataSet);
begin

   RetornarItens;

end;

procedure TfrmControleFiado.qryGridBeforeScroll(DataSet: TDataSet);
begin

   RetornarItens;

end;

procedure TfrmControleFiado.qryGridCalcFields(DataSet: TDataSet);
Var complemento: String;
begin

   if Trim(qryGridCOMPLEMENTO.AsString) <> '' then
      complemento := Trim(qryGridCOMPLEMENTO.AsString)+' ';

   qryGridcalcEndereco.AsString := Trim(qryGridLOGRADOURO.AsString)+', '+
                                   Trim(qryGridNUMERO.AsString)+' '+
                                   complemento+
                                   Trim(qryGridBAIRRO.AsString)+' '+
                                   Trim(qryGridCID_NOME.AsString);

   qryGridcalcTipo.AsString := 'ENTRADA';

   if qryGridTIPO.AsString = 'S' then
      qryGridcalcTipo.AsString := 'SAÍDA';

end;

procedure TfrmControleFiado.RetornarItens;
Var total: double;
begin

   if qryGrid.IsEmpty then
      Exit;

   //lblDataVenda.Caption := '';
   lblVenda.Caption     := '';
   lblTotal.Caption     := '';
   Label2.Caption       := '';
   Label1.Caption       := '';
   Label4.Caption       := '';
   lblVlFiado.Caption       := '';
   lblEntrada.Caption       := '';
   lblDtRecebimento.Caption := '';
   lblDtVenda.Caption       := '';
   total := 0.00;

   qryItens.Close;
   qryRec.Close;

   if Not(qryGridID.AsInteger > 0) then
      Exit;

   if (((qryGridTIPO.AsString = 'S') OR (qryGridTIPO.AsString = 'C')) AND (qryGridID_VENDA.AsInteger > 0)) then Begin

      pnlRecebimento.Visible := False;

      qryItens.SQL.Clear;
      qryItens.SQL.Add(' SELECT p.descricao, ');
      qryItens.SQL.Add('        d.valor_unitario, ');
      qryItens.SQL.Add('        u.sigla, ');
      qryItens.SQL.Add('        d.quantidade, ');
      qryItens.SQL.Add('        d.valor_total ');
      qryItens.SQL.Add('   FROM venda_detalhe d INNER JOIN produtos p ON d.id_produto = p.id ');
      qryItens.SQL.Add('                        INNER JOIN unidade_produtos u ON p.id_unidade = u.id ');
      qryItens.SQL.Add('    AND d.id_venda_cabecalho = '+qryGridID_VENDA.AsString);
      qryItens.Open;

      if Not(qryItens.IsEmpty) then Begin
         lblVenda.Caption := 'Venda Nº '+qryGridID.AsString;
         //lblDataVenda.Caption := 'Data Venda '+qryGridDATA_VENDA.AsString;
         lblTotal.Caption := 'R$ '+FormatFloat('###,#0.00', qryGridTOTAL_VENDA.AsFloat);
         lblEntrada.Caption := 'R$ '+FormatFloat('###,#0.00', qryGridTOTAL_VENDA.AsFloat-qryGridVALOR_VENDA.AsFloat);
         lblVlFiado.Caption := 'R$ '+FormatFloat('###,#0.00', qryGridVALOR_VENDA.AsFloat);
         Label2.Caption       := 'Valor Total';
         Label1.Caption       := 'Valor Entrada';
         Label4.Caption       := 'Valor Fiado';
         //dbgGrid.Width        := 658;
      End;

      lblDtVenda.Caption := 'Venda realizada em '+qryGridDATA_VENDA.AsString;
      lbl01.Visible := True;
      lbl02.Visible := True;
      spePrint.Visible := true;

   End else Begin

      qryRec.SQL.Clear;
      qryRec.SQL.Add(' SELECT f.nome, ');
      qryRec.SQL.Add('        rf.valor ');
      qryRec.SQL.Add('   FROM recebimentos_fiado rf, ');
      qryRec.SQL.Add('        formas_pagamento f ');
      qryRec.SQL.Add('  WHERE rf.id_pagamento = f.id ');
      qryRec.SQL.Add('    AND rf.id_recebimento = '+qryGridID.AsString);
      qryRec.Open;

      while Not(qryRec.Eof) do Begin

         total := total + qryRec.FieldByName('valor').AsFloat;
         qryRec.Next;

      End;

      qryRec.First;

      pnlRecebimento.Visible := True;
      lblDtRecebimento.Caption := 'Pagamento realizado em '+qryGridDATA_PAGAMENTO.AsString;

      if Not(qryRec.IsEmpty) then Begin
         lblVenda.Caption := 'Recebimento de Fiado';
         //lblDataVenda.Caption := 'Data Venda '+qryGridDATA_VENDA.AsString;
         lblTotal.Caption := 'R$ '+FormatFloat('###,#0.00', total);
         Label2.Caption       := 'Valor Total';
         //dbgGrid.Width        := 658;
      End;

      lbl01.Visible := False;
      lbl02.Visible := False;
      spePrint.Visible := false;

   End;

end;

procedure TfrmControleFiado.SpeedButton1Click(Sender: TObject);
begin

   FiltrarCliente;

end;

procedure TfrmControleFiado.SpeedButton2Click(Sender: TObject);
begin

   if TBaseLocalUsuariosController.VerificarPermissao(frmPrincipal.idUser, 'Recebimento_de_PG_Fiados') = false then Begin
      prcMsgAdv('Usuário sem permissão de acesso a função.');
      Exit;
   End;

   Application.CreateForm(TfrmRecebimentoFiado, frmRecebimentoFiado);
   //frmRecebimentoFiado.lblValorVenda.Caption := FormatFloat('###,#0.00', )
   frmRecebimentoFiado.ShowModal;

end;

procedure TfrmControleFiado.spePrintClick(Sender: TObject);
begin
   frmPrincipal.ImprimirVenda(qryGridID_VENDA.Asinteger, qryGridobs_fiado.AsString);
end;

{ ThreadSplashExportarCloud }

constructor ThreadControleFiado.creeate;
begin
   inherited Create(false);
end;

procedure ThreadControleFiado.Execute;
begin
{
   Try
     frmControleFiado.qryClientes.Close;
     frmControleFiado.qryClientes.SQL.Clear;
     frmControleFiado.qryClientes.SQL.Add('   SELECT DISTINCT(c.id), ');
     frmControleFiado.qryClientes.SQL.Add('          c.nome, ');
     frmControleFiado.qryClientes.SQL.Add('          c.fone_fixo, ');
     frmControleFiado.qryClientes.SQL.Add('          c.celular, ');
     frmControleFiado.qryClientes.SQL.Add('          c.logradouro, ');
     frmControleFiado.qryClientes.SQL.Add('          c.numero, ');
     frmControleFiado.qryClientes.SQL.Add('          c.complemento, ');
     frmControleFiado.qryClientes.SQL.Add('          c.bairro, ');
     frmControleFiado.qryClientes.SQL.Add('          c.bloqueado, ');
     frmControleFiado.qryClientes.SQL.Add('          ci.cid_nome ');
     frmControleFiado.qryClientes.SQL.Add('     FROM fiados f INNER JOIN clientes c ON f.id_cliente = c.id ');
     frmControleFiado.qryClientes.SQL.Add('                   LEFT JOIN cidade ci ON cast(c.cidade AS varchar(7)) = ci.cid_codigo ');

     if frmControleFiado.idCliente > 0 then
        frmControleFiado.qryClientes.SQL.Add('    WHERE f.id_cliente = '+frmControleFiado.idCliente.ToString);

     frmControleFiado.qryClientes.SQL.Add(' ORDER BY c.nome ');
     frmControleFiado.qryClientes.Open;

   Finally
      frmSplash.Close;
      frmControleFiado.Filtrar;
   End;
   }
end;

end.
