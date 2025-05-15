unit untPercDescontoPromocao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, FireDAC.Stan.Intf, unitConfiguracoes,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPercDescontoPromocao = class(TForm)
    Panel4: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image2: TImage;
    Label5: TLabel;
    edtPercentual: TJvValidateEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Confirmar;
  end;

var
  frmPercDescontoPromocao: TfrmPercDescontoPromocao;

implementation

{$R *.dfm}

uses untPrincipal, untCadastrarPromocao;

procedure TfrmPercDescontoPromocao.Confirmar;
Var query: TFDQuery;
    transacao: TFDTransaction;
    id: integer;
begin

  if edtPercentual.AsFloat <= 0.00 then Begin

     prcMsgAdv('Informe um percentual.');
     edtPercentual.SetFocus;
     Exit;

  End;

  if fctMsgConfirmDefaultButtonYes('Confirma a aplicação do desconto para todos os produtos?') = false then
     Exit;

   Try

      Try

         transacao := TFDTransaction.Create(frmPrincipal.ConexaoLocal);
         transacao.Connection := frmPrincipal.ConexaoLocal;
         transacao.StartTransaction;

         query := TFDQuery.Create(self);
         query.Connection := frmPrincipal.ConexaoLocal;

         frmCadastrarPromocao.qryProdutos.First;

         while Not(frmCadastrarPromocao.qryProdutos.Eof) do Begin

            query.Close;
            query.SQL.Clear;

            query.SQL.Add(' SELECT * FROM promocao_detalhe WHERE id_cabecalho = :id_cabecalho AND id_produto = :id_produto ');
            query.Params.ParamByName('id_cabecalho').AsInteger := frmCadastrarPromocao.idPromocao;
            query.Params.ParamByName('id_produto').AsInteger   := frmCadastrarPromocao.qryProdutosID_PROD_ORIGINAL.asinteger;
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
               query.Params.ParamByName('id_produto').AsInteger   := frmCadastrarPromocao.qryProdutosID_PROD_ORIGINAL.asinteger;

            End else Begin

               id := query.FieldByName('id').AsInteger;

               query.Close;
               query.SQL.Clear;
               query.SQL.Add(' UPDATE promocao_detalhe SET valor = :valor WHERE id = :id  ');

               query.Params.ParamByName('id').AsInteger := id;

            End;

            query.Params.ParamByName('valor').AsFloat          := frmCadastrarPromocao.qryProdutosVALOR_UNITARIO.AsFloat -
                                                                      (frmCadastrarPromocao.qryProdutosVALOR_UNITARIO.AsFloat * (edtPercentual.AsFloat/100));
            query.ExecSQL;

            frmCadastrarPromocao.qryProdutos.Next;

         End;

         transacao.Commit;
         frmCadastrarPromocao.FiltrarGrid;
         prcMsgInf('Registros atualizados com sucesso.');

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

procedure TfrmPercDescontoPromocao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmPercDescontoPromocao.FormShow(Sender: TObject);
begin

   edtPercentual.SetFocus;

end;

procedure TfrmPercDescontoPromocao.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPercDescontoPromocao.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPercDescontoPromocao.Image4Click(Sender: TObject);
begin

   close;

end;

end.
