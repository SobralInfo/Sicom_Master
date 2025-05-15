object frmConexao: TfrmConexao
  Left = 0
  Top = 0
  Caption = 'frmConexao'
  ClientHeight = 397
  ClientWidth = 336
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
  object Label1: TLabel
    Left = 19
    Top = 22
    Width = 77
    Height = 13
    Caption = 'Banco de Dados'
  end
  object SpeedButton1: TSpeedButton
    Left = 112
    Top = 304
    Width = 105
    Height = 41
    Caption = 'Testar'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 289
    Top = 88
    Width = 24
    Height = 21
    OnClick = SpeedButton2Click
  end
  object ComboBox1: TComboBox
    Left = 19
    Top = 41
    Width = 294
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 0
    Items.Strings = (
      'FIREBIRD'
      'MYSQL'
      'POSTGRESSQL'
      'SQL SERVER'
      'ORACLE')
  end
  object mkeCaminho: TMaskEdit
    Left = 19
    Top = 88
    Width = 269
    Height = 21
    TabOrder = 1
    Text = ''
  end
  object mkeUsuario: TMaskEdit
    Left = 19
    Top = 198
    Width = 294
    Height = 21
    TabOrder = 2
    Text = ''
  end
  object mkeSenha: TMaskEdit
    Left = 19
    Top = 254
    Width = 294
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    Text = ''
  end
  object mkeServidor: TMaskEdit
    Left = 19
    Top = 142
    Width = 294
    Height = 21
    TabOrder = 4
    Text = ''
  end
  object OpenDialog1: TOpenDialog
    Left = 276
    Top = 296
  end
end
