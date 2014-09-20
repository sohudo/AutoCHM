unit FrmProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Gauges;

type

  TFormPro = class(TForm)
    lblTitle: TLabel;
    Gauge: TGauge;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Bmp: TBitmap;
    FStartColor, FEndColor: TColor;
    procedure WMEraseBkgnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure AnimateForm;
    procedure SetStartColor(const Value: TColor);
    procedure SetEndColor(const Value: TColor);
  public
    { Public declarations }
    property StartColor: TColor read FStartColor write SetStartColor;
    property EndColor: TColor read FEndColor write SetEndColor;
  end;

procedure ShowProgress(const Title: string;Const ShowColor:TColor=$00F0E080);
{* 显示进度条窗体，参数为窗体标题}
procedure HideProgress;
{* 关闭进度条窗体}
procedure UpdateProgress(Value: Integer);
{* 更新当前进度，参数为进度值：0..100}
procedure UpdateProgressTitle(const Title: string);
{* 更新进度条窗体标题，参数为标题}
implementation
{$R *.DFM}
var
  FormPro:TFormPro=nil;
  FormList: TThreadList;   // 被禁用的窗体列表

// 显示窗体
procedure ShowProgress(const Title: string;Const ShowColor:TColor=$00F0E080);
var
  i: Integer;
begin
  if not Assigned(FormPro) then
    FormPro := TFormPro.Create(Application.MainForm)
  else
    FormPro.BringToFront;
  FormPro.lblTitle.Caption := Title;
 { case ShowColor of
    0:EndColor:= $00F0E080;
    1:EndColor:= $0080F0E0;
    2:EndColor:= $008080F0;
  end; }
  FormPro.EndColor  := ShowColor;
  FormPro.StartColor:= clWhite;
  FormPro.Show;

  FormList.Clear;
  with FormList.LockList do
  try
    for i := 0 to Screen.FormCount - 1 do
      if (Screen.Forms[i] <> FormPro) and Screen.Forms[i].Enabled then
      begin
        Add(Screen.Forms[i]);    // 保存当前可用的窗体列表
        Screen.Forms[i].Enabled := False; // 禁用窗体
      end;
  finally
    FormList.UnlockList;
  end;
  FormPro.Update;
end;

// 关闭窗体
procedure HideProgress;
var
  i: Integer;
begin
  if not Assigned(FormPro) then Exit;
  with FormList.LockList do
  try
    for i := Count - 1 downto 0 do
    begin
      try
        TForm(Items[i]).Enabled := True;   // 恢复原窗体
      except
        ;
      end;
      Delete(i);
    end;
  finally
    FormList.UnlockList;
  end;
  FormPro.Hide;
  Application.ProcessMessages;
  FormPro.Free;
  FormPro := nil;
end;

// 更新进度
procedure UpdateProgress(Value: Integer);
begin
  if Assigned(FormPro) then
  begin
    FormPro.Gauge.Progress := Value;
    FormPro.Update;
    Application.ProcessMessages;
  end;
end;

// 更新标题
procedure UpdateProgressTitle(const Title: string);
begin
  if Assigned(FormPro) then
  begin
    FormPro.lblTitle.Caption := Title;
    FormPro.Update;
    Application.ProcessMessages;
  end;
end;

procedure TFormPro.AnimateForm;
var
  FDesktopCanvas: TCanvas;
  FDesktopHandle: Hwnd;
  FDesktopBitmap: TPicture;
  SRect: TRect;
  aPos1,aPos2,
  N,FLeft,FTop: Integer;
  KLeft,KTop,KRight,KBottom,
  FStep: Double;
begin
  FDesktopHandle := 0;
  FDesktopBitmap := TPicture.Create;
  FDesktopCanvas := TCanvas.Create;
  FDesktopBitmap.Bitmap.Width := Screen.Width;
  FDesktopBitmap.Bitmap.Height := Screen.Height;

  FLeft := Left;
  FTop  := Top;
  if Position = poScreenCenter then
  begin
    if FormStyle = fsMDIChild then
    begin
      FLeft := (Application.MainForm.ClientWidth - Width) div 2;
      FTop := (Application.MainForm.ClientHeight - Height) div 2;
    end else
    begin
      FLeft := (Screen.Width - Width) div 2;
      FTop := (Screen.Height - Height) div 2;
    end;
    if FLeft < 0 then FLeft := 0;
    if FTop < 0 then FTop := 0;
  end
  else if Position = poDesktopCenter then
  begin
    if FormStyle = fsMDIChild then
    begin
      FLeft := (Application.MainForm.ClientWidth - Width) div 2;
      FTop := (Application.MainForm.ClientHeight - Height) div 2;
    end else
    begin
      FLeft := (Screen.DesktopWidth - Width) div 2;
      FTop := (Screen.DesktopHeight - Height) div 2;
    end;
    if FLeft < 0 then FLeft := 0;
    if FTop < 0 then FTop := 0;
  end;

  FDesktopCanvas.Handle := GetWindowDC(FDesktopHandle);
  SendMessage(FDesktopHandle, WM_PAINT, FDesktopCanvas.Handle, 0);
  SRect := Rect(0, 0, Screen.Width, Screen.Height);
  FDesktopBitmap.Bitmap.Canvas.CopyRect(SRect,FDesktopCanvas,SRect);

  FDesktopCanvas.Brush.Color := clBtnFace;
  FDesktopCanvas.Brush.Style := bsClear;
  FDesktopCanvas.Pen.Color := clBlack;
  FDesktopCanvas.Pen.Width := 1;
  //FDesktopCanvas.Pen.Style := psDot;

  N :=Width div 32;
  if N<=0 then
    N := 4;

  aPos1 := (Width div 2)+FLeft;
  aPos2 := (Height div 2)+FTop;
  KTop := aPos2;   KLeft := aPos1;
  KRight  := aPos1;  KBottom := aPos2;

  FStep :=Height / Width;
  while KLeft>FLeft do
  begin
    KLeft   := KLeft - N;
    KTop    := KTop - FStep*N;
    KRight  := KRight + N;
    KBottom := KBottom + FStep*N;
    if (KLeft<FLeft) or (KTop<FTop+1) then Break;
    Sleep(2);
    FDesktopCanvas.Rectangle(Trunc(KLeft),Trunc(KTop),Trunc(KRight),Trunc(KBottom));
    BitBlt(FDesktopCanvas.Handle,Trunc(KLeft)+2,Trunc(KTop)+2,
      Trunc(KRight-KLeft)-4,Trunc(KBottom-KTop)-4,
      FDesktopBitmap.Bitmap.Canvas.Handle,Trunc(KLeft)+2,Trunc(KTop)+2,SRCCOPY);
  end;
  BitBlt(FDesktopCanvas.Handle,Trunc(KLeft)+2,Trunc(KTop)+2,
    Trunc(KRight-KLeft)-4,Trunc(KBottom-KTop)-4,
    FDesktopBitmap.Bitmap.Canvas.Handle,Trunc(KLeft)+2,Trunc(KTop)+2,SRCCOPY);
  ReleaseDC(0, FDesktopCanvas.Handle);
  FDesktopBitmap.Free;
  FDesktopCanvas.Free;
end;



// 窗体初始化
procedure TFormPro.FormCreate(Sender: TObject);
begin
  Bmp := TBitmap.Create;
  Bmp.Width := CLientWidth;
  Bmp.Height := CLientHeight;
  Bmp.PixelFormat := pf24Bit;
end;

// 窗体显示前
procedure TFormPro.FormShow(Sender: TObject);
type
  PRGBArray = ^TRGBArray;
  TRGBArray = array [Byte] of TRGBTriple;
var
  PLine: PRGBArray;
  RowInc: Integer;
  sr, sg, sb, er, eg, eb: Integer;
  x, y: Integer;
  ARect: TRect;
begin
  Top := (Screen.DesktopHeight - Height) div 2;
  Left :=(Screen.DesktopWidth - Width) div 2;
  AnimateForm;


  sr := GetRValue(FStartColor);
  sg := GetGValue(FStartColor);
  sb := GetBValue(FStartColor);
  er := GetRValue(FEndColor);
  eg := GetGValue(FEndColor);
  eb := GetBValue(FEndColor);
  PLine := PRGBArray(Bmp.ScanLine[0]);
  for x := 0 to Bmp.Width - 1 do
  begin
    PLine[x].rgbtRed := sr + (er - sr) * x div Bmp.Width;
    PLine[x].rgbtGreen := sg + (eg - sg) * x div Bmp.Width;
    PLine[x].rgbtBlue := sb + (eb - sb) * x div Bmp.Width;
  end;
  RowInc := (Bmp.Width * 3 + 3) div 4 * 4;
  for y := 1 to Bmp.Height - 1 do
    Move(PLine^, Bmp.ScanLine[y]^, RowInc);
  ARect := Rect(0, 0, Bmp.Width, Bmp.Height);
  Frame3D(Bmp.Canvas, ARect, $EEEEEE, $111111, 1);
  Frame3D(Bmp.Canvas, ARect, $EEEEEE, $EEEEEE, 1);
  Frame3D(Bmp.Canvas, ARect, $111111, $EEEEEE, 1);
end;

// 窗体释放
procedure TFormPro.FormDestroy(Sender: TObject);
begin
  Bmp.Free;
end;
// 背景擦除消息
procedure TFormPro.WMEraseBkgnd(var Msg: TWMEraseBkgnd);
begin
  Bitblt(Msg.DC, 0, 0, ClientWidth, ClientHeight, Bmp.Canvas.Handle, 0, 0, SRCCOPY);
  Msg.Result := 1;  // 已处理
end;

procedure TFormPro.SetStartColor(const Value: TColor);
begin
  FStartColor:= Value;
end;

procedure TFormPro.SetEndColor(const Value: TColor);
begin
  FEndColor:= Value;
end;

initialization
  FormList := TThreadList.Create;

finalization
  FormList.Clear;
  FormList.Free;
end.

