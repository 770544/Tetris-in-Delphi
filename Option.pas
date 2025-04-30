unit Option;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;
type
  T설정 = class(TForm)
    HardModeBtn: TButton;
    HardModeLab: TLabel;
    BGMLab: TLabel;
    OpenDialog1: TOpenDialog;
    Option: TPanel;
    BGMAddBtn: TButton;
    배경음악: TComboBox;
    Label1: TLabel;
    procedure HardModeBtnClick(Sender: TObject);
    procedure BGMAddBtnClick(Sender: TObject);
    procedure 배경음악Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  설정: T설정;
  BGM : string;

implementation

{$R *.dfm}

uses Game;

procedure T설정.BGMAddBtnClick(Sender: TObject);
begin
  OpenDialog1.Filter := 'MP3 Files (*.mp3)|*.mp3';
  OpenDialog1.Title := '배경음악 선택, MP3 파일만 지원합니다.';

  if OpenDialog1.Execute then
  begin
    BGM := OpenDialog1.FileName;
    배경음악.Items.Add(BGM);
  end;
end;

procedure T설정.HardModeBtnClick(Sender: TObject);
begin
  if HardMode = True then
  begin
    HardMode := False;
    HardModeBtn.Caption := '키다';
    HardModeLab.Caption := '어려운 조건: False';
  end else
  begin
    HardMode := True;
    HardModeBtn.Caption := '끄다';
    HardModeLab.Caption := '어려운 조건: True';
  end;
end;

procedure T설정.배경음악Change(Sender: TObject);
begin
  BGM := 배경음악.Text;
end;

end.
