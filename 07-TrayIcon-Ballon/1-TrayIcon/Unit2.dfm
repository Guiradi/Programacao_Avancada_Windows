object Form2: TForm2
  Left = 530
  Top = 352
  BorderStyle = bsDialog
  Caption = 'Exemplo de utiliza'#231#227'o de System Tray'
  ClientHeight = 144
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 128
    Height = 128
  end
  object Memo1: TMemo
    Left = 144
    Top = 8
    Width = 128
    Height = 128
    Enabled = False
    Lines.Strings = (
      'Exemplo de utiliza'#231#227'o '
      'de System Tray'
      ''
      'Envolve PopupMenu e '
      'altera'#231#227'o de '#237'cones do '
      'programa'
      ''
      'Desenvolvido nas aulas '
      'de PAW')
    TabOrder = 0
  end
end
