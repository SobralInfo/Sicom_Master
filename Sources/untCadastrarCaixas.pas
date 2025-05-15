unit untCadastrarCaixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, firedac.Comp.Client,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, unitConfiguracoes;

type
  TfrmCadastrarCaixas = class(TForm)
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label4: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    cbbStatus: TComboBox;
    edtDescricao: TMaskEdit;
    Panel2: TPanel;
    Panel4: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure speNovoClick(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Var DAO: String;
        idCaixa: integer;
    procedure Novo;
    procedure Salvar;
    procedure CANCELAR;
    procedure HabilitarDesabilitarBotoes(tipo: string);
    procedure HabilitarDesabilitarCampos(tipo: string);
    procedure LimparCampos;
  end;

var
  frmCadastrarCaixas: TfrmCadastrarCaixas;

implementation

{$R *.dfm}

uses untPrincipal, untPesquisarCaixas;

{ TfrmCadastrarCaixas }

procedure TfrmCadastrarCaixas.CANCELAR;
begin

   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');

end;

procedure TfrmCadastrarCaixas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case Key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmCadastrarCaixas.HabilitarDesabilitarBotoes(tipo: string);
begin

   if tipo = 'N' then Begin

      speNovo.Enabled     := False;
      speSalvar.Enabled   := True;
      speCancelar.Enabled := True;

   End;

   if tipo = 'E' then Begin

      speNovo.Enabled     := False;
      speSalvar.Enabled   := True;
      speCancelar.Enabled := True;

   End;

   if tipo = 'X' then Begin

      speNovo.Enabled     := True;
      speSalvar.Enabled   := False;
      speCancelar.Enabled := False;

   End;

   if tipo = 'C' then Begin

      speNovo.Enabled     := True;
      speSalvar.Enabled   := False;
      speCancelar.Enabled := False;

   End;

   if tipo = 'S' then Begin

      speNovo.Enabled     := True;
      speSalvar.Enabled   := False;
      speCancelar.Enabled := False;

   End;

end;

procedure TfrmCadastrarCaixas.HabilitarDesabilitarCampos(tipo: string);
begin

   if tipo = 'H' then Begin

      cbbStatus.Enabled       := True;
      edtDescricao.Enabled    := True;

   End else if tipo = 'D' then Begin

      cbbStatus.Enabled       := False;
      edtDescricao.Enabled    := False;

   End;

end;

procedure TfrmCadastrarCaixas.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarCaixas.LimparCampos;
begin

   cbbStatus.ItemIndex := -1;
   edtDescricao.Text   := '';

end;

procedure TfrmCadastrarCaixas.Novo;
begin

   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;
   cbbStatus.ItemIndex := 0;
   cbbStatus.SetFocus;
   DAO := 'N';

end;

procedure TfrmCadastrarCaixas.Salvar;
Var query: tfdquery;
begin

   if cbbStatus.ItemIndex < 0 then Begin
      prcMsgAdv('Informe o status do caixa.');
      cbbStatus.SetFocus;
      Exit;
   End;

   if Trim(edtDescricao.Text) = '' then Begin
      prcMsgAdv('Informe a descrição do caixa.');
      edtDescricao.SetFocus;
      Exit;
   End;

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      if DAO = 'U' then Begin
         query.SQL.Add(' UPDATE CAIXAS SET status = :status, descricao = :descricao WHERE id = :id ');
      End else Begin
         query.SQL.Add('SELECT gen_id(GEN_CAIXAS_ID, 1) AS id from rdb$database;');
         query.Open;
         idCaixa := query.FieldByName('id').AsInteger;
         query.Close;
         query.SQL.Clear;
         query.SQL.Add(' INSERT INTO CAIXAS (id, status, descricao) VALUES (:id, :status, :descricao) ');
      End;

      Try
         query.Params.ParamByName('id').AsInteger       := idCaixa;
         query.Params.ParamByName('status').AsString    := Copy(Trim(cbbStatus.Text),1,1);
         query.Params.ParamByName('descricao').AsString := Trim(edtDescricao.Text);
         query.ExecSQL;

         frmPrincipal.ConexaoLocal.Commit;

         if DAO = 'U' then
            prcMsgInf('Registro alterado com sucesso.')
         else Begin
            DAO := 'U';
            prcMsgInf('Registro inserido com sucesso.');
         End;

      Except

         frmPrincipal.ConexaoLocal.Rollback;
         prcMsgErro('Falha ao alterar o registro.');

      End;

   Finally

      FreeAndNil(query);

   End;

end;

procedure TfrmCadastrarCaixas.speCancelarClick(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCadastrarCaixas.SpeedButton5Click(Sender: TObject);
begin

   Application.CreateForm(TfrmPesquisarCaixas, frmPesquisarCaixas);
   frmPesquisarCaixas.origem := 'CADASTRO_CAIXAS';
   frmPesquisarCaixas.ShowModal;

end;

procedure TfrmCadastrarCaixas.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarCaixas.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

end.
