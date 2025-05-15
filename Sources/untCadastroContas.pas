unit untCadastroContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Data.FMTBcd, Data.DB, Data.SqlExpr, Vcl.Grids, Vcl.DBGrids,
  Datasnap.Provider, Datasnap.DBClient, Vcl.Menus, Vcl.DBCtrls, RLReport,
  RLFilters, RLPDFFilter, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.pngimage;

type
  TfrmCadastroContas = class(TForm)
    ppmPesquisa: TPopupMenu;
    ExcluirRegistro1: TMenuItem;
    ppmAtalhos: TPopupMenu;
    MenuItem1: TMenuItem;
    Salvar1: TMenuItem;
    Cancelar1: TMenuItem;
    Pesquisar1: TMenuItem;
    ImprimirPesquisa1: TMenuItem;
    FiltrarPesquisa1: TMenuItem;
    qryAUX: TFDQuery;
    qryDAO: TFDQuery;
    Panel3: TPanel;
    Label3: TLabel;
    Image1: TImage;
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label2: TLabel;
    cbbConta: TComboBox;
    Label1: TLabel;
    edtConta: TEdit;
    Label4: TLabel;
    cbbStatus: TComboBox;
    procedure speSalvarClick(Sender: TObject);
    procedure speCancelarClick(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);

  private
    { Private declarations }

  public
    var DAO: string;
        idConta: integer;
    procedure Novo;
    procedure Salvar;
    procedure Cancelar;
    procedure HabilitarDesabilitarBotoes(tipo: string);
    procedure HabilitarDesabilitarCampos(tipo: string);
    procedure LimparCampos;
    procedure Pesquisar;
    { Public declarations }
  end;

var
  frmCadastroContas: TfrmCadastroContas;

implementation

uses unitConfiguracoes, untPrincipal, untPesquisarContasFinanceiras;

{$R *.dfm}


{ TfrmCadastroContas }

procedure TfrmCadastroContas.Cancelar;
begin
   LimparCampos;
   HabilitarDesabilitarCampos('D');
   HabilitarDesabilitarBotoes('C');
end;

procedure TfrmCadastroContas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: close;
   end;
end;

procedure TfrmCadastroContas.HabilitarDesabilitarBotoes(tipo: string);
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

procedure TfrmCadastroContas.HabilitarDesabilitarCampos(tipo: string);
begin
   if tipo = 'H' then Begin
      cbbStatus.Enabled := True;
      cbbConta.Enabled  := True;
      edtConta.Enabled  := True;
   End else if tipo = 'D' then Begin
      cbbStatus.Enabled := False;
      cbbConta.Enabled  := False;
      edtConta.Enabled  := False;
   End;
end;

procedure TfrmCadastroContas.Image1Click(Sender: TObject);
begin
   close;
end;

procedure TfrmCadastroContas.LimparCampos;
begin
   cbbStatus.ItemIndex := -1;
   cbbConta.ItemIndex := -1;
   edtConta.Text := '';
   idConta := 0;
   DAO := '';
end;

procedure TfrmCadastroContas.Novo;
begin
   HabilitarDesabilitarBotoes('N');
   HabilitarDesabilitarCampos('H');
   LimparCampos;
   cbbStatus.SetFocus;
   DAO := 'N';
end;

procedure TfrmCadastroContas.Pesquisar;
begin
   Application.CreateForm(TfrmPesquisarContasFinanceiras, frmPesquisarContasFinanceiras);
   frmPesquisarContasFinanceiras.qryContasFinanceiras.Close;
   frmPesquisarContasFinanceiras.qryContasFinanceiras.Open;
   frmPesquisarContasFinanceiras.showmodal;
end;

procedure TfrmCadastroContas.Salvar;
begin
   if cbbStatus.ItemIndex < 0 then Begin
      prcMsgAdv('Selecione o status da conta.');
      cbbStatus.SetFocus;
      Exit;
   End;

   if cbbConta.ItemIndex < 0 then Begin
      prcMsgAdv('Selecione o tipo de conta.');
      cbbConta.SetFocus;
      Exit;
   End;

   if Trim(edtConta.Text) = '' then Begin
      prcMsgAdv('Informe a descrição da conta.');
      edtConta.SetFocus;
      Exit;
   End;

   if DAO = 'N' then
      begin
         qryDAO.Close;
         qryDAO.SQL.Clear;
         qryDAO.SQL.Add(' INSERT INTO CONTAS_FINANCEIRAS ');
         qryDAO.SQL.Add(' (  ');
         qryDAO.SQL.Add(' status, tipo, descricao ');
         qryDAO.SQL.Add(' )    ');
         qryDAO.SQL.Add(' VALUES   ');
         qryDAO.SQL.Add(' (    ');
         qryDAO.SQL.Add(' :status, :tipo, :descricao ');
         qryDAO.SQL.Add(' )  ');
      End
   else
      begin
         qryDAO.Close;
         qryDAO.SQL.Clear;
         qryDAO.SQL.Add(' Update CONTAS_FINANCEIRAS Set status = :status, ');
         qryDAO.SQL.Add('                               tipo = :tipo, ');
         qryDAO.SQL.Add('                               descricao = :descricao ');
         qryDAO.SQL.Add(' Where id = :id ');
         qryDAO.Params.ParamByName('id').Asinteger := idConta;
      end;

   qryDAO.Params.ParamByName('status').AsString := Copy(cbbStatus.Text,1,1);
   qryDAO.Params.ParamByName('tipo').AsString := Copy(cbbConta.Text,1,1);
   qryDAO.Params.ParamByName('descricao').AsString := Trim(edtConta.Text);

   Try
      qryDAO.ExecSQL;;
      prcMsgInf('Registro atualizado com sucesso.');
      Cancelar;
   Except
      prcMsgAdv('Falha ao atualizar o registro.');
   End;
end;

procedure TfrmCadastroContas.speCancelarClick(Sender: TObject);
begin
   Cancelar;
end;

procedure TfrmCadastroContas.SpeedButton5Click(Sender: TObject);
begin
   Pesquisar;
end;

procedure TfrmCadastroContas.speNovoClick(Sender: TObject);
begin
   Novo;
end;

procedure TfrmCadastroContas.speSalvarClick(Sender: TObject);
begin
   Salvar;
end;

end.
