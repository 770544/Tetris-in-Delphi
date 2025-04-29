unit Option;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;
type
  T���� = class(TForm)
    GostOnOffBtn: TButton;
    GostLab: TLabel;
    BGMLab: TLabel;
    OpenDialog1: TOpenDialog;
    Option: TPanel;
    BGMAddBtn: TButton;
    �������: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure GostOnOffBtnClick(Sender: TObject);
    procedure BGMAddBtnClick(Sender: TObject);
    procedure �������Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ����: T����;
  Gost : boolean;
  BGM : string;

implementation

{$R *.dfm}

procedure T����.BGMAddBtnClick(Sender: TObject);
begin
  OpenDialog1.Filter := 'MP3 Files (*.mp3)|*.mp3';
  OpenDialog1.Title := '������� ����, MP3 ���ϸ� �����մϴ�.';

  if OpenDialog1.Execute then
  begin
    BGM := OpenDialog1.FileName;
    �������.Items.Add(BGM);
  end;
end;

procedure T����.FormCreate(Sender: TObject);
begin
  Gost := True;
end;

procedure T����.GostOnOffBtnClick(Sender: TObject);
begin
  if Gost = True then
  begin
    Gost := False;
    GostOnOffBtn.Caption := 'Ű��';
    GostLab.Caption := '����: False';
  end else
  begin
    Gost := True;
    GostOnOffBtn.Caption := '����';
    GostLab.Caption := '����: True';
  end;
end;

procedure T����.�������Change(Sender: TObject);
begin
  BGM := �������.Text;
end;

end.
