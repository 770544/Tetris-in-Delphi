object 설정: T설정
  Left = 286
  Top = 0
  Caption = #49444#51221
  ClientHeight = 300
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object GostLab: TLabel
    Left = 8
    Top = 8
    Width = 80
    Height = 16
    Caption = #50976#47161': True'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #44417#49436#52404
    Font.Style = []
    ParentFont = False
  end
  object GostOnOffBtn: TButton
    Left = 8
    Top = 46
    Width = 75
    Height = 25
    Caption = #45124#45796
    TabOrder = 0
    OnClick = GostOnOffBtnClick
  end
end
