object Form_Gral: TForm_Gral
  Left = 233
  Top = 154
  Anchors = []
  BorderStyle = bsSingle
  Caption = 'CONTROL MODULO HIDROPONIA'
  ClientHeight = 689
  ClientWidth = 1427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox5: TGroupBox
    Left = 342
    Top = 16
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 1'
    TabOrder = 7
    DesignSize = (
      153
      217)
    object Led_Mod1_Stt: TShape
      Left = 22
      Top = 44
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod1_Per: TShape
      Left = 65
      Top = 44
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod1_Rst: TShape
      Left = 103
      Top = 43
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod1_Rst: TLabel
      Left = 99
      Top = 43
      Width = 30
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod1_RstClick
    end
    object Label_Mod1_Stt: TLabel
      Left = 22
      Top = 44
      Width = 25
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod1_SttClick
    end
    object Label_Mod1_Per: TLabel
      Left = 61
      Top = 44
      Width = 32
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod1_PerClick
    end
    object Label26: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label27: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label28: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label29: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label31: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label106: TLabel
      Left = 22
      Top = 25
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label107: TLabel
      Left = 65
      Top = 25
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label108: TLabel
      Left = 108
      Top = 24
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod1_TOn: TEdit
      Left = 88
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod1_TOnKeyPress
    end
    object Show_Mod1_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod1_TOffKeyPress
    end
    object Show_Mod1_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod1_TROnKeyPress
    end
    object Show_Mod1_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod1_TRFrKeyPress
    end
    object Show_Mod1_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object StatusBarPrinc: TStatusBar
    Left = 0
    Top = 672
    Width = 1427
    Height = 17
    Panels = <
      item
        Alignment = taCenter
        Width = 75
      end
      item
        Alignment = taCenter
        Width = 75
      end
      item
        Width = 75
      end>
  end
  object Show_DrenLSH: TGroupBox
    Left = 501
    Top = 462
    Width = 153
    Height = 196
    Caption = 'Drenaje LSH'
    TabOrder = 0
    DesignSize = (
      153
      196)
    object Label5: TLabel
      Left = 8
      Top = 163
      Width = 35
      Height = 13
      Caption = 'Switch:'
    end
    object Label6: TLabel
      Left = 8
      Top = 144
      Width = 27
      Height = 13
      Caption = 'Nivel:'
    end
    object Label7: TLabel
      Left = 8
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Minimo:'
    end
    object Label8: TLabel
      Left = 8
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Maximo:'
    end
    object Label17: TLabel
      Left = 8
      Top = 72
      Width = 45
      Height = 13
      Caption = 'Valor AD:'
    end
    object Label18: TLabel
      Left = 8
      Top = 96
      Width = 54
      Height = 13
      Caption = 'Long Sens:'
    end
    object Label41: TLabel
      Left = 8
      Top = 120
      Width = 31
      Height = 13
      Caption = 'Offfset'
    end
    object Show_DrenLSH_Swtch: TEdit
      Left = 96
      Top = 160
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '0'
      OnKeyPress = Show_DrenLSH_SwtchKeyPress
      ExplicitLeft = 80
    end
    object Show_DrenLSH_Val: TEdit
      Left = 96
      Top = 136
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
      ExplicitLeft = 80
    end
    object Show_DrenLSH_Min: TEdit
      Left = 96
      Top = 16
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '0'
      OnKeyPress = Show_DrenLSH_MinKeyPress
      ExplicitLeft = 80
    end
    object Show_DrenLSH_Max: TEdit
      Left = 96
      Top = 40
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '0'
      OnKeyPress = Show_DrenLSH_MaxKeyPress
      ExplicitLeft = 80
    end
    object Show_DrenLSH_ADVal: TEdit
      Left = 96
      Top = 64
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '0'
      ExplicitLeft = 80
    end
    object Show_DrenLSH_Lng: TEdit
      Left = 96
      Top = 88
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
      Text = '0'
      OnKeyPress = Show_DrenLSH_LngKeyPress
      ExplicitLeft = 80
    end
    object Show_DrenLSH_Offset: TEdit
      Left = 96
      Top = 112
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 6
      Text = '0'
      OnKeyPress = Show_DrenLSH_OffsetKeyPress
      ExplicitLeft = 80
    end
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 16
    Width = 312
    Height = 169
    Caption = 'GENERAL'
    TabOrder = 1
    object Label25: TLabel
      Left = 151
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Nombre:'
    end
    object Label30: TLabel
      Left = 151
      Top = 48
      Width = 37
      Height = 13
      Caption = 'Horario:'
    end
    object Label32: TLabel
      Left = 151
      Top = 96
      Width = 91
      Height = 13
      Caption = 'Inicio del Mediodia:'
    end
    object Label33: TLabel
      Left = 151
      Top = 120
      Width = 80
      Height = 13
      Caption = 'Fin del Mediodia:'
    end
    object Label34: TLabel
      Left = 151
      Top = 72
      Width = 61
      Height = 13
      Caption = 'Inicio del Dia'
    end
    object Label35: TLabel
      Left = 151
      Top = 144
      Width = 53
      Height = 13
      Caption = 'Fin del Dia:'
    end
    object Chek_Auto_Actual: TCheckBox
      Left = 26
      Top = 14
      Width = 97
      Height = 25
      Alignment = taLeftJustify
      Caption = 'Actualizar Datos:'
      TabOrder = 0
    end
    object Show_Name: TEdit
      Left = 199
      Top = 16
      Width = 105
      Height = 21
      TabOrder = 1
      OnKeyPress = Show_NameKeyPress
    end
    object BtnSaveConfig: TButton
      Left = 24
      Top = 112
      Width = 97
      Height = 25
      Caption = 'SALVAR CONFIG'
      TabOrder = 2
      OnClick = But_UpD_MtrClick
    end
    object Show_Hora_Disp: TEdit
      Left = 247
      Top = 40
      Width = 57
      Height = 21
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Hora_DispKeyPress
    end
    object Bot_Man_Auto: TButton
      Left = 24
      Top = 80
      Width = 97
      Height = 25
      Caption = 'AUTOMATICO'
      TabOrder = 4
      OnClick = Bot_Man_AutoClick
    end
    object Show_Time_IniDia: TEdit
      Left = 247
      Top = 64
      Width = 57
      Height = 21
      TabOrder = 5
      Text = '00:00:00'
      OnKeyPress = Show_Time_IniDiaKeyPress
    end
    object Show_Time_IniMed: TEdit
      Left = 247
      Top = 88
      Width = 57
      Height = 21
      TabOrder = 6
      Text = '00:00:00'
      OnKeyPress = Show_Time_IniMedKeyPress
    end
    object Show_Time_FinMed: TEdit
      Left = 247
      Top = 112
      Width = 57
      Height = 21
      TabOrder = 7
      Text = '00:00:00'
      OnKeyPress = Show_Time_FinMedKeyPress
    end
    object Show_Time_FinDia: TEdit
      Left = 247
      Top = 136
      Width = 57
      Height = 21
      TabOrder = 8
      Text = '00:00:00'
      OnKeyPress = Show_Time_FinDiaKeyPress
    end
    object But_Sincronizar: TButton
      Left = 24
      Top = 48
      Width = 97
      Height = 25
      Caption = 'SINCRONIZAR'
      TabOrder = 9
      OnClick = But_SincronizarClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 1070
    Top = 466
    Width = 161
    Height = 188
    Caption = 'Estado de Salidas'
    TabOrder = 2
    object OutLuces: TCheckBox
      Left = 16
      Top = 48
      Width = 113
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Bba Riego Mod 2'
      TabOrder = 0
      OnClick = OutLucesClick
    end
    object ValvulaRiego: TCheckBox
      Left = 16
      Top = 25
      Width = 113
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Val de Riego 1'
      TabOrder = 1
      OnClick = ValvulaRiegoClick
    end
    object BombaTrasvase: TCheckBox
      Left = 16
      Top = 94
      Width = 113
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Bomba de Trasvase'
      TabOrder = 2
      OnClick = BombaTrasvaseClick
    end
    object BombaAire: TCheckBox
      Left = 16
      Top = 71
      Width = 113
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Bba Riego Mod 3'
      TabOrder = 3
      OnClick = BombaAireClick
    end
    object ValvulaAgua: TCheckBox
      Left = 16
      Top = 120
      Width = 113
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Valvula de Agua'
      TabOrder = 4
      OnClick = ValvulaAguaClick
    end
  end
  object Show_DrenLT: TGroupBox
    Left = 658
    Top = 466
    Width = 131
    Height = 200
    Caption = 'Drenaje LT'
    TabOrder = 3
    DesignSize = (
      131
      200)
    object Label1: TLabel
      Left = 8
      Top = 168
      Width = 35
      Height = 13
      Caption = 'Switch:'
    end
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Minimo:'
    end
    object Label4: TLabel
      Left = 8
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Maximo:'
    end
    object Label19: TLabel
      Left = 8
      Top = 72
      Width = 45
      Height = 13
      Caption = 'Valor AD:'
    end
    object Label20: TLabel
      Left = 8
      Top = 96
      Width = 54
      Height = 13
      Caption = 'Long Sens:'
    end
    object Label2: TLabel
      Left = 8
      Top = 144
      Width = 27
      Height = 13
      Caption = 'Nivel:'
    end
    object Label42: TLabel
      Left = 8
      Top = 120
      Width = 34
      Height = 13
      Caption = 'Offfset:'
    end
    object Show_DrenLT_Swtch: TEdit
      Left = 74
      Top = 160
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '0'
      OnKeyPress = Show_DrenLT_SwtchKeyPress
    end
    object Show_DrenLT_Val: TEdit
      Left = 74
      Top = 136
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
    object Show_DrenLT_Min: TEdit
      Left = 74
      Top = 16
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '0'
      OnKeyPress = Show_DrenLT_MinKeyPress
    end
    object Show_DrenLT_Max: TEdit
      Left = 74
      Top = 40
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '0'
      OnKeyPress = Show_DrenLT_MaxKeyPress
    end
    object Show_DrenLT_ADVal: TEdit
      Left = 74
      Top = 64
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '0'
    end
    object Show_DrenLT_Lng: TEdit
      Left = 74
      Top = 88
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
      Text = '0'
      OnKeyPress = Show_DrenLT_LngKeyPress
    end
    object Show_DrenLT_Offset: TEdit
      Left = 74
      Top = 112
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 6
      Text = '0'
      OnKeyPress = Show_DrenLT_OffsetKeyPress
    end
  end
  object GroupBox1: TGroupBox
    Left = 795
    Top = 466
    Width = 130
    Height = 200
    Caption = 'Tanque LSH'
    TabOrder = 4
    DesignSize = (
      130
      200)
    object Label9: TLabel
      Left = 8
      Top = 168
      Width = 35
      Height = 13
      Caption = 'Switch:'
    end
    object Label11: TLabel
      Left = 8
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Minimo:'
    end
    object Label12: TLabel
      Left = 8
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Maximo:'
    end
    object Label21: TLabel
      Left = 8
      Top = 72
      Width = 45
      Height = 13
      Caption = 'Valor AD:'
    end
    object Label22: TLabel
      Left = 8
      Top = 96
      Width = 54
      Height = 13
      Caption = 'Long Sens:'
    end
    object Label10: TLabel
      Left = 8
      Top = 144
      Width = 27
      Height = 13
      Caption = 'Nivel:'
    end
    object Label43: TLabel
      Left = 8
      Top = 120
      Width = 34
      Height = 13
      Caption = 'Offfset:'
    end
    object Show_TKLSH_Swtch: TEdit
      Left = 73
      Top = 160
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '0'
      OnKeyPress = Show_TKLSH_SwtchKeyPress
    end
    object Show_TKLSH_Val: TEdit
      Left = 73
      Top = 136
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
    object Show_TKLSH_Min: TEdit
      Left = 73
      Top = 16
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '0'
      OnKeyPress = Show_TKLSH_MinKeyPress
    end
    object Show_TKLSH_Max: TEdit
      Left = 73
      Top = 40
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '0'
      OnKeyPress = Show_TKLSH_MaxKeyPress
    end
    object Show_TKLSH_ADVal: TEdit
      Left = 73
      Top = 64
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '0'
    end
    object Show_TKLSH_Lng: TEdit
      Left = 73
      Top = 89
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
      Text = '0'
      OnKeyPress = Show_TKLSH_LngKeyPress
    end
    object Show_TKLSH_Offset: TEdit
      Left = 73
      Top = 112
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 6
      Text = '0'
      OnKeyPress = Show_TKLSH_OffsetKeyPress
    end
  end
  object GroupBox3: TGroupBox
    Left = 931
    Top = 466
    Width = 133
    Height = 188
    Caption = 'Tanque LSL'
    TabOrder = 5
    DesignSize = (
      133
      188)
    object Label13: TLabel
      Left = 8
      Top = 168
      Width = 35
      Height = 13
      Caption = 'Switch:'
    end
    object Label15: TLabel
      Left = 8
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Minimo:'
    end
    object Label16: TLabel
      Left = 8
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Maximo:'
    end
    object Label23: TLabel
      Left = 8
      Top = 72
      Width = 45
      Height = 13
      Caption = 'Valor AD:'
    end
    object Label24: TLabel
      Left = 8
      Top = 96
      Width = 54
      Height = 13
      Caption = 'Long Sens:'
    end
    object Label14: TLabel
      Left = 8
      Top = 144
      Width = 27
      Height = 13
      Caption = 'Nivel:'
    end
    object Label44: TLabel
      Left = 8
      Top = 120
      Width = 34
      Height = 13
      Caption = 'Offfset:'
    end
    object Show_TKLSL_Swtch: TEdit
      Left = 76
      Top = 160
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '0'
      OnKeyPress = Show_TKLSL_SwtchKeyPress
    end
    object Show_TKLSL_Val: TEdit
      Left = 76
      Top = 136
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
    end
    object Show_TKLSL_Min: TEdit
      Left = 76
      Top = 16
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '0'
      OnKeyPress = Show_TKLSL_MinKeyPress
    end
    object Show_TKLSL_Max: TEdit
      Left = 76
      Top = 40
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '0'
      OnKeyPress = Show_TKLSL_MaxKeyPress
    end
    object Show_TKLSL_ADVal: TEdit
      Left = 76
      Top = 64
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '0'
    end
    object Show_TKLSL_Lng: TEdit
      Left = 76
      Top = 88
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
      Text = '0'
      OnKeyPress = Show_TKLSL_LngKeyPress
    end
    object Show_TKLSL_Offset: TEdit
      Left = 76
      Top = 112
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 6
      Text = '0'
      OnKeyPress = Show_TKLSL_OffsetKeyPress
    end
  end
  object GroupBox6: TGroupBox
    Left = 660
    Top = 16
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 3'
    TabOrder = 8
    DesignSize = (
      153
      217)
    object Led_Mod3_Stt: TShape
      Left = 22
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod3_Stt: TLabel
      Left = 22
      Top = 39
      Width = 26
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod3_SttClick
    end
    object Led_Mod3_Per: TShape
      Left = 65
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod3_Rst: TShape
      Left = 103
      Top = 38
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod3_Per: TLabel
      Left = 64
      Top = 39
      Width = 29
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod3_PerClick
    end
    object Label_Mod3_Rst: TLabel
      Left = 99
      Top = 38
      Width = 30
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod3_RstClick
    end
    object Label36: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label37: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label38: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label39: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label40: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label116: TLabel
      Left = 22
      Top = 20
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label117: TLabel
      Left = 65
      Top = 20
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label118: TLabel
      Left = 108
      Top = 19
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod3_TOn: TEdit
      Left = 88
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod3_TOnKeyPress
    end
    object Show_Mod3_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod3_TOffKeyPress
    end
    object Show_Mod3_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod3_TROnKeyPress
    end
    object Show_Mod3_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod3_TRFrKeyPress
    end
    object Show_Mod3_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object GroupBox7: TGroupBox
    Left = 342
    Top = 462
    Width = 153
    Height = 97
    Caption = 'Conductividad TK'
    TabOrder = 9
    DesignSize = (
      153
      97)
    object Label45: TLabel
      Left = 8
      Top = 24
      Width = 54
      Height = 13
      Caption = 'MaximoAD:'
    end
    object Label46: TLabel
      Left = 8
      Top = 48
      Width = 69
      Height = 13
      Caption = 'Factor de Esc:'
    end
    object Label47: TLabel
      Left = 8
      Top = 72
      Width = 71
      Height = 13
      Caption = 'Conductividad:'
    end
    object Label49: TLabel
      Left = 8
      Top = 144
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Show_TKCond_MaxAD: TEdit
      Left = 88
      Top = 16
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '0'
      OnKeyPress = Show_Mod1_TOnKeyPress
    end
    object Show_TKCond_FEsc: TEdit
      Left = 88
      Top = 40
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
      OnKeyPress = Show_TKCond_FEscKeyPress
    end
    object Show_TKCond_Val: TEdit
      Left = 88
      Top = 64
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '0'
      OnKeyPress = Show_Mod1_TROnKeyPress
    end
  end
  object GroupBox8: TGroupBox
    Left = 342
    Top = 565
    Width = 153
    Height = 97
    Caption = 'Conductividad Drenaje'
    TabOrder = 10
    DesignSize = (
      153
      97)
    object Label48: TLabel
      Left = 8
      Top = 24
      Width = 54
      Height = 13
      Caption = 'MaximoAD:'
    end
    object Label50: TLabel
      Left = 8
      Top = 48
      Width = 69
      Height = 13
      Caption = 'Factor de Esc:'
    end
    object Label51: TLabel
      Left = 8
      Top = 72
      Width = 71
      Height = 13
      Caption = 'Conductividad:'
    end
    object Label52: TLabel
      Left = 8
      Top = 144
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Show_DrenCond_MaxAD: TEdit
      Left = 88
      Top = 16
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '0'
      OnKeyPress = Show_Mod1_TOnKeyPress
    end
    object Show_DrenCond_FEsc: TEdit
      Left = 88
      Top = 40
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '0'
      OnKeyPress = Show_DrenCond_FEscKeyPress
    end
    object Show_DrenCond_Val: TEdit
      Left = 88
      Top = 64
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '0'
      OnKeyPress = Show_Mod1_TROnKeyPress
    end
  end
  object GroupBox9: TGroupBox
    Left = 501
    Top = 16
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 2'
    TabOrder = 11
    DesignSize = (
      153
      217)
    object Led_Mod2_Stt: TShape
      Left = 22
      Top = 40
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod2_Stt: TLabel
      Left = 21
      Top = 40
      Width = 26
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod2_SttClick
    end
    object Led_Mod2_Per: TShape
      Left = 65
      Top = 40
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod2_Rst: TShape
      Left = 103
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod2_Per: TLabel
      Left = 61
      Top = 40
      Width = 32
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod2_PerClick
    end
    object Label_Mod2_Rst: TLabel
      Left = 99
      Top = 39
      Width = 30
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod2_RstClick
    end
    object Label64: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label65: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label66: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label67: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label68: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label110: TLabel
      Left = 22
      Top = 21
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label111: TLabel
      Left = 65
      Top = 21
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label112: TLabel
      Left = 108
      Top = 20
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod2_TOn: TEdit
      Left = 88
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod2_TOnKeyPress
    end
    object Show_Mod2_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod2_TOffKeyPress
    end
    object Show_Mod2_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod2_TROnKeyPress
    end
    object Show_Mod2_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod2_TRFrKeyPress
    end
    object Show_Mod2_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object GroupBox10: TGroupBox
    Left = 819
    Top = 16
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 4'
    TabOrder = 12
    DesignSize = (
      153
      217)
    object Led_Mod4_Stt: TShape
      Left = 22
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod4_Stt: TLabel
      Left = 22
      Top = 39
      Width = 26
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod4_SttClick
    end
    object Led_Mod4_Per: TShape
      Left = 65
      Top = 38
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod4_Rst: TShape
      Left = 103
      Top = 38
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod4_Rst: TLabel
      Left = 99
      Top = 38
      Width = 30
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod4_RstClick
    end
    object Label_Mod4_Per: TLabel
      Left = 61
      Top = 39
      Width = 32
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod4_PerClick
    end
    object Label53: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label54: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label57: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label58: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label59: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label122: TLabel
      Left = 22
      Top = 20
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label123: TLabel
      Left = 65
      Top = 20
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label124: TLabel
      Left = 108
      Top = 19
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod4_TOn: TEdit
      Left = 87
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod4_TOnKeyPress
    end
    object Show_Mod4_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod4_TOffKeyPress
    end
    object Show_Mod4_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod4_TROnKeyPress
    end
    object Show_Mod4_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod4_TRFrKeyPress
    end
    object Show_Mod4_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object GroupBox11: TGroupBox
    Left = 1137
    Top = 16
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 6'
    TabOrder = 13
    DesignSize = (
      153
      217)
    object Led_Mod6_Stt: TShape
      Left = 23
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod6_Stt: TLabel
      Left = 23
      Top = 40
      Width = 25
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod6_SttClick
    end
    object Led_Mod6_Per: TShape
      Left = 66
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod6_Rst: TShape
      Left = 104
      Top = 38
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod6_Rst: TLabel
      Left = 102
      Top = 38
      Width = 29
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod6_RstClick
    end
    object Label_Mod6_Per: TLabel
      Left = 62
      Top = 39
      Width = 32
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod6_PerClick
    end
    object Label60: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label61: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label62: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label63: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label69: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label134: TLabel
      Left = 23
      Top = 20
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label135: TLabel
      Left = 66
      Top = 20
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label136: TLabel
      Left = 109
      Top = 19
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod6_TOn: TEdit
      Left = 88
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod6_TOnKeyPress
    end
    object Show_Mod6_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod6_TOffKeyPress
    end
    object Show_Mod6_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod6_TROnKeyPress
    end
    object Show_Mod6_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod6_TRFrKeyPress
    end
    object Show_Mod6_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object GroupBox12: TGroupBox
    Left = 978
    Top = 16
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 5'
    TabOrder = 14
    DesignSize = (
      153
      217)
    object Led_Mod5_Stt: TShape
      Left = 22
      Top = 38
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod5_Stt: TLabel
      Left = 22
      Top = 38
      Width = 26
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod5_SttClick
    end
    object Led_Mod5_Per: TShape
      Left = 63
      Top = 37
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod5_Per: TLabel
      Left = 60
      Top = 37
      Width = 32
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod5_PerClick
    end
    object Led_Mod5_Rst: TShape
      Left = 103
      Top = 37
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod5_Rst: TLabel
      Left = 100
      Top = 38
      Width = 30
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod5_RstClick
    end
    object Label70: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label71: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label72: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label73: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label74: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label128: TLabel
      Left = 22
      Top = 19
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label129: TLabel
      Left = 65
      Top = 19
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label130: TLabel
      Left = 108
      Top = 18
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod5_TOn: TEdit
      Left = 88
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod5_TOnKeyPress
    end
    object Show_Mod5_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod5_TOffKeyPress
    end
    object Show_Mod5_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod5_TROnKeyPress
    end
    object Show_Mod5_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod5_TRFrKeyPress
    end
    object Show_Mod5_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object GroupBox13: TGroupBox
    Left = 342
    Top = 239
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 7'
    TabOrder = 15
    DesignSize = (
      153
      217)
    object Led_Mod7_Rst: TShape
      Left = 103
      Top = 43
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod7_Per: TShape
      Left = 65
      Top = 44
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod7_Stt: TShape
      Left = 22
      Top = 44
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod7_Stt: TLabel
      Left = 22
      Top = 44
      Width = 25
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod7_SttClick
    end
    object Label_Mod7_Per: TLabel
      Left = 61
      Top = 44
      Width = 32
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod7_PerClick
    end
    object Label_Mod7_Rst: TLabel
      Left = 99
      Top = 43
      Width = 30
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod7_RstClick
    end
    object Label76: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label77: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label78: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label79: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label80: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label81: TLabel
      Left = 22
      Top = 25
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label82: TLabel
      Left = 65
      Top = 25
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label83: TLabel
      Left = 108
      Top = 24
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod7_TOn: TEdit
      Left = 88
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod7_TOnKeyPress
    end
    object Show_Mod7_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod7_TOffKeyPress
    end
    object Show_Mod7_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod7_TROnKeyPress
    end
    object Show_Mod7_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod7_TRFrKeyPress
    end
    object Show_Mod7_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object GroupBox14: TGroupBox
    Left = 660
    Top = 239
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 9'
    TabOrder = 16
    DesignSize = (
      153
      217)
    object Led_Mod9_Stt: TShape
      Left = 22
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod9_Per: TShape
      Left = 65
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod9_Rst: TShape
      Left = 103
      Top = 38
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod9_Rst: TLabel
      Left = 99
      Top = 38
      Width = 30
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod9_RstClick
    end
    object Label_Mod9_Per: TLabel
      Left = 64
      Top = 39
      Width = 29
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod9_PerClick
    end
    object Label_Mod9_Stt: TLabel
      Left = 22
      Top = 39
      Width = 26
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod9_SttClick
    end
    object Label87: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label88: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label89: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label90: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label91: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label92: TLabel
      Left = 22
      Top = 20
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label93: TLabel
      Left = 65
      Top = 20
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label94: TLabel
      Left = 108
      Top = 19
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod9_TOn: TEdit
      Left = 88
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod9_TOnKeyPress
    end
    object Show_Mod9_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod9_TOffKeyPress
    end
    object Show_Mod9_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod9_TROnKeyPress
    end
    object Show_Mod9_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod9_TRFrKeyPress
    end
    object Show_Mod9_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object GroupBox15: TGroupBox
    Left = 501
    Top = 239
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 8'
    TabOrder = 17
    DesignSize = (
      153
      217)
    object Led_Mod8_Stt: TShape
      Left = 22
      Top = 40
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod8_Stt: TLabel
      Left = 21
      Top = 40
      Width = 26
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod8_SttClick
    end
    object Led_Mod8_Rst: TShape
      Left = 103
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod8_Per: TShape
      Left = 65
      Top = 40
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod8_Rst: TLabel
      Left = 99
      Top = 39
      Width = 30
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod8_RstClick
    end
    object Label_Mod8_Per: TLabel
      Left = 61
      Top = 40
      Width = 32
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod8_PerClick
    end
    object Label98: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label99: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label100: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label101: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label102: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label103: TLabel
      Left = 22
      Top = 21
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label104: TLabel
      Left = 65
      Top = 21
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label105: TLabel
      Left = 108
      Top = 20
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod8_TOn: TEdit
      Left = 88
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod8_TOnKeyPress
    end
    object Show_Mod8_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod8_TOffKeyPress
    end
    object Show_Mod8_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod8_TROnKeyPress
    end
    object Show_Mod8_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod8_TRFrKeyPress
    end
    object Show_Mod8_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object GroupBox16: TGroupBox
    Left = 819
    Top = 239
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 10'
    TabOrder = 18
    DesignSize = (
      153
      217)
    object Led_Mod10_Stt: TShape
      Left = 22
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod10_Per: TShape
      Left = 65
      Top = 38
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod10_Rst: TShape
      Left = 103
      Top = 38
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod10_Rst: TLabel
      Left = 99
      Top = 38
      Width = 30
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod10_RstClick
    end
    object Label_Mod10_Per: TLabel
      Left = 61
      Top = 39
      Width = 32
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod10_PerClick
    end
    object Label_Mod10_Stt: TLabel
      Left = 22
      Top = 39
      Width = 26
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod10_SttClick
    end
    object Label115: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label119: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label120: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label121: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label125: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label126: TLabel
      Left = 22
      Top = 20
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label127: TLabel
      Left = 65
      Top = 20
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label131: TLabel
      Left = 108
      Top = 19
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod10_TOn: TEdit
      Left = 87
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod10_TOnKeyPress
    end
    object Show_Mod10_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod10_TOffKeyPress
    end
    object Show_Mod10_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod10_TROnKeyPress
    end
    object Show_Mod10_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod10_TRFrKeyPress
    end
    object Show_Mod10_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object GroupBox17: TGroupBox
    Left = 1137
    Top = 239
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 12'
    TabOrder = 19
    DesignSize = (
      153
      217)
    object Led_Mod12_Stt: TShape
      Left = 23
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod12_Stt: TLabel
      Left = 23
      Top = 40
      Width = 25
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod12_SttClick
    end
    object Led_Mod12_Rst: TShape
      Left = 104
      Top = 38
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod12_Per: TShape
      Left = 66
      Top = 39
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod12_Rst: TLabel
      Left = 102
      Top = 38
      Width = 29
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod12_RstClick
    end
    object Label_Mod12_Per: TLabel
      Left = 62
      Top = 39
      Width = 32
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod12_PerClick
    end
    object Label138: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label139: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label140: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label141: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label142: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label143: TLabel
      Left = 23
      Top = 20
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label144: TLabel
      Left = 66
      Top = 20
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label145: TLabel
      Left = 109
      Top = 19
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod12_TOn: TEdit
      Left = 88
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod12_TOnKeyPress
    end
    object Show_Mod12_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod12_TOffKeyPress
    end
    object Show_Mod12_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod12_TROnKeyPress
    end
    object Show_Mod12_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod12_TRFrKeyPress
    end
    object Show_Mod12_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object GroupBox18: TGroupBox
    Left = 978
    Top = 239
    Width = 153
    Height = 217
    Caption = 'Bomba Riego Mod 11'
    TabOrder = 20
    DesignSize = (
      153
      217)
    object Led_Mod11_Rst: TShape
      Left = 103
      Top = 37
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod11_Per: TShape
      Left = 63
      Top = 37
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Led_Mod11_Stt: TShape
      Left = 22
      Top = 38
      Width = 26
      Height = 27
      Brush.Color = clRed
      Shape = stCircle
    end
    object Label_Mod11_Rst: TLabel
      Left = 100
      Top = 38
      Width = 30
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod11_RstClick
    end
    object Label_Mod11_Per: TLabel
      Left = 60
      Top = 37
      Width = 32
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod11_PerClick
    end
    object Label_Mod11_Stt: TLabel
      Left = 22
      Top = 38
      Width = 26
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = 'Off'
      Layout = tlCenter
      OnClick = Label_Mod11_SttClick
    end
    object Label149: TLabel
      Left = 8
      Top = 91
      Width = 46
      Height = 13
      Caption = 'Timer On:'
    end
    object Label150: TLabel
      Left = 8
      Top = 115
      Width = 46
      Height = 13
      Caption = 'Timer Off:'
    end
    object Label151: TLabel
      Left = 8
      Top = 139
      Width = 55
      Height = 13
      Caption = 'Tiempo On:'
    end
    object Label152: TLabel
      Left = 8
      Top = 163
      Width = 59
      Height = 13
      Caption = 'Tiempo Frec'
    end
    object Label153: TLabel
      Left = 8
      Top = 187
      Width = 29
      Height = 13
      Caption = 'Timer:'
    end
    object Label154: TLabel
      Left = 22
      Top = 19
      Width = 21
      Height = 13
      Caption = 'STT'
    end
    object Label155: TLabel
      Left = 65
      Top = 19
      Width = 22
      Height = 13
      Caption = 'PER'
    end
    object Label156: TLabel
      Left = 108
      Top = 18
      Width = 22
      Height = 13
      Caption = 'RST'
    end
    object Show_Mod11_TOn: TEdit
      Left = 88
      Top = 83
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 0
      Text = '00:00:00'
      OnKeyPress = Show_Mod11_TOnKeyPress
    end
    object Show_Mod11_TOff: TEdit
      Left = 88
      Top = 107
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      Text = '00:00:00'
      OnKeyPress = Show_Mod11_TOffKeyPress
    end
    object Show_Mod11_TROn: TEdit
      Left = 88
      Top = 131
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      Text = '00:00:00'
      OnKeyPress = Show_Mod11_TROnKeyPress
    end
    object Show_Mod11_TRFr: TEdit
      Left = 88
      Top = 155
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      Text = '00:00:00'
      OnKeyPress = Show_Mod11_TRFrKeyPress
    end
    object Show_Mod11_TMR: TEdit
      Left = 88
      Top = 179
      Width = 57
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      Text = '00:00:00'
    end
  end
  object MainMenu1: TMainMenu
    Left = 748
    Top = 668
    object MenuArchivos: TMenuItem
      Caption = 'Archivos'
      object MenuItemArchAbrir: TMenuItem
        Caption = '&Abrir...'
        ShortCut = 16449
      end
      object MenuItemArchGuardar: TMenuItem
        Caption = '&Guardar'
        ShortCut = 16455
      end
      object MenuItemArchGuardarComo: TMenuItem
        Caption = 'Guardar como...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object MenuItemArchExportar: TMenuItem
        Caption = '&Exportar...'
        ShortCut = 16453
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object MenuItemArchImprimir: TMenuItem
        Caption = '&Imprimir...'
        ShortCut = 16457
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object MenuItemArchSalir: TMenuItem
        Caption = '&Salir'
        ShortCut = 16467
      end
    end
    object MenuOpciones: TMenuItem
      Caption = 'Opciones'
      object MenuCalibracion: TMenuItem
        Caption = 'Calibraci'#243'n...'
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object Conexion: TMenuItem
        Caption = 'Conexi'#243'n...'
        OnClick = ConexionClick
      end
    end
    object MenuVentana: TMenuItem
      Caption = 'Ventana'
      object VentanaCascade: TMenuItem
        Caption = 'Cascada'
      end
      object VentanaTile: TMenuItem
        Caption = 'Mosaico'
      end
    end
    object MenuAyuda: TMenuItem
      Caption = 'Ayuda'
      object Contenido1: TMenuItem
        Caption = 'Contenido...'
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Acercade1: TMenuItem
        Caption = 'Acerca de ...'
      end
    end
  end
  object ImageListToolBar: TImageList
    Left = 708
    Top = 668
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008000000000000000000000000000000000
      0000000000000000000000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00000000000000FF00000000000000000000000000
      0000000000000000000000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080000000000000000000000000000000800000000000000000
      0000000000000000800000008000000080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000800000000000000080000000
      000000008000000080000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000000000000000
      0000000000000080000000000000000000000000000000800000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      000000000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000000000000080000000
      000000008000000080000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000800000000000000000
      0000000000000080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000000000000080000000
      000000008000000080000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000000000000080000000
      000000008000000080000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000000000000000000000000000000000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8000000000000000800000008000000000000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      0000000080000000000000000000000000000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      0000000080000000000000000000000000000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080000000
      0000000080000000000000000000000000000000800000008000000080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C4CBCF00B8BFC300B1B8
      BB00B5BCBF00BFC6CA00C7CFD300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      800000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFC6CA00A1A7AB00808588007176
      78007A7F8100959B9E00B5BDC000C6CED2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF00000000008080800000000000000000000000000000000000C6CE
      D200B9C1C400AAB0B400A4ABAE00A2A8AB00878E99003644A1001B2CA100202C
      8E00343B5E005C6061008F959700BCC3C7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000000000FF000000000000000000000000000000000000C6CED200B3BA
      BE00898F920065696B00595C5E0051566400172EE1006D7DF9008A97FA005E70
      F8001027D6002B335E006A6E7000ADB4B7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000808080000000000000FF
      FF0000FFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      000000FF000000FF000000000000808080000000000000000000BCC3C7007679
      7B00888888006D6D6D006D6D6D002A3AB60097A2F500FFFFFF00FFFFFF006A78
      E4003249F6001428BE005C606100A6ACB000000000000000000000000000A4A0
      A000A4A0A00000000000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0
      A000A4A0A0000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000FF000000FF000000FF000000000000FF
      000000FF000000FF000000FF00000000000000000000C7CFD3008B9092008888
      8800A0A0A000AAAAAA00AFAFAF00132CEB00FFFFFF00FFFFFF006A78E4006D7D
      F900F0F2FE00122AE00063676900AAB0B400000000000000000000000000FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A4A0A0000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000FF000000000000FF000000FF
      000000FF000000FF000000FF000000000000C7CFD300BBC2C6005C5D5D007A7A
      7A00ABABAB00C7C7C700C9C9C900132BE500D1D4EE006A78E4006D7DF900FFFF
      FF00F0F2FE00162DDB007E848600B5BDC0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000FF000000000000C0C7CB00888E9000545454006A67
      670053454500534545009D9898004D5EE6002036DC006D7DF900FFFFFF00FFFF
      FF006C7BEE003E4EBB00A5ABAF00C4CBCF00000000000000000000000000A4A0
      A000A4A0A00000000000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0
      A000A4A0A0000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF0000000000000000FF000000FF
      000000FF000000FF000000FF000000000000A5A2A50061474700525252005345
      4500857272009A7979005E5E5E00ACADBA00354AEB001F34D7004A5AD3002F44
      E2002E42D700A3ABBA00C1C9CD0000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A4A0A0000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF0000000000000000FF
      000000FF000000FF000000FF00000000000088686900977A7A00464646007171
      71008A8A8A00787878008E75750054545400C7C7C7007B82C1003E4BAE00434D
      7F009CA3A600C7CFD30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000008080800000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      000000FF000000FF0000000000008080800098787900D0BABA003C3C3C008383
      8300C7C7C7009A9A9A007573730054545400B0B0B000A5A5A5006D6D6D006064
      6600A7AEB1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      00000000000000FF0000000000000000000094797A00F9F7F7004B4B4B004F4F
      4F00FFFFFF00C7C7C700737373006B6A6A0096969600949494006D6D6D00777C
      7F00B3BABE000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000000000008080800000000000A89DA000A7919100C9C9C9003939
      39004E4E4E006C6C6C00545454006C6C6C007F7F7F008787870062636400999F
      A200C1C9CD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      80000000000000000000FF000000FF000000FF000000FF000000FF0000000000
      00000000000080808000000000000000000000000000A98B8B0086696A004E43
      44003939390048484800535353005D5D5D00616161006D6D6D0081858800B7BE
      C200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      00007C808200363636003F3F3F004D4D4D00565757007D818300B9C0C400C6CE
      D200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFC6CA00A1A7AA009EA4A700B8C0C300C6CED200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4000000
      0000C8D0D4000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C8D0D40000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000BFBF00000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000000000000000000000000000000000000000000C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D40000FFFF0000FFFF0000FFFF00C8D0D400C8D0
      D400000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0000000000000BFBF0000BFBF000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000008080000000000000000000000000000000000000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000000000000000000000000000000000C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400808080008080800080808000C8D0D400C8D0
      D40000000000C8D0D4000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000BFBF0000BF
      BF00000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000FFFF000000000000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C8D0D400C8D0D400000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000BF
      BF0000BFBF000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      000000808000008080000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4000000
      0000C8D0D40000000000C8D0D400000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      000000BFBF0000BFBF0000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF000000000000FFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C8D0
      D40000000000C8D0D40000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF000000000000BFBF0000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008080000000000000000000000000000000000000FFFF000000
      000000FFFF000000000000FFFF000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8D0D40000000000C8D0D400000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000000000000000000000000000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080808000000000000000000080000000800000008000
      0000800000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000000000000080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008080
      8000800000008000000080808000000000000000000080000000808080008000
      0000800000008080800000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000080
      8000008080000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000FF0000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008000
      0000808080008000000080808000000000000000000080808000800000008080
      800080000000808080000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FF00000000FFFF00FF00000000FFFF00FFFFFF000000
      0000008080000000000000000000000000000000000000000000000000000000
      00000000000000FF0000C0C0C00000FF0000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008080
      8000800000008000000080808000000000000000000080000000808080008000
      0000800000008080800000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000008080000080800000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FF00000000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000FF0000C0C0C00000FF0000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000808080008000
      0000808080008000000080808000000000000000000080808000800000008080
      800080000000808080000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000008080000080800000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000C0C0C00000FF0000C0C0C00000FF0000C0C0C0000000
      0000000000000000000000000000000000000000000000000000800000008080
      8000800000008000000080808000000000000000000080000000808080008000
      00008000000080808000000000000000000000000000000000000000000000FF
      FF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF00FF000000FFFFFF0000FF
      FF00000000000080800000000000000000000000000000000000000000000000
      0000000000000000000000FFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000FF0000C0C0C00000FF0000C0C0C00000FF0000C0C0
      C000000000000000000000000000000000000000000000000000808080008000
      0000808080008000000080808000000000000000000080808000800000008080
      8000800000008080800000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF00FF000000FFFFFF00FF000000FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000C0C0C00000FF0000C0C0C00000FF0000C0C0C00000FF
      0000C0C0C0000000000000000000000000000000000000000000800000008080
      8000800000008000000080808000000000000000000080000000808080008000
      0000800000008080800000000000000000000000000000FFFF00FFFFFF0000FF
      FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000FF0000C0C0C00000FF0000C0C0C00000FF0000C0C0
      C000000000000000000000000000000000000000000000000000808080008000
      0000808080008000000080808000000000000000000080808000800000008080
      80008000000080808000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000080000000800000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000C0C0C00000FF0000C0C0C00000FF0000C0C0C0000000
      0000000000000000000000000000000000000000000000000000800000008080
      8000800000008000000080808000000000000000000080000000808080008000
      0000800000008080800000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000FF0000C0C0C00000FF0000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000808080008000
      0000808080008000000080808000000000000000000080808000800000008080
      8000800000008080800000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00000000000000000000008000000000000000000000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000FF0000C0C0C00000FF0000C0C0C00000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008080
      8000800000008000000080808000000000000000000080000000808080008000
      0000800000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF000000000000000000000000000000000000000000FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000FF0000C0C0C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008000
      0000808080008000000080808000000000000000000080808000800000008080
      8000800000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FF0000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008080
      8000800000008000000000000000000000000000000080000000808080008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF007FFDFFFF000000007EFDFFFF00000000
      7D7DFFFF000000007BB8FE00000000007BBF5200000000000000FE0000000000
      3BFF5200000000003BFFFE000000000057FF5200000000006FFFFE0000000000
      7FFF5200000000006F7FFE0100000000697FFE0300000000573FFE0700000000
      577FFFFF00000000571FFFFF00000000FFFFFFFFF80FFF81FFFFFEFFE003FF00
      FFFFFC7FC001E0008001F83FC001C000BFFDF83F8000C000A405FC7F80008000
      A405FEFF80000000BFFDFEFF80000000A405FC7F80000001A405FC7F80000003
      BFFDF83F800000078001F83FC00100078001F83FC00100078001FC7FE003800F
      FFFFFEFFF80FF00FFFFFFFFFFFFFF83FFFFFFFFFFFFFFFFFFFFFC001FFFFC007
      C07F8031001F8003803F8031000F0001801F803100070001800F800140030001
      C007800120010000E003800150000000F0018FF12A9F8000F8018FF1555FDFE0
      FC018FF1201FE821FE018FF18FF1EFF7FF038FF1FFF9F417FFFF8FF5FF75F7FB
      FFFF8001FF8FF803FFFFFFFFFFFFFFFFFFFFE01FFFFFE1C3FFFFC00FF9FFC183
      C00FC007F8FFC1838007C003F87FC1838003E003F83FC1838001F003F81FC183
      8001F807F80FC183C001F80FF807C1838001FC9FF807C1830000FF7FF80FC183
      0000FE3FF81FC1838001F367F83FC183C003E143F87FC183F00FE003F8FFC183
      FFFFF007F9FFC387FFFFF80FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object TimerSciTx: TTimer
    Interval = 500
    OnTimer = TimerSciTxTimer
    Left = 668
    Top = 672
  end
end
