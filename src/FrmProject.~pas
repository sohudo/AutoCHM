unit FrmProject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, ComCtrls, Spin, StdCtrls, IniFiles,Buttons;

type
  TFrmPro = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label_TITLE: TLabel;
    Label_HOME: TLabel;
    Label_DEF: TLabel;
    Label_lang: TLabel;
    Edit1: TEdit;
    ComboBoxlang: TComboBox;
    btnDefault: TButton;
    TabSheet7: TTabSheet;
    btnClose: TButton;
    FontDialog2: TFontDialog;
    Edit3: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    GroupBox5: TGroupBox;
    ChkPane2: TCheckBox;
    ChkPane3: TCheckBox;
    ChkPane5: TCheckBox;
    ChkPane1: TCheckBox;
    ChkPane4: TCheckBox;
    GroupBox1: TGroupBox;
    Chkhhp1: TCheckBox;
    Chkhhp2: TCheckBox;
    Chkhhp4: TCheckBox;
    Chkhhp5: TCheckBox;
    Chkhhp6: TCheckBox;
    Chkhhp3: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ReadProject;
  public
    { Public declarations }
  end;

var
  FrmPro: TFrmPro;

implementation

uses CHMCONST, Main, FileList;

{$R *.dfm}

procedure TFrmPro.FormShow(Sender: TObject);
begin
  ChangLanguage(Self);

  Edit4.Text:= CHMProject;
  Edit5.Text:= HHCProject;
  Edit6.Text:= HHKProject;
  ReadProject;
end;

procedure TFrmPro.SpeedButton1Click(Sender: TObject);
begin
  FrmFileList.isSelect:=true;
  if FrmFileList.ShowModal=mrok then
  begin
    Edit2.Text:=FrmFileList.ListView1.Selected.Caption;
    FrmFileList.isSelect:=false;
  end;
end;

procedure TFrmPro.SpeedButton2Click(Sender: TObject);
begin
  FrmFileList.isSelect:=true;
  if FrmFileList.ShowModal=mrok then
  begin
    Edit3.Text:=FrmFileList.ListView1.Selected.Caption;
    FrmFileList.isSelect:=false;
  end;
end;

procedure TFrmPro.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPro.ReadProject;
var
  Lists:TIniFile;
  Str,SAA:String;
begin
  Lists:=TIniFile.Create(OpenProject);
  with Lists do
  begin
      Chkhhp1.Checked:=ValueExists('OPTIONS','Binary Index');
      Chkhhp2.Checked:=ValueExists('OPTIONS','Binary TOC');
      Chkhhp3.Checked:=ValueExists('OPTIONS','Create CHI file');
      Chkhhp4.Checked:=ValueExists('OPTIONS','Full-text search');
      Chkhhp5.Checked:=ValueExists('OPTIONS','Enhanced decompilation');

      Chkhhp6.Checked:=ValueExists('OPTIONS','Flat');

    Edit1.text:=ReadString('OPTIONS','Title','');
    Edit2.text:=ReadString('OPTIONS','Default topic','');
    Str:=ReadString('WINDOWS','Main','');
    SAA:=trim(GetNOSubStr(Str,10));
    if SAA='0x420' then
       ChkPane3.Checked:=true;
    if SAA='0x20420' then
    begin
     ChkPane3.Checked:=true;
     ChkPane4.Checked:=true;
    end;
    if SAA='0x21420' then
    begin
     ChkPane3.Checked:=true;
     ChkPane4.Checked:=true;
     ChkPane5.Checked:=true;
    end;
   if SAA='0x1020' then
     ChkPane5.Checked:=true;
  end;
end;
procedure TFrmPro.Button1Click(Sender: TObject);
var
  Lists:TIniFile;
  aProject,Str,SAA:String;
  Procedure DelKey(const Section, Ident: String);
  begin
    if Lists.ValueExists(Section, Ident) then
      Lists.DeleteKey(Section, Ident);
  end;
begin
  Lists:=TIniFile.Create(OpenProject);
  with Lists do
  begin
    WriteString('OPTIONS','Title',Edit1.text);
    WriteString('OPTIONS','Compatibility','1.1 or later');
    WriteString('OPTIONS','Compiled file',Edit4.text);
    WriteString('OPTIONS','Contents file',Edit5.text);
    WriteString('OPTIONS','Index file',Edit6.text);
    WriteString('OPTIONS','Default topic',Edit2.text);
    WriteString('OPTIONS','Display compile progress','Yes');

    if Chkhhp1.Checked then
      WriteString('OPTIONS','Binary Index','Yes')
    else
      DelKey('OPTIONS','Binary Index');

    if Chkhhp2.Checked then
      WriteString('OPTIONS','Binary TOC','Yes')
    else
      DelKey('OPTIONS','Binary TOC');

    if Chkhhp3.Checked then
      WriteString('OPTIONS','Create CHI file','Yes')
    else
      DelKey('OPTIONS','Create CHI file');

    if Chkhhp4.Checked then
      WriteString('OPTIONS','Full-text search','Yes')
    else
      DelKey('OPTIONS','Full-text search');

    if Chkhhp5.Checked then
      WriteString('OPTIONS','Enhanced decompilation','Yes')
    else
      DelKey('OPTIONS','Enhanced decompilation');

    if Chkhhp6.Checked then
      WriteString('OPTIONS','Flat','Yes')
    else
      DelKey('OPTIONS','Flat');

    WriteString('OPTIONS','Language','0x804 中文(中国)');


   SAA:='0x20';
   if (ChkPane3.Checked=true) and (ChkPane4.Checked=false) and (ChkPane5.Checked=false) then
     SAA:='0x420';
   if (ChkPane3.Checked=true) and (ChkPane4.Checked=true) and (ChkPane5.Checked=false) then
     SAA:='0x20420';
   if (ChkPane3.Checked=true) and (ChkPane4.Checked=true) and (ChkPane5.Checked=true) then
     SAA:='0x21420';
   if (ChkPane3.Checked=false) and (ChkPane4.Checked=false) and (ChkPane5.Checked=true) then
     SAA:='0x1020';
     
   Str:='"'+Edit1.text+'","'+
   Edit5.text+'","'+Edit6.text+'","'+
   Edit2.text+'","'+Edit3.text+'",,,,,'+SAA+',180,0x104E,[80,60,720,540],0x0,0x0,,,,,0';
   WriteString('WINDOWS','Main',Str);
  end;
  Lists.Free;
  Close;
end;

end.
