unit BaseLocalUnidadesVO;

interface

Type TBaseLocalUnidadesVO = class
  private
    Fdescricao: string;
    Ffator: double;
    Fid: integer;
    Fstatus: string;
    Fsigla: string;
    Fpode_fracionar: string;
    procedure Setdescricao(const Value: string);
    procedure Setfator(const Value: double);
    procedure Setid(const Value: integer);
    procedure Setsigla(const Value: string);
    procedure Setstatus(const Value: string);
    procedure Setpode_fracionar(const Value: string);
  published

   property id: integer read Fid write Setid;
   property status: string read Fstatus write Setstatus;
   property descricao: string read Fdescricao write Setdescricao;
   property sigla: string read Fsigla write Setsigla;
   property fator: double read Ffator write Setfator;
   property pode_fracionar: string read Fpode_fracionar write Setpode_fracionar;

end;



implementation

{ TBaseLocalUnidadesVO }

procedure TBaseLocalUnidadesVO.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TBaseLocalUnidadesVO.Setfator(const Value: double);
begin
  Ffator := Value;
end;

procedure TBaseLocalUnidadesVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TBaseLocalUnidadesVO.Setpode_fracionar(const Value: string);
begin
  Fpode_fracionar := Value;
end;

procedure TBaseLocalUnidadesVO.Setsigla(const Value: string);
begin
  Fsigla := Value;
end;

procedure TBaseLocalUnidadesVO.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

end.
