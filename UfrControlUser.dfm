object FrmControlUser: TFrmControlUser
  Left = 0
  Top = 0
  Caption = 'Controle de Usu'#225'rio'
  ClientHeight = 114
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 8
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object Label2: TLabel
    Left = 88
    Top = 51
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object EdtLogin: TEdit
    Left = 88
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edtsenha: TEdit
    Left = 88
    Top = 65
    Width = 121
    Height = 20
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Wingdings'
    Font.Style = []
    ParentFont = False
    PasswordChar = 'L'
    TabOrder = 1
  end
  object BtnConfirmar: TButton
    Left = 109
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = BtnConfirmarClick
  end
  object QryLogin: TADOQuery
    Connection = DMDados.ADOEasyMaster
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from [dbo].[LOGIN]')
    Left = 40
    Top = 32
    object QryLoginLogin: TStringField
      FieldName = 'Login'
      Size = 11
    end
    object QryLoginSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object QryLoginTipFun: TStringField
      FieldName = 'TipFun'
      Size = 3
    end
  end
end
