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
    LevelLab: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CreateBlock(X, Y : integer; Color : TColor);
    procedure CreateMino;
    procedure MoveMino(X, Y : integer);
    procedure Timer1Timer(Sender: TObject);
    procedure Rotate90;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AddLockedBlock;
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
    0 : I미노
    1 : O미노
    2 : Z미노
    3 : S미노
    4 : J미노
    5 : L미노
    6 : T미노
  }

  Line : integer;                                // 지운 줄
  Level : integer;                               // 레벨, 50Line당 1
  Block : array [0..3] of TShape;
  CreateBlockCount : integer;                    // 만들어진 블록 수 카운트
  LockedBlock : array [0..21, 0..9] of TShape;   // 고정된 블록                               // 미노의 하강 속도

  {
    미노: 여러개의 블록으로 이루어진 도형
    블록: 미노를 이루는 4개의 정사각형
  }

  SoftDrop : boolean;
  Speed : integer;                            // 미노 하강 속도

implementation

{$R *.dfm}

procedure TForm1.AddLockedBlock;
var
  i : integer;
  NewLockedBlock : TShape;
begin
  for I := 0 to 3 do
  begin
    NewLockedBlock := TShape.Create(Game);
    NewLockedBlock.Parent	:= Game;
    NewLockedBlock.Width := 30;
    NewLockedBlock.Height	:= 30;
    NewLockedBlock.Left	:= Block[i].Left;
    NewLockedBlock.Top := Block[i].Top;

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

    LockedBlock[(Block[i].Top div 30), (Block[i].Left div 30)] := NewLockedBlock;
    Block[i].Free;
    Block[i] := nil;
  end;
end;

procedure TForm1.CreateBlock(X, Y : integer; Color : TColor);
var
  NewBlock : TShape;
begin
  NewBlock := TShape.Create(Game);
  NewBlock.Parent	:= Game;
  NewBlock.Height := 30;
  NewBlock.Width := 30;
  NewBlock.Left := X;
  NewBlock.Top := Y;
  NewBlock.Brush.Color := Color;
  Block[CreateBlockCount] := NewBlock;
  CreateBlockCount := CreateBlockCount + 1;
end;

procedure TForm1.CreateMino;
begin
  case NextMino of
    0 : begin
      CreateBlock(90, 60, clAqua);
      CreateBlock(120, 60, clAqua);
      CreateBlock(150, 60, clAqua);
      CreateBlock(180, 60, clAqua);
    end;

    1 : begin
      CreateBlock(120, 60, clYellow);
      CreateBlock(120, 90, clYellow);
      CreateBlock(150, 60, clYellow);
      CreateBlock(150, 90, clYellow);
    end;

    2 : begin
      CreateBlock(90, 60, clRed);
      CreateBlock(120, 60, clRed);
      CreateBlock(120, 90, clRed);
      CreateBlock(150, 90, clRed);
    end;

    3 : begin
      CreateBlock(150, 60, clGreen);
      CreateBlock(120, 60, clGreen);
      CreateBlock(120, 90, clGreen);
      CreateBlock(90, 90, clGreen);
    end;

    4 : begin
      CreateBlock(150, 90, clBlue);
      CreateBlock(120, 90, clBlue);
      CreateBlock(90, 90, clBlue);
      CreateBlock(90, 60, clBlue);
    end;

    5 : begin
      CreateBlock(150, 60, RGB(255, 165, 0));
      CreateBlock(120, 60, RGB(255, 165, 0));
      CreateBlock(90, 60, RGB(255, 165, 0));
      CreateBlock(90, 90, RGB(255, 165, 0));
    end;

    6 : begin
      CreateBlock(90, 60, clPurple);
      CreateBlock(120, 60, clPurple);
      CreateBlock(120, 90, clPurple);
      CreateBlock(150, 60, clPurple);
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
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i : integer;
  StopFlag : boolean;
begin
  StopFlag := False;

  case Key of
    VK_Left:
      MoveMino(-30, 0); // 왼쪽으로 한칸 이동

    VK_Right:
      MoveMino(30, 0);  // 오른쪽으로 한칸 이동

    VK_Up:
      Rotate90;         // 90도 회전

    VK_Down:
    begin
      if SoftDrop = False then
        Timer1.Interval := 50;   // 소프트드롭

      SoftDrop := True;
    end;

    VK_Space:
    begin

    end;

    VK_Shift:
    begin
      // 홀드
    end;

    Ord('A'):
    begin
      Rotate90;
      Rotate90;         // 180도 회전
    end;
  end;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_Down then
  begin
    Timer1.Interval := Speed;
    SoftDrop := False;
  end;
end;

procedure TForm1.MoveMino(X, Y: integer);
var
  i, j, k : integer;
  StopFlag : boolean;       // 프로시져 중지
  ChangeFlag : boolean;     // 블록을 LockedBlock으로 만들어주는 마법
  LockedBlockCount : integer;
  NewLockedBlock : TShape;
begin
  StopFlag := False;
  ChangeFlag := False;

  for I := 0 to 3 do
  begin
    if Block[i] = nil then
    // 해제된 값에 접근할 때 발생하는 오류 방지
    begin
      StopFlag := True;
    end;
  end;

  if StopFlag = False then
  begin
    for I := 0 to 3 do
    begin
        if (Block[i].Left + X < 0) or (Block[i].Left + X > 270) then
        begin
          StopFlag := True;    // 미노가 화면 밖으로 나가는 것 방지
        end;

        if (Block[i].Top + Y > 630) then
        begin
          StopFlag := True;
          ChangeFlag := True;
        end;

        if ((Block[i].Left div 30) + (X div 30) < 0) then
        begin
          StopFlag := True;    // (Block[i].Left div 30) + (X div 30) < 0 일때 인덱스 접근 오류 발생 방지
        end;

        if (StopFlag = False) and (LockedBlock[(Block[i].Top div 30), (Block[i].Left div 30) + (X div 30)] <> nil) then
        begin
          StopFlag := True;
        end;

        if (StopFlag = False) and (LockedBlock[(Block[i].Top div 30) + (Y div 30), (Block[i].Left div 30)] <> nil) then
        begin
          StopFlag := True;
          ChangeFlag := True;  // 미노가 움직임이 블록에 막힐 예정이라면 ChangeFlag := True
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

  if ChangeFlag = True then
  begin
    AddLockedBlock;
    CreateMino;

    Timer1.Enabled := False;
    Timer1.Interval := Speed;
    Timer1.Enabled := True;
  end;

  i := 21;

  while i >= 0 do
  begin
    LockedBlockCount := 0;

    // 1. 해당 줄이 가득 찼는지 확인
    for j := 0 to 9 do
      begin
        if LockedBlock[i, j] <> nil then
        begin
          Inc(LockedBlockCount);
        end;
      end;

    // 2. 가득 찬 줄이라면
    if LockedBlockCount = 10 then
    begin
      // 3. 줄 삭제
      for j := 0 to 9 do
      begin
        LockedBlock[i, j].Free;
        LockedBlock[i, j] := nil;
      end;

      // 4. 위의 모든 줄을 아래로 한 칸씩 이동
      for k := i - 1 downto 0 do
      begin
        for j := 0 to 9 do
        begin
          if LockedBlock[k, j] <> nil then
          begin
            LockedBlock[k, j].Top := LockedBlock[k, j].Top + 30;
            LockedBlock[k + 1, j] := LockedBlock[k, j];
            LockedBlock[k, j] := nil;
          end;
        end;
      end;
      // 5. 같은 줄을 다시 검사 (줄들이 내려와서 또 가득 찰 수도 있음)
    end
    else
    begin
      Dec(i);
    end;
  end;
end;

procedure TForm1.Rotate90;
var
  i : integer;
  DistanceX, DistanceY : integer; // 중점과의 거리
begin
  for I := 0 to 3 do
  begin
    if i <> 1 then
    begin
      DistanceX := Block[i].Left - Block[1].Left;
      DistanceY := Block[i].Top - Block[1].Top;

      Block[i].Left := Block[1].Left + DistanceY;
      Block[i].Top := Block[1].Top - DistanceX;
    end;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  MoveMino(0, 30);
end;

end.
