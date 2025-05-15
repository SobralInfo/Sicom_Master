unit untBiblioteca;

interface

uses System.SysUtils, IdHashMessageDigest, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
     FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, firedac.comp.client,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, generics.collections,
     System.Json, rest.json, FireDAC.Stan.StorageJSON, vcl.forms, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ACBrutil, synautil, StrUtils ;

Type

TBiblioteca = class

   private

   public

      class procedure Importar;
      class function Servidor: String;
      class Function MD5(const texto: string): string;
      class procedure AtualizarTabelas(Conexao: TFDConnection);
      class function SplashTela: TForm;
      class function RetornarUFporID(id: integer):String;
      class function RetornarIDporUF(UF:String): integer;
      class function convertir_utf8_ansi(const Source: string):string;
      class function GetStrNumber(const S: string): string;
      class function GetStrNumberComVirgula(const S: string): string;
      class function ParseTexto( const Texto : AnsiString; const Decode : Boolean = True; const IsUTF8: Boolean = True) : String;
      class function Cronometro(Data: TDateTime):  String;
      class function ExtensoMes(n: Integer): String;
      class function mascaraCPFCNPJ(texto: string): string;

end;

thread = class(TThread)

   constructor create;
   procedure Execute; override;

end;

implementation


{ TBiblioteca }

Var tela: TForm;

class function TBiblioteca.RetornarIDporUF(UF: String): integer;
begin

   if UF = 'AC' then Result := 0;
   if UF = 'AL' then Result := 1;
   if UF = 'AP' then Result := 2;
   if UF = 'AM' then Result := 3;
   if UF = 'BA' then Result := 4;
   if UF = 'CE' then Result := 5;
   if UF = 'DF' then Result := 6;
   if UF = 'ES' then Result := 7;
   if UF = 'GO' then Result := 8;
   if UF = 'MA' then Result := 9;
   if UF = 'MT' then Result := 10;
   if UF = 'MS' then Result := 11;
   if UF = 'MG' then Result := 12;
   if UF = 'PA' then Result := 13;
   if UF = 'PB' then Result := 14;
   if UF = 'PR' then Result := 15;
   if UF = 'PE' then Result := 16;
   if UF = 'PI' then Result := 17;
   if UF = 'RJ' then Result := 18;
   if UF = 'RN' then Result := 19;
   if UF = 'RS' then Result := 20;
   if UF = 'RO' then Result := 21;
   if UF = 'RR' then Result := 22;
   if UF = 'SC' then Result := 23;
   if UF = 'SP' then Result := 24;
   if UF = 'SE' then Result := 25;
   if UF = 'TO' then Result := 26;

end;

class procedure TBiblioteca.AtualizarTabelas(Conexao: TFDConnection);
Var qryAUX: TFDQuery;
begin

   Try

      qryAUX := TFDQuery.Create(Nil);
      qryAUX.Connection := Conexao;

      Try

         qryAUX.SQL.Clear;
         qryAUX.SQL.Add(' ALTER TABLE "Igreja".paroquias ADD paroco VARCHAR(100), ADD adm_paroquial VARCHAR(100) ');
         qryAUX.ExecSQL;

      Except
      End;

      Try

         qryAUX.SQL.Clear;
         qryAUX.SQL.Add('  CREATE TABLE "Igreja".funcao ');
         qryAUX.SQL.Add('  (  ');
         qryAUX.SQL.Add('  id serial NOT NULL, ');
         qryAUX.SQL.Add('  status char(1) NOT NULL,  ');
         qryAUX.SQL.Add('  descricao varchar(100) NOT NULL  ');
         qryAUX.SQL.Add('  )  ');
         qryAUX.ExecSQL;

      Except
      End;

      Try

         qryAUX.SQL.Clear;
         qryAUX.SQL.Add('CREATE TABLE "Igreja".membros ');
         qryAUX.SQL.Add('(  ');
         qryAUX.SQL.Add('  id serial NOT NULL, ');
         qryAUX.SQL.Add('  id_paroquia integer, ');
         qryAUX.SQL.Add('  id_funcao integer, ');
         qryAUX.SQL.Add('  status char(1) NOT NULL, ');
         qryAUX.SQL.Add('  nome varchar(100) NOT NULL,  ');
         qryAUX.SQL.Add('  logradouro varchar(100) NOT NULL, ');
         qryAUX.SQL.Add('  numero varchar(30) NOT NULL, ');
         qryAUX.SQL.Add('  complemento varchar(100), ');
         qryAUX.SQL.Add('  bairro varchar(80) NOT NULL,  ');
         qryAUX.SQL.Add('  id_cidade integer NOT NULL,  ');
         qryAUX.SQL.Add('  fone_fixo char(10),  ');
         qryAUX.SQL.Add('  celular1 char(11),  ');
         qryAUX.SQL.Add('  celular2 char(11),  ');
         qryAUX.SQL.Add('  email varchar(80) ');
         qryAUX.SQL.Add('  )  ');
         qryAUX.ExecSQL;

      Except
      End;

      Try

         qryAUX.SQL.Clear;
         qryAUX.SQL.Add(' CREATE TABLE "Igreja".tipo_documento ');
         qryAUX.SQL.Add(' (  ');
         qryAUX.SQL.Add(' id serial NOT NULL,  ');
         qryAUX.SQL.Add(' status char(1) NOT NULL,  ');
         qryAUX.SQL.Add(' descricao varchar(100) NOT NULL  ');
         qryAUX.SQL.Add(' ) ');
         qryAUX.ExecSQL;

      Except
      End;

     { Try

         qryAUX.SQL.Clear;
         qryAUX.SQL.Add(' CREATE TABLE "Igreja".condicao_pagamento  ');
         qryAUX.SQL.Add(' (  ');
         qryAUX.SQL.Add(' id serial NOT NULL, ');
         qryAUX.SQL.Add(' id_tipo_documento integer NOT NULL,  ');
         qryAUX.SQL.Add(' status char(1) NOT NULL, ');
         qryAUX.SQL.Add(' descricao varchar(100) NOT NULL, ');
         qryAUX.SQL.Add(' percentual double precision, ');
         qryAUX.SQL.Add(' dias integer  ');
         qryAUX.SQL.Add(' ) ');
         qryAUX.ExecSQL;

      Except
      End;

      Try

         qryAUX.SQL.Clear;
         qryAUX.SQL.Add(' DROP TABLE "Igreja".condicao_pagamento  ');
         qryAUX.ExecSQL;

      Except
      End;  }

      Try

         qryAUX.SQL.Clear;
         qryAUX.SQL.Add(' CREATE TABLE "Igreja".condicao_pagamento  ');
         qryAUX.SQL.Add(' (  ');
         qryAUX.SQL.Add(' id serial NOT NULL, ');
         qryAUX.SQL.Add(' status char(1) NOT NULL, ');
         qryAUX.SQL.Add(' descricao varchar(100) NOT NULL ');
         qryAUX.SQL.Add(' ) ');
         qryAUX.ExecSQL;

      Except
      End;

      Try

         qryAUX.SQL.Clear;
         qryAUX.SQL.Add(' CREATE TABLE "Igreja".parcelas ');
         qryAUX.SQL.Add(' (  ');
         qryAUX.SQL.Add(' id serial NOT NULL,  ');
         qryAUX.SQL.Add(' id_condicao_pagamento integer NOT NULL,  ');
         qryAUX.SQL.Add(' descricao varchar(100) NOT NULL,  ');
         qryAUX.SQL.Add(' percentual double precision,  ');
         qryAUX.SQL.Add(' dias integer ');
         qryAUX.SQL.Add(' ) ');
         qryAUX.ExecSQL;

      Except
      End;

      Try

         qryAUX.SQL.Clear;
         qryAUX.SQL.Add(' CREATE TABLE "Igreja".eventos  ');
         qryAUX.SQL.Add(' (   ');
         qryAUX.SQL.Add(' id serial NOT NULL,  ');
         qryAUX.SQL.Add(' id_paroquia integer NOT NULL,  ');
         qryAUX.SQL.Add(' dtIni: date, ');
         qryAUX.SQL.Add(' dtFim: date, ');
         qryAUX.SQL.Add(' descricao varchar(100) NOT NULL, ');
         qryAUX.SQL.Add(' obs: blob ');
         qryAUX.SQL.Add(' ) ');
         qryAUX.ExecSQL;

      Except
      End;

      Try

         qryAUX.SQL.Clear;
         qryAUX.SQL.Add(' ALTER TABLE "Igreja".eventos ADD status CHAR(1) ');
         qryAUX.ExecSQL;

      Except
      End;

   Finally

      FreeAndNil(qryAUX);

   End;

end;

class function TBiblioteca.convertir_utf8_ansi(const Source: string): string;
var
   Iterator, SourceLength, FChar, NChar: Integer;
begin
   Result := '';
   Iterator := 0;
   SourceLength := Length(Source);
   while Iterator < SourceLength do
   begin
      Inc(Iterator);
      FChar := Ord(Source[Iterator]);
      if FChar >= $80 then
      begin
         Inc(Iterator);
         if Iterator > SourceLength then break;
         FChar := FChar and $3F;
         if (FChar and $20) <> 0 then
         begin
            FChar := FChar and $1F;
            NChar := Ord(Source[Iterator]);
            if (NChar and $C0) <> $80 then break;
            FChar := (FChar shl 6) or (NChar and $3F);
            Inc(Iterator);
            if Iterator > SourceLength then break;
         end;
         NChar := Ord(Source[Iterator]);
         if (NChar and $C0) <> $80 then break;
         Result := Result + WideChar((FChar shl 6) or (NChar and $3F));
      end
      else
         Result := Result + WideChar(FChar);
   end;

end;

class function TBiblioteca.Cronometro(Data: TDateTime): String;
var
  iData1, iData2:  String;
begin
  iData1 := TimeToStr(Data);
  iData2 := TimeToStr( (StrToTime(iData1) + 0.0000115741) );
  iData1 := iData2;

  Result := iData1;
end;

class function TBiblioteca.ExtensoMes(n: Integer): String;
begin

   Case n Of

      1 : Result := 'Janeiro';
      2 : Result := 'Fevereiro';
      3 : Result := 'Março';
      4 : Result := 'Abril';
      5 : Result := 'Maio';
      6 : Result := 'Junho';
      7 : Result := 'Julho';
      8 : Result := 'Agosto';
      9 : Result := 'Setembro';
      10 : Result := 'Outubro';
      11 : Result := 'Novembro';
      12 : Result := 'Dezembro';

   end;

end;

class function TBiblioteca.GetStrNumber(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;

    Inc(vText);
  end;
end;

class function TBiblioteca.GetStrNumberComVirgula(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9',',']) then
    {$ELSE}
    if vText^ in ['0'..'9',','] then
    {$ENDIF}
      Result := Result + vText^;

    Inc(vText);
  end;
end;

class procedure TBiblioteca.Importar;
begin

end;

class function TBiblioteca.mascaraCPFCNPJ(texto: string): string;
begin

   if Length(Trim(GetStrNumber(texto))) = 14 then
      Result := Copy(Trim(GetStrNumber(texto)),1,2)+'.'+
                Copy(Trim(GetStrNumber(texto)),3,3)+'.'+
                Copy(Trim(GetStrNumber(texto)),6,3)+'/'+
                Copy(Trim(GetStrNumber(texto)),9,4)+'-'+
                Copy(Trim(GetStrNumber(texto)),13,2)
   else if Length(Trim(GetStrNumber(texto))) = 11 then
      Result := Copy(Trim(GetStrNumber(texto)),1,3)+'.'+
                Copy(Trim(GetStrNumber(texto)),4,3)+'.'+
                Copy(Trim(GetStrNumber(texto)),7,3)+'-'+
                Copy(Trim(GetStrNumber(texto)),10,2);

end;

class function TBiblioteca.MD5(const texto: string): string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;

class function TBiblioteca.ParseTexto(const Texto: AnsiString; const Decode,
  IsUTF8: Boolean): String;
var
  AStr: String;

  function InternalStringReplace(const S, OldPatern, NewPattern: String ): String;
  begin
    if pos(OldPatern, S) > 0 then
      Result := ReplaceString(AnsiString(S), AnsiString(OldPatern), AnsiString(ACBrStr(NewPattern)))
    else
      Result := S;
  end;

begin
  if Decode then
  begin
    Astr := DecodeToString( Texto, IsUTF8 ) ;

    Astr := InternalStringReplace(AStr, '&amp;'   , '&');
    AStr := InternalStringReplace(AStr, '&lt;'    , '<');
    AStr := InternalStringReplace(AStr, '&gt;'    , '>');
    AStr := InternalStringReplace(AStr, '&quot;'  , '"');
    AStr := InternalStringReplace(AStr, '&#39;'   , #39);
    AStr := InternalStringReplace(AStr, '&aacute;', 'á');
    AStr := InternalStringReplace(AStr, '&Aacute;', 'Á');
    AStr := InternalStringReplace(AStr, '&acirc;' , 'â');
    AStr := InternalStringReplace(AStr, '&Acirc;' , 'Â');
    AStr := InternalStringReplace(AStr, '&atilde;', 'ã');
    AStr := InternalStringReplace(AStr, '&Atilde;', 'Ã');
    AStr := InternalStringReplace(AStr, '&agrave;', 'à');
    AStr := InternalStringReplace(AStr, '&Agrave;', 'À');
    AStr := InternalStringReplace(AStr, '&eacute;', 'é');
    AStr := InternalStringReplace(AStr, '&Eacute;', 'É');
    AStr := InternalStringReplace(AStr, '&ecirc;' , 'ê');
    AStr := InternalStringReplace(AStr, '&Ecirc;' , 'Ê');
    AStr := InternalStringReplace(AStr, '&iacute;', 'í');
    AStr := InternalStringReplace(AStr, '&Iacute;', 'Í');
    AStr := InternalStringReplace(AStr, '&oacute;', 'ó');
    AStr := InternalStringReplace(AStr, '&Oacute;', 'Ó');
    AStr := InternalStringReplace(AStr, '&otilde;', 'õ');
    AStr := InternalStringReplace(AStr, '&Otilde;', 'Õ');
    AStr := InternalStringReplace(AStr, '&ocirc;' , 'ô');
    AStr := InternalStringReplace(AStr, '&Ocirc;' , 'Ô');
    AStr := InternalStringReplace(AStr, '&uacute;', 'ú');
    AStr := InternalStringReplace(AStr, '&Uacute;', 'Ú');
    AStr := InternalStringReplace(AStr, '&uuml;'  , 'ü');
    AStr := InternalStringReplace(AStr, '&Uuml;'  , 'Ü');
    AStr := InternalStringReplace(AStr, '&ccedil;', 'ç');
    AStr := InternalStringReplace(AStr, '&Ccedil;', 'Ç');
    AStr := InternalStringReplace(AStr, '&apos;'  , '''');
  end
  else
  begin
    AStr := string(Texto);
    AStr := StringReplace(AStr, '&', '&amp;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, '<', '&lt;'  , [rfReplaceAll]);
    AStr := StringReplace(AStr, '>', '&gt;'  , [rfReplaceAll]);
    AStr := StringReplace(AStr, '"', '&quot;', [rfReplaceAll]);
    AStr := StringReplace(AStr, #39, '&#39;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, '''','&apos;', [rfReplaceAll]);
    AStr := StringReplace(AStr, 'Á','&Aacute;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'â','&acirc;'  , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'Â','&Acirc;'  , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'ã','&atilde;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'Ã','&Atilde;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'à','&agrave;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'À','&Agrave;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'é','&eacute;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'É','&Eacute;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'ê','&ecirc;'  , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'Ê','&Ecirc;'  , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'í','&iacute;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'Í','&Iacute;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'ó','&oacute;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'Ó','&Oacute;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'õ','&otilde;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'Õ','&Otilde;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'ô','&ocirc;'  , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'Ô','&Ocirc;'  , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'ú','&uacute;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'Ú','&Uacute;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'ü','&uuml;'   , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'Ü','&Uuml;'   , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'ç','&ccedil;' , [rfReplaceAll]);
    AStr := StringReplace(AStr, 'Ç','&Ccedil;' , [rfReplaceAll]);

  end;

  Result := AStr;
end;

class function TBiblioteca.RetornarUFporID(id: integer): String;
begin

   case id of

      0:  Result := 'AC';
      1:  Result := 'AL';
      2:  Result := 'AP';
      3:  Result := 'AM';
      4:  Result := 'BA';
      5:  Result := 'CE';
      6:  Result := 'DF';
      7:  Result := 'ES';
      8:  Result := 'GO';
      9:  Result := 'MA';
      10: Result := 'MT';
      11: Result := 'MS';
      12: Result := 'MG';
      13: Result := 'PA';
      14: Result := 'PB';
      15: Result := 'PR';
      16: Result := 'PE';
      17: Result := 'PI';
      18: Result := 'RJ';
      19: Result := 'RN';
      20: Result := 'RS';
      21: Result := 'RO';
      22: Result := 'RR';
      23: Result := 'SC';
      24: Result := 'SP';
      25: Result := 'SE';
      26: Result := 'TO';

   end;

end;

class function TBiblioteca.Servidor: String;
begin

   //52.43.122.194:8080 191.252.156.134
   Result := 'http://191.252.156.134:8080/datasnap/rest/TSM';

end;

class function TBiblioteca.SplashTela: TForm;
begin

   thread.create;
   Result := tela;

end;
{ thread }

constructor thread.create;
begin

   inherited;
   FreeOnTerminate := True;

end;

procedure thread.Execute;
begin
end;

end.
