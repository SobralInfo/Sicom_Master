unit PedidoEmpresasVO;

interface

Type TPedidoEmpresasVO = class
  private
    Ffantasia: string;
    Fcnpj: string;
    Frazao_social: string;
    Fmatriz_filial: string;
    Fid: integer;
    Fstatus: string;
    procedure Setcnpj(const Value: string);
    procedure Setfantasia(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setmatriz_filial(const Value: string);
    procedure Setrazao_social(const Value: string);
    procedure Setstatus(const Value: string);

   public
      property id: integer read Fid write Setid;
      property status: string read Fstatus write Setstatus;
      property matriz_filial: string read Fmatriz_filial write Setmatriz_filial;
      property cnpj: string read Fcnpj write Setcnpj;
      property razao_social: string read Frazao_social write Setrazao_social;
      property fantasia: string read Ffantasia write Setfantasia;

end;

implementation

{ TPedidoEmpresasVO }

procedure TPedidoEmpresasVO.Setcnpj(const Value: string);
begin
  Fcnpj := Value;
end;

procedure TPedidoEmpresasVO.Setfantasia(const Value: string);
begin
  Ffantasia := Value;
end;

procedure TPedidoEmpresasVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TPedidoEmpresasVO.Setmatriz_filial(const Value: string);
begin
  Fmatriz_filial := Value;
end;

procedure TPedidoEmpresasVO.Setrazao_social(const Value: string);
begin
  Frazao_social := Value;
end;

procedure TPedidoEmpresasVO.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

end.



