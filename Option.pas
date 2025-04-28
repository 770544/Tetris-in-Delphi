unit Option;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  T���� = class(TForm)
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
  ����: T����;
  Gost : boolean;

implementation

{$R *.dfm}

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
  end else
  begin
    Gost := True;
    GostOnOffBtn.Caption := '����';
  end;
end;

end.
