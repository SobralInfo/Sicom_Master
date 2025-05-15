unit untCadastrarCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, unitConfiguracoes,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, FireDAC.Comp.Client;

type
  TfrmCadastrarCategoria = class(TForm)
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    cbbStatus: TComboBox;
    Label1: TLabel;
    edtDescricao: TMaskEdit;
    procedure Image1Click(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    Var DAO: String;
        idCategoria: integer;
    procedure Novo;
    procedure Salvar;
    procedure CANCELAR;
    procedure HabilitarDesabilitarBotoes(tipo: string);
    procedure HabilitarDesabilitarCampos(tipo: string);
    procedure LimparCampos;
  end;

var
  frmCadastrarCategoria: TfrmCadastrarCategoria;

implementation

{$R *.dfm}

uses untPrincipal, untPesquisarCategorias;

procedure TfrmCadastrarCategoria.CANCELAR;
begin

   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');

end;

procedure TfrmCadastrarCategoria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case Key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmCadastrarCategoria.HabilitarDesabilitarBotoes(tipo: string);
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

procedure TfrmCadastrarCategoria.HabilitarDesabilitarCampos(tipo: string);
begin

   if tipo = 'H' then Begin

      cbbStatus.Enabled       := True;
      edtDescricao.Enabled    := True;

   End else if tipo = 'D' then Begin

      cbbStatus.Enabled       := False;
      edtDescricao.Enabled    := False;

   End;


end;

procedure TfrmCadastrarCategoria.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarCategoria.LimparCampos;
begin

   cbbStatus.ItemIndex := -1;
   edtDescricao.Text   := '';

end;

procedure TfrmCadastrarCategoria.Novo;
begin

   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;
   cbbStatus.ItemIndex := 0;
   cbbStatus.SetFocus;
   DAO := 'N';

end;

procedure TfrmCadastrarCategoria.Salvar;
Var query: tfdquery;
begin

   if cbbStatus.ItemIndex < 0 then Begin
      prcMsgAdv('Informe O status da categoria.');
      cbbStatus.SetFocus;
      Exit;
   End;

   if Trim(edtDescricao.Text) = '' then Begin
      prcMsgAdv('Informe a descrição da categoria.');
      edtDescricao.SetFocus;
      Exit;
   End;

   Try

      query := TFDQuery.Create(Nil);
      query.Connection := frmPrincipal.ConexaoLocal;

      if DAO = 'U' then Begin
         query.SQL.Add(' UPDATE categoria SET status = :status, descricao = :descricao WHERE id = :id ');
      End else Begin
         query.SQL.Add('SELECT gen_id(gen_categoria_id, 1) AS id from rdb$database;');
         query.Open;
         idCategoria := query.FieldByName('id').AsInteger;
         query.Close;
         query.SQL.Clear;
         query.SQL.Add(' INSERT INTO categoria (id, status, descricao) VALUES (:id, :status, :descricao) ');
      End;

      Try
         query.Params.ParamByName('id').AsInteger       := idCategoria;
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

procedure TfrmCadastrarCategoria.speCancelarClick(Sender: TObject);
begin

   CANCELAR;

end;

procedure TfrmCadastrarCategoria.SpeedButton5Click(Sender: TObject);
begin

   Application.CreateForm(TfrmPesquisarCategorias, frmPesquisarCategorias);
   frmPesquisarCategorias.origem := 'CADASTRO_CATEGORIAS';
   frmPesquisarCategorias.ShowModal;

end;

procedure TfrmCadastrarCategoria.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarCategoria.speSalvarClick(Sender: TObject);
begin

   salvar;

end;

end.
