unit untCadastrarFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage, BaseLocalFuncionariosVO, unitConfiguracoes,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, BaseLocalFuncionariosController;

type
  TfrmCadastrarFuncionarios = class(TForm)
    cbbStatus: TComboBox;
    edtPercComissao: TJvValidateEdit;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    edtCodigo: TMaskEdit;
    edtNome: TMaskEdit;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure speSalvarClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Var DAO: string;
        idFuncionario: integer;
    procedure Pesquisar;
    procedure Salvar;
    procedure Cancelar;
    procedure Novo;
    procedure HabilitarDesabilitarBotoes(tipo: string);
    procedure HabilitarDesabilitarCampos(tipo: string);
    procedure LimparCampos;
  end;

var
  frmCadastrarFuncionarios: TfrmCadastrarFuncionarios;

implementation

{$R *.dfm}

uses untPesquisarFuncionarios;

procedure TfrmCadastrarFuncionarios.Cancelar;
begin

   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');

end;

procedure TfrmCadastrarFuncionarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmCadastrarFuncionarios.HabilitarDesabilitarBotoes(tipo: string);
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

procedure TfrmCadastrarFuncionarios.HabilitarDesabilitarCampos(tipo: string);
begin

   if tipo = 'H' then Begin

      cbbStatus.Enabled       := True;
      edtCodigo.Enabled       := True;
      edtNome.Enabled         := True;
      edtPercComissao.Enabled := True;

   End else if tipo = 'D' then Begin

      cbbStatus.Enabled       := False;
      edtCodigo.Enabled       := False;
      edtNome.Enabled         := False;
      edtPercComissao.Enabled := False;

   End;

end;

procedure TfrmCadastrarFuncionarios.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarFuncionarios.LimparCampos;
begin

   cbbStatus.ItemIndex     := -1;
   edtPercComissao.AsFloat := 0.00;
   edtCodigo.Text          := '';
   edtNome.Text            := '';
   idFuncionario           := 0;
   DAO                     := '';

end;

procedure TfrmCadastrarFuncionarios.Novo;
begin

   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;
   cbbStatus.ItemIndex := 0;
   cbbStatus.SetFocus;
   DAO := 'N';

end;

procedure TfrmCadastrarFuncionarios.Pesquisar;
begin

   Application.CreateForm(TfrmPesquisarFuncionarios, frmPesquisarFuncionarios);
   frmPesquisarFuncionarios.origem := 'CADASTRO_FUNCIONARIOS';
   frmPesquisarFuncionarios.ShowModal;

end;

procedure TfrmCadastrarFuncionarios.Salvar;
var funcionario: TBaseLocalFuncionariosVO;
begin

   if cbbStatus.ItemIndex < 0 then Begin
      prcMsgAdv('Informe O status do funcionário.');
      cbbStatus.SetFocus;
      Exit;
   End;

   if Trim(edtNome.Text) = '' then Begin
      prcMsgAdv('Informe o nome do funcionário.');
      edtNome.SetFocus;
      Exit;
   End;

   Try

      funcionario := TBaseLocalFuncionariosVO.Create;

      funcionario.STATUS              := Copy(Trim(cbbStatus.Text),1,1);
      funcionario.CODIGO              := Trim(edtCodigo.Text);
      funcionario.NOME                := Trim(edtNome.Text);
      funcionario.percentual_comissao := edtPercComissao.AsFloat;

      if DAO = 'U' then Begin
         funcionario.ID := idFuncionario;
         TBaseLocalFuncionariosController.AlterarFuncionario(funcionario);
      End else Begin
         idFuncionario  := TBaseLocalFuncionariosController.retornarGenerator;
         funcionario.ID := idFuncionario;
         TBaseLocalFuncionariosController.GravarFuncionario(funcionario);
         DAO := 'U';
         idFuncionario := funcionario.id;
      End;

   Finally

      FreeAndNil(funcionario);

   End;

end;

procedure TfrmCadastrarFuncionarios.speCancelarClick(Sender: TObject);
begin

   Cancelar;

end;

procedure TfrmCadastrarFuncionarios.SpeedButton5Click(Sender: TObject);
begin

   Pesquisar;

end;

procedure TfrmCadastrarFuncionarios.speNovoClick(Sender: TObject);
begin

   Novo;

end;

procedure TfrmCadastrarFuncionarios.speSalvarClick(Sender: TObject);
begin

   Salvar;

end;

end.
