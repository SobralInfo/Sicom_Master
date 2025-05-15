unit untPesquisarFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask, unitConfiguracoes,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, JvExDBGrids, JvDBGrid,
  Vcl.Imaging.pngimage, RxDBCtrl;

type
  TfrmPesquisarFuncionarios = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Image1: TImage;
    mkeDescricao: TMaskEdit;
    Panel1: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    JvDBGrid1: TRxDBGrid;
    procedure mkeDescricaoChange(Sender: TObject);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure JvDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarFuncionarios: TfrmPesquisarFuncionarios;

implementation

{$R *.dfm}

uses untPrincipal, untPedidos, untCadastrarFuncionarios, untTelaDePedido;

procedure TfrmPesquisarFuncionarios.Confirmar;
begin

   if frmPrincipal.qryFuncionarios.IsEmpty then Begin
      prcMsgAdv('Selecione um funcionário.');
      EXit;
   End;

   if origem = 'CADASTRO_FUNCIONARIOS' then Begin

      frmCadastrarFuncionarios.HabilitarDesabilitarBotoes('E');
      frmCadastrarFuncionarios.HabilitarDesabilitarCampos('H');
      frmCadastrarFuncionarios.LimparCampos;
      frmCadastrarFuncionarios.DAO := 'U';

      if frmPrincipal.qryFuncionariosSTATUS.AsString = 'A' then
         frmCadastrarFuncionarios.cbbStatus.ItemIndex := 0
      else
         frmCadastrarFuncionarios.cbbStatus.ItemIndex := 1;

      frmCadastrarFuncionarios.edtCodigo.Text          := Trim(frmPrincipal.qryFuncionariosCODIGO.AsString);
      frmCadastrarFuncionarios.edtNome.Text            := Trim(frmPrincipal.qryFuncionariosNOME.AsString);
      frmCadastrarFuncionarios.edtPercComissao.AsFloat := frmPrincipal.qryFuncionariosPERCENTUAL_COMISSAO.AsFloat;
      frmCadastrarFuncionarios.idFuncionario           := frmPrincipal.qryFuncionariosID.AsInteger;

   End else if origem = 'PEDIDO' then Begin

      frmTelaDePedido.idFuncionario := frmPrincipal.qryFuncionariosID.AsInteger;

   end else Begin

      frmPedidos.idFuncionario              := frmPrincipal.qryFuncionariosID.AsInteger;
      frmPedidos.lblFuncionario.Caption     := Trim(frmPrincipal.qryFuncionariosNOME.AsString);
      frmPedidos.lblFuncionario.Visible     := True;
      frmPedidos.lblNomeFuncionario.Visible := True;

   End;

   close;

end;

procedure TfrmPesquisarFuncionarios.Filtrar;
begin

   frmPrincipal.qryFuncionarios.Filtered := False;

   if origem = 'CADASTRO_FUNCIONARIOS' then
      frmPrincipal.qryFuncionarios.Filter := ' UPPER(nome) LIKE '+QuotedStr(UpperCase(Trim(mkeDescricao.Text))+'%')
   else
      frmPrincipal.qryFuncionarios.Filter := ' status = ''A'' AND UPPER(nome) LIKE '+QuotedStr(UpperCase(Trim(mkeDescricao.Text))+'%');

   frmPrincipal.qryFuncionarios.Filtered := True;

   lblTotal.Caption := 'Total de Funcionários: '+frmPrincipal.qryFuncionarios.RecordCount.ToString;

   frmPrincipal.qryFuncionarios.First;

end;

procedure TfrmPesquisarFuncionarios.FormCreate(Sender: TObject);
begin

   frmPrincipal.qryFuncionarios.Close;
   frmPrincipal.qryFuncionarios.Open;

end;

procedure TfrmPesquisarFuncionarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmPesquisarFuncionarios.FormShow(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarFuncionarios.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarFuncionarios.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarFuncionarios.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarFuncionarios.JvDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   case key of
      VK_ESCAPE: close;
      VK_RETURN, VK_F12: Confirmar;
   end;

end;

procedure TfrmPesquisarFuncionarios.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarFuncionarios.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_DOWN then
      JvDBGrid1.SetFocus;

end;

end.
