unit BaseLocalClientesVO;

interface

Type TBaseLocalClientesVO = class
  private
    Flogradouro: string;
    Fcpf_cnpj: string;
    Fbairro: string;
    Fid: integer;
    Fnumero: string;
    Fstatus: string;
    Fcomplemento: string;
    Fcontato: string;
    Fnome: string;
    Fcidade: integer;
    Ffone_fixo: string;
    Freferencia: String;
    Fcelular: String;
    Flimite_credito_fiado: double;
    Fbloqueado: String;
    Ffidelidade: string;
    FDataNascimento: Tdate;
    procedure Setbairro(const Value: string);
    procedure Setcidade(const Value: integer);
    procedure Setcomplemento(const Value: string);
    procedure Setcontato(const Value: string);
    procedure Setcpf_cnpj(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setlogradouro(const Value: string);
    procedure Setnome(const Value: string);
    procedure Setnumero(const Value: string);
    procedure Setstatus(const Value: string);
    procedure Setcelular(const Value: String);
    procedure Setfone_fixo(const Value: string);
    procedure Setreferencia(const Value: String);
    procedure Setbloqueado(const Value: String);
    procedure Setlimite_credito_fiado(const Value: double);
    procedure Setfidelidade(const Value: string);
    procedure SetDataNascimento(const Value: Tdate);
  published

   property id: integer read Fid write Setid;
   property status: string read Fstatus write Setstatus;
   property cpf_cnpj: string read Fcpf_cnpj write Setcpf_cnpj;
   property nome: string read Fnome write Setnome;
   property logradouro: string read Flogradouro write Setlogradouro;
   property numero: string read Fnumero write Setnumero;
   property complemento: string read Fcomplemento write Setcomplemento;
   property bairro: string read Fbairro write Setbairro;
   property cidade: integer read Fcidade write Setcidade;
   property contato: string read Fcontato write Setcontato;
   property referencia: String read Freferencia write Setreferencia;
   property fone_fixo: string read Ffone_fixo write Setfone_fixo;
   property celular: String read Fcelular write Setcelular;
   property limite_credito_fiado: double read Flimite_credito_fiado write Setlimite_credito_fiado;
   property bloqueado: String read Fbloqueado write Setbloqueado;
   property fidelidade: string read Ffidelidade write Setfidelidade;
   property DataNascimento: Tdate read FDataNascimento write SetDataNascimento;

end;

implementation

{ TBaseLocalClientesVO }

procedure TBaseLocalClientesVO.Setbairro(const Value: string);
begin
  Fbairro := Value;
end;

procedure TBaseLocalClientesVO.Setbloqueado(const Value: String);
begin
  Fbloqueado := Value;
end;

procedure TBaseLocalClientesVO.Setcelular(const Value: String);
begin
  Fcelular := Value;
end;

procedure TBaseLocalClientesVO.Setcidade(const Value: integer);
begin
  Fcidade := Value;
end;

procedure TBaseLocalClientesVO.Setcomplemento(const Value: string);
begin
  Fcomplemento := Value;
end;

procedure TBaseLocalClientesVO.Setcontato(const Value: string);
begin
  Fcontato := Value;
end;

procedure TBaseLocalClientesVO.Setcpf_cnpj(const Value: string);
begin
  Fcpf_cnpj := Value;
end;

procedure TBaseLocalClientesVO.SetDataNascimento(const Value: Tdate);
begin
  FDataNascimento := Value;
end;

procedure TBaseLocalClientesVO.Setfidelidade(const Value: string);
begin
  Ffidelidade := Value;
end;

procedure TBaseLocalClientesVO.Setfone_fixo(const Value: string);
begin
  Ffone_fixo := Value;
end;

procedure TBaseLocalClientesVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TBaseLocalClientesVO.Setlimite_credito_fiado(const Value: double);
begin
  Flimite_credito_fiado := Value;
end;

procedure TBaseLocalClientesVO.Setlogradouro(const Value: string);
begin
  Flogradouro := Value;
end;

procedure TBaseLocalClientesVO.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TBaseLocalClientesVO.Setnumero(const Value: string);
begin
  Fnumero := Value;
end;

procedure TBaseLocalClientesVO.Setreferencia(const Value: String);
begin
  Freferencia := Value;
end;

procedure TBaseLocalClientesVO.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

end.

