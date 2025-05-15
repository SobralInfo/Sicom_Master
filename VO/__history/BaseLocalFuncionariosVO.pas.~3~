unit BaseLocalFuncionariosVO;

interface

Type TBaseLocalFuncionariosVO = class
  private
    Fpercentual_comissao: double;
    Fcodigo: string;
    Fid: integer;
    Fstatus: string;
    Fnome: string;
    procedure Setcodigo(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setnome(const Value: string);
    procedure Setpercentual_comissao(const Value: double);
    procedure Setstatus(const Value: string);
  published

   property id: integer read Fid write Setid;
   property status: string read Fstatus write Setstatus;
   property codigo: string read Fcodigo write Setcodigo;
   property nome: string read Fnome write Setnome;
   property percentual_comissao: double read Fpercentual_comissao write Setpercentual_comissao;

end;

implementation

{ TBaseLocalFuncionariosVO }

procedure TBaseLocalFuncionariosVO.Setcodigo(const Value: string);
begin
  Fcodigo := Value;
end;

procedure TBaseLocalFuncionariosVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TBaseLocalFuncionariosVO.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TBaseLocalFuncionariosVO.Setpercentual_comissao(const Value: double);
begin
  Fpercentual_comissao := Value;
end;

procedure TBaseLocalFuncionariosVO.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

end.


