unit untSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvAnimatedImage, JvGIFCtrl,
  Vcl.StdCtrls, Vcl.ExtCtrls, JvLabel;

type
  TfrmSplash = class(TForm)
    JvGIFAnimator1: TJvGIFAnimator;
    JvLabel1: TJvLabel;
    Timer2: TTimer;
    JvGIFAnimator2: TJvGIFAnimator;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    caminhoThread: string;
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   frmSplash := Nil;
   //Timer1.Enabled := False;

end;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin

   //Timer1.Enabled := True;
   Brush.Style := bsClear;

end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
begin

   //frmSplash.Close;

end;

procedure TfrmSplash.Timer2Timer(Sender: TObject);
begin

   if JvLabel1.Visible then
      JvLabel1.Visible := False
   else
      JvLabel1.Visible := True;

end;

end.
