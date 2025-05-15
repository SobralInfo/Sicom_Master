object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'SICOM Pedidos'
  ClientHeight = 498
  ClientWidth = 985
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 985
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Color = 6710886
    ParentBackground = False
    TabOrder = 0
    object lblCaption: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 64
      Height = 23
      Align = alClient
      Alignment = taCenter
      Caption = 'Pedidos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Image1: TImage
      Left = 982
      Top = 0
      Width = 3
      Height = 33
      Cursor = crHandPoint
      Align = alRight
      Center = True
      Stretch = True
      ExplicitLeft = 1382
    end
    object Image2: TImage
      Left = 948
      Top = 0
      Width = 34
      Height = 33
      Cursor = crHandPoint
      Hint = 'Fechar'
      Align = alRight
      Center = True
      ParentShowHint = False
      ShowHint = True
      OnClick = Image2Click
      ExplicitLeft = 1352
      ExplicitHeight = 31
    end
    object Image22: TImage
      Left = 914
      Top = 0
      Width = 34
      Height = 33
      Cursor = crHandPoint
      Hint = 'Minimizar'
      Align = alRight
      Center = True
      ParentShowHint = False
      ShowHint = True
      OnClick = Image22Click
      ExplicitLeft = 1352
      ExplicitHeight = 31
    end
  end
  object Panel7: TPanel
    Left = 337
    Top = 33
    Width = 648
    Height = 440
    Align = alClient
    BevelOuter = bvNone
    Color = 16750899
    ParentBackground = False
    TabOrder = 1
    object Image12: TImage
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 642
      Height = 434
      Align = alClient
      AutoSize = True
      Center = True
      ExplicitWidth = 165
      ExplicitHeight = 50
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 337
    Height = 440
    Align = alLeft
    BevelOuter = bvNone
    Color = 16750899
    ParentBackground = False
    TabOrder = 2
    object CategoryPanelGroup1: TCategoryPanelGroup
      Left = 0
      Top = 0
      Width = 337
      Height = 440
      VertScrollBar.Tracking = True
      BevelInner = bvNone
      BevelOuter = bvNone
      ChevronColor = clNavy
      ChevronHotColor = clBlack
      Color = 16750899
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientBaseColor = 16750899
      GradientColor = 16750899
      GradientDirection = gdHorizontal
      HeaderAlignment = taCenter
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWhite
      HeaderFont.Height = -13
      HeaderFont.Name = 'Tahoma'
      HeaderFont.Style = [fsBold]
      HeaderStyle = hsImage
      ParentFont = False
      TabOrder = 0
      object CategoryPanel2: TCategoryPanel
        Top = 30
        Height = 30
        Caption = 'Consultas'
        Color = 16750899
        Collapsed = True
        TabOrder = 0
        ExpandedHeight = 94
        object SpeedButton6: TSpeedButton
          Left = 0
          Top = 33
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Pedidos Cancelados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton6Click
          ExplicitTop = 8
          ExplicitWidth = 314
        end
        object SpeedButton1: TSpeedButton
          Left = 0
          Top = 0
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Pedidos Pendentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton1Click
          ExplicitTop = 8
        end
        object Image9: TImage
          Left = 13
          Top = 6
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
        object Image4: TImage
          Left = 13
          Top = 39
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
      end
      object CategoryPanel1: TCategoryPanel
        Top = 0
        Height = 30
        Cursor = crHandPoint
        Caption = 'Cadastros'
        Color = 16750899
        Collapsed = True
        TabOrder = 1
        ExpandedHeight = 60
        object SpeedButton5: TSpeedButton
          Left = 0
          Top = 0
          Width = 331
          Height = 33
          Cursor = crHandPoint
          Align = alTop
          Caption = 'Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6710886
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton5Click
          ExplicitTop = 5
          ExplicitWidth = 308
        end
        object Image3: TImage
          Left = 13
          Top = 6
          Width = 28
          Height = 22
          Cursor = crHandPoint
          Center = True
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 476
    Width = 979
    Height = 19
    Color = 14737632
    Panels = <
      item
        Width = 230
      end
      item
        Text = 'Tempo de Conex'#227'o: 00:00:00'
        Width = 200
      end
      item
        Width = 250
      end
      item
        Text = 'Desenvolvido por Sobral Info | Acesse www.sobralinfo.com.br  '
        Width = 250
      end>
  end
  object ConexaoLocal: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\Users\sobra\OneDrive\Pedido (OnLine)\DB\PEDIDO.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 207
    Top = 136
  end
  object dtsClientes: TDataSource
    DataSet = qryClientes
    Left = 263
    Top = 176
  end
  object qryClientes: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from clientes')
    Left = 263
    Top = 120
    object qryClientesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Size = 14
    end
    object qryClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object qryClientesLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Size = 120
    end
    object qryClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 30
    end
    object qryClientesCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 120
    end
    object qryClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 120
    end
    object qryClientesCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
    end
    object qryClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 11
    end
    object qryClientesFONE_FIXO: TStringField
      FieldName = 'FONE_FIXO'
      Origin = 'FONE_FIXO'
      Size = 10
    end
    object qryClientesREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 250
    end
    object qryClientesCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      EditMask = '(99)99999.9999;0;_'
      FixedChar = True
      Size = 11
    end
    object qryClientescalcCPFCNPJ: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCPFCNPJ'
      Calculated = True
    end
  end
  object dtsMunicipio: TDataSource
    DataSet = qryMunicipio
    Left = 335
    Top = 176
  end
  object qryMunicipio: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from cidade ORDER BY uf_sigla')
    Left = 335
    Top = 120
    object qryMunicipioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qryMunicipioCID_CODIGO: TStringField
      FieldName = 'CID_CODIGO'
      Origin = 'CID_CODIGO'
      Required = True
      FixedChar = True
      Size = 7
    end
    object qryMunicipioUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Origin = 'UF_SIGLA'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryMunicipioCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Origin = 'CID_NOME'
      Required = True
      Size = 40
    end
  end
  object qryFuncionarios: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from FUNCIONARIOS')
    Left = 408
    Top = 128
    object qryFuncionariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFuncionariosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryFuncionariosCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 30
    end
    object qryFuncionariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 120
    end
    object qryFuncionariosPERCENTUAL_COMISSAO: TFloatField
      FieldName = 'PERCENTUAL_COMISSAO'
      Origin = 'PERCENTUAL_COMISSAO'
    end
  end
  object dtsFuncionarios: TDataSource
    DataSet = qryFuncionarios
    Left = 400
    Top = 184
  end
  object dtsUnidades: TDataSource
    DataSet = qryUnidades
    Left = 472
    Top = 176
  end
  object qryUnidades: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from unidade_produtos ORDER BY sigla')
    Left = 472
    Top = 120
    object qryUnidadesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUnidadesSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryUnidadesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object qryUnidadesSIGLA: TStringField
      FieldName = 'SIGLA'
      Origin = 'SIGLA'
      Size = 15
    end
    object qryUnidadesFATOR: TFloatField
      FieldName = 'FATOR'
      Origin = 'FATOR'
      DisplayFormat = '#0.000'
    end
    object qryUnidadesPODE_FRACIONAR: TStringField
      FieldName = 'PODE_FRACIONAR'
      Origin = 'PODE_FRACIONAR'
      FixedChar = True
      Size = 1
    end
    object qryUnidadescalcSTATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcSTATUS'
      Size = 15
      Calculated = True
    end
  end
  object qryProdutos: TFDQuery
    Connection = ConexaoLocal
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = 100000000
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select p.id,'
      '       p.status,'
      '       p.descricao,'
      '       p.qtde_estoque,'
      '       p.referencia,'
      '       p.id_unidade,'
      '       p.codigo_barras,'
      '       p.valor_unitario,'
      '       p.imprimir_cozinha,'
      '       p.id_categoria,'
      '       u.sigla as unidade,'
      '       u.fator,'
      '       '#39'N'#39' AS kit'
      '  from produtos p,'
      '       unidade_produtos u'
      ' WHERE p.id_unidade = u.id'
      ' UNION'
      'select -1 AS id,'
      '       k.status,'
      '       k.descricao,'
      '       0.00 AS qtde_estoque,'
      '       '#39#39' AS referencia,'
      '       1 AS id_unidade,'
      '       k.gtin AS codigo_barras,'
      '       K.valor AS valor_unitario,'
      '       '#39'N'#39' AS imprimir_cozinha,'
      '       1 AS id_categoria,'
      '       '#39'UND'#39' as unidade,'
      '       1 AS fator,'
      '       '#39'S'#39' AS kit'
      '  from kit_produto_cabecalho k'
      '')
    Left = 528
    Top = 112
    object qryProdutosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 120
    end
    object qryProdutosQTDE_ESTOQUE: TFloatField
      FieldName = 'QTDE_ESTOQUE'
      Origin = 'QTDE_ESTOQUE'
      DisplayFormat = '#0.000'
    end
    object qryProdutosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Origin = 'REFERENCIA'
      Size = 80
    end
    object qryProdutosID_UNIDADE: TIntegerField
      FieldName = 'ID_UNIDADE'
      Origin = 'ID_UNIDADE'
    end
    object qryProdutosCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
      FixedChar = True
      Size = 15
    end
    object qryProdutosVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      DisplayFormat = '###,#0.00'
    end
    object qryProdutosUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object qryProdutosFATOR: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'FATOR'
      Origin = 'FATOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryProdutosIMPRIMIR_COZINHA: TStringField
      FieldName = 'IMPRIMIR_COZINHA'
      Origin = 'IMPRIMIR_COZINHA'
      FixedChar = True
      Size = 1
    end
    object qryProdutosID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
    end
    object qryProdutosKIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'KIT'
      Origin = 'KIT'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 528
    Top = 168
  end
  object dtsParametros: TDataSource
    DataSet = qryParametros
    Left = 576
    Top = 167
  end
  object qryParametros: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'SELECT * FROM CONFIGURACOES')
    Left = 576
    Top = 112
    object qryParametrosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryParametrosBASE_LOCAL: TStringField
      FieldName = 'BASE_LOCAL'
      Origin = 'BASE_LOCAL'
      FixedChar = True
      Size = 1
    end
    object qryParametrosCAIXA: TStringField
      FieldName = 'CAIXA'
      Origin = 'CAIXA'
      FixedChar = True
      Size = 3
    end
    object qryParametrosTIPO_DESCONTO_PEDIDO: TStringField
      FieldName = 'TIPO_DESCONTO_PEDIDO'
      Origin = 'TIPO_DESCONTO_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qryParametrosTIPO_IMPRESSAO: TIntegerField
      FieldName = 'TIPO_IMPRESSAO'
      Origin = 'TIPO_IMPRESSAO'
    end
    object qryParametrosCERTIFICADO: TStringField
      FieldName = 'CERTIFICADO'
      Origin = 'CERTIFICADO'
      Size = 120
    end
    object qryParametrosID_UNIDADE_PADRAO_ENTRADA: TIntegerField
      FieldName = 'ID_UNIDADE_PADRAO_ENTRADA'
      Origin = 'ID_UNIDADE_PADRAO_ENTRADA'
    end
    object qryParametrosID_UNIDADE_PADRAO_PRODUTO: TIntegerField
      FieldName = 'ID_UNIDADE_PADRAO_PRODUTO'
      Origin = 'ID_UNIDADE_PADRAO_PRODUTO'
    end
    object qryParametrosCRITICAR_ESTOQUE: TStringField
      FieldName = 'CRITICAR_ESTOQUE'
      Origin = 'CRITICAR_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object qryParametrosMENSAGEM_IMPRIMIR: TStringField
      FieldName = 'MENSAGEM_IMPRIMIR'
      Origin = 'MENSAGEM_IMPRIMIR'
      FixedChar = True
      Size = 1
    end
  end
  object qryUsuarios: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from usuarios ORDER BY nome')
    Left = 664
    Top = 112
    object qryUsuariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUsuariosSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 30
    end
    object qryUsuariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 120
    end
    object qryUsuariosPW: TStringField
      FieldName = 'PW'
      Origin = 'PW'
      Size = 120
    end
    object qryUsuariosCPF: TStringField
      FieldName = 'CPF'
      LookupDataSet = qryClientes
      Origin = 'CPF'
      EditMask = '999.999.999-99;0;_'
      FixedChar = True
      Size = 11
    end
    object qryUsuarioscalcUsuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcUsuario'
      Size = 10
      Calculated = True
    end
    object qryUsuariosFILTRO_CADASTRO_EMPRESA: TStringField
      FieldName = 'FILTRO_CADASTRO_EMPRESA'
      Origin = 'FILTRO_CADASTRO_EMPRESA'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_USUARIOS: TStringField
      FieldName = 'FILTRO_CADASTRO_USUARIOS'
      Origin = 'FILTRO_CADASTRO_USUARIOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_FUNCIONARIOS: TStringField
      FieldName = 'FILTRO_CADASTRO_FUNCIONARIOS'
      Origin = 'FILTRO_CADASTRO_FUNCIONARIOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_CLIENTES: TStringField
      FieldName = 'FILTRO_CADASTRO_CLIENTES'
      Origin = 'FILTRO_CADASTRO_CLIENTES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_UNIDADES: TStringField
      FieldName = 'FILTRO_CADASTRO_UNIDADES'
      Origin = 'FILTRO_CADASTRO_UNIDADES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_PRODUTOS: TStringField
      FieldName = 'FILTRO_CADASTRO_PRODUTOS'
      Origin = 'FILTRO_CADASTRO_PRODUTOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_CADASTRO_PAGAMENTOS: TStringField
      FieldName = 'FILTRO_CADASTRO_PAGAMENTOS'
      Origin = 'FILTRO_CADASTRO_PAGAMENTOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_VENDAS: TStringField
      FieldName = 'FILTRO_ACESSO_VENDAS'
      Origin = 'FILTRO_ACESSO_VENDAS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_EXPORTACOES: TStringField
      FieldName = 'FILTRO_ACESSO_EXPORTACOES'
      Origin = 'FILTRO_ACESSO_EXPORTACOES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_RELATORIOS: TStringField
      FieldName = 'FILTRO_ACESSO_RELATORIOS'
      Origin = 'FILTRO_ACESSO_RELATORIOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_CONFIGURACOES: TStringField
      FieldName = 'FILTRO_ACESSO_CONFIGURACOES'
      Origin = 'FILTRO_ACESSO_CONFIGURACOES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_PED_ATIVOS: TStringField
      FieldName = 'FILTRO_ACESSO_PED_ATIVOS'
      Origin = 'FILTRO_ACESSO_PED_ATIVOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_PED_CANCELADOS: TStringField
      FieldName = 'FILTRO_ACESSO_PED_CANCELADOS'
      Origin = 'FILTRO_ACESSO_PED_CANCELADOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_CANC_VENDA: TStringField
      FieldName = 'FILTRO_ACESSO_CANC_VENDA'
      Origin = 'FILTRO_ACESSO_CANC_VENDA'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_CANC_PEDIDO: TStringField
      FieldName = 'FILTRO_ACESSO_CANC_PEDIDO'
      Origin = 'FILTRO_ACESSO_CANC_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_GERAR_PEDIDO: TStringField
      FieldName = 'FILTRO_GERAR_PEDIDO'
      Origin = 'FILTRO_GERAR_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFILTRO_ACESSO_FECHAMENTO: TStringField
      FieldName = 'FILTRO_ACESSO_FECHAMENTO'
      Origin = 'FILTRO_ACESSO_FECHAMENTO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCADASTRO_FORNECEDORES: TStringField
      FieldName = 'CADASTRO_FORNECEDORES'
      Origin = 'CADASTRO_FORNECEDORES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCADASTRO_CATEGORIA: TStringField
      FieldName = 'CADASTRO_CATEGORIA'
      Origin = 'CADASTRO_CATEGORIA'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCADASTRO_KIT_PRODUTOS: TStringField
      FieldName = 'CADASTRO_KIT_PRODUTOS'
      Origin = 'CADASTRO_KIT_PRODUTOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCADASTRO_CAIXAS: TStringField
      FieldName = 'CADASTRO_CAIXAS'
      Origin = 'CADASTRO_CAIXAS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCADASTRO_PROMOCOES: TStringField
      FieldName = 'CADASTRO_PROMOCOES'
      Origin = 'CADASTRO_PROMOCOES'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosENTRADA_MANUAL: TStringField
      FieldName = 'ENTRADA_MANUAL'
      Origin = 'ENTRADA_MANUAL'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosIMPORTACAO_DE_XML: TStringField
      FieldName = 'IMPORTACAO_DE_XML'
      Origin = 'IMPORTACAO_DE_XML'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFIADO: TStringField
      FieldName = 'FIADO'
      Origin = 'FIADO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosREL_VENDAS_POR_PERIODO: TStringField
      FieldName = 'REL_VENDAS_POR_PERIODO'
      Origin = 'REL_VENDAS_POR_PERIODO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosREL_PRODUTOS_MAIS_VENDIDOS: TStringField
      FieldName = 'REL_PRODUTOS_MAIS_VENDIDOS'
      Origin = 'REL_PRODUTOS_MAIS_VENDIDOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosREL_ESTOQUE_PRODUTOS: TStringField
      FieldName = 'REL_ESTOQUE_PRODUTOS'
      Origin = 'REL_ESTOQUE_PRODUTOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosREL_CONTROLE_FIADO_CLIENTE: TStringField
      FieldName = 'REL_CONTROLE_FIADO_CLIENTE'
      Origin = 'REL_CONTROLE_FIADO_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosBLOQUEAR_CLIENTE_VENDA_FIADO: TStringField
      FieldName = 'BLOQUEAR_CLIENTE_VENDA_FIADO'
      Origin = 'BLOQUEAR_CLIENTE_VENDA_FIADO'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosRECEBIMENTO_DE_PG_FIADOS: TStringField
      FieldName = 'RECEBIMENTO_DE_PG_FIADOS'
      Origin = 'RECEBIMENTO_DE_PG_FIADOS'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosCANCELAR_VENDA: TStringField
      FieldName = 'CANCELAR_VENDA'
      Origin = 'CANCELAR_VENDA'
      FixedChar = True
      Size = 1
    end
    object qryUsuariosFECHAMENTO_DE_CAIXA: TStringField
      FieldName = 'FECHAMENTO_DE_CAIXA'
      Origin = 'FECHAMENTO_DE_CAIXA'
      FixedChar = True
      Size = 1
    end
  end
  object dtsUsuarios: TDataSource
    DataSet = qryUsuarios
    Left = 664
    Top = 168
  end
  object qryEmpresa: TFDQuery
    Connection = ConexaoLocal
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from empresa ORDER BY fantasia')
    Left = 744
    Top = 112
    object qryEmpresaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      EditMask = '99.999.999/9999-99;0;_'
      FixedChar = True
      Size = 14
    end
    object qryEmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 120
    end
    object qryEmpresaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Size = 100
    end
    object qryEmpresaFONE: TStringField
      FieldName = 'FONE'
      Origin = 'FONE'
      FixedChar = True
      Size = 10
    end
    object qryEmpresaCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      FixedChar = True
      Size = 11
    end
    object qryEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object qryEmpresaSITE: TStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      Size = 100
    end
    object qryEmpresaBASE_LOCAL: TStringField
      FieldName = 'BASE_LOCAL'
      Origin = 'BASE_LOCAL'
      FixedChar = True
      Size = 1
    end
    object qryEmpresaULTIMO_NSU: TIntegerField
      FieldName = 'ULTIMO_NSU'
      Origin = 'ULTIMO_NSU'
    end
    object qryEmpresaCODIGO_UF: TIntegerField
      FieldName = 'CODIGO_UF'
      Origin = 'CODIGO_UF'
    end
    object qryEmpresaDATA_HORA_BLOQUEIO_XML: TSQLTimeStampField
      FieldName = 'DATA_HORA_BLOQUEIO_XML'
      Origin = 'DATA_HORA_BLOQUEIO_XML'
    end
    object qryEmpresaID_MUNICIPIO: TIntegerField
      FieldName = 'ID_MUNICIPIO'
      Origin = 'ID_MUNICIPIO'
    end
  end
  object dtsEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 744
    Top = 168
  end
  object RESTResponse1: TRESTResponse
    Left = 576
    Top = 126
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        Options = [poDoNotEncode]
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse1
    ConnectTimeout = 1000000000
    ReadTimeout = 1000000000
    SynchronizedEvents = False
    Left = 632
    Top = 70
  end
end
