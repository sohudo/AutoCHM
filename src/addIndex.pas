unit addIndex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFrmIndex = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Edit3: TEdit;
    BtnOK: TButton;
    BtnClost: TButton;
    Label3: TLabel;
    Edit2: TEdit;
    procedure BtnClostClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIndex: TFrmIndex;

implementation

uses CHMCONST, FileList;

{$R *.dfm}

procedure TFrmIndex.BtnClostClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmIndex.BtnOKClick(Sender: TObject);
begin
  if trim(Edit1.Text)<>'' then
  self.ModalResult:=mrok;
end;

procedure TFrmIndex.Edit1Change(Sender: TObject);
begin
Edit2.Text:=Edit1.Text;
end;

procedure TFrmIndex.FormShow(Sender: TObject);
begin
  ChangLanguage(Self);
end;

procedure TFrmIndex.SpeedButton1Click(Sender: TObject);
begin
  FrmFileList.isSelect:=true;
  if FrmFileList.ShowModal=mrok then
  begin
    if Trim(Edit1.Text)='' then
    begin
      Edit1.Text:=ChangeFileExt(ExtractFileName(FrmFileList.Edit1.Text),'');
      Edit2.Text:=ExtractFileName(FrmFileList.Edit2.Text);
    end;
    Edit3.Text:=FrmFileList.ListView1.Selected.Caption;
    FrmFileList.isSelect:=false;
  end;
end;

end.
