unit PedidoFuncionariosVO;

interface

Type TPedidoFuncionariosVO = class
  private
    Fid_funcionario: integer;
    Fid: integer;
    Fstatus: string;
    Fid_empresa: integer;
    Fnome: string;
    Fpercentual_comissao: double;
    Fid_original: integer;
    procedure Setid(const Value: integer);
    procedure Setid_empresa(const Value: integer);
    procedure Setid_funcionario(const Value: integer);
    procedure Setnome(const Value: string);
    procedure Setstatus(const Value: string);
    procedure Setpercentual_comissao(const Value: double);

   public
      property id: integer read Fid write Setid;
      property id_empresa: integer read Fid_empresa write Setid_empresa;
      property id_funcionario: integer read Fid_funcionario write Setid_funcionario;
      property nome: string read Fnome write Setnome;
      property status: string read Fstatus write Setstatus;
      property percentual_comissao: double read Fpercentual_comissao write Setpercentual_comissao;

end;

implementation

{ TPedidoFuncionariosVO }

procedure TPedidoFuncionariosVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TPedidoFuncionariosVO.Setid_empresa(const Value: integer);
begin
  Fid_empresa := Value;
end;

procedure TPedidoFuncionariosVO.Setid_funcionario(const Value: integer);
begin
  Fid_funcionario := Value;
end;

procedure TPedidoFuncionariosVO.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TPedidoFuncionariosVO.Setpercentual_comissao(const Value: double);
begin
  Fpercentual_comissao := Value;
end;

procedure TPedidoFuncionariosVO.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

end.
