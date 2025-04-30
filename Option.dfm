object 설정: T설정
  Left = 395
  Top = 165
  Caption = #49444#51221
  ClientHeight = 170
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object Option: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 170
    Align = alClient
    TabOrder = 0
    ExplicitTop = 8
    ExplicitHeight = 300
    object HardModeLab: TLabel
      Left = 8
      Top = 8
      Width = 128
      Height = 16
      Caption = #50612#47140#50868#51312#44148': '#44732#51664
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44417#49436#52404
      Font.Style = []
      ParentFont = False
    end
    object BGMLab: TLabel
      Left = 8
      Top = 112
      Width = 64
      Height = 16
      Caption = #48176#44221#51020#50501
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #44417#49436#52404
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 37
      Width = 318
      Height = 11
      Caption = '* '#50612#47140#50868' '#51312#44148#51012' '#53412#44144#45208' '#45132' '#49884' '#45440#51060#44032' '#45796#49884' '#49884#51089#46121#45768#45796' *'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #44417#49436#52404
      Font.Style = []
      ParentFont = False
    end
    object HardModeBtn: TButton
      Left = 159
      Top = 6
      Width = 75
      Height = 25
      Caption = #53412#45796
      TabOrder = 0
      OnClick = HardModeBtnClick
    end
    object BGMAddBtn: TButton
      Left = 159
      Top = 133
      Width = 75
      Height = 25
      Caption = #52628#44032
      TabOrder = 1
      OnClick = BGMAddBtnClick
    end
    object 배경음악: TComboBox
      Left = 8
      Top = 134
      Width = 145
      Height = 23
      TabOrder = 2
      Text = #48176#44221#51020#50501
      OnChange = 배경음악Change
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 344
    Top = 8
  end
end
