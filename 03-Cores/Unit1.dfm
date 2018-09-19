object Form1: TForm1
  Left = 590
  Top = 288
  BorderStyle = bsDialog
  Caption = 'Cores'
  ClientHeight = 105
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 19
    Height = 13
    Caption = 'Red'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 29
    Height = 13
    Caption = 'Green'
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 20
    Height = 13
    Caption = 'Blue'
  end
  object Label4: TLabel
    Left = 320
    Top = 8
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label5: TLabel
    Left = 320
    Top = 32
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label6: TLabel
    Left = 320
    Top = 56
    Width = 6
    Height = 13
    Caption = '0'
  end
  object ScrollBar1: TScrollBar
    Left = 48
    Top = 8
    Width = 257
    Height = 16
    Max = 255
    PageSize = 0
    TabOrder = 0
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 48
    Top = 32
    Width = 257
    Height = 16
    Max = 255
    PageSize = 0
    TabOrder = 1
    OnChange = ScrollBar2Change
  end
  object ScrollBar3: TScrollBar
    Left = 48
    Top = 56
    Width = 257
    Height = 16
    Max = 255
    PageSize = 0
    TabOrder = 2
    OnChange = ScrollBar3Change
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 80
    Width = 97
    Height = 17
    Caption = 'S'#243' tons de cinza'
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 352
    Top = 8
    Width = 65
    Height = 65
    BorderWidth = 35
    TabOrder = 4
    OnClick = Panel1Click
  end
  object ColorDialog1: TColorDialog
    Left = 272
    Top = 120
  end
  object XPManifest1: TXPManifest
    Left = 304
    Top = 120
  end
end
