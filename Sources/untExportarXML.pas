unit untExportarXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, unitConfiguracoes,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmExportarXML = class(TForm)
    Panel5: TPanel;
    Label3: TLabel;
    Image1: TImage;
    Label6: TLabel;
    Label2: TLabel;
    cbbAno: TComboBox;
    cbbMes: TComboBox;
    Image5: TImage;
    Image4: TImage;
    Image3: TImage;
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Confirmar;
  end;

var
  frmExportarXML: TfrmExportarXML;

implementation

{$R *.dfm}

uses untPrincipal;

procedure TfrmExportarXML.Confirmar;
Var origem, destino, mesAno, sChave, pasta: String;
    query: tfDQuery;
    cArq : TStringList;
begin

   Try

      Query := TFDQuery.Create(nil);
      Query.Connection := frmPrincipal.ConexaoLocal;
      Query.sql.Text := ' select CHAVE_NFCE, status from VENDA_CABECALHO WHERE data_hora_venda BETWEEN :dtIni AND :dtFim ';

      case cbbMes.ItemIndex of

         0: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/01/'+Trim(cbbAno.Text)+' 00:00:00');
               query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('31/01/'+Trim(cbbAno.Text)+' 23:59:59');
            End;
         1: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/02/'+Trim(cbbAno.Text)+' 00:00:00');
               if IsLeapYear(StrToInt(cbbAno.Text)) then
                  query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('29/02/'+Trim(cbbAno.Text)+' 23:59:59')
               else
                  query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('28/02/'+Trim(cbbAno.Text)+' 23:59:59');
            End;
         2: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/03/'+Trim(cbbAno.Text)+' 00:00:00');
               query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('31/03/'+Trim(cbbAno.Text)+' 23:59:59');
            End;
         3: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/04/'+Trim(cbbAno.Text)+' 00:00:00');
               query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('30/04/'+Trim(cbbAno.Text)+' 23:59:59');
            End;
         4: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/05/'+Trim(cbbAno.Text)+' 00:00:00');
               query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('31/05/'+Trim(cbbAno.Text)+' 23:59:59');
            End;
         5: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/06/'+Trim(cbbAno.Text)+' 00:00:00');
               query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('30/06/'+Trim(cbbAno.Text)+' 23:59:59');
            End;
         6: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/07/'+Trim(cbbAno.Text)+' 00:00:00');
               query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('31/07/'+Trim(cbbAno.Text)+' 23:59:59');
            End;
         7: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/08/'+Trim(cbbAno.Text)+' 00:00:00');
               query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('31/08/'+Trim(cbbAno.Text)+' 23:59:59');
            End;
         8: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/09/'+Trim(cbbAno.Text)+' 00:00:00');
               query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('30/09/'+Trim(cbbAno.Text)+' 23:59:59');
            End;
         9: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/10/'+Trim(cbbAno.Text)+' 00:00:00');
               query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('31/10/'+Trim(cbbAno.Text)+' 23:59:59');
            End;
        10: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/11/'+Trim(cbbAno.Text)+' 00:00:00');
               query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('30/11/'+Trim(cbbAno.Text)+' 23:59:59');
            End;
        11: Begin
               query.Params.ParamByName('dtIni').AsDateTime := StrToDateTime('01/12/'+Trim(cbbAno.Text)+' 00:00:00');
               query.Params.ParamByName('dtFim').AsDateTime := StrToDateTime('31/12/'+Trim(cbbAno.Text)+' 23:59:59');
            End;

      end;

      Query.Open;
      query.First;

      if query.IsEmpty then Begin

         prcMsgAdv('Nenhuma venda realizada no período');
         Exit;

      End;

      while Not(query.Eof) do Begin

         pasta := 'Liberados\';

         if Trim(query.FieldByName('status').AsString) = 'C' then
            pasta := 'Cancelados\';

         mesAno := Copy(Trim(cbbAno.Text),3,2)+Trim(FormatFloat('#00', cbbMes.ItemIndex + 1));
         origem  := ExtractFilePath(Application.ExeName)+'Vendas\NFCE20'+mesAno+'\'+Trim(query.FieldByName('CHAVE_NFCE').AsString)+'-nfe.xml';
         ForceDirectories(ExtractFilePath(Application.ExeName)+'Contabilidade\XML_NFCE_'+Trim(cbbMes.Text)+'_'+Trim(cbbAno.Text)+'\'+pasta);
         Destino := ExtractFilePath(Application.ExeName)+'Contabilidade\XML_NFCE_'+Trim(cbbMes.Text)+'_'+Trim(cbbAno.Text)+'\'+pasta+Trim(query.FieldByName('CHAVE_NFCE').AsString)+'-nfe.xml';

         CopyFile(PChar(origem), PChar(Destino), True);

         query.Next;

      End;

      prcMsgInf('Arquivos gerados com sucesso na pasta abaixo.'+#13+ExtractFilePath(Application.ExeName)+'Contabilidade\XML_NFCE_'+Trim(cbbMes.Text)+'_'+Trim(cbbAno.Text));

   Finally

      FreeAndNil(query);

   End;

end;

procedure TfrmExportarXML.FormCreate(Sender: TObject);
Var mes, ano: integer;
begin

   mes := strtoint(FormatDateTime('MM', date));
   ano := strtoint(FormatDateTime('YYYY', date));

   case mes of

      1:  cbbMes.ItemIndex := 0;
      2:  cbbMes.ItemIndex := 1;
      3:  cbbMes.ItemIndex := 2;
      4:  cbbMes.ItemIndex := 3;
      5:  cbbMes.ItemIndex := 4;
      6:  cbbMes.ItemIndex := 5;
      7:  cbbMes.ItemIndex := 6;
      8:  cbbMes.ItemIndex := 7;
      9:  cbbMes.ItemIndex := 8;
      10: cbbMes.ItemIndex := 9;
      11: cbbMes.ItemIndex := 10;
      12: cbbMes.ItemIndex := 11;

   end;

   case ano of

      2021: cbbAno.ItemIndex := 0;
      2022: cbbAno.ItemIndex := 1;
      2023: cbbAno.ItemIndex := 2;
      2024: cbbAno.ItemIndex := 3;
      2025: cbbAno.ItemIndex := 4;
      2026: cbbAno.ItemIndex := 5;
      2027: cbbAno.ItemIndex := 6;
      2028: cbbAno.ItemIndex := 7;
      2029: cbbAno.ItemIndex := 8;
      2030: cbbAno.ItemIndex := 9;

   end;


end;

procedure TfrmExportarXML.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   case key of

      VK_ESCAPE: close;
      VK_F12: confirmar;

   end;

end;

procedure TfrmExportarXML.Image1Click(Sender: TObject);
begin

   close;

end;

procedure TfrmExportarXML.Image4Click(Sender: TObject);
begin

   close;

end;

procedure TfrmExportarXML.Image5Click(Sender: TObject);
begin

   Confirmar;

end;

end.
