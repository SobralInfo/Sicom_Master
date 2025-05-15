unit untCadastrarSuprimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, baseLocalSuprimentoVO,
  baseLocalSuprimentoController, unitConfiguracoes, JvEdit, Vcl.Mask, JvExMask,
  JvToolEdit, JvMaskEdit, JvExStdCtrls, JvValidateEdit, Vcl.Imaging.pngimage;

type
  TfrmCadastrarSuprimento = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    edtValor: TJvValidateEdit;
    edtData: TJvMaskEdit;
    edtDescricao: TJvEdit;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image3Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
  end;

var
  frmCadastrarSuprimento: TfrmCadastrarSuprimento;

implementation

{$R *.dfm}

uses untPrincipal;

{ TfrmCadastrarSuprimento }

procedure TfrmCadastrarSuprimento.Confirmar;
Var suprimento: TBaseLocalSuprimentoVO;
begin

   if Trim(edtDescricao.Text) = '' then Begin
      prcMsgAdv('Informe uma descrição.');
      edtDescricao.SetFocus;
      Exit;
   End;

   Try
      strtodate(edtData.Text)
   Except
      prcMsgAdv('Data inválida;.');
      edtData.SetFocus;
      Exit;
   End;

   if edtValor.AsFloat <= 0.00 then Begin
      prcMsgAdv('Informe o valor do suprimento.');
      edtValor.SetFocus;
      Exit;
   End;

   Try

      suprimento := TBaseLocalSuprimentoVO.Create;

      suprimento.descricao := Trim(edtDescricao.Text);
      suprimento.data      := StrToDate(edtData.Text);
      suprimento.valor     := edtValor.AsFloat;

      TBaseLocalSuprimentoController.GravarSuprimento(suprimento);
      frmPrincipal.ImprimirSuprimento(suprimento);
      frmCadastrarSuprimento.Close;

   Finally

      FreeAndNil(suprimento);

   End;


end;

procedure TfrmCadastrarSuprimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: confirmar;

   end;

end;

procedure TfrmCadastrarSuprimento.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarSuprimento.Image3Click(Sender: TObject);
begin


   Confirmar;

end;

procedure TfrmCadastrarSuprimento.Image4Click(Sender: TObject);
begin

   close;

end;

end.
