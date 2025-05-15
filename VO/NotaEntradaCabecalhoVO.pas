unit NotaEntradaCabecalhoVO;

interface

Type TNotaEntradaCabecalhoVO = class
  private
    FDESCONTO: Double;
    FVALOR_NOTA: Double;
    FVALOR_TOTAL_NOTA: Double;
    FCHAVE_NFE: String;
    FSERIE: String;
    FID: integer;
    FOUTROS: Double;
    FSTATUS: String;
    FNUMERO_NOTA: String;
    FDATA_CHEGADA: TDate;
    FTP_NF: String;
    FID_FORNECEDOR: integer;
    FQTD_PROD: integer;
    FDATA_PEDIDO: TDate;
    FFRETE: Double;
    FID_USUARIO: integer;
    procedure SetCHAVE_NFE(const Value: String);
    procedure SetDATA_CHEGADA(const Value: TDate);
    procedure SetDATA_PEDIDO(const Value: TDate);
    procedure SetDESCONTO(const Value: Double);
    procedure SetFRETE(const Value: Double);
    procedure SetID(const Value: integer);
    procedure SetID_FORNECEDOR(const Value: integer);
    procedure SetID_USUARIO(const Value: integer);
    procedure SetNUMERO_NOTA(const Value: String);
    procedure SetOUTROS(const Value: Double);
    procedure SetQTD_PROD(const Value: integer);
    procedure SetSERIE(const Value: String);
    procedure SetSTATUS(const Value: String);
    procedure SetTP_NF(const Value: String);
    procedure SetVALOR_NOTA(const Value: Double);
    procedure SetVALOR_TOTAL_NOTA(const Value: Double);
  published

   Property ID: integer read FID write SetID;
   Property DATA_PEDIDO: TDate read FDATA_PEDIDO write SetDATA_PEDIDO;
   Property DATA_CHEGADA: TDate read FDATA_CHEGADA write SetDATA_CHEGADA;
   Property NUMERO_NOTA: String read FNUMERO_NOTA write SetNUMERO_NOTA;
   Property ID_FORNECEDOR: integer read FID_FORNECEDOR write SetID_FORNECEDOR;
   Property STATUS: String read FSTATUS write SetSTATUS;
   Property OUTROS: Double read FOUTROS write SetOUTROS;
   Property DESCONTO: Double read FDESCONTO write SetDESCONTO;
   Property FRETE: Double read FFRETE write SetFRETE;
   Property VALOR_NOTA: Double read FVALOR_NOTA write SetVALOR_NOTA;
   Property ID_USUARIO: integer read FID_USUARIO write SetID_USUARIO;
   Property SERIE: String read FSERIE write SetSERIE;
   Property CHAVE_NFE: String read FCHAVE_NFE write SetCHAVE_NFE;
   Property TP_NF: String read FTP_NF write SetTP_NF;
   Property VALOR_TOTAL_NOTA: Double read FVALOR_TOTAL_NOTA write SetVALOR_TOTAL_NOTA;
   Property QTD_PROD: integer read FQTD_PROD write SetQTD_PROD;


end;

implementation

{ TNotaEntradaCabecalhoVO }

procedure TNotaEntradaCabecalhoVO.SetCHAVE_NFE(const Value: String);
begin
  FCHAVE_NFE := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetDATA_CHEGADA(const Value: TDate);
begin
  FDATA_CHEGADA := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetDATA_PEDIDO(const Value: TDate);
begin
  FDATA_PEDIDO := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetDESCONTO(const Value: Double);
begin
  FDESCONTO := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetFRETE(const Value: Double);
begin
  FFRETE := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetID_FORNECEDOR(const Value: integer);
begin
  FID_FORNECEDOR := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetID_USUARIO(const Value: integer);
begin
  FID_USUARIO := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetNUMERO_NOTA(const Value: String);
begin
  FNUMERO_NOTA := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetOUTROS(const Value: Double);
begin
  FOUTROS := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetQTD_PROD(const Value: integer);
begin
  FQTD_PROD := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetSERIE(const Value: String);
begin
  FSERIE := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetSTATUS(const Value: String);
begin
  FSTATUS := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetTP_NF(const Value: String);
begin
  FTP_NF := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetVALOR_NOTA(const Value: Double);
begin
  FVALOR_NOTA := Value;
end;

procedure TNotaEntradaCabecalhoVO.SetVALOR_TOTAL_NOTA(const Value: Double);
begin
  FVALOR_TOTAL_NOTA := Value;
end;

end.
