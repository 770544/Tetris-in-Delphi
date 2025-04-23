object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #47784#50577#47582#52628#44592
  ClientHeight = 730
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  TextHeight = 15
  object Menu: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 70
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object LineLab: TLabel
      Left = 16
      Top = 16
      Width = 50
      Height = 19
      Caption = #51460': 0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #44417#49436#52404
      Font.Style = []
      ParentFont = False
    end
    object LevelLab: TLabel
      Left = 148
      Top = 16
      Width = 70
      Height = 19
      Caption = #49688#51456': 0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #44417#49436#52404
      Font.Style = []
      ParentFont = False
    end
  end
  object Game: TPanel
    Left = 0
    Top = 70
    Width = 300
    Height = 660
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 600
  end
  object Timer1: TTimer
    Interval = 600
    OnTimer = Timer1Timer
    Left = 264
    Top = 8
  end
end
