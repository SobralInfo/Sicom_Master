unit BaseLocalSuprimentoVO;

interface

Type TBaseLocalSuprimentoVO = class
  private
    Fvalor: double;
    Fdescricao: String;
    Fid: integer;
    Fid_usuario: integer;
    Fdata: tdate;
    Fid_movimento: integer;
    FidFomaPg: integer;
    FFormaPG: String;
    procedure Setdescricao(const Value: String);
    procedure Setid(const Value: integer);
    procedure Setid_usuario(const Value: integer);
    procedure Setvalor(const Value: double);
    procedure Setdata(const Value: tdate);
    procedure Setid_movimento(const Value: integer);
    procedure SetidFomaPg(const Value: integer);
    procedure SetFormaPG(const Value: String);
  published

   property id: integer read Fid write Setid;
   property descricao: String read Fdescricao write Setdescricao;
   property valor: double read Fvalor write Setvalor;
   property id_usuario: integer read Fid_usuario write Setid_usuario;
   property data: tdate read Fdata write Setdata;
   property id_movimento: integer read Fid_movimento write Setid_movimento;
   property idFomaPg: integer read FidFomaPg write SetidFomaPg;
   property FormaPG: String read FFormaPG write SetFormaPG;

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

procedure TBaseLocalSuprimentoVO.SetFormaPG(const Value: String);
begin
  FFormaPG := Value;
end;

procedure TBaseLocalSuprimentoVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TBaseLocalSuprimentoVO.SetidFomaPg(const Value: integer);
begin
  FidFomaPg := Value;
end;

procedure TBaseLocalSuprimentoVO.Setid_movimento(const Value: integer);
begin
  Fid_movimento := Value;
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

