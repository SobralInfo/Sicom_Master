unit BaseLocalSangriaVO;

interface

Type TBaseLocalSangriaVO = class
  private
    Fvalor: double;
    Fdescricao: String;
    Fid: integer;
    Fid_usuario: integer;
    Fdata: tdate;
    Fid_movimento: integer;
    procedure Setdescricao(const Value: String);
    procedure Setid(const Value: integer);
    procedure Setid_usuario(const Value: integer);
    procedure Setvalor(const Value: double);
    procedure Setdata(const Value: tdate);
    procedure Setid_movimento(const Value: integer);
  published

   property id: integer read Fid write Setid;
   property descricao: String read Fdescricao write Setdescricao;
   property valor: double read Fvalor write Setvalor;
   property id_usuario: integer read Fid_usuario write Setid_usuario;
   property data: tdate read Fdata write Setdata;
   property id_movimento: integer read Fid_movimento write Setid_movimento;

end;

implementation

{ TBaseLocalSangriaVO }

procedure TBaseLocalSangriaVO.Setdata(const Value: tdate);
begin
  Fdata := Value;
end;

procedure TBaseLocalSangriaVO.Setdescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TBaseLocalSangriaVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TBaseLocalSangriaVO.Setid_movimento(const Value: integer);
begin
  Fid_movimento := Value;
end;

procedure TBaseLocalSangriaVO.Setid_usuario(const Value: integer);
begin
  Fid_usuario := Value;
end;

procedure TBaseLocalSangriaVO.Setvalor(const Value: double);
begin
  Fvalor := Value;
end;

end.
