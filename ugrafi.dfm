object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 482
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btngerargrafico: TButton
    Left = 480
    Top = 368
    Width = 75
    Height = 25
    Caption = 'btngerargrafico'
    TabOrder = 0
  end
  object WebCharts1: TWebCharts
    Left = 112
    Top = 128
  end
  object ADOQuery1: TADOQuery
    Connection = DMDados.ADOEasyMaster
    Parameters = <>
    Left = 504
    Top = 248
  end
end
