unit untInserirProdutoPromocao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit, unitConfiguracoes,
  JvValidateEdit, Vcl.ExtCtrls, Vcl.Imaging.pngimage, firedac.Comp.Client;

type
  TfrmInserirProdutoPromocao = class(TForm)
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label5: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    edtProduto: TJvValidateEdit;
    Panel2: TPanel;
    edtValor: TJvValidateEdit;
    Panel4: TPanel;
    edtPercentual: TJvValidateEdit;
    edtValorPromocao: TJvValidateEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure edtPercentualChange(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Var idProduto: integer;
    procedure AtualizarValor;
    procedure Confirmar;
  end;

var
  frmInserirProdutoPromocao: TfrmInserirProdutoPromocao;

implementation

{$R *.dfm}

uses untPrincipal, untCadastrarPromocao;

procedure TfrmInserirProdutoPromocao.AtualizarValor;
begin

   edtValorPromocao.AsFloat := edtValor.AsFloat - (edtValor.AsFloat * (edtPercentual.AsFloat/100));

end;

procedure TfrmInserirProdutoPromocao.Confirmar;
Var query: TFDQuery;
    transacao: TFDTransaction;
    id: integer;
begin

   if edtValorPromocao.AsFloat <= 0.00 then Begin

     prcMsgAdv('Informe o valor da promoção.');
     edtValorPromocao.SetFocus;
     Exit;

   End;

   Try

      Try

         transacao := TFDTransaction.Create(frmPrincipal.ConexaoLocal);
         transacao.Connection := frmPrincipal.ConexaoLocal;
         transacao.StartTransaction;

         query := TFDQuery.Create(self);
         query.Connection := frmPrincipal.ConexaoLocal;

         query.SQL.Add(' SELECT * FROM promocao_detalhe WHERE id_cabecalho = :id_cabecalho AND id_produto = :id_produto ');
         query.Params.ParamByName('id_cabecalho').AsInteger := frmCadastrarPromocao.idPromocao;
         query.Params.ParamByName('id_produto').AsInteger   := idProduto;
         query.Open;

         if query.IsEmpty then Begin

            query.Close;
            query.SQL.Clear;
            query.SQL.Add(' INSERT INTO promocao_detalhe ');
            query.SQL.Add(' (  ');
            query.SQL.Add(' id_cabecalho, id_produto, valor  ');
            query.SQL.Add(' )  ');
            query.SQL.Add(' VALUES ');
            query.SQL.Add(' (  ');
            query.SQL.Add(' :id_cabecalho, :id_produto, :valor ');
            query.SQL.Add(' ) ');

            query.Params.ParamByName('id_cabecalho').AsInteger := frmCadastrarPromocao.idPromocao;
            query.Params.ParamByName('id_produto').AsInteger   := idProduto;

         End else Begin

            id := query.FieldByName('id').AsInteger;

            query.Close;
            query.SQL.Clear;
            query.SQL.Add(' UPDATE promocao_detalhe SET valor = :valor WHERE id = :id  ');

            query.Params.ParamByName('id').AsInteger := id;

         End;

         query.Params.ParamByName('valor').AsFloat := edtValorPromocao.AsFloat;
         query.ExecSQL;
         transacao.Commit;

         frmCadastrarPromocao.qryProdutos.Refresh;

      Except

         transacao.Rollback;
         prcMsgInf('Falha ao atualizar os registros.');

      End;

      close;

   Finally

      FreeAndNil(query);
      FreeAndNil(transacao);

   End;

end;

procedure TfrmInserirProdutoPromocao.edtPercentualChange(Sender: TObject);
begin

   AtualizarValor;

end;

procedure TfrmInserirProdutoPromocao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      vk_f12: Confirmar;

   end;

end;

procedure TfrmInserirProdutoPromocao.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmInserirProdutoPromocao.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmInserirProdutoPromocao.Image4Click(Sender: TObject);
begin

   close;

end;

end.
