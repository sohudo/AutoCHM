unit FileList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TFrmFileList = class(TForm)
    Label1: TLabel;
    btnOK: TButton;
    Edit2: TEdit;
    BtnCancel: TButton;
    ListView1: TListView;
    BtnAdd: TButton;
    btnRemove: TButton;
    Edit1: TEdit;
    btnAddFolder: TButton;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    isSelect:Boolean;
  end;

var
  FrmFileList: TFrmFileList;

implementation

uses CHMCONST;

{$R *.dfm}

procedure TFrmFileList.FormShow(Sender: TObject);
begin
 ChangLanguage(Self);
 Label1.Caption:=intToStr(ListView1.Items.Count)+'¸ö';
end;

procedure TFrmFileList.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFileList.btnRemoveClick(Sender: TObject);
begin
  if ListView1.Selected<>nil then
    ListView1.Selected.Delete;
end;

procedure TFrmFileList.ListView1Click(Sender: TObject);
var
  Str,Str1:String;
begin
  if ListView1.Selected<>nil then
  begin
    Str1:=ListView1.Selected.Caption;
    Str:=GethtmlTitle(ExtractFilePath(OpenProject)+Str1);
    Str1:=ExtractFileName(Str1);
    Edit1.Text:=Str1;
    Edit2.Text:=Str;
  end;
end;

procedure TFrmFileList.Button1Click(Sender: TObject);
begin
  if isSelect then
    if ListView1.Selected<>nil then
       Self.ModalResult:=mrOK;
end;

procedure TFrmFileList.ListView1DblClick(Sender: TObject);
begin
   if isSelect then
     if ListView1.Selected<>nil then
      Self.ModalResult:=mrOK;
end;

end.
