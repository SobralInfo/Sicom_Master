unit untCadastrarSangria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, baseLocalSangriaVO, baseLocalSangriaController, unitConfiguracoes,
  JvEdit, Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit, Vcl.StdCtrls,
  JvExStdCtrls, JvValidateEdit, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmCadastrarSangria = class(TForm)
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
  frmCadastrarSangria: TfrmCadastrarSangria;

implementation

{$R *.dfm}

uses untPrincipal;

{ TfrmCadastrarSangria }

procedure TfrmCadastrarSangria.Confirmar;
Var sangria: TBaseLocalSangriaVO;
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
      prcMsgAdv('Informe o valor da Sangria.');
      edtValor.SetFocus;
      Exit;
   End;

   Try

      sangria :=  TBaseLocalSangriaVO.Create;

      sangria.descricao := Trim(edtDescricao.Text);
      sangria.data      := StrToDate(edtData.Text);
      sangria.valor     := edtValor.AsFloat;

      TBaseLocalSangriaController.GravarSangria(sangria);
      frmPrincipal.ImprimirSangria(sangria);
      frmCadastrarSangria.Close;

   Finally

      FreeAndNil(sangria);

   End;


end;

procedure TfrmCadastrarSangria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmCadastrarSangria.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmCadastrarSangria.Image3Click(Sender: TObject);
begin

   Confirmar;

end;



procedure TfrmCadastrarSangria.Image4Click(Sender: TObject);
begin

   close;

end;

end.
