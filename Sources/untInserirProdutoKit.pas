unit untInserirProdutoKit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit, unitConfiguracoes,
  JvValidateEdit, Vcl.ExtCtrls, Vcl.Imaging.pngimage, firedac.Comp.Client;

type
  TfrmInserirProdutoKit = class(TForm)
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
    Panel4: TPanel;
    edtValor: TJvValidateEdit;
    Label4: TLabel;
    Label1: TLabel;
    edtQuantidade: TJvValidateEdit;
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
  frmInserirProdutoKit: TfrmInserirProdutoKit;

implementation

{$R *.dfm}

uses untPrincipal, untCadastrarKit;

procedure TfrmInserirProdutoKit.AtualizarValor;
begin

end;

procedure TfrmInserirProdutoKit.Confirmar;
Var query: TFDQuery;
    transacao: TFDTransaction;
    id: integer;
begin

   if edtValor.AsFloat <= 0.00 then Begin

     prcMsgAdv('Informe o valor do produto.');
     edtValor.SetFocus;
     Exit;

   End;

   Try

      Try

         transacao := TFDTransaction.Create(frmPrincipal.ConexaoLocal);
         transacao.Connection := frmPrincipal.ConexaoLocal;
         transacao.StartTransaction;

         query := TFDQuery.Create(self);
         query.Connection := frmPrincipal.ConexaoLocal;

         query.SQL.Add(' SELECT * FROM kit_produto_detalhe WHERE ID_KIT_CABECALHO = :id_cabecalho AND id_produto = :id_produto ');
         query.Params.ParamByName('id_cabecalho').AsInteger := frmCadastrarKit.idKit;
         query.Params.ParamByName('id_produto').AsInteger   := idProduto;
         query.Open;

         if query.IsEmpty then Begin

            query.Close;
            query.SQL.Clear;
            query.SQL.Add(' INSERT INTO kit_produto_detalhe ');
            query.SQL.Add(' (  ');
            query.SQL.Add(' ID_KIT_CABECALHO, id_produto, valor, quantidade  ');
            query.SQL.Add(' )  ');
            query.SQL.Add(' VALUES ');
            query.SQL.Add(' (  ');
            query.SQL.Add(' :ID_KIT_CABECALHO, :id_produto, :valor, :quantidade ');
            query.SQL.Add(' ) ');

            query.Params.ParamByName('ID_KIT_CABECALHO').AsInteger := frmCadastrarKit.idKit;
            query.Params.ParamByName('id_produto').AsInteger       := idProduto;

         End else Begin

            id := query.FieldByName('id').AsInteger;

            query.Close;
            query.SQL.Clear;
            query.SQL.Add(' UPDATE kit_produto_detalhe SET valor = :valor, quantidade = :quantidade WHERE id = :id  ');

            query.Params.ParamByName('id').AsInteger := id;

         End;

         query.Params.ParamByName('quantidade').AsFloat := edtQuantidade.AsFloat;
         query.Params.ParamByName('valor').AsFloat      := edtValor.AsFloat;
         query.ExecSQL;
         transacao.Commit;

         frmCadastrarKit.qryProdutos.Refresh;
         frmCadastrarKit.Somar;

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

procedure TfrmInserirProdutoKit.edtPercentualChange(Sender: TObject);
begin

   AtualizarValor;

end;

procedure TfrmInserirProdutoKit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      vk_f12: Confirmar;

   end;

end;

procedure TfrmInserirProdutoKit.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmInserirProdutoKit.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmInserirProdutoKit.Image4Click(Sender: TObject);
begin

   close;

end;

end.
