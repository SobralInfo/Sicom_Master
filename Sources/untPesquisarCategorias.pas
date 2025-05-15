unit untPesquisarCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, untPrincipal,
  JvExDBGrids, JvDBGrid, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, unitConfiguracoes,
  Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  RxDBCtrl;

type
  TfrmPesquisarCategorias = class(TForm)
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
    qryCategoria: TFDQuery;
    qryCategoriaID: TIntegerField;
    qryCategoriaSTATUS: TStringField;
    qryCategoriaDESCRICAO: TStringField;
    dtsCategoria: TDataSource;
    qryCategoriacalcStatus: TStringField;
    JvDBGrid1: TRxDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mkeDescricaoChange(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure qryCategoriaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarCategorias: TfrmPesquisarCategorias;

implementation

{$R *.dfm}

uses untCadastrarUsuarios, untCadastrarCategoria;

procedure TfrmPesquisarCategorias.Confirmar;
begin

   if qryCategoria.IsEmpty then Begin
      prcMsgAdv('Selecione um registro.');
      mkeDescricao.SetFocus;
      Exit;
   End;

   if origem = 'CADASTRO_CATEGORIAS' then Begin

      frmCadastrarCategoria.HabilitarDesabilitarBotoes('E');
      frmCadastrarCategoria.HabilitarDesabilitarCampos('H');
      frmCadastrarCategoria.LimparCampos;
      frmCadastrarCategoria.DAO := 'U';

      frmCadastrarCategoria.idCategoria := qryCategoriaID.AsInteger;

      if qryCategoriaSTATUS.AsString = 'A' then
         frmCadastrarCategoria.cbbStatus.ItemIndex := 0
      else
         frmCadastrarCategoria.cbbStatus.ItemIndex := 1;

      frmCadastrarCategoria.edtDescricao.Text := Trim(qryCategoriaDESCRICAO.AsString);

      frmCadastrarCategoria.cbbStatus.SetFocus;

   End;

   close;

end;

procedure TfrmPesquisarCategorias.Filtrar;
begin

   qryCategoria.Filtered := False;
   qryCategoria.Filter := ' descricao like '+QuotedStr(Trim(Copy(mkeDescricao.Text,1,120))+'%');
   qryCategoria.Filtered := True;

   lblTotal.Caption := 'Total de Categorias: '+qryCategoria.RecordCount.ToString;
   qryCategoria.First;

end;

procedure TfrmPesquisarCategorias.FormCreate(Sender: TObject);
begin

   qryCategoria.Close;
   qryCategoria.Open;
   Filtrar;

end;

procedure TfrmPesquisarCategorias.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case KEY of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmPesquisarCategorias.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarCategorias.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarCategorias.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarCategorias.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarCategorias.mkeDescricaoChange(Sender: TObject);
begin

   filtrar;

end;

procedure TfrmPesquisarCategorias.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   case key of

      VK_DOWN: JvDBGrid1.SetFocus;

   end;

end;

procedure TfrmPesquisarCategorias.qryCategoriaCalcFields(DataSet: TDataSet);
begin

   if qryCategoriaSTATUS.AsString = 'A' then
      qryCategoriacalcStatus.AsString := 'ATIVO'
   else
      qryCategoriacalcStatus.AsString := 'INATIVO';

end;

end.
