unit PedidoConexaoVO;

interface

Type TPedidoConexaoVO = class
  private
    Fid: integer;
    Fid_empresa: integer;
    Fcaminho_banco: String;
    Fsenha: string;
    Fservidor: String;
    Flogin: String;
    procedure Setid(const Value: integer);
    procedure Setid_empresa(const Value: integer);
    procedure Setcaminho_banco(const Value: String);
    procedure Setsenha(const Value: string);
    procedure Setservidor(const Value: String);
    procedure Setlogin(const Value: String);

   public
       property id: integer read Fid write Setid;
       property id_empresa: integer read Fid_empresa write Setid_empresa;
       property caminho_banco: String read Fcaminho_banco write Setcaminho_banco;
       property login: String read Flogin write Setlogin;
       property senha: string read Fsenha write Setsenha;
       property servidor: String read Fservidor write Setservidor;

end;

implementation

{ TPedidoConexaoVO }

procedure TPedidoConexaoVO.Setcaminho_banco(const Value: String);
begin
  Fcaminho_banco := Value;
end;

procedure TPedidoConexaoVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TPedidoConexaoVO.Setid_empresa(const Value: integer);
begin
  Fid_empresa := Value;
end;

procedure TPedidoConexaoVO.Setlogin(const Value: String);
begin
  Flogin := Value;
end;

procedure TPedidoConexaoVO.Setsenha(const Value: string);
begin
  Fsenha := Value;
end;

procedure TPedidoConexaoVO.Setservidor(const Value: String);
begin
  Fservidor := Value;
end;

end.
