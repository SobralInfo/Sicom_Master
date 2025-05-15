unit BaseLocalEmpresaVO;

interface

Type TBaseLocalEmpresaVO = class
  private
    FFONE: string;
    FFANTASIA: string;
    FCNPJ: string;
    FSITE: string;
    FEMAIL: string;
    FRAZAO_SOCIAL: string;
    FBASE_LOCAL: string;
    FID: integer;
    FCELULAR: string;
    FCODIGO_UF: integer;
    FCODIGO_CIDADE: integer;
    FULTIMO_NSU: integer;
    FDATA_HORA_BLOQUEIO_XML: TDateTime;
    FID_MUNICIPIO: integer;
    FIE: String;
    FTIPO_REGIME: integer;
    FLOGRADOURO: String;
    FBAIRRO: String;
    FNUMERO: String;
    FCOMPLEMENTO: String;
    FCEP: String;
    FUF: String;
    FCIDADE: String;
    procedure SetBASE_LOCAL(const Value: string);
    procedure SetCELULAR(const Value: string);
    procedure SetCNPJ(const Value: string);
    procedure SetEMAIL(const Value: string);
    procedure SetFANTASIA(const Value: string);
    procedure SetFONE(const Value: string);
    procedure SetID(const Value: integer);
    procedure SetRAZAO_SOCIAL(const Value: string);
    procedure SetSITE(const Value: string);
    procedure SetCODIGO_CIDADE(const Value: integer);
    procedure SetCODIGO_UF(const Value: integer);
    procedure SetULTIMO_NSU(const Value: integer);
    procedure SetDATA_HORA_BLOQUEIO_XML(const Value: TDateTime);
    procedure SetID_MUNICIPIO(const Value: integer);
    procedure SetIE(const Value: String);
    procedure SetTIPO_REGIME(const Value: integer);
    procedure SetBAIRRO(const Value: String);
    procedure SetCOMPLEMENTO(const Value: String);
    procedure SetLOGRADOURO(const Value: String);
    procedure SetNUMERO(const Value: String);
    procedure SetCEP(const Value: String);
    procedure SetCIDADE(const Value: String);
    procedure SetUF(const Value: String);
  published

   property ID: integer read FID write SetID;
   property CNPJ: string read FCNPJ write SetCNPJ;
   property RAZAO_SOCIAL: string read FRAZAO_SOCIAL write SetRAZAO_SOCIAL;
   property FANTASIA: string read FFANTASIA write SetFANTASIA;
   property FONE: string read FFONE write SetFONE;
   property CELULAR: string read FCELULAR write SetCELULAR;
   property EMAIL: string read FEMAIL write SetEMAIL;
   property SITE: string read FSITE write SetSITE;
   property BASE_LOCAL: string read FBASE_LOCAL write SetBASE_LOCAL;
   property CODIGO_UF: integer read FCODIGO_UF write SetCODIGO_UF;
   property CODIGO_CIDADE: integer read FCODIGO_CIDADE write SetCODIGO_CIDADE;
   property ULTIMO_NSU: integer read FULTIMO_NSU write SetULTIMO_NSU;
   property DATA_HORA_BLOQUEIO_XML: TDateTime read FDATA_HORA_BLOQUEIO_XML write SetDATA_HORA_BLOQUEIO_XML;
   property ID_MUNICIPIO: integer read FID_MUNICIPIO write SetID_MUNICIPIO;
   property IE: String read FIE write SetIE;
   property TIPO_REGIME: integer read FTIPO_REGIME write SetTIPO_REGIME;
   property LOGRADOURO: String read FLOGRADOURO write SetLOGRADOURO;
   property NUMERO: String read FNUMERO write SetNUMERO;
   property COMPLEMENTO: String read FCOMPLEMENTO write SetCOMPLEMENTO;
   property BAIRRO: String read FBAIRRO write SetBAIRRO;
   property CEP: String read FCEP write SetCEP;
   property CIDADE: String read FCIDADE write SetCIDADE;
   property UF: String read FUF write SetUF;
end;

implementation

{ tBaseLocalEmpresaVO }

procedure TBaseLocalEmpresaVO.SetBAIRRO(const Value: String);
begin
  FBAIRRO := Value;
end;

procedure tBaseLocalEmpresaVO.SetBASE_LOCAL(const Value: string);
begin
  FBASE_LOCAL := Value;
end;

procedure tBaseLocalEmpresaVO.SetCELULAR(const Value: string);
begin
  FCELULAR := Value;
end;

procedure TBaseLocalEmpresaVO.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TBaseLocalEmpresaVO.SetCIDADE(const Value: String);
begin
  FCIDADE := Value;
end;

procedure tBaseLocalEmpresaVO.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TBaseLocalEmpresaVO.SetCODIGO_CIDADE(const Value: integer);
begin
  FCODIGO_CIDADE := Value;
end;

procedure TBaseLocalEmpresaVO.SetCODIGO_UF(const Value: integer);
begin
  FCODIGO_UF := Value;
end;

procedure TBaseLocalEmpresaVO.SetCOMPLEMENTO(const Value: String);
begin
  FCOMPLEMENTO := Value;
end;

procedure TBaseLocalEmpresaVO.SetDATA_HORA_BLOQUEIO_XML(const Value: TDateTime);
begin
  FDATA_HORA_BLOQUEIO_XML := Value;
end;

procedure tBaseLocalEmpresaVO.SetEMAIL(const Value: string);
begin
  FEMAIL := Value;
end;

procedure tBaseLocalEmpresaVO.SetFANTASIA(const Value: string);
begin
  FFANTASIA := Value;
end;

procedure tBaseLocalEmpresaVO.SetFONE(const Value: string);
begin
  FFONE := Value;
end;

procedure tBaseLocalEmpresaVO.SetID(const Value: integer);
begin
  FID := Value;
end;

procedure TBaseLocalEmpresaVO.SetID_MUNICIPIO(const Value: integer);
begin
  FID_MUNICIPIO := Value;
end;

procedure TBaseLocalEmpresaVO.SetIE(const Value: String);
begin
  FIE := Value;
end;

procedure TBaseLocalEmpresaVO.SetLOGRADOURO(const Value: String);
begin
  FLOGRADOURO := Value;
end;

procedure TBaseLocalEmpresaVO.SetNUMERO(const Value: String);
begin
  FNUMERO := Value;
end;

procedure tBaseLocalEmpresaVO.SetRAZAO_SOCIAL(const Value: string);
begin
  FRAZAO_SOCIAL := Value;
end;

procedure tBaseLocalEmpresaVO.SetSITE(const Value: string);
begin
  FSITE := Value;
end;

procedure TBaseLocalEmpresaVO.SetTIPO_REGIME(const Value: integer);
begin
  FTIPO_REGIME := Value;
end;

procedure TBaseLocalEmpresaVO.SetUF(const Value: String);
begin
  FUF := Value;
end;

procedure TBaseLocalEmpresaVO.SetULTIMO_NSU(const Value: integer);
begin
  FULTIMO_NSU := Value;
end;

end.
