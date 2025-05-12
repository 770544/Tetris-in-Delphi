unit Option;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;
type
  TForm2 = class(TForm)
    BGMLab: TLabel;
    OpenDialog1: TOpenDialog;
    Option: TPanel;
    BGMAddBtn: TButton;
    배경음악: TComboBox;
    procedure BGMAddBtnClick(Sender: TObject);
    procedure 배경음악Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  BGM : string;

implementation

{$R *.dfm}

uses Game;

procedure TForm2.BGMAddBtnClick(Sender: TObject);
begin
  OpenDialog1.Filter := 'MP3 Files (*.mp3)|*.mp3';
  OpenDialog1.Title := '배경음악 선택, MP3 파일만 지원합니다.';

  if OpenDialog1.Execute then
  begin
    BGM := OpenDialog1.FileName;
    배경음악.Items.Add(BGM);
  end;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Escape then
  begin
    Self.Close;
    Form1.Timer1.Enabled := True;
    Form1.MediaPlayer1.FileName := BGM;
  end;
end;

procedure TForm2.배경음악Change(Sender: TObject);
begin
  BGM := 배경음악.Text;
end;

end.
