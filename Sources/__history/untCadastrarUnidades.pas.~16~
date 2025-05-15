unit untCadastrarUnidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, BaseLocalUnidadesVO, BaseLocalUnidadesController,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Mask, JvExStdCtrls, JvEdit, unitConfiguracoes,
  JvValidateEdit;

type
  TfrmCadastrarUnidades = class(TForm)
    edtFator: TJvValidateEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtSigla: TMaskEdit;
    edtDescricao: TMaskEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Panel4: TPanel;
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label6: TLabel;
    cbbStatus: TComboBox;
    cbbFracionar: TComboBox;
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Novo;
    procedure Salvar;
    procedure Pesquisar;
    procedure Cancelar;
    procedure HabilitarDesabilitarBotoes(tipo: string);
    procedure HabilitarDesabilitarCampos(tipo: string);
    procedure LimparCampos;
    var DAO: string;
        idUnidade: integer;
  end;

var
  frmCadastrarUnidades: TfrmCadastrarUnidades;

implementation

{$R *.dfm}

uses untPesquisarUnidades;

procedure TfrmCadastrarUnidades.Cancelar;
begin

   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');

end;

procedure TfrmCadastrarUnidades.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmCadastrarUnidades.HabilitarDesabilitarBotoes(tipo: string);
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

procedure TfrmCadastrarUnidades.HabilitarDesabilitarCampos(tipo: string);
begin

   if tipo = 'H' then Begin

      cbbStatus.Enabled    := True;
      edtDescricao.Enabled := True;
      edtSigla.Enabled     := True;
      cbbFracionar.Enabled := True;
      edtFator.Enabled     := True;

   End else if tipo = 'D' then Begin

      cbbStatus.Enabled    := False;
      edtDescricao.Enabled := False;
      edtSigla.Enabled     := False;
      cbbFracionar.Enabled := False;
      edtFator.Enabled     := False;

   End;


end;

procedure TfrmCadastrarUnidades.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarUnidades.LimparCampos;
begin

   cbbStatus.ItemIndex    := -1;
   edtFator.AsFloat       := 0.00;
   edtSigla.Text          := '';
   edtDescricao.Text      := '';
   cbbFracionar.ItemIndex := -1;
   idUnidade              := 0;
   DAO                    := '';

end;

procedure TfrmCadastrarUnidades.Novo;
begin

   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;
   cbbStatus.ItemIndex := 0;
   cbbStatus.SetFocus;
   DAO := 'N';

end;

procedure TfrmCadastrarUnidades.Pesquisar;
begin

   Application.CreateForm(TfrmPesquisarUnidades, frmPesquisarUnidades);
   frmPesquisarUnidades.origem := 'CADASTRO_UNIDADES';
   frmPesquisarUnidades.ShowModal;

end;

procedure TfrmCadastrarUnidades.Salvar;
var unidade: TBaseLocalUnidadesVO;
begin

   if cbbStatus.ItemIndex < 0 then Begin
      prcMsgAdv('Informe o status da unidade.');
      cbbStatus.SetFocus;
      Exit;
   End;

   if Trim(edtDescricao.Text) = '' then Begin
      prcMsgAdv('Informe a descrição da unidade.');
      edtDescricao.SetFocus;
      Exit;
   End;

   if Trim(edtSigla.Text) = '' then Begin
      prcMsgAdv('Informe a sigla da unidade.');
      edtSigla.SetFocus;
      Exit;
   End;

   if cbbFracionar.ItemIndex < 0 then Begin
      prcMsgAdv('Informe se pode fracionar a unidade.');
      cbbFracionar.SetFocus;
      Exit;
   End;

   if edtFator.AsFloat <= 0 then Begin
      prcMsgAdv('Informe o fator da unidade.');
      edtFator.SetFocus;
      Exit;
   End;


   Try

      unidade := TBaseLocalUnidadesVO.Create;

      unidade.STATUS              := Copy(Trim(cbbStatus.Text),1,1);
      unidade.pode_fracionar      := Copy(Trim(cbbFracionar.Text),1,1);
      unidade.descricao           := Trim(edtDescricao.Text);
      unidade.sigla               := Trim(edtSigla.Text);
      unidade.fator               := edtFator.AsFloat;

      if DAO = 'U' then Begin
         unidade.ID := idUnidade;
         TBaseLocalUnidadesController.AlterarUnidade(unidade);
      End else
         TBaseLocalUnidadesController.GravarUnidade(unidade);

   Finally

      FreeAndNil(unidade);

   End;

end;
procedure TfrmCadastrarUnidades.speCancelarClick(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCadastrarUnidades.SpeedButton5Click(Sender: TObject);
begin

   Pesquisar;

end;

procedure TfrmCadastrarUnidades.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarUnidades.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

end.
