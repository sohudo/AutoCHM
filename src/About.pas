unit About;

interface

uses
  Windows, Messages, Forms, SysUtils,ShellAPI, StdCtrls, Graphics, Classes,
  Controls, ExtCtrls, jpeg;

type
  TFrmAbout = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure pnButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FRgn: HRGN;
    Ver,SoftTitle,Builde:String;

  public
    { Public declarations }

  end;


Procedure ShowAbout(aSoft,aVer,aBuilde:String);
implementation

{$R *.DFM}
Procedure ShowAbout(aSoft,aVer,aBuilde:String);
var
  FrmAbout: TFrmAbout;
begin
  FrmAbout:=TFrmAbout.Create(Application);
  with FrmAbout do
  begin
    SoftTitle:=aSoft;
    Ver      :=aVer;
    Builde   :=aBuilde;
    ShowModal;
    Free;
  end;
end;

procedure TFrmAbout.FormCreate(Sender: TObject);
//var
 // FColor: TColor;
begin
  Width := Image1.Width;
  Height := Image1.Height;
//  FColor := Image1.Picture.Bitmap.Canvas.Pixels[0,0];
//  FRGN := CreateRegionFromBitmap(Image1.Picture.Bitmap, FColor);
//  SetWindowRgn(Handle, 0, False);
  SetWindowRgn(Handle, FRGN, True);
end;

procedure TFrmAbout.pnButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmAbout.FormDestroy(Sender: TObject);
begin
  if FRGN<>0 then DeleteObject(FRGN);
end;

procedure TFrmAbout.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Y<65 then
  begin
    ReleaseCapture;
    PerForm(WM_SYSCOMMAND,61457, 0);
  end;
end;

procedure TFrmAbout.Image1Click(Sender: TObject);
begin
   Close;
end;

procedure TFrmAbout.Label1Click(Sender: TObject);
begin
  ShellExecute(Handle,nil,PChar(Label1.Hint),nil,nil,SW_SHOWNORMAL);
end;

procedure TFrmAbout.Label3Click(Sender: TObject);
begin
  ShellExecute(Handle,nil,PChar(Label3.Hint),nil,nil,SW_SHOWNORMAL);
end;

procedure TFrmAbout.FormShow(Sender: TObject);
begin
   Label4.Caption:=SoftTitle;
   Label5.Caption:=Format(Label5.Caption,[Ver,Builde]);
end;

end.
