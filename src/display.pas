unit display;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ComCtrls, ImgList, ExtCtrls, Buttons;
type
  TFrmshow=class(TForm)
    Timer1: TTimer;
    ImageList1: TImageList;
    btnStop: TSpeedButton;
    Image1: TImage;
    procedure FormClose(Sender : TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    MyDC: HDC;
    index:Integer;
    BitMap:TBitmap;
  public
    { Public declarations }
    Procedure Start(Str:String);
  end;

var
  Frmshow: TFrmshow;



implementation

uses CHMCONST, Main;

{$R *.DFM}
Procedure TFrmshow.Start(Str:String);
begin
  if not self.Visible then
    self.Show;
  index:=0;
  Timer1.Enabled:=true;
  RunDosCommand(Str,FrmMain.Memo1);
  Timer1.Enabled:=false;
  Close;
end;

procedure TFrmshow.FormClose(Sender : TObject);
begin
  Close;
end;

procedure TFrmshow.Timer1Timer(Sender: TObject);
begin
  inc(index);
  if index>7 then
    index:=0;
  Bitmap.FreeImage;
  if ImageList1.GetBitmap(Index,BitMap) then
  begin
   // Image1.Picture.Bitmap.FreeImage;
   // Image1.Picture.Bitmap.Assign(BitMap);
    BitBlt(MyDC,16,16,50,50,BitMap.Canvas.Handle,0,0,SRCCOPY);
  end;

end;

procedure TFrmshow.FormCreate(Sender: TObject);
begin
  MyDC:=GetDC(self.Handle);
  BitMap:=TBitmap.Create;
end;

procedure TFrmshow.FormDestroy(Sender: TObject);
begin
  BitMap.Free;
end;

procedure TFrmshow.FormShow(Sender: TObject);
begin
  ChangLanguage(Self);
end;

end.
