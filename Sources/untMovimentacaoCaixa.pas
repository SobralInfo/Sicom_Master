unit untMovimentacaoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, BaseLocalSuprimentoVO,
  JvExStdCtrls, JvEdit, JvValidateEdit, Vcl.ExtCtrls, Vcl.Imaging.pngimage, BaseLocalSuprimentoController,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, untPrincipal,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, unitConfiguracoes,
  FireDAC.Comp.Client, BaseLocalUsuariosController, BaseLocalUsuariosVO;

type
  TfrmMovimentacaoCaixa = class(TForm)
    Label1: TLabel;
    lkpCaixa: TDBLookupComboBox;
    edtUsuario: TMaskEdit;
    Label2: TLabel;
    edtSenha: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtAbertura: TJvValidateEdit;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    Label6: TLabel;
    Panel3: TPanel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    mkeDataHora: TMaskEdit;
    qryCaixa: TFDQuery;
    dtsCaixa: TDataSource;
    qryCaixaID: TIntegerField;
    qryCaixaDESCRICAO: TStringField;
    lblStatus: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure lkpCaixaClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure lkpCaixaKeyPress(Sender: TObject; var Key: Char);
    procedure edtAberturaKeyPress(Sender: TObject; var Key: Char);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure VerificarCaixa;
    Procedure ValidarUsuario;
    procedure GravarMovimento(idUser: integer);
  end;

var
  frmMovimentacaoCaixa: TfrmMovimentacaoCaixa;

implementation

{$R *.dfm}

procedure TfrmMovimentacaoCaixa.edtAberturaKeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      edtUsuario.SetFocus;

end;

procedure TfrmMovimentacaoCaixa.edtSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      ValidarUsuario;

end;

procedure TfrmMovimentacaoCaixa.edtUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      edtSenha.SetFocus;

end;

procedure TfrmMovimentacaoCaixa.FormCreate(Sender: TObject);
begin

   qryCaixa.Close;
   qryCaixa.Open;

end;

procedure TfrmMovimentacaoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: ValidarUsuario;

   end;

end;

procedure TfrmMovimentacaoCaixa.GravarMovimento(idUser: integer);
Var query: TFDQuery;
    idMovimento: integer;
    suprimento: TBaseLocalSuprimentoVO;

function retornarGenerator: integer;
Var query: TFDQuery;

begin

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.Close;
      query.SQL.Add('SELECT gen_id(GEN_MOVIMENTO_CAIXAS_ID, 1) AS id from rdb$database;');
      query.Open;

      Result := query.FieldByName('id').AsInteger;

   Finally

      //FreeAndNil(query);

   End;

end;

begin

   Try

      idMovimento := retornarGenerator;

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add(' INSERT INTO movimento_caixas ');
      query.SQL.Add(' (  ');
      query.SQL.Add(' id, status, data_abertura, id_usuario, valor_abertura, id_caixa ');
      query.SQL.Add(' ) ');
      query.SQL.Add(' VALUES ');
      query.SQL.Add(' ( ');
      query.SQL.Add(' :id, ''A'', :data_abertura, :id_usuario, :valor_abertura, :id_caixa  ');
      query.SQL.Add(' ) ');

      query.Params.ParamByName('id').AsInteger             := idMovimento;
      query.Params.ParamByName('data_abertura').AsDateTime := StrToDateTime(mkeDataHora.Text);
      query.Params.ParamByName('id_caixa').Asinteger       := lkpCaixa.KeyValue;
      query.Params.ParamByName('valor_abertura').Asfloat   := edtAbertura.AsFloat;
      query.Params.ParamByName('id_usuario').AsInteger     := idUser;

      Try

         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         frmPrincipal.idMovimento := idMovimento;
         prcMsgInf('Movimento aberto com sucesso.');

         Try

            suprimento := TBaseLocalSuprimentoVO.Create;

            suprimento.descricao    := 'Abertura de Caixa';
            suprimento.data         := Date;
            suprimento.valor        := edtAbertura.AsFloat;
            suprimento.id_movimento := idMovimento;
            suprimento.id_usuario   := 0;

            TBaseLocalSuprimentoController.GravarSuprimentos(suprimento);
            frmPrincipal.ImprimirSuprimento(suprimento);

         Finally

            FreeAndNil(suprimento);

         End;

      Except

         frmPrincipal.ConexaoLocal.Rollback;

      End;

   Finally

      FreeAndNil(query);

   End;

end;

procedure TfrmMovimentacaoCaixa.Image3Click(Sender: TObject);
begin

   ValidarUsuario;

end;

procedure TfrmMovimentacaoCaixa.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmMovimentacaoCaixa.lkpCaixaClick(Sender: TObject);
begin

   VerificarCaixa;

end;

procedure TfrmMovimentacaoCaixa.lkpCaixaKeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      if edtAbertura.Enabled then
         edtAbertura.SetFocus
      else if edtUsuario.Enabled then
         edtUsuario.SetFocus
      else if edtSenha.Enabled then
         edtSenha.SetFocus;

end;

procedure TfrmMovimentacaoCaixa.ValidarUsuario;
Var user: TBaseLocalUsuariosVO;
begin

   if Trim(edtUsuario.Text) = '' then Begin
      prcMsgAdv('Informe o nome do usuário.');
      if edtUsuario.Enabled then
         edtUsuario.SetFocus;
      Exit;
   End;


   if Trim(edtSenha.Text) = '' then Begin
      prcMsgAdv('Informe a senha do usuário.');
      if edtSenha.Enabled then
         edtSenha.SetFocus;
      Exit;
   End;

   Try

      user := TBaseLocalUsuariosVO.Create;

      user.ID   := 0;
      user.NOME := Trim(edtUsuario.Text);
      user.PW   := Trim(edtSenha.Text);

      user := TBaseLocalUsuariosController.ValidarUsuario(user);

      if user.ID > 0 then Begin

         if edtUsuario.Enabled then
            GravarMovimento(user.ID);
         frmPrincipal.movimentacao := True;

         frmPrincipal.lblFuncionario := Trim(user.NOME);
         frmPrincipal.lblCaixa       := Trim(qryCaixaDESCRICAO.AsString);
         frmPrincipal.lblMovimento   := 'Data Abertura Movimento: '+Trim(mkeDataHora.Text);

         Close;

      End else
         prcMsgAdv('Dados do usuário inválidos.');

   Finally

      FreeAndNil(user);

   End;

end;

procedure TfrmMovimentacaoCaixa.VerificarCaixa;
Var query: TFDQuery;
begin

   if qryCaixa.IsEmpty then
      Exit;

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      query.SQL.Add(' SELECT mc.*, u.nome ');
      query.SQL.Add('   FROM movimento_caixas mc INNER JOIN usuarios u ON mc.id_usuario = u.id ');
      query.SQL.Add('  WHERE mc.status = ''A'' AND id_caixa = '+qryCaixaID.AsString);
      query.Open;

      if Not(query.IsEmpty) then Begin

         lblStatus.Font.Color:= clRed;
         lblStatus.Caption   := '(OCUPADO)';
         mkeDataHora.Text    := DateTimeToStr(query.FieldByName('DATA_ABERTURA').AsDateTime);
         edtAbertura.AsFloat := query.FieldByName('VALOR_ABERTURA').AsFloat;
         edtUsuario.Text     := Trim( query.FieldByName('nome').AsString);
         frmPrincipal.idMovimento := QUERY.FieldByName('id').AsInteger;

         edtAbertura.Enabled := False;
         edtUsuario.Enabled  := False;
         edtSenha.Enabled    := True;

      End else Begin

         lblStatus.Font.Color:= clBlue;
         lblStatus.Caption   := '(LIBERADO)';
         mkeDataHora.Text    := DateTimeToStr(now);
         edtAbertura.AsFloat := 0.00;
         edtUsuario.Text     := '';

         edtAbertura.Enabled := True;
         edtUsuario.Enabled  := True;
         edtSenha.Enabled    := True;


      End;



   Finally

      FreeAndNil(query)

   End;

end;

end.
