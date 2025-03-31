unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.MPlayer;

type
  TForm1 = class(TForm)
    Control: TPanel;
    BackGround: TPanel;
    LevelLabel: TLabel;
    NextBlockLabel: TLabel;
    LevelLabel2: TLabel;
    Alpha: TTimer;
    MediaPlayer1: TMediaPlayer;
    LineLabel1: TLabel;
    Label1: TLabel;
    Beta: TTimer;
    HoldBlockLabel: TLabel;
    Shape1: TShape;
    procedure FormShow(Sender: TObject); // TShape 복제본 몸통 생성
    procedure CreateBlock(CloneType: String; Parent: TWinControl; X: integer; Y: integer; Size: integer; Color: TColor);
    procedure MoveBlock(X: integer; Y: integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure AlphaTimer(Sender: TObject);
    procedure BetaTimer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Level : integer;                              // 50Line 당 1Level
  NextBlock : integer;
  (*  0: I미노 (Cyan)
      1: O미노 (Yellow)
      2: Z미노 (Red)
      3: S미노 (Green)
      4: J미노 (Blue)
      5: L미노 (Orange)
      6: T미노 (Purple)
  *)
  BlockCheck : array [0..19, 0..9] of boolean;  // 칸에 블록이 있는지 확인
  Block : array [0..3] of TShape;               // 블록 배열
  CreateBlockCount : integer;                   // 만든 블록 수 카운트
  Line : integer;                               // 지운 라인 수
  LineBlock : array [0..199] of TShape;         // 라인에 남은 블록
  HoldBlock : integer;                          // 홀드한 블록
  NowBlock : integer;                           // 지금 블록
  Angle : integer;                              // 블록의 각도

implementation

{$R *.dfm}

procedure TForm1.BetaTimer(Sender: TObject);
begin
  MoveBlock(0, +1); // 블록을 한칸씩 내리기 (하강)
end;

procedure TForm1.CreateBlock(CloneType: String; Parent: TWinControl; X: integer; Y: integer; Size: integer; Color: TColor);
  (*  CloneType : 'Block'일 시 Block 배열에 NewShape (블록분신) 추가
      Parent : 각 블록의 부모 (Control or BackGround)
      X : 블록 생성 X 좌표
      Y : 블록 생성 Y 좌표
      Color : 블록 색
  *)
var
  NewShape : TShape;
begin
  NewShape := TShape.Create(Parent);  // 블록 생성 (뒤에 있는 Parent는 매개변수임 ㅇㅇ)
  NewShape.Parent := Parent;          // 부모 정하기
  NewShape.Shape := stRectangle;      // 블록의 형태 정하기 (사각형)
  NewShape.Left := X;                 // 블록 생성 X좌표 정하기
  NewShape.Top := Y;                  // 블록 생성 Y좌표 정하기
  NewShape.Width := Size;             // 블록의 크기 정하기
  NewShape.Height := Size;            // 블록의 크기 정하기22
  NewShape.Brush.Color := Color;      // 블록 색 정하기

  if CloneType = 'Block' then // 프로시져가 NextBlock에도 사용될 것을 고려
    begin
      Block[CreateBlockCount] := NewShape;        // CreateBlockCount번째 블록 배열에 TShape 대입
      CreateBlockCount := CreateBlockCount + 1;   // CreateBlock + 1
    end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : integer;
begin
  if Key = VK_Left then
    begin                                         // 왼쪽으로 한칸 움직이기
      MoveBlock(-1, 0);
    end;

  if Key = VK_Right then
    begin                                         // 오른쪽으로 한칸 움직이기
      MoveBlock(+1, 0);
    end;

  if Key = VK_Up then                             // 90도 회전
    begin
      //

      for I := 0 to 3 do
        begin
          Block[i].Parent := nil;
          Block[i].Free;
        end;





      Angle := Angle + 90;
    end;

  if (Key = Ord('x')) or (Key = Ord('X')) then    // 90도 회전
    begin
      Angle := Angle + 90
    end;


  if (key = Ord('z')) or (Key = Ord('Z')) then   // -90도 회전
    begin
      Angle := Angle - 90
    end;

  if (Key = Ord('a')) or (Key = Ord('A')) then   // 180도 회전
    begin
      Angle := Angle + 180
    end;

  if Key = VK_Down then                         // 소프트 드롭
    begin
      Beta.interval := 100;
    end;

  if Key = VK_Space then                        // 하드 드롭
    begin

    end;

  if Key = VK_Shift then                       // 홀드
    begin

    end;

  if (Key = Ord('c')) or (Key = Ord('C')) then // 홀드
    begin

    end;

  if Key = Ord('1') then
    begin
      MediaPlayer1.Close;
      MediaPlayer1.Open;                                                        // 미디어 플레이어 재시작
      MediaPlayer1.Notify := False;                                             // 음성 무한반복 끄기 (세팅 리셋)
      MediaPlayer1.FileName := 'C:\Users\GreenPC\Downloads\TetrisBGM1.mp3';     // 음성 파일 불러오기
      MediaPlayer1.Notify := True;                                              // 음성 무한반복 키기
      MediaPlayer1.Play;
    end;

  if Key = Ord('2') then
    begin
      MediaPlayer1.Close;
      MediaPlayer1.Open;
      MediaPlayer1.Notify := False;
      MediaPlayer1.FileName := 'C:\Users\GreenPC\Downloads\TetrisBGM2.mp3';
      MediaPlayer1.Notify := True;
      MediaPlayer1.Play;
    end;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Down then // 소프트 드롭 종료
    Beta.Interval := 1000;

end;

procedure TForm1.FormShow(Sender: TObject);
var
  i, j : integer;
begin
  Level := 1;             // 레벨 기본값
  Randomize;
  NextBlock := Random(7); // 다음 블록 정하기
  CreateBlockCount := 0;

  if NextBlock = 0 then   // 현재 블록 값 정하기
    NowBlock := 0;

  if NextBlock = 1 then
    NowBlock := 1;

  if NextBlock = 2 then
    NowBlock := 2;

  if NextBlock = 3 then
    NowBlock := 3;

  if NextBlock = 4 then
    NowBlock := 4;

  if NextBlock = 5 then
    NowBlock := 5;

  if NextBlock = 6 then
    NowBlock := 6;

  Line := 0;             // 지운 라인 없음
  HoldBlock := -1;       // 홀드한 블록 없음

//  MediaPlayer1.Open;
//  MediaPlayer1.Notify := True;
//  MediaPlayer1.Play;

  for I := 0 to 19 do    // 배열로 되어있는 각 칸의 블록 설치 유무 정하기; 기본값 False
    begin
      for j := 0 to 9 do
        begin
          BlockCheck[i, j] := False;
        end;
    end;

  if NextBlock = 0 then // 현재 블록 생성
    begin
      CreateBlock('Block', BackGround, 75, 0, 25, clAqua);
      CreateBlock('Block', BackGround, 100, 0, 25, clAqua);
      CreateBlock('Block', BackGround, 125, 0, 25, clAqua);
      CreateBlock('Block', BackGround, 150, 0, 25, clAqua);
    end;

  if NextBlock = 1 then
    begin
      CreateBlock('Block', BackGround, 100, 0, 25, clYellow);
      CreateBlock('Block', BackGround, 125, 0, 25, clYellow);
      CreateBlock('Block', BackGround, 100, 25, 25, clYellow);
      CreateBlock('Block', BackGround, 125, 25, 25, clYellow);
    end;

  if NextBlock = 2 then
    begin
      CreateBlock('Block', BackGround, 75, 0, 25, clRed);
      CreateBlock('Block', BackGround, 100, 0, 25, clRed);
      CreateBlock('Block', BackGround, 100, 25, 25, clRed);
      CreateBlock('Block', BackGround, 125, 25, 25, clRed);
    end;

  if NextBlock = 3 then
    begin
      CreateBlock('Block', BackGround, 125, 0, 25, clGreen);
      CreateBlock('Block', BackGround, 100, 0, 25, clGreen);
      CreateBlock('Block', BackGround, 100, 25, 25, clGreen);
      CreateBlock('Block', BackGround, 75, 25, 25, clGreen);
    end;

  if NextBlock = 4 then
    begin
      CreateBlock('Block', BackGround, 125, 25, 25, clBlue);
      CreateBlock('Block', BackGround, 100, 25, 25, clBlue);
      CreateBlock('Block', BackGround, 75, 25, 25, clBlue);
      CreateBlock('Block', BackGround, 75, 0, 25, clBlue);
    end;

  if NextBlock = 5 then
    begin
      CreateBlock('Block', BackGround, 125, 25, 25, clWebOrange);
      CreateBlock('Block', BackGround, 125, 0, 25, clWebOrange);
      CreateBlock('Block', BackGround, 100, 25, 25, clWebOrange);
      CreateBlock('Block', BackGround, 75, 25, 25, clWebOrange);
    end;

  if NextBlock = 6 then
    begin
      CreateBlock('Block', BackGround, 100, 0, 25, clPurple);
      CreateBlock('Block', BackGround, 100, 25, 25, clPurple);
      CreateBlock('Block', BackGround, 125, 25, 25, clPurple);
      CreateBlock('Block', BackGround, 75, 25, 25, clPurple);
    end;

  Randomize;
  NextBlock := Random(7); // 다음 블록 정하기

  if NextBlock = 0 then // 다음 블록 정하기
    begin
      CreateBlock('NextBlock', Control, 180, 17, 10, clAqua);
      CreateBlock('NextBlock', Control, 190, 17, 10, clAqua);
      CreateBlock('NextBlock', Control, 200, 17, 10, clAqua);
      CreateBlock('NextBlock', Control, 210, 17, 10, clAqua);
    end;

  if NextBlock = 1 then
    begin
      CreateBlock('NextBlock', Control, 180, 10, 10, clYellow);
      CreateBlock('NextBlock', Control, 190, 10, 10, clYellow);
      CreateBlock('NextBlock', Control, 180, 20, 10, clYellow);
      CreateBlock('NextBlock', Control, 190, 20, 10, clYellow);
    end;

  if NextBlock = 2 then
    begin
      CreateBlock('NextBlock', Control, 180, 10, 10, clRed);
      CreateBlock('NextBlock', Control, 190, 10, 10, clRed);
      CreateBlock('NextBlock', Control, 190, 20, 10, clRed);
      CreateBlock('NextBlock', Control, 200, 20, 10, clRed);
    end;

  if NextBlock = 3 then
    begin
      CreateBlock('NextBlock', Control, 180, 20, 10, clGreen);
      CreateBlock('NextBlock', Control, 190, 20, 10, clGreen);
      CreateBlock('NextBlock', Control, 190, 10, 10, clGreen);
      CreateBlock('NextBlock', Control, 200, 10, 10, clGreen);
    end;

  if NextBlock = 4 then
    begin
      CreateBlock('NextBlock', Control, 180, 20, 10, clBlue);
      CreateBlock('NextBlock', Control, 180, 10, 10, clBlue);
      CreateBlock('NextBlock', Control, 190, 10, 10, clBlue);
      CreateBlock('NextBlock', Control, 200, 10, 10, clBlue);
    end;

  if NextBlock = 5 then
    begin
      CreateBlock('NextBlock', Control, 180, 10, 10, clWebOrange);
      CreateBlock('NextBlock', Control, 190, 10, 10, clWebOrange);
      CreateBlock('NextBlock', Control, 200, 10, 10, clWebOrange);
      CreateBlock('NextBlock', Control, 200, 20, 10, clWebOrange);
    end;

  if NextBlock = 6 then
    begin
      CreateBlock('NextBlock', Control, 180, 20, 10, clPurple);
      CreateBlock('NextBlock', Control, 190, 20, 10, clPurple);
      CreateBlock('NextBlock', Control, 190, 10, 10, clPurple);
      CreateBlock('NextBlock', Control, 200, 10, 10, clPurple);
    end;
end;

procedure TForm1.MediaPlayer1Notify(Sender: TObject);
begin
   if MediaPlayer1.Position = MediaPlayer1.Length then  // 음악 무한 반복 재생
    MediaPlayer1.Play;

   Form1.SetFocus;
end;

procedure TForm1.MoveBlock(X, Y: integer);
var
  i, j : integer;
  NowXY : integer;
begin
  for I := 0 to 3 do  // 블록 4개 움직이기
    begin
      if X = 0 then
        begin

        end else
        begin
          if True then
            begin
              Block[i].Left := Block[i].Left + (X * 25);  // 블록의 X값 움직이기
            end;

        end;

      if Y = 0 then
        begin

        end else
        begin
          if True then
            begin
              Block[i].Top := Block[i].Top + (Y * 25);  // 블록의 Y값 움직이기
            end;

        end;
    end;
end;

procedure TForm1.AlphaTimer(Sender: TObject); // 판정용
var
  i, j : integer;
  LineCheck : integer; // 한 라인에서 설치된 블록의 수 체크
begin
  for I := 0 to 19 do // 줄 없애기 (라인 클리어)
    begin
      if LineCheck = 10 then
        begin
          Line := Line + 1;
          LineCheck := 0;
          // I - 1 에서 줄 없애기
        end;

      for j := 0 to 9 do
        begin
          if BlockCheck[i, j] = True then     // n번째 줄의 m번째 칸 체크
            begin
              LineCheck := LineCheck + 1;     // n번째 줄의 m번째 칸이 True (블록이 설치되어 있다면) LineCheck + 1
            end else
            begin                             // False라면 반복문 탈출
              LineCheck := 0;
              exit;
            end;
        end;

    end;

  if Line mod 50 = 0 then                     // 50줄 마다 1레벨씩 올리기
    begin
      Level := Level + 1;
      Beta.Interval := Beta.Interval - 100;   // 블록이 떨어지는 속도 올리기
    end;
end;

end.
