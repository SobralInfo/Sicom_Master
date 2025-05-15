unit BaseLocalFormasPagamentoVO;

interface

type TBaseLocalFormasPagamentoVO = class
  private
    Fid: integer;
    Fstatus: string;
    Fnome: string;
    Fpermite_troco: string;
    Ftipo_pagamento_nfce: integer;
    FEMITIR_FISCAL: string;
    FPRAZO_PARCELAS: integer;
    FGERAR_FINANCEIRO: string;
    procedure Setid(const Value: integer);
    procedure Setnome(const Value: string);
    procedure Setstatus(const Value: string);
    procedure Setpermite_troco(const Value: string);
    procedure Settipo_pagamento_nfce(const Value: integer);
    procedure SetEMITIR_FISCAL(const Value: string);
    procedure SetPRAZO_PARCELAS(const Value: integer);
    procedure SetGERAR_FINANCEIRO(const Value: string);
  published

   property id: integer read Fid write Setid;
   property status: string read Fstatus write Setstatus;
   property nome: string read Fnome write Setnome;
   property permite_troco: string read Fpermite_troco write Setpermite_troco;
   property tipo_pagamento_nfce: integer read Ftipo_pagamento_nfce write Settipo_pagamento_nfce;
   property EMITIR_FISCAL: string read FEMITIR_FISCAL write SetEMITIR_FISCAL;
   property PRAZO_PARCELAS: integer read FPRAZO_PARCELAS write SetPRAZO_PARCELAS;
   property GERAR_FINANCEIRO: string read FGERAR_FINANCEIRO write SetGERAR_FINANCEIRO;

end;

implementation

{ TBaseLocalFormasPagamentoVO }

procedure TBaseLocalFormasPagamentoVO.SetEMITIR_FISCAL(const Value: string);
begin
  FEMITIR_FISCAL := Value;
end;

procedure TBaseLocalFormasPagamentoVO.SetGERAR_FINANCEIRO(const Value: string);
begin
  FGERAR_FINANCEIRO := Value;
end;

procedure TBaseLocalFormasPagamentoVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TBaseLocalFormasPagamentoVO.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TBaseLocalFormasPagamentoVO.Setpermite_troco(const Value: string);
begin
  Fpermite_troco := Value;
end;

procedure TBaseLocalFormasPagamentoVO.SetPRAZO_PARCELAS(const Value: integer);
begin
  FPRAZO_PARCELAS := Value;
end;

procedure TBaseLocalFormasPagamentoVO.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

procedure TBaseLocalFormasPagamentoVO.Settipo_pagamento_nfce(
  const Value: integer);
begin
  Ftipo_pagamento_nfce := Value;
end;

end.
