object Form1: TForm1
  Left = 378
  Top = 164
  BorderStyle = bsDialog
  Caption = #205'ndice de massa corp'#243'rea'
  ClientHeight = 432
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 73
    Caption = 'Altura'
    TabOrder = 0
    object Label1: TLabel
      Left = 120
      Top = 56
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object TrackBar1: TTrackBar
      Left = 8
      Top = 16
      Width = 273
      Height = 33
      Max = 220
      Min = 140
      Frequency = 5
      Position = 140
      TabOrder = 0
      TickMarks = tmTopLeft
      OnChange = TrackBar1Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 88
    Width = 289
    Height = 73
    Caption = 'Peso'
    TabOrder = 1
    object Label2: TLabel
      Left = 120
      Top = 56
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
    object TrackBar2: TTrackBar
      Left = 8
      Top = 16
      Width = 273
      Height = 33
      Max = 140
      Min = 40
      Frequency = 10
      Position = 40
      TabOrder = 0
      TickMarks = tmTopLeft
      OnChange = TrackBar2Change
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 168
    Width = 289
    Height = 49
    Caption = #205'ndice de massa corp'#243'rea'
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Label3'
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 224
    Width = 289
    Height = 201
    Caption = 'Silhueta - para apavorar'
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 184
      Width = 67
      Height = 13
      Caption = 'Padr'#227'o = 22.5'
    end
    object Image1: TImage
      Left = 8
      Top = 16
      Width = 65
      Height = 165
      Stretch = True
      Transparent = True
    end
    object Image2: TImage
      Left = 80
      Top = 16
      Width = 65
      Height = 165
      Stretch = True
      Transparent = True
    end
    object Label5: TLabel
      Left = 80
      Top = 184
      Width = 155
      Height = 13
      Caption = 'Propor'#231#227'o em rela'#231#227'o ao padr'#227'o'
    end
  end
  object RichEdit1: TRichEdit
    Left = 304
    Top = 8
    Width = 329
    Height = 377
    TabOrder = 4
  end
  object Button1: TButton
    Left = 304
    Top = 400
    Width = 79
    Height = 25
    Caption = 'Ajuda'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 388
    Top = 400
    Width = 79
    Height = 25
    Caption = 'Sobre'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 472
    Top = 400
    Width = 79
    Height = 25
    Caption = 'Busca Google'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 556
    Top = 400
    Width = 79
    Height = 25
    Caption = 'Culin'#225'ria'
    TabOrder = 8
    OnClick = Button4Click
  end
end
