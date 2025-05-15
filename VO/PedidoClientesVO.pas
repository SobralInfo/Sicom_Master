unit PedidoClientesVO;

interface

Type TPedidoClientesVO = class
  private
    Flogradouro: string;
    Fcpf_cnpj: String;
    Ffantasia: widestring;
    Fbairro: string;
    Fid_cliente: integer;
    Fid: integer;
    Fnumero: string;
    Fid_municipio: integer;
    Ffone_fixo: string;
    Fcomplemento: string;
    Fid_empresa: integer;
    Fnome: widestring;
    Fcelular: string;
    Fstatus: string;
    procedure Setbairro(const Value: string);
    procedure Setcelular(const Value: string);
    procedure Setcomplemento(const Value: string);
    procedure Setcpf_cnpj(const Value: String);
    procedure Setfone_fixo(const Value: string);
    procedure Setid(const Value: integer);
    procedure Setid_cliente(const Value: integer);
    procedure Setid_empresa(const Value: integer);
    procedure Setid_municipio(const Value: integer);
    procedure Setlogradouro(const Value: string);
    procedure Setnumero(const Value: string);
    procedure Setstatus(const Value: string);
    procedure Setfantasia(const Value: widestring);
    procedure Setnome(const Value: widestring);

   public

       property id: integer read Fid write Setid;
       property id_empresa: integer read Fid_empresa write Setid_empresa;
       property id_cliente: integer read Fid_cliente write Setid_cliente;
       property cpf_cnpj: String read Fcpf_cnpj write Setcpf_cnpj;
       property logradouro: string read Flogradouro write Setlogradouro;
       property numero: string read Fnumero write Setnumero;
       property complemento: string read Fcomplemento write Setcomplemento;
       property bairro: string read Fbairro write Setbairro;
       property id_municipio: integer read Fid_municipio write Setid_municipio;
       property celular: string read Fcelular write Setcelular;
       property fone_fixo: string read Ffone_fixo write Setfone_fixo;
       property status: string read Fstatus write Setstatus;
       property nome: widestring read Fnome write Setnome;
       property fantasia: widestring read Ffantasia write Setfantasia;

end;

implementation

{ TPedidoClientesVO }

procedure TPedidoClientesVO.Setbairro(const Value: string);
begin
  Fbairro := Value;
end;

procedure TPedidoClientesVO.Setcelular(const Value: string);
begin
  Fcelular := Value;
end;

procedure TPedidoClientesVO.Setcomplemento(const Value: string);
begin
  Fcomplemento := Value;
end;

procedure TPedidoClientesVO.Setcpf_cnpj(const Value: String);
begin
  Fcpf_cnpj := Value;
end;

procedure TPedidoClientesVO.Setfantasia(const Value: widestring);
begin
  Ffantasia := Value;
end;

procedure TPedidoClientesVO.Setfone_fixo(const Value: string);
begin
  Ffone_fixo := Value;
end;

procedure TPedidoClientesVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TPedidoClientesVO.Setid_cliente(const Value: integer);
begin
  Fid_cliente := Value;
end;

procedure TPedidoClientesVO.Setid_empresa(const Value: integer);
begin
  Fid_empresa := Value;
end;

procedure TPedidoClientesVO.Setid_municipio(const Value: integer);
begin
  Fid_municipio := Value;
end;

procedure TPedidoClientesVO.Setlogradouro(const Value: string);
begin
  Flogradouro := Value;
end;

procedure TPedidoClientesVO.Setnome(const Value: widestring);
begin
  Fnome := Value;
end;

procedure TPedidoClientesVO.Setnumero(const Value: string);
begin
  Fnumero := Value;
end;

procedure TPedidoClientesVO.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

end.
