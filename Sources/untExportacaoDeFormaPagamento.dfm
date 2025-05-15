object frmExportacaoDeFormaPagamento: TfrmExportacaoDeFormaPagamento
  Left = 0
  Top = 0
  AlphaBlend = True
  BorderIcons = [biSystemMenu]
  Caption = 'Exporta'#231#227'o de Forma de Pagamento'
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
    Caption = 'Exportar Forma de PG'
    OnClick = SpeedButton1Click
  end
  object DBGrid1: TDBGrid
    Left = 11
    Top = 9
    Width = 960
    Height = 496
    DataSource = dtFormaPG
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
        FieldName = 'DESCRICAO'
        Width = 295
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERMITE_TROCO'
        Title.Caption = 'PERMITE TROCO'
        Width = 134
        Visible = True
      end>
  end
  object dtFormaPG: TDataSource
    DataSet = qryFormaPG
    Left = 672
    Top = 360
  end
  object qryFormaPG: TFDQuery
    Connection = frmPrincipal.Conexao
    SQL.Strings = (
      
        'SELECT f.id, F.descricao, '#39'A'#39' as STATUS, f.permite_troco FROM ec' +
        'f_tipo_pagamento f order by f.descricao')
    Left = 592
    Top = 360
    object qryFormaPGID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFormaPGDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
    end
    object qryFormaPGSTATUS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryFormaPGPERMITE_TROCO: TStringField
      FieldName = 'PERMITE_TROCO'
      Origin = 'PERMITE_TROCO'
      FixedChar = True
      Size = 1
    end
  end
end
