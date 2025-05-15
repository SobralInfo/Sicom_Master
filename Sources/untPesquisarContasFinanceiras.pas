unit untPesquisarContasFinanceiras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untPrincipal, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, RxDBCtrl, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, unitConfiguracoes;

type
  TfrmPesquisarContasFinanceiras = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    mkeDescricao: TMaskEdit;
    Panel2: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel4: TPanel;
    JvDBGrid1: TRxDBGrid;
    qryContasFinanceiras: TFDQuery;
    dtsContasFinanceiras: TDataSource;
    qryContasFinanceirasID: TIntegerField;
    qryContasFinanceirasSTATUS: TStringField;
    qryContasFinanceirasTIPO: TStringField;
    qryContasFinanceirasDESCRICAO: TStringField;
    qryContasFinanceirascalcStatus: TStringField;
    qryContasFinanceirascalcTipo: TStringField;
    procedure Image4Click(Sender: TObject);
    procedure mkeDescricaoChange(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure qryContasFinanceirasCalcFields(DataSet: TDataSet);
    procedure Image3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    origem: string;
    procedure filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarContasFinanceiras: TfrmPesquisarContasFinanceiras;

implementation

{$R *.dfm}

uses untCadastroContas, untCadastroParametros;

procedure TfrmPesquisarContasFinanceiras.Confirmar;
begin
   if qryContasFinanceiras.IsEmpty then Begin
      prcMsgAdv('Selecione um registro.');
      mkeDescricao.SetFocus;
      Exit;
   End;

   if origem = 'PARAMETROS' then
      begin
         frmCadastroParametros.idConta := qryContasFinanceirasID.AsInteger;
         frmCadastroParametros.edtContaFinanceira.Text := trim(qryContasFinanceirasDESCRICAO.AsString);
      end
   else
      begin
         frmCadastroContas.HabilitarDesabilitarBotoes('E');
         frmCadastroContas.HabilitarDesabilitarCampos('H');
         frmCadastroContas.LimparCampos;
         frmCadastroContas.DAO := 'U';

         frmCadastroContas.idConta := qryContasFinanceirasID.AsInteger;
         frmCadastroContas.edtConta.Text := trim(qryContasFinanceirasDESCRICAO.AsString);

         if qryContasFinanceirasSTATUS.AsString = 'A' then
            frmCadastroContas.cbbStatus.ItemIndex := 0
         else
            frmCadastroContas.cbbStatus.ItemIndex := 1;

         if qryContasFinanceirasTIPO.AsString = 'C' then
            frmCadastroContas.cbbConta.ItemIndex := 0
         else
            frmCadastroContas.cbbConta.ItemIndex := 1;
      end;

   close;
end;

procedure TfrmPesquisarContasFinanceiras.filtrar;
begin
   qryContasFinanceiras.Close;
   qryContasFinanceiras.SQL.Clear;
   qryContasFinanceiras.SQL.Add('Select * from contas_financeiras where upper(descricao) LIKE '+QuotedStr('%'+UpperCase(mkeDescricao.Text)+'%') +' order by descricao');
   qryContasFinanceiras.Open;
end;

procedure TfrmPesquisarContasFinanceiras.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case key of
      VK_ESCAPE: close;
      VK_F12: Confirmar;
   end;
end;

procedure TfrmPesquisarContasFinanceiras.Image3Click(Sender: TObject);
begin
   Confirmar;
end;

procedure TfrmPesquisarContasFinanceiras.Image4Click(Sender: TObject);
begin
   close;
end;

procedure TfrmPesquisarContasFinanceiras.JvDBGrid1DblClick(Sender: TObject);
begin
   Confirmar;
end;

procedure TfrmPesquisarContasFinanceiras.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
      Confirmar;
end;

procedure TfrmPesquisarContasFinanceiras.mkeDescricaoChange(Sender: TObject);
begin
   filtrar;
end;

procedure TfrmPesquisarContasFinanceiras.qryContasFinanceirasCalcFields(
  DataSet: TDataSet);
begin
   if qryContasFinanceirasSTATUS.AsString = 'A' then
      qryContasFinanceirascalcStatus.AsString := 'ATIVO'
   else
      qryContasFinanceirascalcStatus.AsString := 'INATIVO';

   if qryContasFinanceirasTIPO.AsString = 'C' then
      qryContasFinanceirascalcTipo.AsString := 'CRÉDITO'
   else
      qryContasFinanceirascalcTipo.AsString := 'DÉBITO';
end;

end.
