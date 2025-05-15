unit PedidoUsuariosVO;

interface

Type
   TPedidoUsuariosVO = class
  private
    Fcpf: string;
    Fmatriz_filial: string;
    Fid: integer;
    Fstatus: string;
    Fpw: string;
    Fnome: string;
    Fid_empresa: integer;
    Fbd: String;
    procedure Setcpf(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setmatriz_filial(const Value: string);
    procedure Setnome(const Value: string);
    procedure Setpw(const Value: string);
    procedure Setstatus(const Value: string);
    procedure Setid_empresa(const Value: integer);
    procedure Setbd(const Value: String);

  public
      property id: integer read Fid write Setid;
      property status: string read Fstatus write Setstatus;
      property matriz_filial: string read Fmatriz_filial write Setmatriz_filial;
      property cpf: string read Fcpf write Setcpf;
      property nome: string read Fnome write Setnome;
      property pw: string read Fpw write Setpw;
      property id_empresa: integer read Fid_empresa write Setid_empresa;
      property bd: String read Fbd write Setbd;


   end;

implementation




{ TPedidoUsuariosVO }

procedure TPedidoUsuariosVO.Setbd(const Value: String);
begin
  Fbd := Value;
end;

procedure TPedidoUsuariosVO.Setcpf(const Value: string);
begin
  Fcpf := Value;
end;

procedure TPedidoUsuariosVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TPedidoUsuariosVO.Setid_empresa(const Value: integer);
begin
  Fid_empresa := Value;
end;

procedure TPedidoUsuariosVO.Setmatriz_filial(const Value: string);
begin
  Fmatriz_filial := Value;
end;

procedure TPedidoUsuariosVO.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TPedidoUsuariosVO.Setpw(const Value: string);
begin
  Fpw := Value;
end;

procedure TPedidoUsuariosVO.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

end.
