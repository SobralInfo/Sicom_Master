unit untPequisarKitProdutos;

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
  TfrmPequisarKitProdutos = class(TForm)
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
    qryKit: TFDQuery;
    qryKitID: TIntegerField;
    qryKitSTATUS: TStringField;
    qryKitDESCRICAO: TStringField;
    dtsKit: TDataSource;
    qryKitcalcStatus: TStringField;
    JvDBGrid1: TRxDBGrid;
    qryKitGTIN: TStringField;
    qryKitVALOR: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mkeDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mkeDescricaoChange(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure qryKitCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPequisarKitProdutos: TfrmPequisarKitProdutos;

implementation

{$R *.dfm}

uses untCadastrarUsuarios, untCadastrarKit;

procedure TfrmPequisarKitProdutos.Confirmar;
begin

   if qryKit.IsEmpty then Begin
      prcMsgAdv('Selecione um registro.');
      mkeDescricao.SetFocus;
      Exit;
   End;

   if origem = 'CADASTRO_KIT' then Begin

      frmCadastrarKit.HabilitarDesabilitarBotoes('E');
      frmCadastrarKit.HabilitarDesabilitarCampos('H');
      frmCadastrarKit.LimparCampos;
      frmCadastrarKit.DAO := 'U';

      frmCadastrarKit.idKit := qryKitID.AsInteger;

      if qryKitSTATUS.AsString = 'A' then
         frmCadastrarKit.cbbStatus.ItemIndex := 0
      else
         frmCadastrarKit.cbbStatus.ItemIndex := 1;

      frmCadastrarKit.edtDescricao.Text := Trim(qryKitDESCRICAO.AsString);
      frmCadastrarKit.edtGTIN.Text := Trim(qryKitGTIN.AsString);

      frmCadastrarKit.FiltrarGrid;

      frmCadastrarKit.cbbStatus.SetFocus;

   End;

   close;

end;

procedure TfrmPequisarKitProdutos.Filtrar;
begin

   qryKit.Filtered := False;
   qryKit.Filter := ' descricao like '+QuotedStr(Trim(Copy(mkeDescricao.Text,1,120))+'%');
   qryKit.Filtered := True;

   lblTotal.Caption := 'Total de Kits: '+qryKit.RecordCount.ToString;
   qryKit.First;

end;

procedure TfrmPequisarKitProdutos.FormCreate(Sender: TObject);
begin

   qryKit.Close;
   qryKit.Open;
   Filtrar;

end;

procedure TfrmPequisarKitProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case KEY of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmPequisarKitProdutos.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPequisarKitProdutos.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPequisarKitProdutos.JvDBGrid1DblClick(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPequisarKitProdutos.JvDBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPequisarKitProdutos.mkeDescricaoChange(Sender: TObject);
begin

   filtrar;

end;

procedure TfrmPequisarKitProdutos.mkeDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   case key of

      VK_DOWN: JvDBGrid1.SetFocus;

   end;

end;

procedure TfrmPequisarKitProdutos.qryKitCalcFields(DataSet: TDataSet);
begin

   if qryKitSTATUS.AsString = 'A' then
      qryKitcalcStatus.AsString := 'ATIVO'
   else
      qryKitcalcStatus.AsString := 'INATIVO';

end;

end.
