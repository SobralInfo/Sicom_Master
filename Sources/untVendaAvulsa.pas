unit untVendaAvulsa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Grids, Vcl.DBGrids, RxDBCtrl, Vcl.Buttons;

type
  TfrmVendaAvulsa = class(TForm)
    speNovo: TSpeedButton;
    speSalvar: TSpeedButton;
    speCancelar: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label4: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    JvDBGrid1: TRxDBGrid;
    cbbStatus: TComboBox;
    edtDescricao: TMaskEdit;
    edtGTIN: TMaskEdit;
    PopupMenu1: TPopupMenu;
    InserirProduto1: TMenuItem;
    ExcluirProduto1: TMenuItem;
    qryProdutos: TFDQuery;
    qryProdutosID: TIntegerField;
    qryProdutosDESCRICAO: TStringField;
    qryProdutosSIGLA: TStringField;
    qryProdutosVALOR: TFloatField;
    qryProdutosQUANTIDADE: TFloatField;
    dtsProdutos: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendaAvulsa: TfrmVendaAvulsa;

implementation

{$R *.dfm}

end.
