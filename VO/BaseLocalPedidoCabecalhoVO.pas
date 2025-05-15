unit BaseLocalPedidoCabecalhoVO;

interface

uses baseLocalClientesVO, baseLocalFuncionariosVO;


Type TBaseLocalPedidoCabecalhoVO = class
  private
    Fobservacao: String;
    Fdata_abertura: TDate;
    Fid_funcionario: integer;
    Fid_cliente: integer;
    Fid: integer;
    Fdata_conclusao: TDate;
    Fstatus: string;
    FbaseLocalClientesVO: tbaseLocalClientesVO;
    FbaseLocalFuncionariosVO: tbaseLocalFuncionariosVO;
    FVALOR_TOTAL: double;
    FVALOR_LIQUIDO: double;
    FVALOR_DESCONTO: double;
    Ftaxa_entrega: double;
    Fcontato: string;
    procedure Setdata_abertura(const Value: TDate);
    procedure Setdata_conclusao(const Value: TDate);
    procedure Setid(const Value: integer);
    procedure Setid_cliente(const Value: integer);
    procedure Setid_funcionario(const Value: integer);
    procedure Setobservacao(const Value: String);
    procedure Setstatus(const Value: string);
    procedure SetbaseLocalClientesVO(const Value: tbaseLocalClientesVO);
    procedure SetbaseLocalFuncionariosVO(const Value: tbaseLocalFuncionariosVO);
    procedure SetVALOR_DESCONTO(const Value: double);
    procedure SetVALOR_LIQUIDO(const Value: double);
    procedure SetVALOR_TOTAL(const Value: double);
    procedure Settaxa_entrega(const Value: double);
    procedure Setcontato(const Value: string);
  published

   property id: integer read Fid write Setid;
   property status: string read Fstatus write Setstatus;
   property id_cliente: integer read Fid_cliente write Setid_cliente;
   property id_funcionario: integer read Fid_funcionario write Setid_funcionario;
   property data_abertura: TDate read Fdata_abertura write Setdata_abertura;
   property data_conclusao: TDate read Fdata_conclusao write Setdata_conclusao;
   property observacao: String read Fobservacao write Setobservacao;
   property baseLocalClientesVO: tbaseLocalClientesVO read FbaseLocalClientesVO write SetbaseLocalClientesVO;
   property baseLocalFuncionariosVO: tbaseLocalFuncionariosVO read FbaseLocalFuncionariosVO write SetbaseLocalFuncionariosVO;
   property VALOR_TOTAL: double read FVALOR_TOTAL write SetVALOR_TOTAL;
   property VALOR_DESCONTO: double read FVALOR_DESCONTO write SetVALOR_DESCONTO;
   property VALOR_LIQUIDO: double read FVALOR_LIQUIDO write SetVALOR_LIQUIDO;
   property taxa_entrega: double read Ftaxa_entrega write Settaxa_entrega;
   property contato: string read Fcontato write Setcontato;

end;

implementation

{ TBaseLocalPedidoCabecalhoVO }

procedure TBaseLocalPedidoCabecalhoVO.SetbaseLocalClientesVO(const Value: tbaseLocalClientesVO);
begin
  FbaseLocalClientesVO := tbaseLocalClientesVO.Create;
  FbaseLocalClientesVO := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.SetbaseLocalFuncionariosVO(
  const Value: tbaseLocalFuncionariosVO);
begin
  FbaseLocalFuncionariosVO := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.Setcontato(const Value: string);
begin
  Fcontato := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.Setdata_abertura(const Value: TDate);
begin
  Fdata_abertura := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.Setdata_conclusao(const Value: TDate);
begin
  Fdata_conclusao := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.Setid_cliente(const Value: integer);
begin
  Fid_cliente := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.Setid_funcionario(const Value: integer);
begin
  Fid_funcionario := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.Setobservacao(const Value: String);
begin
  Fobservacao := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.Setstatus(const Value: string);
begin
  Fstatus := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.Settaxa_entrega(const Value: double);
begin
  Ftaxa_entrega := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.SetVALOR_DESCONTO(const Value: double);
begin
  FVALOR_DESCONTO := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.SetVALOR_LIQUIDO(const Value: double);
begin
  FVALOR_LIQUIDO := Value;
end;

procedure TBaseLocalPedidoCabecalhoVO.SetVALOR_TOTAL(const Value: double);
begin
  FVALOR_TOTAL := Value;
end;

end.

