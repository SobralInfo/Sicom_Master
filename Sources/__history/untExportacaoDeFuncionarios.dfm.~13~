object frmExportacaoDeFuncionarios: TfrmExportacaoDeFuncionarios
  Left = 0
  Top = 0
  AlphaBlend = True
  BorderIcons = [biSystemMenu]
  Caption = 'Exporta'#231#227'o de Funcion'#225'rios'
  ClientHeight = 561
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton3: TSpeedButton
    Left = 335
    Top = 515
    Width = 154
    Height = 37
    Caption = 'Carregar Dados'
    OnClick = SpeedButton3Click
  end
  object SpeedButton1: TSpeedButton
    Left = 509
    Top = 515
    Width = 154
    Height = 37
    Caption = 'Exportar Funcion'#225'rios'
    OnClick = SpeedButton1Click
  end
  object DBGrid1: TDBGrid
    Left = 11
    Top = 8
    Width = 960
    Height = 498
    DataSource = dtsFuncionarios
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Width = 131
        Visible = True
      end>
  end
  object dtsFuncionarios: TDataSource
    DataSet = qryFuncionarios
    Left = 672
    Top = 360
  end
  object qryFuncionarios: TFDQuery
    Connection = frmPrincipal.Conexao
    SQL.Strings = (
      
        'SELECT f.cod_funcionario AS id, F.nome_funcionario AS nome, '#39'A'#39' ' +
        'as STATUS FROM funcionarios f order by nome')
    Left = 592
    Top = 360
    object qryFuncionariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'COD_FUNCIONARIO'
      Required = True
    end
    object qryFuncionariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME_FUNCIONARIO'
      Size = 65
    end
    object qryFuncionariosSTATUS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
  end
end
