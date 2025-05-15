unit unitConfiguracoes;

interface

//{$REGION 'SUMMARY'}

// untASI_LIB_DelphiFuncoesGenericas : Biblioteca de funções genéricas para Delphi
// Start Date  : 01/06/2011 às 08:00 hs
// Last Change : 18/11/2011 às 12:00 hs
// Developer   : By Dennis Sobral

//{$ENDREGION}

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids, Buttons,
   DBCtrls, Db, Printers, ADODB, ShellAPI;

{ Procedures LIB }

{ 01 } procedure prcMsgInf(_Msg: string); // mensagem em português de informação
{ 02 } procedure prcMsgAdv(_Msg: string); // mensagem em português de advertência
{ 03 } procedure prcMsgErro(_Msg: string); // mensagem em português de advertência
{ 04 } procedure prcMsgErro_Register(_Erro, _Form, _Evento, _Tabela, _TypeComando: string; _User: integer); // mensagem em português de erro
{ 05 } procedure prcSetDefaultPrinter(_PrinterName: String); // definie impressora como padrão
{ 06 } procedure Delay(_MileSegundos: Comp); // aguarda tela em milesegundos
{ 07 } procedure prcCopyDir(const cFrom, cTo : string);
{ 07 } procedure prcMoveDir(const cFrom, cTo : string);
{ 08 } procedure prcGeraBarras_EAN13(_CodBarra: string; Imagem: TCanvas);
{ 09 } procedure prcDesenhaBarras_EAN13(SequenciaHexa: string; Imagem: TCanvas);
{ 10 } procedure prcGetFiles(FileName, Ext: String; Arc: TStrings);

{ Funções LIB }

{ 01 } function fctMsgConfirmDefaultButtonYes(_Msg: string): boolean; // pergunta em português
{ 01 } function fctMsgConfirmDefaultButtonNo(_Msg: string): boolean; // pergunta em português
{ 01 } function fctMsgConfirm(_Msg: string): boolean; // pergunta em português

{ 02 } function fctAspaDupla(_Texto: string): string;  // coloca aspa dupla em uma string
{ 03 } function fctRemoveMaskNumber(_Number, _Tipo: string): string; // remove a máscara de um determinado número conforme o seu formato. N = númerico ; M = moeda ; P = percentual
{ 04 } function fctModulo11_X(_Number: integer): integer; // retorna 0 módulo 11 com dígito X
{ 05 } function fctModulo11_0(_Number: integer): string;// retorna 0 módulo 11 com dígito 0
{ 06 } function fctValidCPF(_Number: string): boolean; // valida CPF
{ 07 } function fctValidCNPJ(_Number: string): boolean; // valida CNPJ
{ 08 } function fctNumBanco(_Number: string): string; // gera número do banco
{ 09 } function fctInvalidValue(_Edit: TDBEdit; _TypeData: string; _QtdCasDec: integer): boolean; // verifica se o valor é válido para numérico, monetário, percentual e data
{ 10 } function fctExtenso(_Valor: double): string; // retorna valor por extenso
{ 11 } function fctUserValid(_IDUserAcess: integer; _Form: string): boolean; // verifica se o usário é válido para acessar um determinado sistema

{ 12 } function fctConexaoAdo: String; // retorna a string para conexão do tipo ADO com o banco de dados
{ 13 } function fctTableNextID(_Table: string): integer; // retorna o próximo ID da tabela
{ 14 } function fctServidorDateTime: TDateTime; // consulta data e hora do servidor
{ 15 } function fctComputerName: string; // retorna o nome do computador
{ 16 } function fctInsertErro(_Erro, _Form, _Evento, _Tabela, _TypeComando: string; _User: integer): integer; // inseri o erro na tabela de erros e retorna o nº do erro pro usuário
{ 17 } function fctPreencheEsquerda(_Tam: integer; _Carac, Campo: string) : string; // preenche um tamanho à esquerda da string com o caractere informado
{ 18 } function fctPreencheDireita(Tamanho:Integer; Carac, Campo:String):String; // preenche um tamanho à direita da string com o caractere informado

{ 18 } function fctRemoveCasasDecimais(_Number : string): string; // remove as casa decimais de um número passado como string
{ 19 } function fctTransformPontoEmVirgula(pValue: string): string; // transforma uma string onde conter ponto para vírgula
{ 20 } function fctCalculaDV_EAN13(_CodBarra: string): string; // cálcula EAN 13
{ 21 } function fctDirList(ASource : string; ADirList : TStringList) : integer; // ?
{ 22 } function fctRetornPartStringBlunt(_String: string; _Tamanho: integer): string; // retorna a parte de uma string sem corte
{ 23 } function fctReturnID(_Msg: string): integer; // retorna o ID da mensagem de registros
{ 24 } function fctFormCaptionCenter(sTexto: string; iTamanho: Integer): string; // deixa o caption do form centralizado

{ 25 } function fctTransformaHoraEmDecimal(_HORA: string): double; // transforma hora string em decimal de minutos
{ 26 } function fctUsuarioLogado(): integer;
{ 26 } function StringParaFloat(S: string): Double;
{ 27 } function SoNumero(fField : String): String;
{ 28 } function Cronometro(Data: TDateTime):  String;
{ 29 } Function Criptografa(texto:string;chave:integer):String;
{ 30 } Function DesCriptografa(texto:string;chave:integer):String;
{ 31 } function FormataNome(sNome: String): string;
{ 32 } function RetornarCPFCNPJcomMascara(cpfcnpj: string): string;




{ ********** PARA FUNÇÕES DE MENSAGENS **********

  [ÍCONES]
  MB_ICONINFORMATION - ícone "i", para informações gerais.
  MB_ICONERROR       - ícone de erro, use para alertas graves ou falhas tratadas.
  MB_ICONWARNING     - ícone de aviso, exclamação geralmente num triângulo amarelo.
  MB_ICONQUESTION    - ícone de pergunta, interrogação.

  [BOTÕES]
  MB_OK - apenas o botão de OK, use para notificações.
  MB_OKCANCEL - botões OK e Cancelar.
  MB_YESNO - botões Sim e Não.
  MB_YESNOCANCEL - botões Sim, Não e Cancelar.
  MB_RETRYCANCEL - botões Repetir e Cancelar.
  MB_ABORTRETRYIGNORE - botões Abortar Anular, Repetir e Ignorar.

  [RETORNO]
  IDOK - se o usuário clicar no OK.
  IDCANCEL - se o usuário clicar no Cancelar.
  IDYES - se o usuário clicar no Sim.
  IDNO - se o usuário clicar no Não.
  IDABORT - se o usuário clicar no Abortar.
  IDRETRY - se o usuário clicar no Repetir.
  IDIGNORE - se o usuário clicar no Ignorar.
}

implementation

{ VCL }

function RetornarCPFCNPJcomMascara(cpfcnpj: string): string;
Begin

   if Length(cpfcnpj) = 14 then
      Result := Copy(cpfcnpj,1,2)+'.'+
                Copy(cpfcnpj,3,3)+'.'+
                Copy(cpfcnpj,6,3)+'/'+
                Copy(cpfcnpj,9,4)+'-'+
                Copy(cpfcnpj,13,2)
   else if Length(cpfcnpj) = 11 then
      Result := Copy(cpfcnpj,1,3)+'.'+
                Copy(cpfcnpj,4,3)+'.'+
                Copy(cpfcnpj,7,3)+'-'+
                Copy(cpfcnpj,10,2);

End;

function FormataNome(sNome: String): string;
const
  excecao: array[0..5] of string = (' da ', ' de ', ' do ', ' das ', ' dos ', ' e ');
var
  tamanho, j: integer;
  i: byte;
begin
  Result := AnsiLowerCase(sNome);
  tamanho := Length(Result);

  for j := 1 to tamanho do
    // Se é a primeira letra ou se o caracter anterior é um espaço
    if (j = 1) or ((j>1) and (Result[j-1]=Chr(32))) then
      Result[j] := AnsiUpperCase(Result[j])[1];
  for i := 0 to Length(excecao)-1 do
    result:= StringReplace(result,excecao[i],excecao[i],[rfReplaceAll, rfIgnoreCase]);
end;

Function DesCriptografa(texto:string;chave:integer):String;

function AsciiToInt(Caracter: Char): Integer;
var
  i: Integer;
begin
  i := 32;
  while i < 255 do begin
    if Chr(i) = Caracter then
      Break;
    i := i + 1;
  end;
  Result := i;
end;

var
  cont:integer;
  retorno:string;
begin
  if (trim(texto)=EmptyStr) or (chave=0) then begin
    result:=texto;
  end else begin
    retorno:='';
    for cont:=1 to length(texto) do begin
      retorno:=retorno+chr(asciitoint(texto[cont])-chave);
    end;
    result:=retorno;
  end;
end;


Function Criptografa(texto:string;chave:integer):String;

function AsciiToInt(Caracter: Char): Integer;
var
  i: Integer;
begin
  i := 32;
  while i < 255 do begin
    if Chr(i) = Caracter then
      Break;
    i := i + 1;
  end;
  Result := i;
end;

var
  cont:integer;
  retorno:string;
begin
  if (trim(texto)=EmptyStr) or (chave=0) then begin
    result:=texto;
  end else begin
    retorno:='';
    for cont:=1 to length(texto) do begin
      retorno:=retorno+chr(asciitoint(texto[cont])+chave);
    end;
    result:=retorno;
  end;
end;

function Cronometro(Data: TDateTime):  String;
var
  iData1, iData2:  String;
begin
  iData1 := TimeToStr(Data);
  iData2 := TimeToStr( (StrToTime(iData1) + 0.0000115741) );
  iData1 := iData2;

  Result := iData1;
end;

procedure prcMsgInf(_Msg: string);
begin
   Beep;
   Application.Messagebox(PChar(_Msg), PChar('Informação'),
      MB_ICONINFORMATION + MB_OK);
end;

function StringParaFloat(S: string): Double;
var
  I : Integer;
begin
  I := Length(S);
  for I := I downto 1 do
    if S[I] = FormatSettings.ThousandSeparator then
      Delete(S, I, 1);

  Result := StrToFloat(S);

end;

function SoNumero(fField : String): String;
var
  I : Byte;
begin
   Result := '';
   for I := 1 To Length(fField) do
       if fField [I] In ['0'..'9'] Then
            Result := Result + fField [I];
end;


procedure prcMsgAdv(_Msg: string);
begin
   Beep;
   Application.Messagebox(PChar(_Msg), PChar('Aviso'), MB_ICONWARNING + MB_OK);
end;

procedure prcMsgErro(_Msg: string);
begin
   Beep;
   Application.Messagebox(PChar(_Msg), PChar('Erro'), MB_ICONERROR + MB_OK);
end;

procedure prcMsgErro_Register(_Erro, _Form, _Evento, _Tabela,
   _TypeComando: string; _User: integer);
begin
   Beep;
   Application.Messagebox(PChar('Erro na Aplicação. ID_ERRO = ' + IntToStr
           (fctInsertErro(_Erro, _Form, _Evento, _Tabela, _TypeComando, _User)))
        , PChar('Erro'), MB_ICONERROR + MB_OK);
end;

procedure prcSetDefaultPrinter(_PrinterName: String);
var
   I: integer;
   Device: PChar;
   Driver: PChar;
   Port: PChar;
   HdeviceMode: Thandle;
   aPrinter: TPrinter;
begin
   Printer.PrinterIndex := -1;
   getmem(Device, 255);
   getmem(Driver, 255);
   getmem(Port, 255);
   aPrinter := TPrinter.create;
   for I := 0 to Printer.Printers.Count - 1 do
   begin
      if Printer.Printers[I] = _PrinterName then
      begin
         aPrinter.PrinterIndex := I;
         aPrinter.getprinter(Device, Driver, Port, HdeviceMode);
         StrCat(Device, ',');
         StrCat(Device, Driver);
         StrCat(Device, Port);
         WriteProfileString('windows', 'device', Device);
         StrCopy(Device, 'windows');
         SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, Longint(@Device));
      end;
   end;
   Freemem(Device, 255);
   Freemem(Driver, 255);
   Freemem(Port, 255);
   aPrinter.Free;
end;

procedure Delay(_MileSegundos: Comp);
var
   FirstTickCount: Comp;
   function GetTickCount: Comp;
   begin
      Result := TimeStampToMSecs(DateTimeToTimeStamp(Now));
   end;
begin
   FirstTickCount := GetTickCount;
   repeat
      Application.ProcessMessages; { allowing access to other controls, etc. }
   until ((GetTickCount - FirstTickCount) >= _MileSegundos);
end;

procedure prcCopyDir(const cFrom, cTo : string);
var
   OpStruc : TSHFileOpStruct;
   frombuf, tobuf : array[0..128] of Char;
begin
   FillChar(frombuf, Sizeof(frombuf), 0);
   FillChar(tobuf, Sizeof(tobuf), 0);
   StrPCopy(frombuf, cFrom);
   StrPCopy(tobuf, cTo);
   with OpStruc do begin
      Wnd := Application.Handle;
      wFunc := FO_COPY;
      pFrom := @frombuf;
      pTo := @tobuf;
      fFlags := FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
      fAnyOperationsAborted := False;
      hNameMappings := nil;
      lpszProgressTitle := nil;
   end;
   ShFileOperation(OpStruc);
end;

procedure prcMoveDir(const cFrom, cTo : string);
var
   OpStruc : TSHFileOpStruct;
   frombuf, tobuf : array[0..128] of Char;
begin
   FillChar(frombuf, Sizeof(frombuf), 0);
   FillChar(tobuf, Sizeof(tobuf), 0);
   StrPCopy(frombuf, cFrom);
   StrPCopy(tobuf, cTo);
   with OpStruc do begin
      Wnd := Application.Handle;
      wFunc := FO_MOVE;
      pFrom := @frombuf;
      pTo := @tobuf;
      fFlags := FOF_NOCONFIRMATION or FOF_RENAMEONCOLLISION;
      fAnyOperationsAborted := False;
      hNameMappings := nil;
      lpszProgressTitle := nil;
   end;
   ShFileOperation(OpStruc);
end;


function fctCalculaDV_EAN13(_CodBarra: string): string;
var nX    : Integer;
 nPeso  : Integer;
   nSoma  : Double;
   nMaior  : Double;
   nDigito : Integer;
Begin

    nPeso := 3;
 nSoma := 0;

    For nX := 12 DownTo 1 do
 Begin

     nSoma := nSoma + StrToInt(_CodBarra[nX]) * nPeso;

   If nPeso = 3 Then
       nPeso := 1
   Else
       nPeso := 3;

 End;

 nMaior      := ( ( Trunc( nSoma / 10 ) + 1 ) * 10 );
 nDigito  := Trunc( nMaior ) - Trunc( nSoma );
 If nDigito = 10 Then
     nDigito := 0;
 Result := IntToStr( nDigito );
end;


procedure prcGeraBarras_EAN13(_CodBarra: string; Imagem: TCanvas);
const
  TabelaA: array[0..9] of string[7] = ('0001101', '0011001', '0010011', '0111101', '0100011', '0110001', '0101111', '0111011', '0110111', '0001011');
  TabelaB: array[0..9] of string[7] = ('0100111', '0110011', '0011011', '0011011', '0011101', '0111001', '0000101', '0010001', '0001001', '0010111');
  TabelaC: array[0..9] of string[7] = ('1110010', '1100110', '1101100', '1000010', '1011100', '1001110', '1010000', '1000100', '1001000', '1110100');
  TabAux:  array[0..9] of string[6] = ('AAAAAA', 'AABABB', 'AABBAB', 'AABBBA', 'ABAABB', 'ABBAAB', 'ABBBAA', 'ABABAB', 'ABABBA', 'ABBABA');
var
  Codigo: string;
  Formato: string;
  PegaDaTabela: string;
  DecimoTerceiroDig: Byte;
  Cont: Byte;
  X: STRING;
begin
  Formato := '';
  Codigo := _CodBarra;
  DecimoTerceiroDig := StrToIntDef(_CodBarra[1], 0);
  {----------------------------------------------------------------------------}
  { Tendo o 13º dígito definido, posso definir o padrão de impressão das barras}
  { no primeiro conjunto de 6 dígitos baseado na tabela Auxiliar. }
  {----------------------------------------------------------------------------}
  PegaDaTabela := TabAux[DecimoTerceiroDig] + 'CCCCCC';
  Formato := Formato + '101'; //--> Barra Auxiliar de Guarda 'Esquerda'
  for Cont := 1 to Length(PegaDaTabela) do
  begin

    case PegaDaTabela[Cont] of
      'A': Formato := Formato + TabelaA[StrToInt(Codigo[Cont + 1])];
      'B': Formato := Formato + TabelaB[StrToInt(Codigo[Cont + 1])];
      'C': Formato := Formato + TabelaC[StrToInt(Codigo[Cont + 1])];
    end;

    if Cont = 6 then
      Formato := Formato + '01010'; //--> Barra Auxiliar de Guarda 'Central'

  end;
  Formato := Formato + '101'; //--> Barra Auxiliar de Guarda 'Direita'

  //------ Desenha o código alfa-numérico na imagem
  Imagem.Font.Size := 14;
  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  Imagem.TextOut(02, 51, Copy(_CodBarra, 01, 01));
  Imagem.TextOut(13, 51, Copy(_CodBarra, 02, 06));
  Imagem.TextOut(60, 51, Copy(_CodBarra, 08, 06));
  //------ Desenha as barras na imagem
  prcDesenhaBarras_EAN13(Formato, Imagem);
end;

procedure prcDesenhaBarras_EAN13(SequenciaHexa: string; Imagem: TCanvas);
var
  X, Y, H: LongInt;
  A, B, C, D: TPoint;
  I: Boolean;
begin

  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  x := 10;
  i := True;
  for y := 1 to Length(SequenciaHexa) do
  begin
    if SequenciaHexa[y] = '0' then
      Imagem.Pen.Color := ClWhite
    else
      Imagem.Pen.Color := ClBlack;
    h := 1;
    a.x := x;
    a.y := 0;
    b.x := x;
    b.y := 50;
    c.x := x + h - 1;
    c.y := 50;
    d.x := x + h - 1;
    d.y := 0;
    case Y of
      1..3, 46..50, 93..95:
        begin
          b.y := 55;
          c.y := 55;
        end;
    end;
    Imagem.Polygon([A, B, C, D]);
    i := not (i);
    x := x + h;
  end;

end;

procedure prcGetFiles(FileName, Ext: String; Arc: TStrings);
var

   SearchFile: TSearchRec;
   FindResult: Integer;

begin

  FindResult := FindFirst(FileName+Ext, faArchive, SearchFile);
  try
     While FindResult = 0 do
     begin
          Application.ProcessMessages;
          Arc.Add(SearchFile.Name);
          FindResult := FindNext(SearchFile);
     end;
  finally
        FindClose(SearchFile)
  end;

end;

function fctAspaDupla(_Texto: string): string;
begin
   Result := '''' + _Texto + '''';
end;

function fctRemoveMaskNumber(_Number, _Tipo: string): string;
var
   sTextParcial: string; // armazena o texto parcial
   sTextFull: string; // armazena o texto completo
   nPosAtu: integer; // armazena a posição atual encontrada no texto parcial
begin

   // Serve para. Exemplo: 1,000.00 = 1000.00 ; R$ 1,000.00 = 1000.00 ; 100.00 % = 100.00

   if _Tipo = 'N' then
   begin { Número }

      sTextParcial := Trim(Copy(Trim(_Number), 1, Length(Trim(_Number))));

      while Pos('.', sTextParcial) > 0 do
      begin
         sTextParcial[Pos('.', sTextParcial)] := ' ';
         nPosAtu := Pos(' ', sTextParcial);
         sTextFull := sTextFull + Copy(sTextParcial, 1, nPosAtu - 1);
         sTextParcial := Copy(sTextParcial, nPosAtu + 1, Length(sTextParcial));
      end;

      if nPosAtu > 0 then
         Result := Trim(sTextFull + Copy(sTextParcial, 1, Length(sTextParcial)))
      else
         Result := sTextParcial;

   end;

   if _Tipo = 'M' then
   begin { Moeda }

      if Copy(Trim(_Number), 1, 2) = 'R$' then
         sTextParcial := Trim(Copy(Trim(_Number), 3, Length(Trim(_Number))))
      else
         sTextParcial := Trim(Copy(Trim(_Number), 1, Length(Trim(_Number))));

      while Pos('.', sTextParcial) > 0 do
      begin
         sTextParcial[Pos('.', sTextParcial)] := ' ';
         nPosAtu := Pos(' ', sTextParcial);
         sTextFull := sTextFull + Copy(sTextParcial, 1, nPosAtu - 1);
         sTextParcial := Copy(sTextParcial, nPosAtu + 1, Length(sTextParcial));
      end;

      if nPosAtu > 0 then
         Result := Trim(sTextFull + Copy(sTextParcial, 1, Length(sTextParcial)))
      else
         Result := sTextParcial;

   end;

   if _Tipo = 'P' then
   begin // Percentual
      if Copy(Trim(_Number), Length(Trim(_Number)), 1) = '%' then
         Result := Trim(Copy(Trim(_Number), 1, Length(Trim(_Number)) - 1))
      else
         Result := Trim(Copy(Trim(_Number), 1, Length(Trim(_Number))));
   end;

end;

function fctModulo11_X(_Number: integer): integer;
begin
   Result := 11 - (_Number - Trunc(_Number / 11) * 11);
   if Result > 9 then
      Result := 0;
end;

function fctModulo11_0(_Number: integer): string;
var
   nValue: integer;
begin
   nValue := (_Number - Trunc(_Number / 11) * 11);
   if nValue = 10 then
      Result := 'X'
   else
      Result := IntToStr(nValue);
end;

function fctValidCPF(_Number: string): boolean;
var
   nValue: integer; // armazena o valor para calcular cada dígito
   nDV1: integer; // armazena o dígito verificador 1
   nDV2: integer; // armazena o dígito verificador 2
begin
   Result := False;

   nValue := StrToInt(_Number[1]) * 10 + StrToInt(_Number[2]) * 9 + StrToInt
     (_Number[3]) * 8 + StrToInt(_Number[4]) * 7 + StrToInt(_Number[5])
     * 6 + StrToInt(_Number[6]) * 5 + StrToInt(_Number[7]) * 4 + StrToInt
     (_Number[8]) * 3 + StrToInt(_Number[9]) * 2;

   nDV1 := fctModulo11_X(nValue);

   if nDV1 <> StrToInt(_Number[10]) then
      Exit;

   nValue := StrToInt(_Number[1]) * 11 + StrToInt(_Number[2]) * 10 + StrToInt
     (_Number[3]) * 9 + StrToInt(_Number[4]) * 8 + StrToInt(_Number[5])
     * 7 + StrToInt(_Number[6]) * 6 + StrToInt(_Number[7]) * 5 + StrToInt
     (_Number[8]) * 4 + StrToInt(_Number[9]) * 3 + nDV1 * 2;

   nDV2 := fctModulo11_X(nValue);

   if nDV2 <> StrToInt(_Number[11]) then
      Exit;

   Result := True;
end;

function fctNumBanco(_Number: string): string;
var
   nValue: integer; // armazena o valor para calcular cada dígito
begin

   Result := '';

   nValue := StrToInt(_Number[11]) * 9 + StrToInt(_Number[10]) * 8 + StrToInt
     (_Number[9]) * 7 + StrToInt(_Number[8]) * 6 + StrToInt(_Number[7])
     * 5 + StrToInt(_Number[6]) * 4 + StrToInt(_Number[5]) * 3 + StrToInt
     (_Number[4]) * 2 + StrToInt(_Number[3]) * 9 + StrToInt(_Number[2])
     * 8 + StrToInt(_Number[1]) * 7;

   Result := fctModulo11_0(nValue);

end;

function fctValidCNPJ(_Number: string): boolean;
var
   nValue: integer; // armazena o valor para calcular cada dígito
   nDV1: integer; // armazena o dígito verificador 1
   nDV2: integer; // armazena o dígito verificador 2
begin
   Result := False;

   nValue := StrToInt(_Number[1]) * 5 + StrToInt(_Number[2]) * 4 + StrToInt
     (_Number[3]) * 3 + StrToInt(_Number[4]) * 2 + StrToInt(_Number[5])
     * 9 + StrToInt(_Number[6]) * 8 + StrToInt(_Number[7]) * 7 + StrToInt
     (_Number[8]) * 6 + StrToInt(_Number[9]) * 5 + StrToInt(_Number[10])
     * 4 + StrToInt(_Number[11]) * 3 + StrToInt(_Number[12]) * 2;

   nDV1 := fctModulo11_X(nValue);

   if nDV1 <> StrToInt(_Number[13]) then
      Exit;

   nValue := StrToInt(_Number[1]) * 6 + StrToInt(_Number[2]) * 5 + StrToInt
     (_Number[3]) * 4 + StrToInt(_Number[4]) * 3 + StrToInt(_Number[5])
     * 2 + StrToInt(_Number[6]) * 9 + StrToInt(_Number[7]) * 8 + StrToInt
     (_Number[8]) * 7 + StrToInt(_Number[9]) * 6 + StrToInt(_Number[10])
     * 5 + StrToInt(_Number[11]) * 4 + StrToInt(_Number[12]) * 3 + StrToInt
     (_Number[13]) * 2;

   nDV2 := fctModulo11_X(nValue);

   if nDV2 <> StrToInt(_Number[14]) then
      Exit;

   Result := True;
end;

function fctMsgConfirmDefaultButtonYes(_Msg: string): boolean;
begin
   Beep;
   if Application.Messagebox(PChar(_Msg), PChar('Confirmação'),
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1
      ) = IDYES then
      Result := True
   else
      Result := False;
end;

function fctMsgConfirmDefaultButtonNo(_Msg: string): boolean;
begin
   Beep;
   if Application.Messagebox(PChar(_Msg), PChar('Confirmação'),
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      Result := True
   else
      Result := False;
end;

function fctMsgConfirm(_Msg: string): boolean;
begin
   Beep;
   if Application.Messagebox(PChar(_Msg), PChar('Confirmação'),
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
      Result := True
   else
      Result := False;
end;

function fctInvalidValue(_Edit: TDBEdit; _TypeData: string; _QtdCasDec: integer)
  : boolean;
begin

   Result := False;

   // Caso o usuário apague todo o texto do edit correspondente
   if Length(Trim(_Edit.Text)) = 0 then
   begin
      Result := True;
      Exit;
   end;

   // Caso exista cálculos que usem o edit correspondente e que o mesmo não pode ser zero
   if _TypeData = 'Numerico' then
   begin
      if ((_QtdCasDec = 2) and (Trim(_Edit.Text) = '0.00')) or
        ((_QtdCasDec = 3) and (Trim(_Edit.Text) = '0.000')) or
        ((_QtdCasDec = 4) and (Trim(_Edit.Text) = '0.0000')) or
        ((_QtdCasDec = 7) and (Trim(_Edit.Text) = '0.0000000')) then
         Result := True;
   end;

   if _TypeData = 'Monetario' then
   begin
      if ((_QtdCasDec = 2) and (Trim(_Edit.Text) = 'R$ 0.00')) or
        ((_QtdCasDec = 3) and (Trim(_Edit.Text) = 'R$ 0.000')) or
        ((_QtdCasDec = 4) and (Trim(_Edit.Text) = 'R$ 0.0000')) then
         Result := True;
   end;

   if _TypeData = 'Percentual' then
   begin
      if (_QtdCasDec = 2) and (Trim(_Edit.Text) = '0.00 %') then
         Result := True;
   end;

   if _TypeData = 'Data' then
   begin
      if Trim(_Edit.Text) = '/  /' then
         Result := True;
   end;

end;

function fctExtenso(_Valor: double): string;
const
   Centenas: array [1 .. 9] of string[12] = ('CEM', 'DUZENTOS', 'TREZENTOS',
      'QUATROCENTOS', 'QUINHENTOS', 'SEISCENTOS', 'SETECENTOS', 'OITOCENTOS',
      'NOVECENTOS');
   Dezenas: array [2 .. 9] of string[10] = ('VINTE', 'TRINTA', 'QUARENTA',
      'CINQUENTA', 'SESSENTA', 'SETENTA', 'OITENTA', 'NOVENTA');
   Dez: array [0 .. 9] of string[10] = ('DEZ', 'ONZE', 'DOZE', 'TREZE',
      'QUATORZE', 'QUINZE', 'DEZESSEIS', 'DEZESSETE', 'DEZOITO', 'DEZENOVE');
   Unidades: array [1 .. 9] of string[10] = ('UM', 'DOIS', 'TRES', 'QUATRO',
      'CINCO', 'SEIS', 'SETE', 'OITO', 'NOVE');
   MoedaSingular = 'REAL';
   MoedaPlural = 'REAIS';
   CentSingular = 'CENTAVO';
   CentPlural = 'CENTAVOS';
   Zero = 'ZERO';

   function fctExt3(Parte: string): string;
   var
      Base: string;
      digito: integer;
   begin
      Base := '';
      digito := StrToInt(Parte[1]);
      if digito = 0 then
         Base := ''
      else
         Base := Centenas[digito];
      if (digito = 1) and (Parte > '100') then
         Base := 'CENTO';
      digito := StrToInt(Parte[2]);
      if digito = 1 then
      begin
         digito := StrToInt(Parte[3]);
         if Base <> '' then
            Base := Base + ' E ';
         Base := Base + Dez[digito];
      end
      else
      begin
         if (Base <> '') and (digito > 0) then
            Base := Base + ' E ';
         if digito > 1 then
            Base := Base + Dezenas[digito];
         digito := StrToInt(Parte[3]);
         if digito > 0 then
         begin
            if Base <> '' then
               Base := Base + ' E ';
            Base := Base + Unidades[digito];
         end;
      end;
      Result := Base;
   end;

var
   ComoTexto: string;
   Parte: string;
begin
   Result := '';
   ComoTexto := FloatToStrF(Abs(_Valor), ffFixed, 18, 2);
   // Acrescenta zeros a esquerda ate 12 digitos
   while Length(ComoTexto) < 15 do
      Insert('0', ComoTexto, 1);
   // Retira caracteres a esquerda para o máximo de 12 digitos
   while Length(ComoTexto) > 15 do
      delete(ComoTexto, 1, 1);

   // Calcula os bilhões
   Parte := fctExt3(Copy(ComoTexto, 1, 3));
   if StrToInt(Copy(ComoTexto, 1, 3)) = 1 then
      Parte := Parte + ' BILHAO'
   else if Parte <> '' then
      Parte := Parte + ' BILHOES';
   Result := Parte;

   // Calcula os milhões
   Parte := fctExt3(Copy(ComoTexto, 4, 3));
   if Parte <> '' then
   begin
      if Result <> '' then
         Result := Result + ', ';
      if StrToInt(Copy(ComoTexto, 4, 3)) = 1 then
         Parte := Parte + ' MILHAO '
      else
         Parte := Parte + ' MILHOES';
      Result := Result + Parte;
   end;

   // Calcula os milhares
   Parte := fctExt3(Copy(ComoTexto, 7, 3));
   if Parte <> '' then
   begin
      if Result <> '' then
         Result := Result + ', ';
      Parte := Parte + ' MIL';
      Result := Result + Parte;
   end;

   // Calcula as unidades
   Parte := fctExt3(Copy(ComoTexto, 10, 3));
   if Parte <> '' then
   begin
      if Result <> '' then
         if Frac(_Valor) = 0 then
            Result := Result + ' E '
         else
            Result := Result + ', ';
      Result := Result + Parte;
   end;

   // Acrescenta o texto da moeda
   if Int(_Valor) = 1 then
      Parte := ' ' + MoedaSingular
   else
      Parte := ' ' + MoedaPlural;
   if Copy(ComoTexto, 7, 6) = '000000' then
      Parte := 'DE ' + MoedaPlural;
   Result := Result + Parte;

   // Se o valor for zero, limpa o resultado
   if Int(_Valor) = 0 then
      Result := '';

   // Calcula os centavos
   Parte := fctExt3('0' + Copy(ComoTexto, 14, 2));
   if Parte <> '' then
   begin
      if Result <> '' then
         Result := Result + ' E ';
      if Parte = Unidades[1] then
         Parte := Parte + ' ' + CentSingular
      else
         Parte := Parte + ' ' + CentPlural;
      Result := Result + Parte;
   end;

   // Se o valor for zero, assume a constante ZERO
   if _Valor = 0 then
      Result := Zero;
end;

function fctUserValid(_IDUserAcess: integer; _Form: string): boolean;
begin

   Result := False;

   if _IDUserAcess = 100 then
      Result := True; // Administrador

   if _IDUserAcess = 1 then
   begin // Caixa nº 1
      if _Form = 'frmCadPar' then
         Result := True;
      if _Form = 'frmMovSai' then
         Result := True;
      if _Form = 'frmMovCtrChe' then
         Result := True;
      if _Form = 'frmOpiFecCxa' then
         Result := True;
      if _Form = 'frmCstVnd' then
         Result := True;
   end;

   if _IDUserAcess = 2 then
   begin // Caixa nº 2
      if _Form = 'frmCadPar' then
         Result := True;
      if _Form = 'frmMovSai' then
         Result := True;
      if _Form = 'frmMovCtrChe' then
         Result := True;
      if _Form = 'frmOpiFecCxa' then
         Result := True;
      if _Form = 'frmCstVnd' then
         Result := True;
   end;

   if _IDUserAcess = 3 then
   begin // Grupo de vendas nº 1
      if _Form = 'frmCadPar' then
         Result := True;
      if _Form = 'frmMovPef' then
         Result := True;
      if _Form = 'frmMovEnt' then
         Result := True;
      if _Form = 'frmMovDve' then
         Result := True;
      if _Form = 'frmMovSai' then
         Result := True;
      if _Form = 'frmMovDvs' then
         Result := True;
      if _Form = 'frmCstPrd' then
         Result := True;
      if _Form = 'frmCstVnd' then
         Result := True;
      if _Form = 'frmOpcAtuNF' then
         Result := True;
   end;

   if _IDUserAcess = 4 then
   begin // Grupo de vendas nº 2
      if _Form = 'frmCadPar' then
         Result := True;
      if _Form = 'frmMovPef' then
         Result := True;
      if _Form = 'frmMovEnt' then
         Result := True;
      if _Form = 'frmMovDve' then
         Result := True;
      if _Form = 'frmMovSai' then
         Result := True;
      if _Form = 'frmMovDvs' then
         Result := True;
      if _Form = 'frmCstPrd' then
         Result := True;
      if _Form = 'frmCstVnd' then
         Result := True;
      if _Form = 'frmOpcAtuNF' then
         Result := True;
   end;

   if _IDUserAcess = 5 then
   begin // Grupo de cobrança
      if _Form = 'frmCadPar' then
         Result := True;
      if _Form = 'frmCadBorCob' then
         Result := True;
      if _Form = 'frmMovDiv' then
         Result := True;
      if _Form = 'frmMovSai' then
         Result := True;
      if _Form = 'frmMovCtrChe' then
         Result := True;
      if _Form = 'frmMovMovDiv' then
         Result := True;
      if _Form = 'frmMovBxaDiv' then
         Result := True;
      if _Form = 'frmMovBxaChe' then
         Result := True;
      if _Form = 'frmOpiCtrChe' then
         Result := True;
      if _Form = 'frmOpiCtrDiv' then
         Result := True;
      if _Form = 'frmOpcMudEmp' then
         Result := True;
   end;

   if not Result then
      prcMsgAdv('Acesso não permitido');

end;

function fctConexaoAdo: String;
begin
   Result := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security'+
   'Info=False;Initial Catalog=SysQuestion;Data Source=127.0.0.1;Use Procedure'+
   'for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DENNISSOBRAL;'+
   'Use Encryption for Data=False;Tag with column collation when possible=False;';
end;

function fctTableNextID(_Table: string): integer;
var
   qryADOAux: TADOQuery;
begin
   qryADOAux := TADOQuery.create(nil);
   qryADOAux.ConnectionString := fctConexaoAdo;
   qryADOAux.Close;
   qryADOAux.SQL.Clear;
   qryADOAux.SQL.Add(' Select ISNULL(MAX(ID),0) AS MAX_ID From ' + _Table);
   qryADOAux.Open;
   Result := qryADOAux.FieldByName('MAX_ID').Value + 1;
   FreeAndNil(qryADOAux);
end;

function fctUsuarioLogado(): integer;
var
   qryADOAux: TADOQuery;
begin
   qryADOAux := TADOQuery.create(nil);
   qryADOAux.ConnectionString := fctConexaoAdo;
   qryADOAux.Close;
   qryADOAux.SQL.Clear;
   qryADOAux.SQL.Add(' Select id from usuarios WHERE usuario = :nome AND ra = 1 ');
   qryADOAux.Parameters.ParamByName('nome').Value := 'DENNIS SOBRAL';
   qryADOAux.Open;
   Result := qryADOAux.FieldByName('id').Value;
   FreeAndNil(qryADOAux);
end;

function fctServidorDateTime: TDateTime;
var
   qryADOAux: TADOQuery;
begin
   qryADOAux := TADOQuery.create(nil);
   qryADOAux.ConnectionString := fctConexaoAdo;
   qryADOAux.Close;
   qryADOAux.SQL.Clear;
   qryADOAux.SQL.Add(
      ' SELECT TOP 1 GETDATE() AS SERVIDOR_DATA_HORA FROM SYSOBJECTS ');
   qryADOAux.Open;
   Result := qryADOAux.FieldByName('SERVIDOR_DATA_HORA').Value;
   FreeAndNil(qryADOAux);
end;

function fctComputerName: string;
const
   MAX_COMPUTER_LENGTH = 30;
var
   vlcNome: PChar;
   vlwLen: DWord;
begin
   vlwLen := MAX_COMPUTER_LENGTH + 1;
   getmem(vlcNome, vlwLen);
   if GetComputerName(vlcNome, vlwLen) then
      Result := vlcNome
   else
      Result := '?';
   Freemem(vlcNome, vlwLen);
end;

function fctInsertErro(_Erro, _Form, _Evento, _Tabela, _TypeComando: string;
   _User: integer): integer;
var
   vlnID_ERRO: integer;
   qryADOAux: TADOQuery;
begin
   qryADOAux := TADOQuery.create(nil);
   qryADOAux.ConnectionString := fctConexaoAdo;

   vlnID_ERRO := fctTableNextID('TBL_ERROS');

   qryADOAux.Close;
   qryADOAux.SQL.Clear;
   qryADOAux.SQL.Add(
      ' Insert Into TBL_ERROS (ID, DESC_ERRO, COMPUTADOR, FORM, EVENTO, TABELA, COMANDO, USER_ERRO, DT_HR_ERRO) ');
   qryADOAux.SQL.Add(
      '                Values (:ID, :DESC_ERRO, :COMPUTADOR, :FORM, :EVENTO, :TABELA, :COMANDO, :USER_ERRO, :DT_HR_ERRO) ');
   qryADOAux.Parameters.ParamByName('ID').Value := vlnID_ERRO;
   qryADOAux.Parameters.ParamByName('DESC_ERRO').Value := _Erro;
   qryADOAux.Parameters.ParamByName('COMPUTADOR').Value := fctComputerName;
   qryADOAux.Parameters.ParamByName('FORM').Value := _Form;
   qryADOAux.Parameters.ParamByName('EVENTO').Value := _Evento;
   qryADOAux.Parameters.ParamByName('TABELA').Value := 'TBL_' + _Tabela;
   qryADOAux.Parameters.ParamByName('COMANDO').Value := _TypeComando;
   qryADOAux.Parameters.ParamByName('USER_ERRO').Value := _User;
   qryADOAux.Parameters.ParamByName('DT_HR_ERRO').Value := fctServidorDateTime;
   qryADOAux.ExecSQL;

   Result := vlnID_ERRO;

   FreeAndNil(qryADOAux);
end;

function fctPreencheEsquerda(_Tam: integer; _Carac, Campo: string): string;
var
   Texto, Preenche: String;
   Ind: integer;
begin
   Preenche := '';
   Texto := '';
   for Ind := 1 to _Tam do
      Preenche := Preenche + _Carac;
   if Length(Campo) < _Tam then
      Texto := Copy(Preenche, 1, _Tam - Length(Campo)) + Campo
   else
      Texto := Copy(Campo, 1, _Tam);
   Result := Texto;
end;

function fctPreencheDireita(Tamanho:Integer; Carac, Campo:String):String;
Var Texto,
    Preenche : String;
    Ind : Integer;
Begin
   Preenche := '';
   Texto    := '';
   for Ind := 1 to Tamanho do
       Preenche := Preenche + Carac;
   if Length(Campo) < tamanho then
      Texto  := Campo + Copy(Preenche,1, Tamanho - Length(Campo))
   else
      Texto  := Copy(Campo,1, Tamanho);
   Result := Texto;
end;


function fctRemoveCasasDecimais(_Number : string): string;
var
   sTextParcial: string; // armazena o texto parcial
   sTextFull: string; // armazena o texto completo
   nPosAtu: integer; // armazena a posição atual encontrada no texto parcial
begin

   if Copy(Trim(_Number), 1, 2) = 'R$' then
      sTextParcial := Trim(Copy(Trim(_Number), 3, Length(Trim(_Number))))
   else
      sTextParcial := Trim(Copy(Trim(_Number), 1, Length(Trim(_Number))));

   if sTextParcial[Pos(',', sTextParcial)] = #0 then // se não existir a vírgula
      sTextParcial := sTextParcial + ',';

   sTextParcial[Pos(',', sTextParcial)] := ' ';
   nPosAtu := Pos(' ', sTextParcial);
   sTextFull := sTextFull + Copy(sTextParcial, 1, nPosAtu - 1);
   Result := sTextFull;
end;

function fctTransformPontoEmVirgula(pValue: string): string;
var
  i, t: integer;
  x, Resultado: string;
begin
  t := Length(Trim(pValue));
  for i := 1 to t do begin
  x := Copy(Trim(pValue), i, 1);
  if (x <> '.') and (x <> ',') then Resultado := Resultado + x;
  if x = '.' then Resultado := Resultado + ',';
  end;
  Result := Resultado;
end;

function fctDirList(ASource : string; ADirList : TStringList) : integer;
var
   SearchRec : TSearchRec;
   iResult   : integer;
   iQtdeRec  : integer;
begin

   iResult := FindFirst(ASource, faAnyFile, SearchRec);

   iQtdeRec := 0;

   while (iResult = 0) do begin

      if (SearchRec.Name+' ')[1] = '.' then begin
         iResult := FindNext(SearchRec);
         Continue;
      end;

      ADirList.Add(SearchRec.Name);
      iResult := FindNext(SearchRec);
      Inc(iQtdeRec);
   end;

   FindClose(SearchRec);
   ADirList.Sort;

   Result := iQtdeRec;
end;

function fctRetornPartStringBlunt(_String: string; _Tamanho: integer): string; // retorna a parte de uma string sem corte
var
   i: integer;
   vlsString: string;
begin
   if Copy(_String,1,_Tamanho) = ' ' then begin

      Result := Copy(_String,1,_Tamanho);

   end else begin

      vlsString := Copy(_String,1,_Tamanho);

      for i := 1 to _Tamanho do begin
         if Copy(vlsString,_Tamanho-i,1) = ' ' then begin
            Result := Copy(vlsString,1,_Tamanho-i);
            Break;
         end;
      end;
   end;
end;

{ 23 }
function fctReturnID(_Msg: string): integer; // retorna o ID da mensagem de registros
begin
   Result := StrToInt(Trim(Copy(_Msg,10,Length(Trim(_Msg))-1)));
end;

{ 24 }
function fctFormCaptionCenter(sTexto: string; iTamanho: Integer): string;
var
   iContador : Integer;
   iPosicao : Integer;
begin

   Result := sTexto;
   iPosicao := Trunc((iTamanho - Length(Result)) / 2);

   for iContador := 1 to iPosicao do
      Result := ' ' + Result;

   iPosicao := (iTamanho - Length(Result));

   for iContador := 1 to iPosicao do
      Result := Result + ' ';

end;

{ 25 }
function fctTransformaHoraEmDecimal(_HORA: string): double; // transforma hora string em decimal de minutos
var

   vlnHora: integer;
   vlnMinutos: integer;

begin

   vlnHora := StrToInt(Copy(_HORA,1,2));
   vlnMinutos := StrToInt(Copy(_HORA,4,2));

   Result := 0;

end;

end.

// NOVAS

{ PROCEDURES }

// procedure prccSelecao_Grid(pGrid: TDBGrid; pCol_Desejada: integer); // procedure {2}: Para selecionar uma coluna desejada e somente das linhas selecionadas de um grid.
// OBS.: O array precisa está declarado dentro do form

{ FUNÇÕES }


// function fctTransformValueSQL(pValue: string): string; // função {2}: Transformar um determinado valor numérico para ser compatível para ser usado em um SQL
// function fctInsertNumber(pValue: string): string; // função {3}: Só aceita caracteres de números
// function fctDisplayNumber(pValue: string; pCasasDecimais: integer): string; // função {4}: Mostrar número com padrão brasileiro
// function fctPositionTopWindow(pHeightMain, pHeightSelf: integer): integer; // função {5}: retona o valor do top da janela
// function fctPositionLeftWindow(pWidthMain, pWidthSelf: integer): integer; // função {6}: retona o valor do left da janela
// function fctSQLDateFormat(pDate: string): string; // função {8}: retorna a data com a forma correta para o SQL
// function fctRetorna_Somente_Numeros(pTexto: string): string; // função {11}: retorna somente os números de uma string
// function fctStrToPChar(const Str: string): PChar; // função {12}: transforma uma string para o PChar
// function fctRetornaInteiro(pTexto: string): integer; // função {13}: retorna somente a parte inteira de uma string
// function fctTransformValueSQL_2(pValue: string): string; // função {14}:  Transformar um determinado valor numérico para ser compatível do SQL para o Edit
// function fctBoletos_Calcula_Digito(pBANCO, pNOSSO_NUM: string): string; // função {15}: retorna o dígito verificado do nosso número
// function fctData_Atual(pHora: boolean): TDateTime; // função [16]: retorna a dtaa e hora do servidor
// function fctRetorna_Numero_Mes(pMes: string): string; // função [17]: retorna o número do mês correspondente passado através do nome
// function fctRetorna_Index_Mes(pMes: integer): integer; // função [18]: retorna o índice do mês correspondente passado através do número
// function fctFormat_Data_Fim(pMes, pAno: string): TDateTime; // função [19] retorna a data fim do mÊs específicado
// function fctTransformValueTextNumber(pValue: string): string; // função {20}: Transformar um determinado valor texto em um número válido
// function fctTransformValueFloat(pValue: string): double; // função {21}:  Transformar um determinado valor monetário tipo texto de um Edit para ser transformado para um tipo Float
// function fctRetorna_Sigla_Mes_Oracle_Data(pMES: string): string; // função {22}: Retorna o mês no formato de data do oracle = 'DEC' => Exemplo De: 'DEZEMBRO'
// function fctRetorna_Nome_Mes_Portuques(pMES: string): string; // função {23}: Entra com o nº do mÊs e retorna o nome do mês em português

// var
// aryBoletos_Cancel: array [1..100] of string; // procedure [2]

// implementation

{ PROCEDURES }

// procedure prccMsg(pTexto, pTipo: string);
// begin
{ M = Mensagem
  A = Advertência
  }
{
  Beep;
  if pTipo = 'M' then MessageDlg(pTexto, mtInformation, [mbOK], 0);
  if pTipo = 'A' then MessageDlg(pTexto, mtWarning, [mbOK], 0);
  if pTipo = 'E' then MessageDlg(pTexto, mtError, [mbOK], 0);
  end;

  procedure prccSelecao_Grid(pGrid: TDBGrid; pCol_Desejada: integer);
  var
  i, j, x: Integer;
  s: string;
  begin
  x := 0;

  for i := 1 to 100 do aryBoletos_Cancel[i] := '';

  if pGrid.SelectedRows.Count > 0 then begin
  with pGrid.DataSource.DataSet do begin
  for i := 0 to Pred(pGrid.SelectedRows.Count) do begin
  Inc(x);
  GotoBookmark(pointer(pGrid.SelectedRows.Items[i]));
  for j := pCol_Desejada to pCol_Desejada do begin // coluna referente ao valor desejado
  s := s + Copy(Fields[j].AsString, 1, Length(Trim(Fields[j].AsString)) - 2);
  aryBoletos_Cancel[x] := (s);
  s := '';
  end;
  end;
  end;
  end;

  end;
}
{ FUNÇÕES }

{ function fcttConfirm(pTexto: string): boolean;
  begin
  Beep;
  if MessageDlg(pTexto, mtConfirmation, [mbYes, mbNo], 0) = mrYes then Result := True else Result := False;
  end;

  function fcttInsertNumber(pValue: string): string;
  begin
  if pValue = '.' then begin
  Result := ',';
  end else begin
  if (pValue <> '0') and
  (pValue <> '1') and
  (pValue <> '2') and
  (pValue <> '3') and
  (pValue <> '4') and
  (pValue <> '5') and
  (pValue <> '6') and
  (pValue <> '7') and
  (pValue <> '8') and
  (pValue <> '9') then Result := '';
  end;
  end;

  function fcttDisplayNumber(pValue: string; pCasasDecimais: integer): string;
  begin
  if pCasasDecimais = 2 then begin
  if Length(Trim(pValue)) > 0 then
  Result := FormatFloat('###,##0.00', StrToFloat(pValue))
  else
  Result := '0,00';
  end;

  if pCasasDecimais = 4 then begin
  if Length(Trim(pValue)) > 0 then
  Result := FormatFloat('###,##0.0000', StrToFloat(pValue))
  else
  Result := '0,0000';
  end;
  end;

  function fcttPositionTopWindow(pHeightMain, pHeightSelf: integer): integer;
  begin
  Result := Trunc((pHeightMain / 2)) - Trunc((pHeightSelf / 2));
  end;

  function fcttPositionLeftWindow(pWidthMain, pWidthSelf: integer): Integer;
  begin
  Result := Trunc((pWidthMain / 2)) - Trunc((pWidthSelf / 2));
  end;

  function fcttSQLDateFormat(pDate: string): string;
  var
  lcText: string;
  begin
  Result := '';

  lcText := Copy(pDate, 1, 2);

  if Copy(pDate, 4, 2) = '01' then lcText := lcText + ' JAN ';
  if Copy(pDate, 4, 2) = '02' then lcText := lcText + ' FEB ';
  if Copy(pDate, 4, 2) = '03' then lcText := lcText + ' MAR ';
  if Copy(pDate, 4, 2) = '04' then lcText := lcText + ' APR ';
  if Copy(pDate, 4, 2) = '05' then lcText := lcText + ' MAY ';
  if Copy(pDate, 4, 2) = '06' then lcText := lcText + ' JUN ';
  if Copy(pDate, 4, 2) = '07' then lcText := lcText + ' JUL ';
  if Copy(pDate, 4, 2) = '08' then lcText := lcText + ' AUG ';
  if Copy(pDate, 4, 2) = '09' then lcText := lcText + ' SEP ';
  if Copy(pDate, 4, 2) = '10' then lcText := lcText + ' OCT ';
  if Copy(pDate, 4, 2) = '11' then lcText := lcText + ' NOV ';
  if Copy(pDate, 4, 2) = '12' then lcText := lcText + ' DEC ';

  lcText := lcText + Copy(pDate, 7, 4);

  Result := '''' + lcText + '''';
  end;

  function fcttPreencheEsquerda(Tamanho:Integer; Carac, Campo:String):String;
  var Texto,
  Preenche : string;
  Ind : Integer;
  begin
  Preenche := '';
  Texto    := '';
  for Ind := 1 to Tamanho do
  Preenche := Preenche + Carac;
  if Length(Campo) < tamanho then
  Texto  := Copy(Preenche,1, Tamanho - Length(Campo)) + Campo
  else
  Texto  := Copy(Campo,1, Tamanho);
  Result := Texto;
  end;

  function fcttPreencheDireita(pTamanho: integer; pCaractere, pTexto: string): string;
  var
  i: integer;
  lcTexto :string;
  begin
  for i := 1 to pTamanho do begin
  lcTexto := lcTexto + pCaractere;
  end;
  Result := pTexto + Copy(lcTexto, Length(pTexto), pTamanho);
  end;

  function fcttRetorna_Somente_Numeros(pTexto: string): string;
  var
  i: integer;
  s: string;
  begin
  Result := '';
  for i := 1 to Length(pTexto) do begin
  s := Copy(pTexto,i,1);
  if (s <> '0') and
  (s <> '1') and
  (s <> '2') and
  (s <> '3') and
  (s <> '4') and
  (s <> '5') and
  (s <> '6') and
  (s <> '7') and
  (s <> '8') and
  (s <> '9') then s := '';
  Result := Result + s;
  end;
  end;

  function fcttStrToPChar(const Str: string): PChar;
  type
  TRingIndex = 0..7;
  var
  Ring: array[TRingIndex] of PChar;
  RingIndex: TRingIndex;
  Ptr: PChar;
  begin
  Ptr := @Str[Length(Str)];
  Inc(Ptr);
  if Ptr^ = #0 then
  begin
  Result := @Str[1];
  end else begin
  Result := StrAlloc(Length(Str)+1);
  RingIndex := (RingIndex + 1) mod
  (High(TRingIndex) + 1);
  StrPCopy(Result, Str);
  StrDispose(Ring[RingIndex]);
  Ring[RingIndex]:= Result;
  end;
  end;

  function fcttRetornaInteiro(pTexto: string): integer;
  var
  s, lcNumber: string;
  i: integer;
  begin
  Result := 0;
  s := '';
  lcNumber := '';
  for i := 1 to Length(Trim(pTexto)) do begin
  s := Copy(pTexto,i,1);
  if s <> ',' then begin
  lcNumber := lcNumber + s;
  end else begin
  Result := StrToInt(lcNumber);
  Exit;
  end;
  end;
  end;

  function fcttTransformValueSQL(pValue: string): string;
  var
  i, t: integer;
  x, Resultado: string;
  begin
  t := Length(Trim(pValue));
  for i := 1 to t do begin
  x := Copy(Trim(pValue), i, 1);
  if (x <> '.') and (x <> ',') then Resultado := Resultado + x;
  if x = ',' then Resultado := Resultado + '.';
  end;
  Result := Resultado;
  end;

  function fcttTransformValueSQL_2(pValue: string): string;
  var
  i, t: integer;
  x, Resultado: string;
  begin
  t := Length(Trim(pValue));
  for i := 1 to t do begin
  x := Copy(Trim(pValue), i, 1);
  if (x <> '.') and (x <> ',') then Resultado := Resultado + x;
  if x = '.' then Resultado := Resultado + ',';
  end;
  Result := Resultado;
  end;

  function fcttTransformValueFloat(pValue: string): double;
  var
  i, t: integer;
  x, Resultado: string;
  begin
  t := Length(Trim(pValue));
  for i := 1 to t do begin
  x := Copy(Trim(pValue), i, 1);
  if (x <> '.') and (x <> ',') then Resultado := Resultado + x;
  if x = ',' then Resultado := Resultado + ',';
  end;
  Result := StrToFloat(Resultado);
  end;

  function fcttBoletos_Calcula_Digito(pBANCO, pNOSSO_NUM: string): string;
  var
  lcNosso_Num: string;
  lnSoma, i, lnResto: integer;
  lcCarTeira, lcAgencia: string;
  begin

  if pBANCO = 'BRADESCO' then begin

  //lcCarteira := '09'; // 63 (soma)
  lcCarteira := '06'; // 42 (soma)
  lcAgencia  := '2367';

  lcNosso_Num := lcAgencia + pNOSSO_NUM; // agência + nº passasdo

  lnSoma := 42; // para carteira = 06

  for i:= 11 downto 6 do
  lnSoma := lnSoma + (StrToInt(Copy(lcNosso_Num, i, 1)) * (13 - i));

  for i:= 5 downto 1 do lnSoma := lnSoma + (StrToInt(Copy(lcNosso_Num, i, 1)) * (7 - i));

  lnResto := lnSoma mod 11;

  if lnResto = 1 then begin
  Result := lcNosso_Num + '-P'
  end else begin
  if lnResto = 0 then
  Result := lcNosso_Num + '-0'
  else
  Result := lcNosso_Num + '-' + IntToStr(11 - lnResto);
  end;

  Result := Copy(Result, Length(Result), Length(Result)); // retorna somente o dígito

  end;

  end;

  function fcttData_Atual(pHora: boolean): TDateTime;
  begin
  // Pegando data atual do servidor
  qryTMP.Close;
  qryTMP.SQL.Clear;
  qryTMP.SQL.Add(' Select TRUNC(SYSDATE) DATA_ATUAL, SYSDATE DATA_ATUAL_TIME From DUAL ');
  qryTMP.Open;

  if pHora     then Result := qryTMP.FieldByName('DATA_ATUAL_TIME').AsDateTime;
  if not pHora then Result := qryTMP.FieldByName('DATA_ATUAL').AsDateTime;
  end;

  function fcttRetorna_Numero_Mes(pMes: string): string;
  begin
  if pMes = 'JANEIRO'   then Result := '01';
  if pMes = 'FEVEREIRO' then Result := '02';
  if pMes = 'MARÇO'     then Result := '03';
  if pMes = 'ABRIL'     then Result := '04';
  if pMes = 'MAIO'      then Result := '05';
  if pMes = 'JUNHO'     then Result := '06';
  if pMes = 'JULHO'     then Result := '07';
  if pMes = 'AGOSTO'    then Result := '08';
  if pMes = 'SETEMBRO'  then Result := '09';
  if pMes = 'OUTUBRO'   then Result := '10';
  if pMes = 'NOVEMBRO'  then Result := '11';
  if pMes = 'DEZEMBRO'  then Result := '12';
  end;

  function fcttRetorna_Index_Mes(pMes: integer): integer;
  begin
  if pMes = 1   then Result := 0;
  if pMes = 2   then Result := 1;
  if pMes = 3   then Result := 2;
  if pMes = 4   then Result := 3;
  if pMes = 5   then Result := 4;
  if pMes = 6   then Result := 5;
  if pMes = 7   then Result := 6;
  if pMes = 8   then Result := 7;
  if pMes = 9   then Result := 8;
  if pMes = 10  then Result := 9;
  if pMes = 11  then Result := 10;
  if pMes = 12  then Result := 11;
  end;

  // **************************************************************************** COLOCAR PRA SER GENÉRICA {

  // Imprimi impressão tipo caractere direto pra impressora

  // VARIÁVEIS GLOBAIS
  VAR
  Arq: TextFile;
  gInd1, gInd2: integer;
  gPagina : array [1..80, 1..80] of string[1];

  procedure prccImpReg(lin, col : integer; reg : string);
  var
  lCont : integer;
  begin
  lCont := 1;
  for gInd1 := col to col+length(reg)-1 do begin
  gPagina[lin, gInd1] := copy(reg, lCont,1);
  inc(lCont);
  end;
  end;

  procedure prccImpPag(qtLin: integer);
  var
  lReg : string;
  lInd1, lInd2 : integer;
  begin

  lReg  := '';
  lInd1 := 0;
  lInd2 := 0;

  gind1 := 0;
  gind2 := 0;

  if qtLin > 80 then
  qtLin := 80;

  for gind1 := 1 to qtLin do begin
  for gInd2 := 1 to 80 do begin
  lReg := lReg + gPagina[gInd1, gInd2];
  end;
  Writeln(Arq, lreg);
  lreg := '';
  end;

  for gInd1 := 1 to qtLin do begin
  for gInd2 := 1 to 80 do begin
  gPagina[gInd1, gInd2] := ' ';
  end;
  end;

  for gind1 := 1 to 80 do begin
  for gInd2 := 1 to 80 do begin
  gPagina[gInd1, gInd2] := ' ';
  end;
  end;

  end;

  function  fctFormat_Data_Fim(pMes, pAno: string): TDateTime;
  begin
  if pMes = 'JANEIRO' then Result := StrToDate('31/01/' + pAno);

  if ((StrToInt(pAno) mod 4) = 0) then // verificando se o ano é bissexto
  if pMes = 'FEVEREIRO' then Result := StrToDate('29/02/' + pAno)
  else
  if pMes = 'FEVEREIRO' then Result := StrToDate('28/02/' + pAno);

  if pMes = 'MARÇO'    then Result := StrToDate('31/03/' + pAno);
  if pMes = 'ABRIL'    then Result := StrToDate('30/04/' + pAno);
  if pMes = 'MAIO'     then Result := StrToDate('31/05/' + pAno);
  if pMes = 'JUNHO'    then Result := StrToDate('30/06/' + pAno);
  if pMes = 'JULHO'    then Result := StrToDate('31/07/' + pAno);
  if pMes = 'AGOSTO'   then Result := StrToDate('31/08/' + pAno);
  if pMes = 'SETEMBRO' then Result := StrToDate('30/09/' + pAno);
  if pMes = 'OUTUBRO'  then Result := StrToDate('31/10/' + pAno);
  if pMes = 'NOVEMBRO' then Result := StrToDate('30/11/' + pAno);
  if pMes = 'DEZEMBRO' then Result := StrToDate('31/12/' + pAno);
  end;

  function fcttTransformValueTextNumber(pValue: string): string;
  var
  i, t: integer;
  x, Resultado: string;
  begin
  t := Length(Trim(pValue));
  for i := 1 to t do begin
  x := Copy(Trim(pValue), i, 1);
  if (x <> '.') and (x <> ',') then Resultado := Resultado + x;
  end;
  Result := Resultado;
  end;

  function fcttRetorna_Sigla_Mes_Oracle_Data(pMES: string): string;
  begin

  Result := '';

  if pMES = 'JANEIRO'   then Result := 'JAN';
  if pMES = 'FEVEREIRO' then Result := 'FEB';
  if pMES = 'MARÇO'     then Result := 'MAR';
  if pMES = 'ABRIL'     then Result := 'APR';
  if pMES = 'MAIO'      then Result := 'MAY';
  if pMES = 'JUNHO'     then Result := 'JUN';
  if pMES = 'JULHO'     then Result := 'JUL';
  if pMES = 'AGOSTO'    then Result := 'AUG';
  if pMES = 'SETEMBRO'  then Result := 'SEP';
  if pMES = 'OUTUBRO'   then Result := 'OCT';
  if pMES = 'NOVEMBRO'  then Result := 'NOV';
  if pMES = 'DEZEMBRO'  then Result := 'DEC';

  end;

  function fcttRetorna_Nome_Mes_Portuques(pMES: string): string;
  begin

  Result := '';

  if pMES = '01' then Result := 'JANEIRO';
  if pMES = '02' then Result := 'FEVEREIRO';
  if pMES = '03' then Result := 'MARÇO';
  if pMES = '04' then Result := 'ABRIL';
  if pMES = '05' then Result := 'MAIO';
  if pMES = '06' then Result := 'JUNHO';
  if pMES = '07' then Result := 'JULHO';
  if pMES = '08' then Result := 'AGOSTO';
  if pMES = '09' then Result := 'SETEMBRO';
  if pMES = '10' then Result := 'OUTUBRO';
  if pMES = '11' then Result := 'NOVEMBRO';
  if pMES = '12' then Result := 'DEZEMBRO';

  end;

  end.
}

