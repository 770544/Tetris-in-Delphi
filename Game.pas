unit Game;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Menu: TPanel;
    Game: TPanel;
    LineLab: TLabel;
    ScoreLab: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CreateBlock(X, Y : integer; Color : TColor);
    procedure CreateMino;
    procedure MoveMino(X, Y : integer);
    procedure Timer1Timer(Sender: TObject);
    procedure Rotate90;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure InsertLockedBlock;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  HoldMino : integer;
  NextMino : integer;
  NowMino : integer;

  {
    0 : I�̳�
    1 : O�̳�
    2 : Z�̳�
    3 : S�̳�
    4 : J�̳�
    5 : L�̳�
    6 : T�̳�
  }

  Line : integer;                                 // ���� ��
  Level : integer;                                // ����, 50Line�� 1
  Block : array [0..3] of TShape;
  CreateBlockCount : integer;                     // ������� ��� �� ī��Ʈ
  LockedBlock : array [0..19, 0..9] of Boolean;   // ������ ���
  Speed : integer;                                // �̳��� �ϰ� �ӵ�

  {
    �̳�: �������� ������� �̷���� ����
    ���: �̳븦 �̷�� 4���� ���簢��
  }

  MoveCount : integer;                            // �̳��� ������ ī��Ʈ
  SoftDrop : boolean;

implementation

{$R *.dfm}

procedure TForm1.CreateBlock(X, Y : integer; Color : TColor);
var
  NewBlock : TShape;
begin
  NewBlock := TShape.Create(Game);
  NewBlock.Parent	:= Game;
  NewBlock.Left := X;
  NewBlock.Top := Y;
  NewBlock.Height := 30;
  NewBlock.Width := 30;
  NewBlock.Brush.Color := Color;
  Block[CreateBlockCount] := NewBlock;
  CreateBlockCount := CreateBlockCount + 1;
end;

procedure TForm1.CreateMino;
begin
  case NextMino of
    0 : begin
      CreateBlock(90, 0, clAqua);
      CreateBlock(120, 0, clAqua);
      CreateBlock(150, 0, clAqua);
      CreateBlock(180, 0, clAqua);
    end;

    1 : begin
      CreateBlock(120, 0, clYellow);
      CreateBlock(120, 30, clYellow);
      CreateBlock(150, 0, clYellow);
      CreateBlock(150, 30, clYellow);
    end;

    2 : begin
      CreateBlock(90, 0, clRed);
      CreateBlock(120, 0, clRed);
      CreateBlock(120, 30, clRed);
      CreateBlock(150, 30, clRed);
    end;

    3 : begin
      CreateBlock(150, 0, clGreen);
      CreateBlock(120, 0, clGreen);
      CreateBlock(120, 30, clGreen);
      CreateBlock(90, 30, clGreen);
    end;

    4 : begin
      CreateBlock(150, 30, clBlue);
      CreateBlock(120, 30, clBlue);
      CreateBlock(90, 30, clBlue);
      CreateBlock(90, 0, clBlue);
    end;

    5 : begin
      CreateBlock(150, 0, RGB(255, 165, 0));
      CreateBlock(120, 0, RGB(255, 165, 0));
      CreateBlock(90, 0, RGB(255, 165, 0));
      CreateBlock(90, 30, RGB(255, 165, 0));
    end;

    6 : begin
      CreateBlock(90, 0, clPurple);
      CreateBlock(120, 0, clPurple);
      CreateBlock(120, 30, clPurple);
      CreateBlock(150, 0, clPurple);
    end;
  end;

  NowMino := NextMino;
  Randomize;
  NextMino := Random(7);
  CreateBlockCount := 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Line := 0;
  Level := 0;
  Speed := 600;

  Randomize;
  NextMino := Random(7);
  CreateMino;
  MoveCount := 15;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i : integer;
  StopFlag : boolean;
begin
  StopFlag := False;

  case Key of
    VK_Left:
      MoveMino(-30, 0); // �������� ��ĭ �̵�

    VK_Right:
      MoveMino(30, 0);  // ���������� ��ĭ �̵�

    VK_Up:
      Rotate90;         // 90�� ȸ��

    VK_Down:
    begin
      if SoftDrop = False then
      Timer1.Interval	:= Timer1.Interval - 500;   // ����Ʈ���
      SoftDrop := True;
    end;

    VK_Space:
    begin
      // �ϵ���
    end;

    Ord('A'):
    begin
      Rotate90;
      Rotate90;         // 180�� ȸ��
    end;
  end;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Down then
  begin
    Timer1.Interval := Timer1.Interval + 500;
    SoftDrop := False;
  end;
end;

procedure TForm1.InsertLockedBlock;
var
  i : integer;
  NewLockedBlock : TShape;
begin
  for I := 0 to 3 do
    begin
      LockedBlock[Block[i].Top div 30, Block[i].Left div 30] := True; // LockedBlock �迭�� �Ҵ�

      NewLockedBlock := TShape.Create(Game);
      NewLockedBlock.Parent	:= Game;
      NewLockedBlock.Left := Block[i].Left;
      NewLockedBlock.Top := Block[i].Top;
      NewLockedBlock.Height := 30;
      NewLockedBlock.Width := 30;

      case NowMino of
        0:
          NewLockedBlock.Brush.Color := clAqua;

        1:
          NewLockedBlock.Brush.Color := clYellow;

        2:
          NewLockedBlock.Brush.Color := clRed;

        3:
          NewLockedBlock.Brush.Color := clGreen;

        4:
          NewLockedBlock.Brush.Color := clBlue;

        5:
          NewLockedBlock.Brush.Color := RGB(255, 165, 0);

        6:
          NewLockedBlock.Brush.Color := clPurple;
      end;

      Block[i].Free;
      Block[i] := nil;
      CreateMino;
    end;
end;

procedure TForm1.MoveMino(X, Y: integer);
var
  i, j : integer;
  StopFlag : boolean; // ���ν��� ����
  ILBF : boolean;     // Insert Locked Block Flag
begin
  StopFlag := False;
  ILBF := False;

  for I := 0 to 3 do
  begin
    if Block[i] = nil then
    // ������ ���� ������ �� �߻��ϴ� ���� ����
    begin
      StopFlag := True;
    end;
  end;

  if StopFlag = False then
  begin
    for I := 0 to 3 do
    begin
        if (Block[i].Left + X < 0) or (Block[i].Left + X > 270) then
          StopFlag := True;         // �̳밡 ȭ�� ������ ������ �� ����

        if (Block[i].Top + Y > 570) then
        begin
          StopFlag := True;
          ILBF := True;
        end;

        if ((Block[i].Left div 30) + (X div 30) < 0) then
        begin
          StopFlag := True;         // (Block[i].Left div 30) + (X div 30) < 0 �϶� �ε��� ���� ���� �߻� ����
        end;

        if (StopFlag = False) and (LockedBlock[(Block[i].Top div 30) + (Y div 30), (Block[i].Left div 30) + (X div 30)]) then
        begin
          StopFlag := True;
          ILBF := True;  // �̳밡 �������� ��Ͽ� ���� �����̶�� InsertShapeFlag := True
        end;
    end;
  end;

  if StopFlag = False then
  begin
    for I := 0 to 3 do
    begin
      Block[i].Left := Block[i].Left + X;
      Block[i].Top := Block[i].Top + Y;
    end;
  end;

  // �� ���ִ� �ڵ�

  if ILBF = True then
    InsertLockedBlock;
end;

procedure TForm1.Rotate90;
var
  i : integer;
  DX, DY : integer; // �������� �Ÿ�, DistanceX and DistanceY
begin
  for I := 0 to 3 do
  begin
    if i <> 1 then
    begin
      DX := Block[i].Left - Block[1].Left;
      DY := Block[i].Top - Block[1].Top;

      Block[i].Left := Block[1].Left + DY;
      Block[i].Top := Block[1].Top - DX;
    end;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  MoveMino(0, 30);
end;

end.
