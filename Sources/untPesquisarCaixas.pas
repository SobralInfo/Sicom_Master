unit untPesquisarCaixas;

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
  TfrmPesquisarCaixas = class(TForm)
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
    qryCaixas: TFDQuery;
    qryCaixasID: TIntegerField;
    qryCaixasSTATUS: TStringField;
    qryCaixasDESCRICAO: TStringField;
    dtsCaixas: TDataSource;
    qryCaixascalcStatus: TStringField;
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
    procedure qryCaixasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarCaixas: TfrmPesquisarCaixas;

implementation

{$R *.dfm}

uses untCadastrarCaixas;

procedure TfrmPesquisarCaixas.Confirmar;
begin

   if qryCaixas.IsEmpty then Begin
      prcMsgAdv('Selecione um registro.');
      mkeDescricao.SetFocus;
      Exit;
   End;

   if origem = 'CADASTRO_CAIXAS' then Begin

      frmCadastrarCaixas.HabilitarDesabilitarBotoes('E');
      frmCadastrarCaixas.HabilitarDesabilitarCampos('H');
      frmCadastrarCaixas.LimparCampos;
      frmCadastrarCaixas.DAO := 'U';

      frmCadastrarCaixas.idCaixa := qryCaixasID.AsInteger;

      if qryCaixasSTATUS.AsString = 'A' then
         frmCadastrarCaixas.cbbStatus.ItemIndex := 0
      else
         frmCadastrarCaixas.cbbStatus.ItemIndex := 1;

      frmCadastrarCaixas.edtDescricao.Text := Trim(qryCaixasDESCRICAO.AsString);

      frmCadastrarCaixas.cbbStatus.SetFocus;

   End;

   close;

end;

procedure TfrmPesquisarCaixas.Filtrar;
begin

   qryCaixas.Filtered := False;
   qryCaixas.Filter := ' descricao like '+QuotedStr(Trim(Copy(mkeDescricao.Text,1,120))+'%');
   qryCaixas.Filtered := True;

   lblTotal.Caption := 'Total de Caixas: '+qryCaixas.RecordCount.ToString;
   qryCaixas.First;

end;

procedure TfrmPesquisarCaixas.FormCreate(Sender: TObject);
begin

   qryCaixas.Close;
   qryCaixas.Open;
   Filtrar;

end;

procedure TfrmPesquisarCaixas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case KEY of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmPesquisarCaixas.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarCaixas.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarCaixas.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarCaixas.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarCaixas.mkeDescricaoChange(Sender: TObject);
begin

   filtrar;

end;

procedure TfrmPesquisarCaixas.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   case key of

      VK_DOWN: JvDBGrid1.SetFocus;

   end;

end;

procedure TfrmPesquisarCaixas.qryCaixasCalcFields(DataSet: TDataSet);
begin

   if qryCaixasSTATUS.AsString = 'A' then
      qryCaixascalcStatus.AsString := 'ATIVO'
   else
      qryCaixascalcStatus.AsString := 'INATIVO';

end;

end.
