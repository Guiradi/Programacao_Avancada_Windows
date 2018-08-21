object Form1: TForm1
  Left = 457
  Top = 102
  Width = 481
  Height = 637
  Caption = 'Converte RTF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Abrir'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 40
    Width = 449
    Height = 553
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos RTF|*.rtf'
    InitialDir = '.'
    Left = 192
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Arquivos RTF|*.rtf'
    InitialDir = '.'
    Left = 224
    Top = 8
  end
end
