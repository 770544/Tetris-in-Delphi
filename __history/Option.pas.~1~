unit Option;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  T설정 = class(TForm)
    GostOnOffBtn: TButton;
    GostLab: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure GostOnOffBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  설정: T설정;
  Gost : boolean;

implementation

{$R *.dfm}

procedure T설정.FormCreate(Sender: TObject);
begin
  Gost := True;
end;

procedure T설정.GostOnOffBtnClick(Sender: TObject);
begin
  if Gost = True then
  begin
    Gost := False;
    GostOnOffBtn.Caption := '키다';
  end else
  begin
    Gost := True;
    GostOnOffBtn.Caption := '끄다';
  end;
end;

end.
