object DialogConexion: TDialogConexion
  Left = 920
  Top = 329
  BorderStyle = bsDialog
  Caption = 'Conexi'#243'n...'
  ClientHeight = 130
  ClientWidth = 259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    259
    130)
  PixelsPerInch = 96
  TextHeight = 13
  object EstConexion: TLabel
    Left = 120
    Top = 28
    Width = 70
    Height = 13
    Caption = 'Desconectado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 120
    Top = 56
    Width = 117
    Height = 13
    Caption = 'Periodo Muestreo [mseg]'
  end
  object ComboBoxPuerto: TComboBox
    Left = 20
    Top = 24
    Width = 81
    Height = 21
    TabOrder = 0
    Items.Strings = (
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5'
      'COM6'
      'COM7'
      'COM8'
      'COM9'
      'COM10'
      'COM11'
      'COM12'
      'COM13'
      'COM14'
      'COM15'
      'COM16'
      'COM17'
      'COM18'
      'COM19'
      'COM20'
      'COM21'
      'COM22'
      'COM23'
      'COM24'
      'COM25'
      'COM26'
      'COM27'
      'COM28'
      'COM29'
      'COM30'
      'COM31'
      'COM32')
  end
  object CloseBtn: TButton
    Left = 166
    Top = 94
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = CloseBtnClick
  end
  object ButtonConexion: TButton
    Left = 24
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 2
    OnClick = ButtonConexionClick
  end
  object Show_Periodo_Muestreo: TEdit
    Left = 24
    Top = 56
    Width = 73
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 3
    Text = '100'
  end
end
