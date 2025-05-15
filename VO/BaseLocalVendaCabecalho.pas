unit BaseLocalVendaCabecalhoVO;

interface

Type
   TBaseLocalVendaCabecalhoVO = class
  private
    FCPF_CNPJ_CLIENTE: string;
    FACRESCIMO: double;
    FDESCONTO: double;
    FID_CLIENTE: integer;
    FDATA_HORA_VENDA: TDateTime;
    FID: integer;
    FSTATUS: string;
    FID_VENDEDOR: integer;
    FVALOR_FINAL: double;
    FNOME_CLIENTE: string;
    FVALOR_VENDA: double;
    procedure SetACRESCIMO(const Value: double);
    procedure SetCPF_CNPJ_CLIENTE(const Value: string);
    procedure SetDATA_HORA_VENDA(const Value: TDateTime);
    procedure SetDESCONTO(const Value: double);
    procedure SetID(const Value: integer);
    procedure SetID_CLIENTE(const Value: integer);
    procedure SetID_VENDEDOR(const Value: integer);
    procedure SetNOME_CLIENTE(const Value: string);
    procedure SetSTATUS(const Value: string);
    procedure SetVALOR_FINAL(const Value: double);
    procedure SetVALOR_VENDA(const Value: double);
  published

      property ID: integer read FID write SetID;
      property ID_CLIENTE: integer read FID_CLIENTE write SetID_CLIENTE;
      property ID_VENDEDOR: integer read FID_VENDEDOR write SetID_VENDEDOR;
      property DATA_HORA_VENDA: TDateTime read FDATA_HORA_VENDA write SetDATA_HORA_VENDA;
      property VALOR_VENDA: double read FVALOR_VENDA write SetVALOR_VENDA;
      property DESCONTO: double read FDESCONTO write SetDESCONTO;
      property ACRESCIMO: double read FACRESCIMO write SetACRESCIMO;
      property VALOR_FINAL: double read FVALOR_FINAL write SetVALOR_FINAL;
      property STATUS: string read FSTATUS write SetSTATUS;
      property NOME_CLIENTE: string read FNOME_CLIENTE write SetNOME_CLIENTE;
      property CPF_CNPJ_CLIENTE: string read FCPF_CNPJ_CLIENTE write SetCPF_CNPJ_CLIENTE;

   end;

implementation

{ TBaseLocalVendaCabecalho }

procedure TBaseLocalVendaCabecalhoVO.SetACRESCIMO(const Value: double);
begin
  FACRESCIMO := Value;
end;

procedure TBaseLocalVendaCabecalhoVO.SetCPF_CNPJ_CLIENTE(const Value: string);
begin
  FCPF_CNPJ_CLIENTE := Value;
end;

procedure TBaseLocalVendaCabecalhoVO.SetDATA_HORA_VENDA(const Value: TDateTime);
begin
  FDATA_HORA_VENDA := Value;
end;

procedure TBaseLocalVendaCabecalhoVO.SetDESCONTO(const Value: double);
begin
  FDESCONTO := Value;
end;

procedure TBaseLocalVendaCabecalhoVO.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TBaseLocalVendaCabecalhoVO.SetID_CLIENTE(const Value: integer);
begin
  FID_CLIENTE := Value;
end;

procedure TBaseLocalVendaCabecalhoVO.SetID_VENDEDOR(const Value: integer);
begin
  FID_VENDEDOR := Value;
end;

procedure TBaseLocalVendaCabecalhoVO.SetNOME_CLIENTE(const Value: string);
begin
  FNOME_CLIENTE := Value;
end;

procedure TBaseLocalVendaCabecalhoVO.SetSTATUS(const Value: string);
begin
  FSTATUS := Value;
end;

procedure TBaseLocalVendaCabecalhoVO.SetVALOR_FINAL(const Value: double);
begin
  FVALOR_FINAL := Value;
end;

procedure TBaseLocalVendaCabecalhoVO.SetVALOR_VENDA(const Value: double);
begin
  FVALOR_VENDA := Value;
end;

end.
