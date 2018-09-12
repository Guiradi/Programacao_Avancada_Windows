object FormPrincipal: TFormPrincipal
  Left = 429
  Top = 306
  BorderStyle = bsDialog
  Caption = 'Matem'#225'tica e Texto'
  ClientHeight = 245
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 19
    Height = 13
    Caption = 'X = '
  end
  object Label2: TLabel
    Left = 8
    Top = 44
    Width = 19
    Height = 13
    Caption = 'Y = '
  end
  object Label3: TLabel
    Left = 8
    Top = 200
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object Bevel1: TBevel
    Left = 184
    Top = 8
    Width = 9
    Height = 229
    Shape = bsLeftLine
  end
  object Label4: TLabel
    Left = 192
    Top = 188
    Width = 54
    Height = 13
    Caption = 'Trocar letra'
  end
  object Label5: TLabel
    Left = 284
    Top = 188
    Width = 43
    Height = 13
    Caption = 'pela letra'
  end
  object Edit1: TEdit
    Left = 32
    Top = 8
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 32
    Top = 40
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 72
    Width = 73
    Height = 17
    Caption = 'Soma'
    TabOrder = 2
  end
  object RadioButton2: TRadioButton
    Left = 96
    Top = 72
    Width = 73
    Height = 17
    Caption = 'Subtrai'
    TabOrder = 3
  end
  object RadioButton3: TRadioButton
    Left = 8
    Top = 96
    Width = 73
    Height = 17
    Caption = 'Multiplica'
    TabOrder = 4
  end
  object RadioButton4: TRadioButton
    Left = 96
    Top = 96
    Width = 73
    Height = 17
    Caption = 'Divide'
    TabOrder = 5
  end
  object RadioButton5: TRadioButton
    Left = 8
    Top = 120
    Width = 73
    Height = 17
    Caption = 'M'#237'nimo'
    TabOrder = 6
  end
  object RadioButton6: TRadioButton
    Left = 96
    Top = 120
    Width = 73
    Height = 17
    Caption = 'M'#225'ximo'
    TabOrder = 7
  end
  object RadioButton7: TRadioButton
    Left = 8
    Top = 144
    Width = 73
    Height = 17
    Caption = 'Seno'
    TabOrder = 8
  end
  object RadioButton8: TRadioButton
    Left = 96
    Top = 144
    Width = 81
    Height = 17
    Caption = 'Cosseno'
    TabOrder = 9
  end
  object Button1: TButton
    Left = 8
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Executa'
    TabOrder = 10
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 8
    Top = 216
    Width = 169
    Height = 21
    TabOrder = 11
  end
  object Memo1: TMemo
    Left = 192
    Top = 8
    Width = 169
    Height = 169
    TabOrder = 12
  end
  object Edit4: TEdit
    Left = 252
    Top = 184
    Width = 25
    Height = 21
    TabOrder = 13
  end
  object Edit5: TEdit
    Left = 336
    Top = 184
    Width = 25
    Height = 21
    TabOrder = 14
  end
  object Button2: TButton
    Left = 288
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Trocar'
    TabOrder = 15
    OnClick = Button2Click
  end
end
