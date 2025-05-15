unit untPesquisarPromocao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask, unitConfiguracoes,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, JvExDBGrids, JvDBGrid, untBiblioteca,
  Vcl.Imaging.pngimage, Vcl.Buttons, RxDBCtrl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPesquisarPromocao = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    lblTotal: TLabel;
    mkeDescricao: TMaskEdit;
    Label1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    imgNovo: TImage;
    JvDBGrid1: TRxDBGrid;
    qryPromocao: TFDQuery;
    dtsPromocao: TDataSource;
    qryPromocaoID: TIntegerField;
    qryPromocaoDESCRICAO: TStringField;
    qryPromocaoSTATUS: TStringField;
    qryPromocaoDATA_INICIO: TSQLTimeStampField;
    qryPromocaoDATA_FIM: TSQLTimeStampField;
    qryPromocaocalcSTATUS: TStringField;
    procedure mkeDescricaoChange(Sender: TObject);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Image4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure qryPromocaoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarPromocao: TfrmPesquisarPromocao;

implementation

{$R *.dfm}

uses untPrincipal, untCadastrarPromocao;

procedure TfrmPesquisarPromocao.Confirmar;
begin

   if qryPromocao.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   if origem = 'PROMOCAO' then Begin

      frmCadastrarPromocao.Novo;
      frmCadastrarPromocao.idPromocao := qryPromocaoID.AsInteger;
      frmCadastrarPromocao.DAO := 'U';

      if qryPromocaoSTATUS.AsString = 'P' then
         frmCadastrarPromocao.cbbStatus.ItemIndex := 0
      else if qryPromocaoSTATUS.AsString = 'L' then
         frmCadastrarPromocao.cbbStatus.ItemIndex := 1
      else if qryPromocaoSTATUS.AsString = 'E' then
         frmCadastrarPromocao.cbbStatus.ItemIndex := 2
      else
         frmCadastrarPromocao.cbbStatus.ItemIndex := 3;

      frmCadastrarPromocao.edtDescricao.Text := Trim(qryPromocaoDESCRICAO.AsString);
      frmCadastrarPromocao.mkeDtIni.Text     := Trim(qryPromocaoDATA_INICIO.AsString);
      frmCadastrarPromocao.mkeDtFim.Text     := Trim(qryPromocaoDATA_FIM.AsString);
      frmCadastrarPromocao.FiltrarGrid;

   End;

   close;

end;

procedure TfrmPesquisarPromocao.Filtrar;
begin

   qryPromocao.Filtered := False;
   qryPromocao.Filter := ' DESCRICAO like '+QuotedStr('%'+Trim(Copy(mkeDescricao.Text,1,13))+'%');
   qryPromocao.Filtered := True;

   lblTotal.Caption := 'Total de Promoções: '+qryPromocao.RecordCount.ToString;
   qryPromocao.First;

end;

procedure TfrmPesquisarPromocao.FormCreate(Sender: TObject);
begin

   Try
      qryPromocao.Close;
      qryPromocao.Open;
   Except
      qryPromocao.Close;
      qryPromocao.Open;
   End;

end;

procedure TfrmPesquisarPromocao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_F12, VK_RETURN: Confirmar;
      VK_ESCAPE: close;

   end;

end;

procedure TfrmPesquisarPromocao.FormShow(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarPromocao.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPesquisarPromocao.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarPromocao.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarPromocao.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

procedure TfrmPesquisarPromocao.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_DOWN then
      JvDBGrid1.SetFocus;

end;

procedure TfrmPesquisarPromocao.qryPromocaoCalcFields(DataSet: TDataSet);
begin

   if qryPromocaoSTATUS.AsString = 'P' then
      qryPromocaocalcSTATUS.AsString := 'PENDENTE';

   if qryPromocaoSTATUS.AsString = 'L' then
      qryPromocaocalcSTATUS.AsString := 'LIBERADA';

   if qryPromocaoSTATUS.AsString = 'E' then
      qryPromocaocalcSTATUS.AsString := 'ENCERRADA';

   if qryPromocaoSTATUS.AsString = 'C' then
      qryPromocaocalcSTATUS.AsString := 'CANCELADA';

end;

procedure TfrmPesquisarPromocao.RxDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

end.
