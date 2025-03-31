object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Tetris'
  ClientHeight = 550
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  TextHeight = 15
  object MediaPlayer1: TMediaPlayer
    Left = -3
    Top = 50
    Width = 253
    Height = 30
    DoubleBuffered = True
    FileName = 'C:\Users\GreenPC\Downloads\TetrisBGM1.mp3'
    ParentDoubleBuffered = False
    TabOrder = 2
    OnNotify = MediaPlayer1Notify
  end
  object Control: TPanel
    Left = 0
    Top = 0
    Width = 250
    Height = 70
    Align = alTop
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    object NextBlockLabel: TLabel
      Left = 130
      Top = 9
      Width = 44
      Height = 21
      Caption = 'NEXT: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LevelLabel: TLabel
      Left = 10
      Top = 9
      Width = 49
      Height = 21
      Caption = 'LEVEL: '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object LevelLabel2: TLabel
      Left = 65
      Top = 9
      Width = 9
      Height = 21
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LineLabel1: TLabel
      Left = 10
      Top = 36
      Width = 39
      Height = 21
      Caption = 'LINE: '
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 52
      Top = 36
      Width = 9
      Height = 21
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object HoldBlockLabel: TLabel
      Left = 130
      Top = 36
      Width = 49
      Height = 21
      Caption = 'HOLD: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Shape1: TShape
      Left = 185
      Top = 43
      Width = 10
      Height = 10
    end
  end
  object BackGround: TPanel
    Left = 0
    Top = 70
    Width = 250
    Height = 480
    Align = alClient
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
  end
  object Alpha: TTimer
    Interval = 1
    OnTimer = AlphaTimer
    Top = 72
  end
  object Beta: TTimer
    OnTimer = BetaTimer
    Left = 40
    Top = 72
  end
end
