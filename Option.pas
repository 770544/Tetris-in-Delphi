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
    �������: TComboBox;
    procedure BGMAddBtnClick(Sender: TObject);
    procedure �������Change(Sender: TObject);
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
  OpenDialog1.Title := '������� ����, MP3 ���ϸ� �����մϴ�.';

  if OpenDialog1.Execute then
  begin
    BGM := OpenDialog1.FileName;
    �������.Items.Add(BGM);
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

procedure TForm2.�������Change(Sender: TObject);
begin
  BGM := �������.Text;
end;

end.
