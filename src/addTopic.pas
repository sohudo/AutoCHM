unit addTopic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFrmTopic = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    BtnOK: TButton;
    BtnClost: TButton;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure BtnClostClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTopic: TFrmTopic;

implementation

uses Main, CHMCONST, FileList;

{$R *.dfm}

procedure TFrmTopic.FormCreate(Sender: TObject);
var 
i : Integer; 
begin
  ComboBox1.Style := csOwnerDrawFixed; //Лђеп ComboBox1.Style := csOwnerDrawVariable;
  for i:=0 to FrmMain.ImageListTree.Count-1 do
    ComboBox1.Items.Add(IntToStr(i));
end;

procedure TFrmTopic.ComboBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  ComboBox1.Canvas.FillRect(Rect);
  FrmMain.ImageListTree.Draw(ComboBox1.Canvas, Rect.Left, Rect.Top, Index);
  ComboBox1.Canvas.TextOut(Rect.Left+20, Rect.Top, IntToStr(Index));
end;

procedure TFrmTopic.BtnClostClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmTopic.BtnOKClick(Sender: TObject);
begin
  if trim(Edit1.Text)<>'' then
    self.ModalResult:=mrok;
end;

procedure TFrmTopic.FormShow(Sender: TObject);
begin
  ChangLanguage(Self);
end;

procedure TFrmTopic.SpeedButton1Click(Sender: TObject);
begin
  FrmFileList.isSelect:=true;
  if FrmFileList.ShowModal=mrok then
  begin
    if Trim(Edit1.Text)='' then
      Edit1.Text:=FrmFileList.Edit2.Text;
    Edit2.Text:=FrmFileList.ListView1.Selected.Caption;
    FrmFileList.isSelect:=false;
  end;
end;

end.
