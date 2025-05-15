unit untPesquisarCEST;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.Imaging.pngimage,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, unitConfiguracoes,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPesquisarCEST = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    mkeDescricao: TMaskEdit;
    Panel3: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    lblTotal: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel4: TPanel;
    JvDBGrid1: TJvDBGrid;
    qryCEST: TFDQuery;
    dtsCEST: TDataSource;
    qryCESTCEST: TStringField;
    qryCESTDESCRICAO: TStringField;
    qryCESTSITUACAO: TStringField;
    procedure mkeDescricaoChange(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Var origem: string;
    procedure Filtrar;
    procedure Confirmar;
  end;

var
  frmPesquisarCEST: TfrmPesquisarCEST;

implementation

{$R *.dfm}

uses untCadastrarProdutos;

{ TfrmPesquisarCEST }

procedure TfrmPesquisarCEST.Confirmar;
begin

   if qryCEST.IsEmpty then Begin

      prcMsgAdv('Selecione um registro.');
      Exit;

   End;

   if origem = 'PRODUTOS' then Begin

      frmCadastrarProdutos.edtCEST.Text := Trim(qryCESTCEST.AsString);

   End;

   close;

end;

procedure TfrmPesquisarCEST.Filtrar;
begin

   qryCEST.Filtered := False;

   qryCEST.Filter := ' ((cest like '+QuotedStr('%'+Trim(Copy(mkeDescricao.Text,1,8))+'%')+
                                                ') OR (UPPER(descricao) LIKE '+QuotedStr(AnsiUpperCase('%'+Trim(mkeDescricao.Text))+'%')+'))';

   qryCEST.Filtered := True;

   lblTotal.Caption := 'Total de CEST: '+qryCEST.RecordCount.ToString;
   qryCEST.First;

end;

procedure TfrmPesquisarCEST.FormCreate(Sender: TObject);
begin

   qryCEST.Close;
   qryCEST.Open;

end;

procedure TfrmPesquisarCEST.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmPesquisarCEST.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPesquisarCEST.Image4Click(Sender: TObject);
begin

   Close;

end;

procedure TfrmPesquisarCEST.JvDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin

   if key = #13 then
      Confirmar;

end;

procedure TfrmPesquisarCEST.mkeDescricaoChange(Sender: TObject);
begin

   Filtrar;

end;

end.
