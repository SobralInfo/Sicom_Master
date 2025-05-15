unit FornecedoresVO;

interface

Type TFornecedoresVO = class
  private
    FLOGRADOURO: String;
    FCPF_CNPJ: String;
    FFANTASIA: String;
    FBAIRRO: String;
    FEMAIL: String;
    FUF: String;
    FDATA_CADASTRO: TDate;
    FCEP: String;
    FINSCRICAO_ESTADUAL: String;
    FID: integer;
    FNUMERO: String;
    FCODIGO_IBGE_CIDADE: integer;
    FTIPO_PESSOA: String;
    FCOMPLEMENTO: String;
    FNOME: String;
    FCIDADE: String;
    FCODIGO_IBGE_UF: integer;
    FCELULAR: String;
    procedure SetBAIRRO(const Value: String);
    procedure SetCELULAR(const Value: String);
    procedure SetCEP(const Value: String);
    procedure SetCIDADE(const Value: String);
    procedure SetCODIGO_IBGE_CIDADE(const Value: integer);
    procedure SetCODIGO_IBGE_UF(const Value: integer);
    procedure SetCOMPLEMENTO(const Value: String);
    procedure SetCPF_CNPJ(const Value: String);
    procedure SetDATA_CADASTRO(const Value: TDate);
    procedure SetEMAIL(const Value: String);
    procedure SetFANTASIA(const Value: String);
    procedure SetID(const Value: integer);
    procedure SetINSCRICAO_ESTADUAL(const Value: String);
    procedure SetLOGRADOURO(const Value: String);
    procedure SetNOME(const Value: String);
    procedure SetNUMERO(const Value: String);
    procedure SetTIPO_PESSOA(const Value: String);
    procedure SetUF(const Value: String);
  published

   property ID: integer read FID write SetID;
   property NOME: String read FNOME write SetNOME;
   property FANTASIA: String read FFANTASIA write SetFANTASIA;
   property EMAIL: String read FEMAIL write SetEMAIL;
   property CPF_CNPJ: String read FCPF_CNPJ write SetCPF_CNPJ;
   property INSCRICAO_ESTADUAL: String read FINSCRICAO_ESTADUAL write SetINSCRICAO_ESTADUAL;
   property TIPO_PESSOA: String read FTIPO_PESSOA write SetTIPO_PESSOA;
   property DATA_CADASTRO: TDate read FDATA_CADASTRO write SetDATA_CADASTRO;
   property LOGRADOURO: String read FLOGRADOURO write SetLOGRADOURO;
   property NUMERO: String read FNUMERO write SetNUMERO;
   property COMPLEMENTO: String read FCOMPLEMENTO write SetCOMPLEMENTO;
   property CEP: String read FCEP write SetCEP;
   property BAIRRO: String read FBAIRRO write SetBAIRRO;
   property CIDADE: String read FCIDADE write SetCIDADE;
   property UF: String read FUF write SetUF;
   property CELULAR: String read FCELULAR write SetCELULAR;
   property CODIGO_IBGE_CIDADE: integer read FCODIGO_IBGE_CIDADE write SetCODIGO_IBGE_CIDADE;
   property CODIGO_IBGE_UF: integer read FCODIGO_IBGE_UF write SetCODIGO_IBGE_UF;



end;

implementation

{ TFornecedoresVO }

procedure TFornecedoresVO.SetBAIRRO(const Value: String);
begin
  FBAIRRO := Value;
end;

procedure TFornecedoresVO.SetCELULAR(const Value: String);
begin
  FCELULAR := Value;
end;

procedure TFornecedoresVO.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TFornecedoresVO.SetCIDADE(const Value: String);
begin
  FCIDADE := Value;
end;

procedure TFornecedoresVO.SetCODIGO_IBGE_CIDADE(const Value: integer);
begin
  FCODIGO_IBGE_CIDADE := Value;
end;

procedure TFornecedoresVO.SetCODIGO_IBGE_UF(const Value: integer);
begin
  FCODIGO_IBGE_UF := Value;
end;

procedure TFornecedoresVO.SetCOMPLEMENTO(const Value: String);
begin
  FCOMPLEMENTO := Value;
end;

procedure TFornecedoresVO.SetCPF_CNPJ(const Value: String);
begin
  FCPF_CNPJ := Value;
end;

procedure TFornecedoresVO.SetDATA_CADASTRO(const Value: TDate);
begin
  FDATA_CADASTRO := Value;
end;

procedure TFornecedoresVO.SetEMAIL(const Value: String);
begin
  FEMAIL := Value;
end;

procedure TFornecedoresVO.SetFANTASIA(const Value: String);
begin
  FFANTASIA := Value;
end;

procedure TFornecedoresVO.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TFornecedoresVO.SetINSCRICAO_ESTADUAL(const Value: String);
begin
  FINSCRICAO_ESTADUAL := Value;
end;

procedure TFornecedoresVO.SetLOGRADOURO(const Value: String);
begin
  FLOGRADOURO := Value;
end;

procedure TFornecedoresVO.SetNOME(const Value: String);
begin
  FNOME := Value;
end;

procedure TFornecedoresVO.SetNUMERO(const Value: String);
begin
  FNUMERO := Value;
end;

procedure TFornecedoresVO.SetTIPO_PESSOA(const Value: String);
begin
  FTIPO_PESSOA := Value;
end;

procedure TFornecedoresVO.SetUF(const Value: String);
begin
  FUF := Value;
end;

end.
