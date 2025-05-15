unit BaseLocalSuprimentoVO;

interface

Type TBaseLocalSuprimentoVO = class
  private
    Fvalor: double;
    Fdescricao: String;
    Fid: integer;
    Fid_usuario: integer;
    Fdata: tdate;
    procedure Setdescricao(const Value: String);
    procedure Setid(const Value: integer);
    procedure Setid_usuario(const Value: integer);
    procedure Setvalor(const Value: double);
    procedure Setdata(const Value: tdate);
  published

   property id: integer read Fid write Setid;
   property descricao: String read Fdescricao write Setdescricao;
   property valor: double read Fvalor write Setvalor;
   property id_usuario: integer read Fid_usuario write Setid_usuario;
   property data: tdate read Fdata write Setdata;

end;

implementation

{ TBaseLocalSuprimentoVO }

procedure TBaseLocalSuprimentoVO.Setdata(const Value: tdate);
begin
  Fdata := Value;
end;

procedure TBaseLocalSuprimentoVO.Setdescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TBaseLocalSuprimentoVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TBaseLocalSuprimentoVO.Setid_usuario(const Value: integer);
begin
  Fid_usuario := Value;
end;

procedure TBaseLocalSuprimentoVO.Setvalor(const Value: double);
begin
  Fvalor := Value;
end;

end.

