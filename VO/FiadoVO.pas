unit FiadoVO;

interface

Type TFiadoVO = class
  private
    Fid_venda: integer;
    Fid: integer;
    Fdata_venda: TDateTime;
    Fvalor_venda: Double;
    Fid_cliente: integer;
    Fobservacao: String;
    Fdata_pagamento: TDateTime;
    Ftipo: String;
    Ftotal_venda: double;
    FOBS_FIADO: String;
    procedure Setdata_venda(const Value: TDateTime);
    procedure Setid(const Value: integer);
    procedure Setid_venda(const Value: integer);
    procedure Setvalor_venda(const Value: Double);
    procedure Setid_cliente(const Value: integer);
    procedure Setdata_pagamento(const Value: TDateTime);
    procedure Setobservacao(const Value: String);
    procedure Settipo(const Value: String);
    procedure Settotal_venda(const Value: double);
    procedure SetOBS_FIADO(const Value: String);

public
   property id: integer read Fid write Setid;
   property id_venda: integer read Fid_venda write Setid_venda;
   property valor_venda: Double read Fvalor_venda write Setvalor_venda;
   property data_venda: TDateTime read Fdata_venda write Setdata_venda;
   property id_cliente: integer read Fid_cliente write Setid_cliente;
   property tipo: String read Ftipo write Settipo;
   property data_pagamento: TDateTime read Fdata_pagamento write Setdata_pagamento;
   property observacao: String read Fobservacao write Setobservacao;
   property total_venda: double read Ftotal_venda write Settotal_venda;
   property OBS_FIADO: String read FOBS_FIADO write SetOBS_FIADO;



end;

implementation

{ TFiadoVO }

procedure TFiadoVO.Setdata_pagamento(const Value: TDateTime);
begin
  Fdata_pagamento := Value;
end;

procedure TFiadoVO.Setdata_venda(const Value: TDateTime);
begin
  Fdata_venda := Value;
end;

procedure TFiadoVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TFiadoVO.Setid_cliente(const Value: integer);
begin
  Fid_cliente := Value;
end;

procedure TFiadoVO.Setid_venda(const Value: integer);
begin
  Fid_venda := Value;
end;

procedure TFiadoVO.Setobservacao(const Value: String);
begin
  Fobservacao := Value;
end;

procedure TFiadoVO.SetOBS_FIADO(const Value: String);
begin
  FOBS_FIADO := Value;
end;

procedure TFiadoVO.Settipo(const Value: String);
begin
  Ftipo := Value;
end;

procedure TFiadoVO.Settotal_venda(const Value: double);
begin
  Ftotal_venda := Value;
end;

procedure TFiadoVO.Setvalor_venda(const Value: Double);
begin
  Fvalor_venda := Value;
end;

end.
