unit untPesquisarNCM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, unitConfiguracoes,
  JvExDBGrids, JvDBGrid, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPesquisarNCM = class(TForm)
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
    JvDBGrid1: TJvDBGrid;
    qryNCM: TFDQuery;
    qryNCMNCM: TStringField;
    qryNCMDESCRICAO: TStringField;
    qryNCMSITUACAO: TStringField;
    qryNCMCEST: TStringField;
    qryNCMDESCRICAO_CEST: TStringField;
    qryNCMPERC_IMP_FEDERAL: TFloatField;
    qryNCMPERC_IMP_ESTADUAL: TFloatField;
    qryNCMPERC_IMP_MUNICIPAL: TFloatField;
    dtsNCM: TDataSource;
    procedure mkeDescricaoChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarNCM: TfrmPesquisarNCM;

implementation

{$R *.dfm}

uses untPrincipal, untCadastrarProdutos;

{ TfrmPesquisarNCM }

procedure TfrmPesquisarNCM.Confirmar;
begin

   if qryNCM.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   if origem = 'PRODUTOS' then Begin

      frmCadastrarProdutos.edtNCM.Text := Trim(qryNCMNCM.AsString);

   End;

   close;


end;

procedure TfrmPesquisarNCM.Filtrar;
begin

   qryNCM.Filtered := False;

   qryNCM.Filter := ' ((ncm like '+QuotedStr('%'+Trim(Copy(mkeDescricao.Text,1,8))+'%')+
                                                ') OR (UPPER(descricao) LIKE '+QuotedStr(AnsiUpperCase('%'+Trim(mkeDescricao.Text))+'%')+'))';

   qryNCM.Filtered := True;

   lblTotal.Caption := 'Total de NCM: '+qryNCM.RecordCount.ToString;
   qryNCM.First;

end;

procedure TfrmPesquisarNCM.FormCreate(Sender: TObject);
begin

   qryNCM.Close;
   qryNCM.Open;

end;

procedure TfrmPesquisarNCM.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmPesquisarNCM.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarNCM.Image4Click(Sender: TObject);
begin

   Close;

end;

procedure TfrmPesquisarNCM.JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarNCM.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

end.
