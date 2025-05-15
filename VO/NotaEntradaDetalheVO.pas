unit NotaEntradaDetalheVO;

interface

Type TNotaEntradaDetalheVO = class
  private
    FVL_ISENTO: double;
    FVL_ICMS_SUBST: double;
    FSEQUENCIA: integer;
    FID_PRODUTO: integer;
    FVL_OUTROS: double;
    FID_CABECALHO: integer;
    FVL_PIS: double;
    FVL_COFINS: double;
    FQTREAL: double;
    FUND: String;
    FVL_FRETE: double;
    FID: integer;
    FVL_IPI: double;
    FVL_DESCONTO: double;
    FVL_UNITARIO: double;
    FCODIGO_ORIGEM: String;
    FVL_ICMS: double;
    FVL_SEGURO: double;
    FFATOR_UNIDADE: double;
    FPROD_ID_UNIDADE_PRODUTO: integer;
    FPROD_ID_UNIDADE_ENTRADA: integer;
    FPROD_VALOR_VENDA: double;
    FPROD_DESCRICAO: String;
    FGTIN: String;
    procedure SetCODIGO_ORIGEM(const Value: String);
    procedure SetID(const Value: integer);
    procedure SetID_CABECALHO(const Value: integer);
    procedure SetID_PRODUTO(const Value: integer);
    procedure SetQTREAL(const Value: double);
    procedure SetSEQUENCIA(const Value: integer);
    procedure SetUND(const Value: String);
    procedure SetVL_COFINS(const Value: double);
    procedure SetVL_DESCONTO(const Value: double);
    procedure SetVL_FRETE(const Value: double);
    procedure SetVL_ICMS(const Value: double);
    procedure SetVL_ICMS_SUBST(const Value: double);
    procedure SetVL_IPI(const Value: double);
    procedure SetVL_ISENTO(const Value: double);
    procedure SetVL_OUTROS(const Value: double);
    procedure SetVL_PIS(const Value: double);
    procedure SetVL_SEGURO(const Value: double);
    procedure SetVL_UNITARIO(const Value: double);
    procedure SetFATOR_UNIDADE(const Value: double);
    procedure SetPROD_DESCRICAO(const Value: String);
    procedure SetPROD_ID_UNIDADE_ENTRADA(const Value: integer);
    procedure SetPROD_ID_UNIDADE_PRODUTO(const Value: integer);
    procedure SetPROD_VALOR_VENDA(const Value: double);
    procedure SetGTIN(const Value: String);
  published

   property ID: integer read FID write SetID;
   property ID_CABECALHO: integer read FID_CABECALHO write SetID_CABECALHO;
   property ID_PRODUTO: integer read FID_PRODUTO write SetID_PRODUTO;
   property SEQUENCIA: integer read FSEQUENCIA write SetSEQUENCIA;
   property QTREAL: double read FQTREAL write SetQTREAL;
   property VL_UNITARIO: double read FVL_UNITARIO write SetVL_UNITARIO;
   property VL_FRETE: double read FVL_FRETE write SetVL_FRETE;
   property VL_IPI: double read FVL_IPI write SetVL_IPI;
   property VL_ICMS: double read FVL_ICMS write SetVL_ICMS;
   property VL_DESCONTO: double read FVL_DESCONTO write SetVL_DESCONTO;
   property VL_ICMS_SUBST: double read FVL_ICMS_SUBST write SetVL_ICMS_SUBST;
   property VL_ISENTO: double read FVL_ISENTO write SetVL_ISENTO;
   property VL_PIS: double read FVL_PIS write SetVL_PIS;
   property VL_COFINS: double read FVL_COFINS write SetVL_COFINS;
   property VL_SEGURO: double read FVL_SEGURO write SetVL_SEGURO;
   property VL_OUTROS: double read FVL_OUTROS write SetVL_OUTROS;
   property CODIGO_ORIGEM: String read FCODIGO_ORIGEM write SetCODIGO_ORIGEM;
   property UND: String read FUND write SetUND;
   property FATOR_UNIDADE: double read FFATOR_UNIDADE write SetFATOR_UNIDADE;
   property PROD_ID_UNIDADE_PRODUTO: integer read FPROD_ID_UNIDADE_PRODUTO write SetPROD_ID_UNIDADE_PRODUTO;
   property PROD_ID_UNIDADE_ENTRADA: integer read FPROD_ID_UNIDADE_ENTRADA write SetPROD_ID_UNIDADE_ENTRADA;
   property PROD_DESCRICAO: String read FPROD_DESCRICAO write SetPROD_DESCRICAO;
   property PROD_VALOR_VENDA: double read FPROD_VALOR_VENDA write SetPROD_VALOR_VENDA;
   property GTIN: String read FGTIN write SetGTIN;

end;

implementation

{ TNotaEntradaDetalheVO }

procedure TNotaEntradaDetalheVO.SetCODIGO_ORIGEM(const Value: String);
begin
  FCODIGO_ORIGEM := Value;
end;

procedure TNotaEntradaDetalheVO.SetFATOR_UNIDADE(const Value: double);
begin
  FFATOR_UNIDADE := Value;
end;

procedure TNotaEntradaDetalheVO.SetGTIN(const Value: String);
begin
  FGTIN := Value;
end;

procedure TNotaEntradaDetalheVO.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TNotaEntradaDetalheVO.SetID_CABECALHO(const Value: integer);
begin
  FID_CABECALHO := Value;
end;

procedure TNotaEntradaDetalheVO.SetID_PRODUTO(const Value: integer);
begin
  FID_PRODUTO := Value;
end;

procedure TNotaEntradaDetalheVO.SetPROD_DESCRICAO(const Value: String);
begin
  FPROD_DESCRICAO := Value;
end;

procedure TNotaEntradaDetalheVO.SetPROD_ID_UNIDADE_ENTRADA(
  const Value: integer);
begin
  FPROD_ID_UNIDADE_ENTRADA := Value;
end;

procedure TNotaEntradaDetalheVO.SetPROD_ID_UNIDADE_PRODUTO(
  const Value: integer);
begin
  FPROD_ID_UNIDADE_PRODUTO := Value;
end;

procedure TNotaEntradaDetalheVO.SetPROD_VALOR_VENDA(const Value: double);
begin
  FPROD_VALOR_VENDA := Value;
end;

procedure TNotaEntradaDetalheVO.SetQTREAL(const Value: double);
begin
  FQTREAL := Value;
end;

procedure TNotaEntradaDetalheVO.SetSEQUENCIA(const Value: integer);
begin
  FSEQUENCIA := Value;
end;

procedure TNotaEntradaDetalheVO.SetUND(const Value: String);
begin
  FUND := Value;
end;

procedure TNotaEntradaDetalheVO.SetVL_COFINS(const Value: double);
begin
  FVL_COFINS := Value;
end;

procedure TNotaEntradaDetalheVO.SetVL_DESCONTO(const Value: double);
begin
  FVL_DESCONTO := Value;
end;

procedure TNotaEntradaDetalheVO.SetVL_FRETE(const Value: double);
begin
  FVL_FRETE := Value;
end;

procedure TNotaEntradaDetalheVO.SetVL_ICMS(const Value: double);
begin
  FVL_ICMS := Value;
end;

procedure TNotaEntradaDetalheVO.SetVL_ICMS_SUBST(const Value: double);
begin
  FVL_ICMS_SUBST := Value;
end;

procedure TNotaEntradaDetalheVO.SetVL_IPI(const Value: double);
begin
  FVL_IPI := Value;
end;

procedure TNotaEntradaDetalheVO.SetVL_ISENTO(const Value: double);
begin
  FVL_ISENTO := Value;
end;

procedure TNotaEntradaDetalheVO.SetVL_OUTROS(const Value: double);
begin
  FVL_OUTROS := Value;
end;

procedure TNotaEntradaDetalheVO.SetVL_PIS(const Value: double);
begin
  FVL_PIS := Value;
end;

procedure TNotaEntradaDetalheVO.SetVL_SEGURO(const Value: double);
begin
  FVL_SEGURO := Value;
end;

procedure TNotaEntradaDetalheVO.SetVL_UNITARIO(const Value: double);
begin
  FVL_UNITARIO := Value;
end;

end.
