object LoginFrm: TLoginFrm
  Left = 693
  Top = 348
  Width = 340
  Height = 215
  BorderIcons = [biSystemMenu]
  Caption = 'Login Form'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Century Gothic'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 17
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 324
    Height = 176
    Align = alClient
    BevelOuter = bvNone
    Color = 16706270
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 63
      Height = 17
      Caption = 'Username'
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 61
      Height = 17
      Caption = 'Password'
    end
    object SpeedButton1: TSpeedButton
      Left = 8
      Top = 133
      Width = 161
      Height = 33
      Caption = 'Login'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SettingsBtn: TSpeedButton
      Left = 176
      Top = 133
      Width = 137
      Height = 33
      Caption = 'Settings'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = SettingsBtnClick
    end
    object Label3: TLabel
      Left = 8
      Top = 182
      Width = 38
      Height = 17
      Caption = 'Server'
    end
    object Label4: TLabel
      Left = 8
      Top = 238
      Width = 64
      Height = 17
      Caption = 'Database'
    end
    object Label5: TLabel
      Left = 8
      Top = 294
      Width = 63
      Height = 17
      Caption = 'Username'
    end
    object Label6: TLabel
      Left = 8
      Top = 350
      Width = 61
      Height = 17
      Caption = 'Password'
    end
    object EdtUsername: TEdit
      Left = 8
      Top = 40
      Width = 305
      Height = 25
      BevelInner = bvLowered
      Color = 15724527
      TabOrder = 0
    end
    object EdtPassword: TEdit
      Left = 8
      Top = 96
      Width = 305
      Height = 25
      BevelInner = bvLowered
      Color = 15724527
      PasswordChar = '*'
      TabOrder = 1
      OnKeyDown = EdtPasswordKeyDown
    end
    object EdtBHost: TEdit
      Left = 8
      Top = 206
      Width = 305
      Height = 25
      BevelInner = bvLowered
      Color = 15724527
      TabOrder = 2
      Text = '10.209.70.5'
    end
    object EdtBDB: TEdit
      Left = 8
      Top = 262
      Width = 305
      Height = 25
      BevelInner = bvLowered
      Color = 15724527
      TabOrder = 3
      Text = 'HRIS_PAYROLL'
    end
    object EdtLogin: TEdit
      Left = 8
      Top = 318
      Width = 305
      Height = 25
      BevelInner = bvLowered
      Color = 15724527
      TabOrder = 4
      Text = 'administrator(albert)'
    end
    object EdtPW: TEdit
      Left = 8
      Top = 374
      Width = 305
      Height = 25
      BevelInner = bvLowered
      Color = 15724527
      PasswordChar = '*'
      TabOrder = 5
      Text = '12345'
    end
  end
end
