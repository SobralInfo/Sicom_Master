unit untPesquisarEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, unitConfiguracoes,
  JvExDBGrids, JvDBGrid, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, RxDBCtrl, untBiblioteca;

type
  TfrmPesquisarEmpresa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    mkeDescricao: TMaskEdit;
    Panel2: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    JvDBGrid1: TRxDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure mkeDescricaoChange(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarEmpresa: TfrmPesquisarEmpresa;

implementation

{$R *.dfm}

uses untPrincipal, untCadastrarEmpresa;

procedure TfrmPesquisarEmpresa.Confirmar;
begin

   if frmPrincipal.qryEmpresa.IsEmpty then Begin
      prcMsgAdv('Selecione um registro.');
      mkeDescricao.SetFocus;
      Exit;
   End;

   if origem = 'CADASTRO_EMPRESA' then Begin

      frmCadastrarEmpresa.HabilitarDesabilitarBotoes('E');
      frmCadastrarEmpresa.HabilitarDesabilitarCampos('H');
      frmCadastrarEmpresa.LimparCampos;
      frmCadastrarEmpresa.DAO := 'U';

      frmCadastrarEmpresa.edtCNPJ.Text        := Trim(frmPrincipal.qryEmpresaCNPJ.AsString);
      frmCadastrarEmpresa.edtRazaoSocial.Text := Trim(frmPrincipal.qryEmpresaRAZAO_SOCIAL.AsString);
      frmCadastrarEmpresa.edtFantasia.Text    := Trim(frmPrincipal.qryEmpresaFANTASIA.AsString);
      frmCadastrarEmpresa.edtFoneFixo.Text    := Trim(frmPrincipal.qryEmpresaFONE.AsString);
      frmCadastrarEmpresa.edtCelular.Text     := Trim(frmPrincipal.qryEmpresaCELULAR.AsString);
      frmCadastrarEmpresa.edtEmail.Text       := Trim(frmPrincipal.qryEmpresaEMAIL.AsString);
      frmCadastrarEmpresa.edtSite.Text        := Trim(frmPrincipal.qryEmpresaSITE.AsString);
      frmCadastrarEmpresa.idEmpresa           := frmPrincipal.qryEmpresaID.AsInteger;
      frmCadastrarEmpresa.edtNSU.AsInteger    := frmPrincipal.qryEmpresaULTIMO_NSU.AsInteger;
      frmCadastrarEmpresa.lkpMunicipio.KeyValue := frmPrincipal.qryEmpresaID_MUNICIPIO.AsInteger;
      frmCadastrarEmpresa.edtIE.Text          := Trim(frmPrincipal.qryEmpresaIE.AsString);

      case frmPrincipal.qryEmpresaTIPO_REGIME.AsInteger of
         1: frmCadastrarEmpresa.cbbTipoRegime.ItemIndex := 0;
         2: frmCadastrarEmpresa.cbbTipoRegime.ItemIndex := 1;
         3: frmCadastrarEmpresa.cbbTipoRegime.ItemIndex := 2;
         4: frmCadastrarEmpresa.cbbTipoRegime.ItemIndex := 3;
      end;

      frmCadastrarEmpresa.lkpUF.ItemIndex      := TBiblioteca.RetornarIDporUF(Trim(frmPrincipal.qryEmpresaUF.AsString));
      frmCadastrarEmpresa.FiltrarMunicipio;
      frmCadastrarEmpresa.lkpMunicipio.KeyValue   := frmPrincipal.qryEmpresaCODIGO_CIDADE.AsInteger;
      frmCadastrarEmpresa.edtLogradouro.Text   := Trim(frmPrincipal.qryEmpresaLOGRADOURO.AsString);
      frmCadastrarEmpresa.edtNumero.Text       := Trim(frmPrincipal.qryEmpresaNUMERO.AsString);
      frmCadastrarEmpresa.edtComplemento.Text  := Trim(frmPrincipal.qryEmpresaCOMPLEMENTO.AsString);
      frmCadastrarEmpresa.edtBairro.Text       := Trim(frmPrincipal.qryEmpresaBAIRRO.AsString);
      frmCadastrarEmpresa.edtCEP.Text          := Trim(frmPrincipal.qryEmpresaCEP.AsString);
      frmCadastrarEmpresa.edtIE.Text           := Trim(frmPrincipal.qryEmpresaIE.AsString);
      frmCadastrarEmpresa.edtCNPJ.SetFocus;

   End;

   close;


end;

procedure TfrmPesquisarEmpresa.Filtrar;
begin

   frmPrincipal.qryEmpresa.Filtered := False;
   frmPrincipal.qryEmpresa.Filter := ' ((Upper(razao_social) like '+UpperCase(QuotedStr(Copy(Trim(mkeDescricao.Text),1,119)+'%'))+') or (upper(fantasia) LIKE '+UpperCase(QuotedStr(Copy(Trim(mkeDescricao.Text),1,100)+'%'))+'))';
   frmPrincipal.qryEmpresa.Filtered := True;

   //frmPrincipal.qryProdutos.Active   := True;

   lblTotal.Caption := 'Total de Empresas: '+frmPrincipal.qryEmpresa.RecordCount.ToString;
   frmPrincipal.qryEmpresa.First;

end;

procedure TfrmPesquisarEmpresa.FormCreate(Sender: TObject);
begin

   frmPrincipal.qryEmpresa.Close;
   frmPrincipal.qryEmpresa.Open;
   //Filtrar;

end;

procedure TfrmPesquisarEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmPesquisarEmpresa.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarEmpresa.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarEmpresa.JvDBGrid1DblClick(Sender: TObject);
begin

   Image3.OnClick(self);

end;

procedure TfrmPesquisarEmpresa.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarEmpresa.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarEmpresa.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_DOWN then
      JvDBGrid1.SetFocus;

end;

end.
