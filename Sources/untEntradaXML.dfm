object frmEntradaXML: TfrmEntradaXML
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Entrada de Notas Fiscais'
  ClientHeight = 650
  ClientWidth = 954
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel9: TPanel
    Left = 0
    Top = 31
    Width = 954
    Height = 619
    Align = alClient
    BevelOuter = bvNone
    Color = 15395562
    ParentBackground = False
    TabOrder = 0
    object Label5: TLabel
      Left = 26
      Top = 16
      Width = 107
      Height = 16
      AutoSize = False
      Caption = 'CNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7039851
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 179
      Top = 16
      Width = 107
      Height = 16
      AutoSize = False
      Caption = 'Raz'#227'o Social'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7039851
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Image2: TImage
      Left = 855
      Top = 13
      Width = 72
      Height = 34
      Cursor = crHandPoint
      Center = True
      Transparent = True
      OnClick = Image2Click
    end
    object SpeedButton1: TSpeedButton
      Left = 855
      Top = 13
      Width = 72
      Height = 34
      Cursor = crHandPoint
      Flat = True
    end
    object Label8: TLabel
      Left = 26
      Top = 32
      Width = 71
      Height = 16
      AutoSize = False
      Caption = 'Emitente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7039851
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 179
      Top = 32
      Width = 71
      Height = 16
      AutoSize = False
      Caption = 'Emitente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7039851
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 462
      Top = 16
      Width = 107
      Height = 16
      AutoSize = False
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7039851
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 462
      Top = 32
      Width = 71
      Height = 16
      AutoSize = False
      Caption = 'Emiss'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7039851
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 546
      Top = 16
      Width = 107
      Height = 16
      AutoSize = False
      Caption = 'Chave'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7039851
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 546
      Top = 32
      Width = 71
      Height = 16
      AutoSize = False
      Caption = 'Acesso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7039851
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBCtrlGrid3: TDBCtrlGrid
      Left = 16
      Top = 57
      Width = 919
      Height = 563
      Cursor = crHandPoint
      AllowDelete = False
      AllowInsert = False
      Color = 16053492
      DataSource = dtsNFe
      Orientation = goHorizontal
      PanelBorder = gbNone
      PanelHeight = 39
      PanelWidth = 919
      ParentColor = False
      TabOrder = 0
      RowCount = 14
      SelectedColor = 8454143
      OnPaintPanel = DBCtrlGrid3PaintPanel
      object DBText10: TDBText
        Left = 163
        Top = 4
        Width = 277
        Height = 17
        Color = 6710886
        DataField = 'RAZAO_EMIT'
        DataSource = dtsNFe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6710886
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object DBText13: TDBText
        Left = 10
        Top = 4
        Width = 146
        Height = 17
        Color = 6710886
        DataField = 'CNPJ_EMIT'
        DataSource = dtsNFe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6710886
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object imgUnlock: TImage
        Left = 839
        Top = 4
        Width = 32
        Height = 29
        Cursor = crHandPoint
        Center = True
        OnClick = imgUnlockClick
      end
      object DBText1: TDBText
        Left = 446
        Top = 4
        Width = 86
        Height = 17
        Color = 6710886
        DataField = 'DATA_EMISSAO'
        DataSource = dtsNFe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6710886
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 591
        Top = 21
        Width = 89
        Height = 17
        Color = 6710886
        DataField = 'VALOR_TOTAL'
        DataSource = dtsNFe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6710886
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Image1: TImage
        Left = 879
        Top = 4
        Width = 32
        Height = 29
        Cursor = crHandPoint
        Center = True
        OnClick = Image1Click
      end
      object DBText3: TDBText
        Left = 210
        Top = 21
        Width = 94
        Height = 17
        Color = 6710886
        DataField = 'SITUACAO'
        DataSource = dtsNFe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6710886
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 367
        Top = 21
        Width = 106
        Height = 17
        Color = 6710886
        DataField = 'NUMERO'
        DataSource = dtsNFe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6710886
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 481
        Top = 21
        Width = 40
        Height = 17
        Color = 6710886
        DataField = 'SERIE'
        DataSource = dtsNFe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6710886
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label1: TLabel
        Left = 163
        Top = 21
        Width = 44
        Height = 16
        AutoSize = False
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 315
        Top = 21
        Width = 49
        Height = 16
        AutoSize = False
        Caption = 'N'#250'mero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 446
        Top = 21
        Width = 34
        Height = 16
        AutoSize = False
        Caption = 'S'#233'rie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 530
        Top = 21
        Width = 61
        Height = 16
        AutoSize = False
        Caption = 'Valor NFe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 530
        Top = 4
        Width = 294
        Height = 17
        Color = 6710886
        DataField = 'CHAVE_ACESSO'
        DataSource = dtsNFe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6710886
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
    object Panel2: TPanel
      Left = 46
      Top = 125
      Width = 851
      Height = 427
      TabOrder = 1
      Visible = False
      object RLReport1: TRLReport
        Left = 30
        Top = 32
        Width = 794
        Height = 1123
        DataSource = dtsRel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        object RLBand1: TRLBand
          Left = 38
          Top = 38
          Width = 718
          Height = 75
          BandType = btHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = False
          object RLDBText2: TRLDBText
            Left = 7
            Top = 9
            Width = 58
            Height = 15
            DataField = 'FANTASIA'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText12: TRLDBText
            Left = 7
            Top = 28
            Width = 702
            Height = 16
            AutoSize = False
            DataField = 'calcEndereco'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLDBText13: TRLDBText
            Left = 7
            Top = 50
            Width = 338
            Height = 16
            AutoSize = False
            DataField = 'CHAVE_NFE'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = 'Chave NFe: '
          end
          object RLDBText14: TRLDBText
            Left = 353
            Top = 50
            Width = 141
            Height = 16
            AutoSize = False
            DataField = 'DATA_PEDIDO'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = 'Emiss'#227'o: '
          end
          object RLDBText15: TRLDBText
            Left = 502
            Top = 50
            Width = 141
            Height = 16
            AutoSize = False
            DataField = 'NUMERO_NOTA'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Text = 'N'#250'mero: '
          end
          object RLDBText16: TRLDBText
            Left = 650
            Top = 50
            Width = 59
            Height = 16
            AutoSize = False
            DataField = 'SERIE'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = 'S'#233'rie: '
          end
        end
        object RLBand2: TRLBand
          Left = 38
          Top = 157
          Width = 718
          Height = 49
          object RLDraw1: TRLDraw
            Left = 0
            Top = 2
            Width = 718
            Height = 44
          end
          object RLDBText1: TRLDBText
            Left = 7
            Top = 6
            Width = 92
            Height = 16
            AutoSize = False
            Color = clWhite
            DataField = 'CODIGO_ORIGEM'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText3: TRLDBText
            Left = 106
            Top = 6
            Width = 342
            Height = 16
            AutoSize = False
            Color = clWhite
            DataField = 'PROD_DESCRICAO'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText4: TRLDBText
            Left = 629
            Top = 6
            Width = 80
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Color = clWhite
            DataField = 'VL_UNITARIO'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText5: TRLDBText
            Left = 453
            Top = 6
            Width = 84
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Color = clWhite
            DataField = 'QTREAL'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText6: TRLDBText
            Left = 544
            Top = 6
            Width = 56
            Height = 16
            AutoSize = False
            Color = clWhite
            DataField = 'UND'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Text = ''
            Transparent = False
          end
          object RLDBText7: TRLDBText
            Left = 7
            Top = 25
            Width = 92
            Height = 16
            AutoSize = False
            DataField = 'ID_PRODUTO'
            DataSource = dtsRel
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 106
            Top = 25
            Width = 342
            Height = 16
            AutoSize = False
            DataField = 'DESCRICAO'
            DataSource = dtsRel
            Text = ''
          end
          object RLDBText9: TRLDBText
            Left = 623
            Top = 25
            Width = 86
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'PROD_VALOR_VENDA'
            DataSource = dtsRel
            Text = ''
          end
          object RLDBText10: TRLDBText
            Left = 454
            Top = 25
            Width = 83
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'UNIDADEPRODUTO'
            DataSource = dtsRel
            Text = ''
          end
          object RLDBText11: TRLDBText
            Left = 544
            Top = 25
            Width = 71
            Height = 16
            AutoSize = False
            DataField = 'calcUnidadeEntrada'
            DataSource = dtsRel
            Text = ''
          end
        end
        object RLBand3: TRLBand
          Left = 38
          Top = 113
          Width = 718
          Height = 44
          BandType = btHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Color = 15329769
          ParentColor = False
          Transparent = False
          object RLLabel1: TRLLabel
            Left = 7
            Top = 5
            Width = 73
            Height = 15
            Caption = 'C'#243'd. Origem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel2: TRLLabel
            Left = 106
            Top = 5
            Width = 106
            Height = 15
            Caption = 'Descri'#231#227'o Origem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel3: TRLLabel
            Left = 544
            Top = 5
            Width = 73
            Height = 15
            Caption = 'Und. Origem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel4: TRLLabel
            Left = 650
            Top = 5
            Width = 59
            Height = 15
            Alignment = taRightJustify
            Caption = 'Vl Origem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel5: TRLLabel
            Left = 453
            Top = 5
            Width = 78
            Height = 15
            Alignment = taRightJustify
            Caption = 'Qtde. Origem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel6: TRLLabel
            Left = 7
            Top = 24
            Width = 76
            Height = 15
            Caption = 'C'#243'd. Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel7: TRLLabel
            Left = 106
            Top = 24
            Width = 109
            Height = 15
            Caption = 'Descri'#231#227'o Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel8: TRLLabel
            Left = 453
            Top = 24
            Width = 78
            Height = 15
            Caption = 'Und. Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel9: TRLLabel
            Left = 544
            Top = 24
            Width = 75
            Height = 15
            Caption = 'Und. Entrada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel10: TRLLabel
            Left = 637
            Top = 24
            Width = 72
            Height = 15
            Caption = 'Valor Venda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
        object RLBand4: TRLBand
          Left = 38
          Top = 206
          Width = 718
          Height = 27
          BandType = btSummary
          object RLDBResult1: TRLDBResult
            Left = 7
            Top = 6
            Width = 218
            Height = 15
            DataField = 'DESCRICAO'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riCount
            ParentFont = False
            Text = 'Quantidade Total de Produtos: '
          end
          object RLDBResult2: TRLDBResult
            Left = 436
            Top = 6
            Width = 273
            Height = 15
            Alignment = taRightJustify
            DataField = 'VALOR_TOTAL_NOTA'
            DataSource = dtsRel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Text = 'Valor Total Nota: '
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 1
      Height = 618
      Align = alLeft
      BevelOuter = bvNone
      Color = 6710886
      ParentBackground = False
      TabOrder = 2
    end
    object Panel4: TPanel
      Left = 0
      Top = 618
      Width = 954
      Height = 1
      Align = alBottom
      BevelOuter = bvNone
      Color = 6710886
      ParentBackground = False
      TabOrder = 3
    end
    object Panel5: TPanel
      Left = 1
      Top = 0
      Width = 953
      Height = 618
      Align = alClient
      BevelOuter = bvNone
      Color = 15395562
      ParentBackground = False
      TabOrder = 4
      object Label14: TLabel
        Left = 26
        Top = 16
        Width = 107
        Height = 16
        AutoSize = False
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 179
        Top = 16
        Width = 107
        Height = 16
        AutoSize = False
        Caption = 'Raz'#227'o Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 26
        Top = 32
        Width = 71
        Height = 16
        AutoSize = False
        Caption = 'Emitente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 179
        Top = 32
        Width = 71
        Height = 16
        AutoSize = False
        Caption = 'Emitente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 462
        Top = 16
        Width = 107
        Height = 16
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 462
        Top = 32
        Width = 71
        Height = 16
        AutoSize = False
        Caption = 'Emiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 546
        Top = 16
        Width = 107
        Height = 16
        AutoSize = False
        Caption = 'Chave'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 546
        Top = 32
        Width = 71
        Height = 16
        AutoSize = False
        Caption = 'Acesso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7039851
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Image4: TImage
        Left = 855
        Top = 12
        Width = 72
        Height = 37
        Cursor = crHandPoint
        Hint = 'Pesquisar Por Notas na SEFAZ'
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
          003208060000001E3F88B1000000097048597300000B1300000B1301009A9C18
          000004614944415478DAED987D6C13651CC7BF4FBB5BB7AE736BB7AE6BD70E07
          C10E130941318A6F31E2C21F88A8898108243A05511337D39968D0F98A413787
          26CE4459F60723BE25BE9288281A3582219BCC18700C82AEEDD68D96DE8A5D5F
          77773EF734EBD6AC265071778E7E93A677CFF3DC3DDFCF3DBFE7F73C7704F344
          44690379903C88CA9507519BF2206A531E446D9A05621AF45C2789B88510C9A8
          B4B96C9224C2536FDF059DB547B282584EF9AA1293C9BD8490554A9B3D3F201C
          486AB41BC357D8FC6910EBF0B03E1E160ED3D3A54A1BBC409A7EBD1E2BBDB5B5
          5106621C703F494762A7D2BE726281D4C23B6BDBA640FA28C872A54DE506825E
          DEE958C1404C031E9E0659B9D2A672141F743A4CA91139E10E139012A51DE522
          1A5A1334B40C972808CD7984FE248D66561511C5E972B99D48DB6935596F4304
          B92DED9A90E96BC9F4F97F0E626D7B07DA7361F85C5B215C36DDBCB2E753E87F
          FD1D234F6D8354A4836DC75BD04462186D6E44DC61CDB887CEE343754717447D
          11469E7E1422C7C1DEFA3A046319465AB6CE0D48F5AE2E149D1A4264E9129CD9
          B28195E9FB8FA16AF707100C25F0BED04C8D8E52A3BB595DF4CAC5187B6453C6
          3D2C9D7B507CFC243B964193154638B6B741E20A30D4F1ECDC8070011ED69D9D
          D044E3F06FBE1B316AB4E665FAF4C3130C2C72553D0395819968A8789F6FC6A4
          2995100B82E3A8796E170B2506F2F803489A4D730F22ABA4EF3798BB3F62A191
          B0DB5034781AA1869BC1AF4DED6CA64064839C3F88D06A5AB7265567FCE220CA
          BEFA3E5DA728882C794E187EFE851DC7EB1C186D6A4C4FEC2990BF6EB806C527
          FF0489C5E07DD1C53643F667DA211572882EAE43E9A13E1580ECA5208753206C
          1E6CDB98CE38334192964A983EDE8F330FAE675DCA732978CF6A70A30194FED4
          AB2C88FEE8715475BD4F27B79E76CEA1800F815FD780D0AA1B6781F077365093
          AF21B6A896A66D9AB14EBBE17DC985F2CFBE5616443B7E0EB6573AA19D88C0DF
          782F4DC1A5B0BCD1CDEAC69AEE476CE1820C90B31BD6A272CF27301CE9676DC2
          D72E4360D35DA878EF736541AADEEE81FED820C2D72F47E0BE75ACCCB8EF1B94
          EDFF019315E5186E6DA24FDD9301A2FBC3036BFBBBACADCFB505F1CBED5941E4
          D08C3917A6FB120B0B590249569B2F32085DADEDAD1D74B216D085EB6148BA42
          562CAFD29637BBA1F3FA68AA7D022491602976FC8EDB10BAFD26D6C6DCF521FB
          97475156F9811F51B6EF2086B73F0681AE23B61D9DE0C6FC19DD893A1DFC0FAD
          47B47ED1C51F112208A98BB5DACC72BA2E906492752E4B5ED5C562DD3F6F39E8
          4391D7223985FF5B5DE29B46152A03C474C2139479943695A366BE58797AE9C1
          D54A3BCA4519AFBA34B45A6868BDAAB4A9DC4024170DAD76066277BB8B23111C
          A2596699D2C62E8C423A5AAA13560ED5D5C5D2F9D1303862E644A18766CC06A5
          FD9D27C5970949BB395C5F1390CF6625FA8A01F70AFAB6702B0532296D35AB7D
          09418D247D7B76C982DE99E5F3F723F6FF557910B5290FA236E541D4A63C88DA
          346F40FE06A22639515243AA3D0000000049454E44AE426082}
        ShowHint = True
        OnClick = Image4Click
      end
      object DBCtrlGrid1: TDBCtrlGrid
        Left = 16
        Top = 57
        Width = 919
        Height = 563
        Cursor = crHandPoint
        AllowDelete = False
        AllowInsert = False
        Color = 16053492
        DataSource = dtsNFe
        Orientation = goHorizontal
        PanelBorder = gbNone
        PanelHeight = 39
        PanelWidth = 919
        ParentColor = False
        TabOrder = 0
        RowCount = 14
        SelectedColor = 16771797
        OnPaintPanel = DBCtrlGrid3PaintPanel
        object DBText7: TDBText
          Left = 163
          Top = 4
          Width = 277
          Height = 17
          Color = 6710886
          DataField = 'RAZAO_EMIT'
          DataSource = dtsNFe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBText8: TDBText
          Left = 10
          Top = 4
          Width = 146
          Height = 17
          Color = 6710886
          DataField = 'CNPJ_EMIT'
          DataSource = dtsNFe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Image5: TImage
          Left = 839
          Top = 4
          Width = 32
          Height = 29
          Cursor = crHandPoint
          Hint = 'Baixar XML da Nota Fiscal'
          Center = True
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D494844520000001E0000
            001E08060000003B30AEA2000000097048597300000B1300000B1301009A9C18
            000000F64944415478DAEDD5BD0E01411007F019E44E4DEFA311A5081E412187
            C6D39C9A780C0FA062A93C01A2168D8F0710A5BB60EC858244E4762477113BCD
            4EB21FBFFCB3D92C02A3EAB6D82060C6EB09683BEA5A59D53350C31AD6B08635
            FCDB70AD2DD2D12B0C1031F132419402C4D8A33FCB7EFF3A4D874B045A938EB5
            63276EDAA270059CCA85493F4988E0488455D1ABCDD9895571BFA86FD80FAE82
            2AC19F705554197E87735016FC8CCBB714E5A06CD82BCB1E16BD51741B4BCE7E
            36FC6DFD21DCB0C7FDB0600A0D360C03F2F95C20E06AB506D775EF70DC34A15C
            290502CF670B3839CE1D96DF1E98327510E5C8B4F2DB0CEF8E6F61A3D0A8D0D6
            82C80000000049454E44AE426082}
          ShowHint = True
          OnClick = imgUnlockClick
        end
        object DBText9: TDBText
          Left = 446
          Top = 4
          Width = 86
          Height = 17
          Color = 6710886
          DataField = 'DATA_EMISSAO'
          DataSource = dtsNFe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBText11: TDBText
          Left = 591
          Top = 21
          Width = 89
          Height = 17
          Color = 6710886
          DataField = 'VALOR_TOTAL'
          DataSource = dtsNFe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Image6: TImage
          Left = 879
          Top = 4
          Width = 32
          Height = 29
          Cursor = crHandPoint
          Hint = 'Importar '#237'tens da Nota Fiscal'
          Center = True
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
            00200806000000737A7AF4000000097048597300000B1300000B1301009A9C18
            000003BA4944415478DAED965D685B6518C7FFEF7BCE49CE393D5906A9C374D9
            2652419813EB464D66D2898237228A179BA03286C240703870206C28A538995A
            C874CED5ABDD29F66ADE88577EDB89ED68713054D665EDDAB48D6B9A9C938FF3
            ED7B32536693364D5A3784FDEFCEFBBCEFF3FFE5799EF3E610DC66913B006B4D
            30997CE43EEA728F75C8FA597270C4BC6500E9F71F6C73F8B623C4C59B20C40F
            177F12EA1E0DBF3E34F89F02B82E483A197DC9053DC10EDFBD346E10E9BB74E0
            A113B197FBBF5A7780747FB4DBA1E4240189D680B15473D2FDB8B2210E93FA11
            2AA72E6E28CE3DD3FD6A727CCD0013FDD1CD1CA5EF32971709A93D93F545301E
            EC41816F5F5C53CC3974E6BECD078CF45B1D91C829B277D06E1A80194B1C2587
            98F1314288B234AE730A5281DD9865BFBC2ADE29619BF62B3A0A632CB95B6DDB
            2510F7F0E6C3435FAF0AC0EBF35472F75EEABAEFB101DBBA346E131ED7DA7662
            52D905877095350A07E1E26FD8A69E67107A4D4ED37231AF991F75F50E1F5A11
            60EE839E2E8B334FB250A25EC1326227C6599F752EB0B8BA519F4067FE7BC8D6
            7CCD09871521933790CE190848F4A7C4F1D1F88A00A54F7B7E601588E7CB361C
            C75D5C57854DB81CDC83BC105E5C93AC05DCCB8C437AAA6E0B73250B93591DBA
            E9DC0095B9C6008581C48FB28F7BD4F32E3088794BC255A51B33F2F6CAA457FA
            ECEAD8A20E23521C65ADAD9DAD22339C9C2F432BFF3BD61440F5F98FF6A791D2
            446449A83254E1E245D6E721084EB9C6D8B25DA459B933AAE1CD518D5A02B8BC
            753F16823B8099318426BE845FCFD424F6CC329A89E96C19761DE396018A868D
            E97B5E402EB40B3E238B1DBFBF83826E432D3BCCF48693CACAEC95BBF44F9F57
            52D300A9BF4A98552DDCB5FD7114B63C5901F0E430F3EB791397668AC897ED86
            C62D03D86C12AF6B169B66133E49465876E0E36965DFF4828E0B57B5559BB704
            50956139951EFB9979BB22DC7A80AABC8AB0ABF9F601DCACFF1D8024D09C22F2
            FBA37D23E75606F8A4E77359A4FBD60B80E7881DF40B6762C7475E2340CD2D51
            F7DF503B133F20F0F4431F4795E5123702F046252072E705C5FF6CECE82FB3CB
            ED5BF67BC07D1B7CA923F1317BED5E6183479B0150FCDC6C50C4730FF78EFEDC
            A8420DBF88D4D3B14D94E7BF90046ECFCD9BEB018802292AA2EF48AC6FF874A3
            BCAB06A82A7B2AFE84E4A767D95D10590AC0133801993FB791EF7CFE81DE4163
            B5399B02A84A1B48BCE1E3485F4635C50B131A82223F1668739EEA3A3636D56C
            AE96003CB9033BE5A9822F99C91A9F75F58D7CD34A8E3501ACA7EE00FC0D955E
            CE309EC5FB4A0000000049454E44AE426082}
          ShowHint = True
          OnClick = Image1Click
        end
        object DBText12: TDBText
          Left = 210
          Top = 21
          Width = 94
          Height = 17
          Color = 6710886
          DataField = 'SITUACAO'
          DataSource = dtsNFe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBText14: TDBText
          Left = 367
          Top = 21
          Width = 106
          Height = 17
          Color = 6710886
          DataField = 'NUMERO'
          DataSource = dtsNFe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBText15: TDBText
          Left = 481
          Top = 21
          Width = 40
          Height = 17
          Color = 6710886
          DataField = 'SERIE'
          DataSource = dtsNFe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label22: TLabel
          Left = 163
          Top = 21
          Width = 44
          Height = 16
          AutoSize = False
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7039851
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 315
          Top = 21
          Width = 49
          Height = 16
          AutoSize = False
          Caption = 'N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7039851
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 446
          Top = 21
          Width = 34
          Height = 16
          AutoSize = False
          Caption = 'S'#233'rie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7039851
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 530
          Top = 21
          Width = 61
          Height = 16
          AutoSize = False
          Caption = 'Valor NFe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 7039851
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText16: TDBText
          Left = 530
          Top = 4
          Width = 294
          Height = 17
          Color = 6710886
          DataField = 'CHAVE_ACESSO'
          DataSource = dtsNFe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object lblImportada: TDBText
          Left = 700
          Top = 21
          Width = 92
          Height = 17
          Color = 6710886
          DataField = 'calcImportada'
          DataSource = dtsNFe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 13500416
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object Panel11: TPanel
        Left = -58
        Top = 501
        Width = 851
        Height = 427
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 14932242
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
        object RLReport2: TRLReport
          Left = 29
          Top = 32
          Width = 794
          Height = 1123
          DataSource = dtsRel
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          object RLBand5: TRLBand
            Left = 38
            Top = 38
            Width = 718
            Height = 75
            BandType = btHeader
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = False
            object RLDBText17: TRLDBText
              Left = 7
              Top = 9
              Width = 58
              Height = 15
              DataField = 'FANTASIA'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
            object RLDBText18: TRLDBText
              Left = 7
              Top = 28
              Width = 702
              Height = 16
              AutoSize = False
              DataField = 'calcEndereco'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
            object RLDBText19: TRLDBText
              Left = 7
              Top = 50
              Width = 338
              Height = 16
              AutoSize = False
              DataField = 'CHAVE_NFE'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = 'Chave NFe: '
            end
            object RLDBText20: TRLDBText
              Left = 353
              Top = 50
              Width = 141
              Height = 16
              AutoSize = False
              DataField = 'DATA_PEDIDO'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = 'Emiss'#227'o: '
            end
            object RLDBText21: TRLDBText
              Left = 502
              Top = 50
              Width = 141
              Height = 16
              AutoSize = False
              DataField = 'NUMERO_NOTA'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Text = 'N'#250'mero: '
            end
            object RLDBText22: TRLDBText
              Left = 650
              Top = 50
              Width = 59
              Height = 16
              AutoSize = False
              DataField = 'SERIE'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = 'S'#233'rie: '
            end
          end
          object RLBand6: TRLBand
            Left = 38
            Top = 157
            Width = 718
            Height = 49
            object RLDraw2: TRLDraw
              Left = 0
              Top = 2
              Width = 718
              Height = 44
            end
            object RLDBText23: TRLDBText
              Left = 7
              Top = 6
              Width = 92
              Height = 16
              AutoSize = False
              Color = clWhite
              DataField = 'CODIGO_ORIGEM'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Text = ''
              Transparent = False
            end
            object RLDBText24: TRLDBText
              Left = 106
              Top = 6
              Width = 342
              Height = 16
              AutoSize = False
              Color = clWhite
              DataField = 'PROD_DESCRICAO'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Text = ''
              Transparent = False
            end
            object RLDBText25: TRLDBText
              Left = 629
              Top = 6
              Width = 80
              Height = 16
              Alignment = taRightJustify
              AutoSize = False
              Color = clWhite
              DataField = 'VL_UNITARIO'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Text = ''
              Transparent = False
            end
            object RLDBText26: TRLDBText
              Left = 453
              Top = 6
              Width = 84
              Height = 16
              Alignment = taRightJustify
              AutoSize = False
              Color = clWhite
              DataField = 'QTREAL'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Text = ''
              Transparent = False
            end
            object RLDBText27: TRLDBText
              Left = 544
              Top = 6
              Width = 56
              Height = 16
              AutoSize = False
              Color = clWhite
              DataField = 'UND'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Text = ''
              Transparent = False
            end
            object RLDBText28: TRLDBText
              Left = 7
              Top = 25
              Width = 92
              Height = 16
              AutoSize = False
              DataField = 'ID_PRODUTO'
              DataSource = dtsRel
              Text = ''
            end
            object RLDBText29: TRLDBText
              Left = 106
              Top = 25
              Width = 342
              Height = 16
              AutoSize = False
              DataField = 'DESCRICAO'
              DataSource = dtsRel
              Text = ''
            end
            object RLDBText30: TRLDBText
              Left = 623
              Top = 25
              Width = 86
              Height = 16
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'PROD_VALOR_VENDA'
              DataSource = dtsRel
              Text = ''
            end
            object RLDBText31: TRLDBText
              Left = 454
              Top = 25
              Width = 83
              Height = 16
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'UNIDADEPRODUTO'
              DataSource = dtsRel
              Text = ''
            end
            object RLDBText32: TRLDBText
              Left = 544
              Top = 25
              Width = 71
              Height = 16
              AutoSize = False
              DataField = 'calcUnidadeEntrada'
              DataSource = dtsRel
              Text = ''
            end
          end
          object RLBand7: TRLBand
            Left = 38
            Top = 113
            Width = 718
            Height = 44
            BandType = btHeader
            Borders.Sides = sdCustom
            Borders.DrawLeft = True
            Borders.DrawTop = True
            Borders.DrawRight = True
            Borders.DrawBottom = True
            Color = 15329769
            ParentColor = False
            Transparent = False
            object RLLabel11: TRLLabel
              Left = 7
              Top = 5
              Width = 73
              Height = 15
              Caption = 'C'#243'd. Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object RLLabel12: TRLLabel
              Left = 106
              Top = 5
              Width = 106
              Height = 15
              Caption = 'Descri'#231#227'o Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object RLLabel13: TRLLabel
              Left = 544
              Top = 5
              Width = 73
              Height = 15
              Caption = 'Und. Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object RLLabel14: TRLLabel
              Left = 650
              Top = 5
              Width = 59
              Height = 15
              Alignment = taRightJustify
              Caption = 'Vl Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object RLLabel15: TRLLabel
              Left = 453
              Top = 5
              Width = 78
              Height = 15
              Alignment = taRightJustify
              Caption = 'Qtde. Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object RLLabel16: TRLLabel
              Left = 7
              Top = 24
              Width = 76
              Height = 15
              Caption = 'C'#243'd. Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object RLLabel17: TRLLabel
              Left = 106
              Top = 24
              Width = 109
              Height = 15
              Caption = 'Descri'#231#227'o Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object RLLabel18: TRLLabel
              Left = 453
              Top = 24
              Width = 78
              Height = 15
              Caption = 'Und. Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object RLLabel19: TRLLabel
              Left = 544
              Top = 24
              Width = 75
              Height = 15
              Caption = 'Und. Entrada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
            object RLLabel20: TRLLabel
              Left = 637
              Top = 24
              Width = 72
              Height = 15
              Caption = 'Valor Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = False
            end
          end
          object RLBand8: TRLBand
            Left = 38
            Top = 206
            Width = 718
            Height = 27
            BandType = btSummary
            object RLDBResult3: TRLDBResult
              Left = 7
              Top = 6
              Width = 218
              Height = 15
              DataField = 'DESCRICAO'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Info = riCount
              ParentFont = False
              Text = 'Quantidade Total de Produtos: '
            end
            object RLDBResult4: TRLDBResult
              Left = 436
              Top = 6
              Width = 273
              Height = 15
              Alignment = taRightJustify
              DataField = 'VALOR_TOTAL_NOTA'
              DataSource = dtsRel
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Text = 'Valor Total Nota: '
            end
          end
        end
      end
      object Panel12: TPanel
        Left = 952
        Top = 0
        Width = 1
        Height = 618
        Align = alRight
        BevelOuter = bvNone
        Color = 6710886
        ParentBackground = False
        TabOrder = 2
      end
      object Panel8: TPanel
        Left = 3
        Top = 604
        Width = 949
        Height = 19
        BevelOuter = bvNone
        TabOrder = 3
      end
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 954
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    Color = 6710886
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 7
    ExplicitTop = 2
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 111
      Height = 16
      Caption = 'Importa'#231#227'o de XML'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Image3: TImage
      Left = 926
      Top = 4
      Width = 22
      Height = 22
      Cursor = crHandPoint
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000600000
        00600806000000E298773800000006624B474400FF00FF00FFA0BDA793000009
        774944415478DAED9D7B6C1CC519C0BFDD3DC74E6CE7E5B743080909061589FE
        4D213C52424CE2D82979567DAAAD9A52D19218A444546D5515DA502090D2428B
        1042FC07A808845A1CEA066843121E69C8D30E3149CAC369510871CE76E2DBDD
        61BED95DDFAE6F8DF77667665D79BEF8EE66CF773BEBDFEFE69BD9D939450315
        A98696F6014CF45002520E2520E55002520E2520E55002520E2520E55002520E
        2520E55002520E2520E5882560A075ED6C02DA56426031DDACC4E708DD180E32
        7CE7DBCE17887F9BF8F71CDC0EEC33F8C6826D125A2719BBFE91BF1F713C812A
        C3EB3F0736745A1AD954B3F3E56EE10210BE6D6BFBE83B6786829A58F0DDB7B1
        F21930ECABAA5EDFFE815001FDADEB9EA375DFAAE007E03BEFD7C8B3553B3B56
        17C3B36801D9E5EBFA40A59D42F8CE5D5FD51B1DD38AE119470051F043E1B387
        AA5D1D45318D256042C3F71F6B41BD840AD82E56C0B996B5BE23090331CA1F3F
        01E063C813A0E08796AB76CB10A0E08796114CF5EE57040B58B69628F8E1F031
        24085833A20F18E58F9F80F0F1A17A8F2C010A7EC870549600053F143E16AAF7
        FC5DB080A56B02B52AF8C1FAAADF942240C11FAD3E09025613057F94FAE8FBAB
        DFEA142F80377C9B3E9A84B0D7EB9A06197A1301DFB46DB0E9731AFD67D02AF4
        B0634D001F43B880BE5B56FB8F2831FC1CB1E1BC6543CEB6189C8CA6C324D0A1
        CCD09D83E3001F1FCE5B260CD9042C42D87E4BA8E4525D678FBCE0E37D8D1C01
        FCE00F9A16F453F815375E0BA517CF86B31D9DA0F59E82C97A06CAA80C6C113C
        E00F581690C67A98DE7C135C387E12CE75BE06E5285BD760127DE4011FCB356F
        FF43B480558437FCDA3B6E83192B96B1E7EDFE7EF84FFBDD601DEE8629288102
        D2D9A7343EFC7E0ADFB86C3ECC79E43E302AD9A50C38F3E2DFA0F7DEFB998452
        14A16989E1638817D0BC2AD84B7284EF859D75251CE982722AA15437DC03E503
        DF0B26E11E94A051D10694800649E04B1610BFC34528590AA7EECEDB617A4B73
        683D4CC2C6CD601E39CA2484F60951E05FD10473B66D01A3A23CB49E33CFBF04
        BDBF79102A3403A6D09E99D512133E4B41EFEC902120FE5073888E44B2660E4A
        68CE9FF5F34D5F58174A38B96133585D6E3AF2F7091CE07BF1C1E65FC150E7AB
        506164582B880B1F43828095242E7C2C0ED9CEA7BFF2DBEBA0FABBDF18B33E47
        C2269A8E7C2D81237C8CFF3DF624F43DF1341560B051515CF872042C59993FB4
        182759264B4126E4EA6A60EE138F805E3E36A0BC846E4782AF4F480ADFA2FBEE
        F9FA0FA0A4F7BF3405E9BE7390E2E1B314B4F7553902929CE162073C60E7409B
        3F0F2EDEFA5B30A656C258312C818E8ECA0D94A00384C11FA5C31D0DFE891FDF
        09F6A16E984CF3FF642A36097C0C2902924E2F600E3B4F610D50684CC243C54A
        E87287A8067B3E097CEB5017FBE4B35695103EDED78A1670F6E65B83B463CEED
        E0EF9804AF253CB425B28413773812B025803BAA1A0FF0B15CFBEFD7240A4838
        B1E6B504EC94F505F3604E440908F0244AA00031E2C29FCCE0D39115F1302483
        8F214F00A7594DDBDF12165C5A9C849FD261AC698E1BF8B851BB4F8600CE53CA
        813E01253C1C311D0D0EB29DE853A68C0BF87857BBEF75C102167F6DD43E20C9
        7C7EB04FA012B6DD1749429490051F43AE00CE1753BC96D0CFFA043E1264C267
        29E85D5902045DC962637A1B25382DE192DFFF2EB604D9F031E408107C19115B
        C2A0AF25C49190067CD607BCFB4FC1026E5AE19B8AE00FDF9B5E186E09A62361
        EEA30F449AB6C0C0CEF9F8FA8DD2E1E3AFEBF64B1220FA02FAC8E9854B504084
        D18E27E0C4FA76C81D3A4C4FB40C67161546CCA20A808F2145806CF851C7F9FE
        F0529079F0882301AFAC79AD40107C2CD7EDFF9758019F7D750519EFF00B25D0
        96A01B6E2AF21F365FF8F8537740B880365F0F3C7EE10724DCE64970FA038D5D
        F5E20F1F439E80FF03F84109ED4C024E399769EEA547CEF0590A3AB053828071
        02DF1EC0A9083BD2E808251C470907F22DC1BF308B077C96820E8A16B0A88D8C
        07F85E7E879C454748F783316D6A84F7645D09B463662B21DCD11127F8181204
        B4FA8E365DF838CEC7E6685CB6809D274496F0A38D8E046C096E3AE2019FA5A0
        836F4810304EE0E3C5148C7E93EEA3298684FD87A19C4A60EB8E38C0C7D7D41F
        122DE0C6D6C0D1A509BFCCBD86EBCC1D99AE8407A34B58BF0172B425E0EA3836
        3A4A081F439280F8F03106DDB59A3AA7CB88F959542AF4F2F954C2D6C812DEFF
        E106B0B063D60C3A422A5C92520C7C2CD41FDE255AC0F211E730C5C1C725E208
        2AD75007F39E7A34F2D291B1AEE10EB72ADA1A8C2BAF80B97FA4E9A8A2229284
        A3ABBE03933EEA65276B19C8CF19150B1F438A80245F8E18A2C3C673A609D3BE
        F74DA8F9FEB7B8C0F7F68DC541DB6909992B2F77D2510409A7FEF0389CFDD393
        50A165DC45BAF1E04B1170E686E541EA45C0C7C8D1C72C153069D142B8E8D73F
        8B0C3FEAAC267E3A589F405B5AE64B4D30F7B1AD634A38D97E375CD8BE032AF4
        0C9468101B3E4B414776CB10100F3E067E0963808E5AB21452FDA60D30A36DE9
        98F08B5D3A924F47B6D312BE40C2E9E75E808F7FB985C2D7D9B0544B001F4382
        8096C2F38088F0BDED9CFB29CDD254517FD74F60E6CA566EF0BDE79904DBEB98
        17C0BC3F3F5CD0317FFA9717E1A35F6C7196A7E357A320A47515015F9E8004F0
        BDB7615FE000B2A984DB61E6AAB602F8492FA678E9284B5B82D1341F2E7D7CDB
        B0043FFC527A2BE1009FA5A0AE3D82055CDF92A71813BE67306723202755542E
        BA1E4AE7CC86CFFEFA0A681F9F823243E37225CB066FB58505645603CC685902
        177A8E435FC70EE7248C237CDC6A902320397CEF8C13D3D105FC921EB1D8CB70
        DD73093DC1E5B95CD0E9139C3A4CBA85FB2DD11CF83CD28E5707C811B08CF082
        EF95F1CBA3167152061E50D225E205AF71EBC3A5F1B8120FEBC0AFA926ED7047
        C2C74243B76801D72DF3D71E0D3E00F0FC2AA8A88B2949E1E35D43F79BB20428
        F823E1634812A0E087C16729E8A870014B89820FA3D44353D0D1B7C40AF874E1
        523F6105DF5FC616F09E2C010A7E017C0C390214FC50F8F8AAC6F7DE162CE0DA
        5B82F415FC61F8F8D3784CA600053F001F439E0005BF003E161A8FBD23418082
        1F0A9FA5A01ED102AE69CE57A9E017D4214300FB0F1C14FCD03ACE36F6EC9D2E
        56C0D5CDCF138DB429F82175003C33AB67EF1AA1023EF9CA92261D6017AD6D86
        82EF2BDB70DA36CC2F5F746CFF874205609C5EB8783658DA03B4DE9BE96DEA04
        87DF478B2F13CD6C2F167E6C012AF88512907228012987129072280129871290
        722801298712907228012987129072280129871290727C0E0B321C5198F29318
        0000000049454E44AE426082}
      Stretch = True
      OnClick = Image3Click
    end
  end
  object ACBrNFe: TACBrNFe
    Configuracoes.Geral.SSLLib = libCustom
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpWinHttp
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.AdicionarLiteral = True
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.Arquivos.SepararPorMes = True
    Configuracoes.WebServices.UF = 'PR'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 808
    Top = 48
  end
  object dtsNFe: TDataSource
    DataSet = qryNFe
    Left = 808
    Top = 224
  end
  object qryNFe: TFDQuery
    OnCalcFields = qryNFeCalcFields
    Connection = frmPrincipal.ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      
        'SELECT * FROM MANIFESTACAO_NFE WHERE IE_EMIT <> '#39'IE'#39' ORDER BY ns' +
        'u DESC')
    Left = 760
    Top = 216
    object qryNFeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object qryNFeCOD_EMP: TIntegerField
      FieldName = 'COD_EMP'
      Origin = 'COD_EMP'
      Required = True
    end
    object qryNFeCHAVE_ACESSO: TStringField
      FieldName = 'CHAVE_ACESSO'
      Origin = 'CHAVE_ACESSO'
      Required = True
      Size = 44
    end
    object qryNFeSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object qryNFeNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object qryNFeCNPJ_EMIT: TStringField
      FieldName = 'CNPJ_EMIT'
      Origin = 'CNPJ_EMIT'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 18
    end
    object qryNFeRAZAO_EMIT: TStringField
      FieldName = 'RAZAO_EMIT'
      Origin = 'RAZAO_EMIT'
      Size = 80
    end
    object qryNFeIE_EMIT: TStringField
      FieldName = 'IE_EMIT'
      Origin = 'IE_EMIT'
    end
    object qryNFeDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
      Origin = 'DATA_EMISSAO'
    end
    object qryNFeTIPO_OPERACAO: TStringField
      FieldName = 'TIPO_OPERACAO'
      Origin = 'TIPO_OPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryNFeVALOR_TOTAL: TFMTBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      DisplayFormat = '###,#0.00'
      Precision = 18
      Size = 2
    end
    object qryNFeSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
    end
    object qryNFeSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object qryNFePROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
      Size = 50
    end
    object qryNFeDATA_REC: TDateField
      FieldName = 'DATA_REC'
      Origin = 'DATA_REC'
    end
    object qryNFeMANIFESTACAO: TStringField
      FieldName = 'MANIFESTACAO'
      Origin = 'MANIFESTACAO'
      FixedChar = True
      Size = 1
    end
    object qryNFeDOWNLOAD: TStringField
      FieldName = 'DOWNLOAD'
      Origin = 'DOWNLOAD'
      FixedChar = True
      Size = 1
    end
    object qryNFeAMBIENTE: TStringField
      FieldName = 'AMBIENTE'
      Origin = 'AMBIENTE'
      FixedChar = True
      Size = 1
    end
    object qryNFeVISIVEL: TStringField
      FieldName = 'VISIVEL'
      Origin = 'VISIVEL'
      FixedChar = True
      Size = 1
    end
    object qryNFeNSU: TIntegerField
      FieldName = 'NSU'
      Origin = 'NSU'
    end
    object qryNFeDATA_DOWNLOAD: TDateField
      FieldName = 'DATA_DOWNLOAD'
      Origin = 'DATA_DOWNLOAD'
    end
    object qryNFeIMPORTADA: TStringField
      FieldName = 'IMPORTADA'
      Origin = 'IMPORTADA'
      FixedChar = True
      Size = 1
    end
    object qryNFecalcImportada: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcImportada'
      Size = 25
      Calculated = True
    end
  end
  object qryRel: TFDQuery
    OnCalcFields = qryRelCalcFields
    Connection = frmPrincipal.ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      '   SELECT ne.*,'
      '          nd.*,'
      '          f.*, '
      '          p.*,            '
      '          u.id AS idUnidadeProd,'
      '          u.sigla AS unidadeProduto,'
      '          u.fator AS fatorProduto,'
      '          u1.id AS idUnidadeEntrada,'
      '          u1.sigla AS unidadeEntrada,'
      '          nd.fator_unidade AS fatorEntrada'
      
        '     FROM nota_entrada_cabecalho ne INNER JOIN nota_entrada_deta' +
        'lhe nd ON ne.id = nd.id_cabecalho'
      
        '                                           INNER JOIN produtos p' +
        ' ON nd.id_produto = p.id'
      
        '                                           INNER JOIN fornecedor' +
        'es f ON ne.id_fornecedor = f.id'
      
        '                                           INNER JOIN unidade_pr' +
        'odutos u ON p.id_unidade = u.id'
      
        '                                           INNER JOIN unidade_pr' +
        'odutos u1 ON nd.prod_id_unidade_entrada = u1.id'
      '    WHERE ne.numero_nota = :nota AND f.cpf_cnpj = :cnpj')
    Left = 752
    Top = 152
    ParamData = <
      item
        Name = 'NOTA'
        DataType = ftString
        ParamType = ptInput
        Size = 15
        Value = Null
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end>
    object qryRelID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryRelDATA_PEDIDO: TSQLTimeStampField
      FieldName = 'DATA_PEDIDO'
      Origin = 'DATA_PEDIDO'
    end
    object qryRelDATA_CHEGADA: TSQLTimeStampField
      FieldName = 'DATA_CHEGADA'
      Origin = 'DATA_CHEGADA'
    end
    object qryRelNUMERO_NOTA: TStringField
      FieldName = 'NUMERO_NOTA'
      Origin = 'NUMERO_NOTA'
      Size = 15
    end
    object qryRelID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
    end
    object qryRelSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryRelOUTROS: TFloatField
      FieldName = 'OUTROS'
      Origin = 'OUTROS'
    end
    object qryRelDESCONTO: TFloatField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
    end
    object qryRelFRETE: TFloatField
      FieldName = 'FRETE'
      Origin = 'FRETE'
    end
    object qryRelVALOR_NOTA: TFloatField
      FieldName = 'VALOR_NOTA'
      Origin = 'VALOR_NOTA'
    end
    object qryRelID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object qryRelSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      FixedChar = True
      Size = 3
    end
    object qryRelCHAVE_NFE: TStringField
      FieldName = 'CHAVE_NFE'
      Origin = 'CHAVE_NFE'
      FixedChar = True
      Size = 44
    end
    object qryRelTP_NF: TStringField
      FieldName = 'TP_NF'
      Origin = 'TP_NF'
      FixedChar = True
      Size = 5
    end
    object qryRelVALOR_TOTAL_NOTA: TFloatField
      FieldName = 'VALOR_TOTAL_NOTA'
      Origin = 'VALOR_TOTAL_NOTA'
      DisplayFormat = '###,#0.00'
    end
    object qryRelQTD_PROD: TIntegerField
      FieldName = 'QTD_PROD'
      Origin = 'QTD_PROD'
      DisplayFormat = '#0.000'
    end
    object qryRelID_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_1'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelID_CABECALHO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_CABECALHO'
      Origin = 'ID_CABECALHO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelID_PRODUTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelSEQUENCIA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelQTREAL: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'QTREAL'
      Origin = 'QTREAL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#0.000'
    end
    object qryRelVL_UNITARIO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VL_UNITARIO'
      Origin = 'VL_UNITARIO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelVL_FRETE: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VL_FRETE'
      Origin = 'VL_FRETE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelVL_IPI: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VL_IPI'
      Origin = 'VL_IPI'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelVL_ICMS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VL_ICMS'
      Origin = 'VL_ICMS'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelVL_DESCONTO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VL_DESCONTO'
      Origin = 'VL_DESCONTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelVL_ICMS_SUBST: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VL_ICMS_SUBST'
      Origin = 'VL_ICMS_SUBST'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelVL_ISENTO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VL_ISENTO'
      Origin = 'VL_ISENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelVL_PIS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VL_PIS'
      Origin = 'VL_PIS'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelVL_COFINS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VL_COFINS'
      Origin = 'VL_COFINS'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelVL_SEGURO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VL_SEGURO'
      Origin = 'VL_SEGURO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelVL_OUTROS: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VL_OUTROS'
      Origin = 'VL_OUTROS'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelCODIGO_ORIGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_ORIGEM'
      Origin = 'CODIGO_ORIGEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryRelUND: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UND'
      Origin = 'UND'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qryRelPROD_ID_UNIDADE_PRODUTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PROD_ID_UNIDADE_PRODUTO'
      Origin = 'PROD_ID_UNIDADE_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelPROD_ID_UNIDADE_ENTRADA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PROD_ID_UNIDADE_ENTRADA'
      Origin = 'PROD_ID_UNIDADE_ENTRADA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelPROD_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROD_DESCRICAO'
      Origin = 'PROD_DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryRelPROD_VALOR_VENDA: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'PROD_VALOR_VENDA'
      Origin = 'PROD_VALOR_VENDA'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###,#0.00'
    end
    object qryRelID_2: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_2'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelIDUNIDADEPROD: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'IDUNIDADEPROD'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelUNIDADEPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADEPRODUTO'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qryRelFATORPRODUTO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'FATORPRODUTO'
      Origin = 'FATOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelIDUNIDADEENTRADA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'IDUNIDADEENTRADA'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelUNIDADEENTRADA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADEENTRADA'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qryRelNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qryRelFANTASIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qryRelEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = []
      ReadOnly = True
      Size = 250
    end
    object qryRelCPF_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object qryRelINSCRICAO_ESTADUAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSCRICAO_ESTADUAL'
      Origin = 'INSCRICAO_ESTADUAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryRelTIPO_PESSOA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_PESSOA'
      Origin = 'TIPO_PESSOA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryRelDATA_CADASTRO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelLOGRADOURO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      ProviderFlags = []
      ReadOnly = True
      Size = 250
    end
    object qryRelNUMERO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = []
      ReadOnly = True
      Size = 6
    end
    object qryRelCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryRelCEP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CEP'
      Origin = 'CEP'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
    object qryRelBAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryRelCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryRelUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryRelCELULAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object qryRelCODIGO_IBGE_CIDADE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_IBGE_CIDADE'
      Origin = 'CODIGO_IBGE_CIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelCODIGO_IBGE_UF: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_IBGE_UF'
      Origin = 'CODIGO_IBGE_UF'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelID_3: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_3'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelSTATUS_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS_1'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryRelDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object qryRelQTDE_ESTOQUE: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE_ESTOQUE'
      Origin = 'QTDE_ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelREFERENCIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryRelID_UNIDADE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_UNIDADE'
      Origin = 'ID_UNIDADE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRelCODIGO_BARRAS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object qryRelVALOR_UNITARIO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '###,#0.00'
    end
    object qryRelID_ORIGINAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ID_ORIGINAL'
      Origin = 'ID_ORIGINAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 80
    end
    object qryRelIMPRIMIR_COZINHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IMPRIMIR_COZINHA'
      Origin = 'IMPRIMIR_COZINHA'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object qryRelcalcUnidadeEntrada: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUnidadeEntrada'
      Size = 12
      Calculated = True
    end
    object qryRelFATOR_UNIDADE: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'FATOR_UNIDADE'
      Origin = 'FATOR_UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#0.00'
    end
    object qryRelFATORENTRADA: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'FATORENTRADA'
      Origin = 'FATOR_UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#0.00'
    end
    object qryRelcalcEndereco: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcEndereco'
      Size = 150
      Calculated = True
    end
  end
  object dtsRel: TDataSource
    DataSet = qryRel
    Left = 800
    Top = 152
  end
end
