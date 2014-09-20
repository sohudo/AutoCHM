unit BatchEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFrmBatch = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BtnOK: TButton;
    BtnClost: TButton;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure BtnClostClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBatch: TFrmBatch;

implementation

uses CHMCONST;

{$R *.dfm}

procedure TFrmBatch.BtnClostClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBatch.BtnOKClick(Sender: TObject);
begin
  if trim(Edit1.text)<>'' then
    Self.ModalResult:=mrOK;
end;

procedure TFrmBatch.FormShow(Sender: TObject);
begin
ChangLanguage(Self);
end;

end.
