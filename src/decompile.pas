unit decompile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, FileCtrl,Buttons;
type
  TFrmdecomp=class(TForm)
    Edit_IN: TEdit;
    Edit_Out: TEdit;
    OpenDialog1: TOpenDialog;
    btnIN: TSpeedButton;
    btnOUT: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    btnCancel: TButton;
    btnOK: TButton;
    procedure btnCancelClick(Sender : TObject);
    procedure btnINClick(Sender: TObject);
    procedure btnOUTClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end ;

var
  Frmdecomp: TFrmdecomp;


implementation

uses CHMCONST;

{$R *.DFM}

procedure TFrmdecomp.btnCancelClick(Sender : TObject);
begin
  Close
end;

procedure TFrmdecomp.btnINClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit_IN.Text:=OpenDialog1.FileName;
end;

procedure TFrmdecomp.btnOUTClick(Sender: TObject);
var
  SavePath : string;
begin
  if SelectDirectory(CH_Language('Select Directory',true), '', SavePath) then
     Edit_Out.Text:=SavePath;
end;



procedure TFrmdecomp.btnOKClick(Sender: TObject);
begin
  if (trim(Edit_IN.Text)<>'') and (trim(Edit_Out.Text)<>'') then
    if Fileexists(Edit_IN.Text) then
      self.ModalResult:=mrok;
end;

procedure TFrmdecomp.FormShow(Sender: TObject);
begin
  ChangLanguage(Self);
end;

end.
