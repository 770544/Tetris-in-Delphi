object Form2: TForm2
  Left = 1150
  Top = 186
  Caption = #49444#51221
  ClientHeight = 70
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesigned
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object Option: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 70
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 170
    object BGMLab: TLabel
      Left = 8
      Top = 8
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
    object BGMAddBtn: TButton
      Left = 159
      Top = 29
      Width = 75
      Height = 25
      Caption = #52628#44032
      TabOrder = 0
      OnClick = BGMAddBtnClick
    end
    object 배경음악: TComboBox
      Left = 8
      Top = 30
      Width = 145
      Height = 23
      TabOrder = 1
      Text = #48176#44221#51020#50501
      OnChange = 배경음악Change
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 344
    Top = 8
  end
end
