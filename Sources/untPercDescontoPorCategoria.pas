unit untPercDescontoPorCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, FireDAC.Stan.Intf, unitConfiguracoes,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls;

type
  TfrmPercDescontoPorCategoria = class(TForm)
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
    qryCategoria: TFDQuery;
    qryCategoriaID: TIntegerField;
    qryCategoriaSTATUS: TStringField;
    qryCategoriaDESCRICAO: TStringField;
    dtsCategoria: TDataSource;
    lkpCategoria: TDBLookupComboBox;
    Label1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Confirmar;
  end;

var
  frmPercDescontoPorCategoria: TfrmPercDescontoPorCategoria;

implementation

{$R *.dfm}

uses untPrincipal, untCadastrarPromocao;

procedure TfrmPercDescontoPorCategoria.Confirmar;
Var query, queryProduto: TFDQuery;
    transacao: TFDTransaction;
    id: integer;
begin

  if Trim(lkpCategoria.Text) = '' then Begin

     prcMsgAdv('Selecione uma categoria.');
     lkpCategoria.SetFocus;
     Exit;

  End;

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

         queryProduto := TFDQuery.Create(Nil);
         queryProduto.Connection := frmPrincipal.ConexaoLocal;

         queryProduto.SQL.Add('SELECT ID, VALOR_UNITARIO FROM produtos WHERE id_categoria = '+IntToStr(lkpCategoria.KeyValue));
         queryProduto.Open;

         while Not(queryProduto.Eof) do Begin

            query.Close;
            query.SQL.Clear;

            query.SQL.Add(' SELECT * FROM promocao_detalhe WHERE id_cabecalho = :id_cabecalho AND id_produto = :id_produto ');
            query.Params.ParamByName('id_cabecalho').AsInteger := frmCadastrarPromocao.idPromocao;
            query.Params.ParamByName('id_produto').AsInteger   := queryProduto.FieldByName('ID').asinteger;
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
               query.Params.ParamByName('id_produto').AsInteger   := queryProduto.FieldByName('ID').asinteger;

            End else Begin

               id := query.FieldByName('id').AsInteger;

               query.Close;
               query.SQL.Clear;
               query.SQL.Add(' UPDATE promocao_detalhe SET valor = :valor WHERE id = :id  ');

               query.Params.ParamByName('id').AsInteger := id;

            End;

            query.Params.ParamByName('valor').AsFloat          := queryProduto.FieldByName('VALOR_UNITARIO').AsFloat -
                                                                      (queryProduto.FieldByName('VALOR_UNITARIO').AsFloat * (edtPercentual.AsFloat/100));
            query.ExecSQL;

            queryProduto.Next;

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
      FreeAndNil(queryProduto);
      FreeAndNil(transacao);

   End;

end;

procedure TfrmPercDescontoPorCategoria.FormCreate(Sender: TObject);
begin

   qryCategoria.Close;
   qryCategoria.Open;

   lkpCategoria.KeyValue := -1;

end;

procedure TfrmPercDescontoPorCategoria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;

   end;

end;

procedure TfrmPercDescontoPorCategoria.FormShow(Sender: TObject);
begin

   lkpCategoria.SetFocus;

end;

procedure TfrmPercDescontoPorCategoria.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmPercDescontoPorCategoria.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmPercDescontoPorCategoria.Image4Click(Sender: TObject);
begin

   close;

end;

end.
