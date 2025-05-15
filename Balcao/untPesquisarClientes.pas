unit untPesquisarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask, unitConfiguracoes,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, JvExDBGrids, JvDBGrid,
  Vcl.Imaging.pngimage, Vcl.Buttons, RxDBCtrl;

type
  TfrmPesquisarClientes = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    lblTotal: TLabel;
    mkeDescricao: TMaskEdit;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    imgNovo: TImage;
    JvDBGrid1: TRxDBGrid;
    procedure mkeDescricaoChange(Sender: TObject);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Image4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure speNovoClick(Sender: TObject);
    procedure imgNovoClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Var origem: string;
    procedure Filtrar;
    procedure Confirmar;
    procedure NovoCliente;
  end;

var
  frmPesquisarClientes: TfrmPesquisarClientes;

implementation

{$R *.dfm}

uses untPrincipal, untBalcao, untCadastrarClientes;

procedure TfrmPesquisarClientes.Confirmar;
begin

   if frmPrincipal.qryClientes.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   frmBalcao.edtCodCliente.Text := frmPrincipal.qryClientesID.AsString;
   frmBalcao.idCliente          := frmPrincipal.qryClientesID.AsInteger;

   close;

end;

procedure TfrmPesquisarClientes.Filtrar;
begin

   frmPrincipal.qryClientes.Filtered := False;

   frmPrincipal.qryClientes.Filter := ' status = ''A'' AND ((celular like '+QuotedStr('%'+Trim(Copy(mkeDescricao.Text,1,11))+'%')+
                                                             ') or (fone_fixo like '+QuotedStr('%'+Trim(Copy(mkeDescricao.Text,1,10))+'%')+
                                                             ') or (cpf_cnpj like '+QuotedStr(Trim(Copy(mkeDescricao.Text,1,14))+'%')+
                                                             ') OR (UPPER(nome) LIKE '+QuotedStr(UpperCase(Trim(mkeDescricao.Text))+'%')+'))';

   frmPrincipal.qryClientes.Filtered := True;

   lblTotal.Caption := 'Total de Clientes: '+frmPrincipal.qryClientes.RecordCount.ToString;
   frmPrincipal.qryClientes.First;

end;

procedure TfrmPesquisarClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   frmPesquisarClientes := Nil;

end;

procedure TfrmPesquisarClientes.FormCreate(Sender: TObject);
begin

   frmPrincipal.qryClientes.Close;
   frmPrincipal.qryClientes.Open;

end;

procedure TfrmPesquisarClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_F12, VK_RETURN: Confirmar;
      VK_ESCAPE: close;
      VK_F2: NovoCliente;

   end;

end;

procedure TfrmPesquisarClientes.FormShow(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarClientes.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarClientes.imgNovoClick(Sender: TObject);
begin

   NovoCliente;

end;

procedure TfrmPesquisarClientes.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarClientes.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarClientes.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarClientes.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_DOWN then
      JvDBGrid1.SetFocus;

end;

procedure TfrmPesquisarClientes.NovoCliente;
begin

   if imgNovo.Visible = false then
      Exit;

   Application.CreateForm(TfrmCadastrarClientes, frmCadastrarClientes);
   frmCadastrarClientes.ShowModal;
   frmPrincipal.qryClientes.Refresh;

end;

procedure TfrmPesquisarClientes.RxDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarClientes.speNovoClick(Sender: TObject);
begin

   NovoCliente;

end;

end.
