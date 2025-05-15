unit untDescontoAcrescimo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit, System.Math,
  JvValidateEdit, Vcl.Buttons, unitConfiguracoes, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmDescontoAcrescimo = class(TForm)
    cbbTipo: TComboBox;
    Panel3: TPanel;
    Label2: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label3: TLabel;
    edtDesconto: TJvValidateEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbbTipoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure cbbTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDesconto1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescontoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
    Var tipo: String;
  end;

var
  frmDescontoAcrescimo: TfrmDescontoAcrescimo;

implementation

{$R *.dfm}

uses untPedidos, untTelaDePedido;

procedure TfrmDescontoAcrescimo.cbbTipoChange(Sender: TObject);
begin

   if cbbTipo.ItemIndex = 6 then Begin
      edtDesconto.AsFloat := 0.00;
      edtDesconto.Enabled := False;   
   End else
      edtDesconto.Enabled := True;

end;

procedure TfrmDescontoAcrescimo.cbbTipoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if ((key = VK_RETURN) and (edtDesconto.Enabled = True)) then
      edtDesconto.SetFocus;

end;

procedure TfrmDescontoAcrescimo.Confirmar;
Var valorDescontoAcrescimo: double;
begin

   if tipo = 'PEDIDO' then
      valorDescontoAcrescimo := StringParaFloat(frmTelaDePedido.lblSubtotal.Caption) * (edtDesconto.AsFloat/100)
   else
      valorDescontoAcrescimo := frmPedidos.total * (edtDesconto.AsFloat/100);

   if cbbTipo.ItemIndex in [2,5] then Begin
      prcMsgAdv('Informe o tipo de desconto/Acréscimo');
      cbbTipo.SetFocus;
      Exit;
   End;

   if ((cbbTipo.ItemIndex <> 6) and (edtDesconto.AsFloat <= 0)) then Begin
      prcMsgAdv('Valor Desconto/Acréscimo inválido.');
      edtDesconto.SetFocus;
      Exit;
   End;


   if cbbTipo.ItemIndex <= 1 then Begin

      if tipo = 'PEDIDO' then Begin

         if cbbTipo.ItemIndex = 0 then
            frmTelaDePedido.lblDescontoAcrescimo.Caption := FormatFloat('###,#0.00',edtDesconto.AsFloat)
         else
            frmTelaDePedido.lblDescontoAcrescimo.Caption := FormatFloat('###,#0.00',SimpleRoundTo(valorDescontoAcrescimo, -2));

         frmTelaDePedido.lblTotalGeral.Caption := FormatFloat('###,#0.00',(StringParaFloat(frmTelaDePedido.lblSubtotal.Caption) - StringParaFloat(frmTelaDePedido.lblDescontoAcrescimo.Caption))+frmTelaDePedido.edtTaxaEntrega.AsFloat);
         frmTelaDePedido.lblDescontoAcrescimo.Caption := '-'+Trim(frmTelaDePedido.lblDescontoAcrescimo.Caption);

         frmTelaDePedido.GravarPedido(False);

      End else Begin

         if cbbTipo.ItemIndex = 0 then
            frmPedidos.desconto := edtDesconto.AsFloat
         else
            frmPedidos.desconto  := SimpleRoundTo(valorDescontoAcrescimo, -2);

         frmPedidos.acrescimo := 0.00;

      End;

   End else if cbbTipo.ItemIndex <= 4 then Begin

      if tipo = 'PEDIDO' then Begin

         if cbbTipo.ItemIndex = 3 then
            frmTelaDePedido.lblDescontoAcrescimo.Caption := FormatFloat('###,#0.00',edtDesconto.AsFloat)
         else
            frmTelaDePedido.lblDescontoAcrescimo.Caption := FormatFloat('###,#0.00',SimpleRoundTo(valorDescontoAcrescimo, -2));

         frmTelaDePedido.lblTotalGeral.Caption := FormatFloat('###,#0.00',(StringParaFloat(frmTelaDePedido.lblSubtotal.Caption) +
                                                                           StringParaFloat(frmTelaDePedido.lblDescontoAcrescimo.Caption))+frmTelaDePedido.edtTaxaEntrega.AsFloat);
         frmTelaDePedido.lblDescontoAcrescimo.Caption := '+'+Trim(frmTelaDePedido.lblDescontoAcrescimo.Caption);

         frmTelaDePedido.GravarPedido(False);

      End else Begin

         if cbbTipo.ItemIndex = 3 then
            frmPedidos.acrescimo := edtDesconto.AsFloat
         else
            frmPedidos.acrescimo := SimpleRoundTo(valorDescontoAcrescimo, -2);

         frmPedidos.desconto  := 0.00;

      End;

   End else if cbbTipo.ItemIndex = 6 then Begin

      if tipo = 'PEDIDO' then Begin

         frmTelaDePedido.lblDescontoAcrescimo.Caption := '0,00';
         frmTelaDePedido.lblTotalGeral.Caption := FormatFloat('###,#0.00',StringParaFloat(frmTelaDePedido.lblSubtotal.Caption)+frmTelaDePedido.edtTaxaEntrega.AsFloat);

         frmTelaDePedido.GravarPedido(False);

      End else Begin

         frmPedidos.desconto  := 0.00;
         frmPedidos.acrescimo := 0.00;


      End;
   End;

   if tipo <> 'PEDIDO' then
      frmPedidos.Totalizadores;

   close;

end;

procedure TfrmDescontoAcrescimo.edtDesconto1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_RETURN then
      Confirmar;

end;

procedure TfrmDescontoAcrescimo.edtDescontoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

   if key = VK_RETURN then
      Confirmar;

end;

procedure TfrmDescontoAcrescimo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   cbbTipo.Clear;

end;

procedure TfrmDescontoAcrescimo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case Key of

      VK_F12: Confirmar;
      VK_ESCAPE: close;

   end;

end;

procedure TfrmDescontoAcrescimo.Image3Click(Sender: TObject);
begin

   Confirmar;

end;

procedure TfrmDescontoAcrescimo.Image4Click(Sender: TObject);
begin

   close;

end;

end.
