object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #47784#50577#47582#52628#44592
  ClientHeight = 700
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
    Height = 100
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object LineLab: TLabel
      Left = 16
      Top = 16
      Width = 60
      Height = 19
      Caption = #51460': '#50689
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = #44417#49436#52404
      Font.Style = []
      ParentFont = False
    end
    object ScoreLab: TLabel
      Left = 148
      Top = 16
      Width = 80
      Height = 19
      Caption = #49688#51456': '#50689
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
    Top = 100
    Width = 300
    Height = 600
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
  end
  object Timer1: TTimer
    Interval = 600
    OnTimer = Timer1Timer
    Left = 264
    Top = 8
  end
end
