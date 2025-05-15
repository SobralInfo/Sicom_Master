unit untFechamentoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, unitConfiguracoes, JvExStdCtrls, JvEdit,
  JvValidateEdit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmFechamentoCaixa = class(TForm)
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel1: TPanel;
    Label4: TLabel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    rdbAnalitico: TRadioButton;
    rdbSintetico: TRadioButton;
    GroupBox2: TGroupBox;
    edtEspecie: TJvValidateEdit;
    GroupBox3: TGroupBox;
    dtIni: TDateTimePicker;
    procedure Image3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure dtIniChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;

  end;

var
  frmFechamentoCaixa: TfrmFechamentoCaixa;

implementation

{$R *.dfm}

uses untPrincipal;

procedure TfrmFechamentoCaixa.Confirmar;
Var bool: Boolean;
    query: TFDQuery;
begin

   if edtEspecie.AsFloat <= 0.00 then Begin

      prcMsgAdv('Informe o valor em espécie.');
      edtEspecie.SetFocus;
      Exit;

   End;

   if edtEspecie.Enabled = True then Begin

      Try

         query := TFDQuery.Create(Nil);
         query.Connection := frmPrincipal.ConexaoLocal;

         query.SQL.Add('INSERT INTO fechamento (data, valor) VALUES (:data, :valor) ');
         query.Params.ParamByName('data').AsDateTime := dtIni.Date;
         query.Params.ParamByName('valor').AsFloat   := edtEspecie.AsFloat;
         query.ExecSQL;
         frmPrincipal.ConexaoLocal.Commit;
         edtEspecie.Enabled := False;

         frmPrincipal.RetornarValorEspecie;

      Finally

         FreeAndNil(query);

      End;

   End;

   bool := True;

   if rdbAnalitico.Checked then
      bool := False;

   frmPrincipal.ImprimirFechamento(dtIni.Date, dtIni.Date, bool);

end;

procedure TfrmFechamentoCaixa.dtIniChange(Sender: TObject);
Begin

   frmPrincipal.RetornarValorEspecie;

End;

procedure TfrmFechamentoCaixa.FormCreate(Sender: TObject);
begin

   dtIni.Date := Date;
   frmPrincipal.RetornarValorEspecie;
   //dtFim.Date := Date;

end;

procedure TfrmFechamentoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: Confirmar;

   end;

end;

procedure TfrmFechamentoCaixa.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmFechamentoCaixa.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmFechamentoCaixa.Image4Click(Sender: TObject);
begin

   Close;

end;

end.
