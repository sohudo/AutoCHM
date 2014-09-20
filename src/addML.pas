unit addML;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, FileCtrl,Buttons;
type
  TfrmML=class(TForm)
    ChkPane2: TCheckBox;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    btnOpen: TSpeedButton;
    btnOK: TButton;
    btnCancel: TButton;
    CheckBox1: TCheckBox;
    procedure btnCancelClick(Sender : TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end ;

var
  frmML: TfrmML;



implementation

uses CHMCONST, SearchFileThread, Main;

{$R *.DFM}

procedure TfrmML.btnCancelClick(Sender : TObject);
begin
  Close;
end;

procedure TfrmML.btnOpenClick(Sender: TObject);
var
  SavePath : string;
begin
  if SelectDirectory(CH_Language('Select Directory',true), ExtractFilePath(OpenProject), SavePath) then
     Edit1.Text:=SavePath;
end;

procedure TfrmML.btnOKClick(Sender: TObject);
//var
 // SearchFile:TSearchFile;
begin
  //SearchFile:=TSearchFile.Create(Edit1.Text,ComboBox1.Text,SearchList);
  //SearchFile.Free;
  
  Searchpath(Edit1.Text,ComboBox1.Text,SearchList);
  Self.ModalResult:=mrok;
end;

procedure TfrmML.FormShow(Sender: TObject);
begin
  ChangLanguage(Self);
  Edit1.Text:=ExtractFilePath(OpenProject);
end;

end.
