unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, StdActns, ActnList, Menus, ImgList, Buttons,
  OleCtrls, SHDocVw, ExtCtrls, About,IniFiles,FReplace,ToolWin;

type
 { TUrlNode =class(TTreeNode)
    private
      FUrl   :String;
      procedure SetUrl(const S: string);
    public
      property Url: string read FUrl write SetUrl;
    end;  }

  TFrmMain = class(TForm)
    Splitter1: TSplitter;
    ControlBar1: TControlBar;
    ToolBar_Edit: TToolBar;
    btnFileList: TToolButton;
    btnProject: TToolButton;
    ToolButton25: TToolButton;
    btnFind: TToolButton;
    ToolBar4: TToolBar;
    btnNew1: TToolButton;
    btnOpen1: TToolButton;
    btnSave1: TToolButton;
    ToolButton1: TToolButton;
    btnCompile: TToolButton;
    Panel1: TPanel;
    PagePnl: TPageControl;
    TabSheet3: TTabSheet;
    ToolBar2: TToolBar;
    btnTextSave: TToolButton;
    ToolButton2: TToolButton;
    btnEditUndo: TToolButton;
    btnEditRedo: TToolButton;
    ToolButton39: TToolButton;
    btnEditCut: TToolButton;
    btnEditCopy: TToolButton;
    btnEditPaste: TToolButton;
    ToolButton31: TToolButton;
    TabSheet4: TTabSheet;
    WebBrowser1: TWebBrowser;
    ToolBar3: TToolBar;
    btnBack: TToolButton;
    btnForward: TToolButton;
    BtnRefresh: TToolButton;
    btnGohome: TToolButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    SBup: TSpeedButton;
    SBdown: TSpeedButton;
    SBleft: TSpeedButton;
    SBico: TSpeedButton;
    SBaddfile: TSpeedButton;
    SBdel: TSpeedButton;
    SBright: TSpeedButton;
    BtnAddFolder: TSpeedButton;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    SBadd: TSpeedButton;
    SBdelete: TSpeedButton;
    btnIDup: TSpeedButton;
    btnIDdown: TSpeedButton;
    btnIDleft: TSpeedButton;
    btnIDright: TSpeedButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    M_ReOpen: TMenuItem;
    Item1: TMenuItem;
    Item2: TMenuItem;
    Item3: TMenuItem;
    Item4: TMenuItem;
    Item5: TMenuItem;
    line: TMenuItem;
    Close1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N34: TMenuItem;
    ChmWizard: TMenuItem;
    N2: TMenuItem;
    M_Compile: TMenuItem;
    N11: TMenuItem;
    DeCompile1: TMenuItem;
    N24: TMenuItem;
    Exit1: TMenuItem;
    M_Topic: TMenuItem;
    EditTopicCaption1: TMenuItem;
    N4: TMenuItem;
    M_addfilehtml: TMenuItem;
    N46: TMenuItem;
    M_AddFolder1: TMenuItem;
    N5: TMenuItem;
    M_DeleteTopic1: TMenuItem;
    N6: TMenuItem;
    M_Expand: TMenuItem;
    M_Collapse: TMenuItem;
    N30: TMenuItem;
    SortItems1: TMenuItem;
    SortAllItem1: TMenuItem;
    N26: TMenuItem;
    M_Property2: TMenuItem;
    M_Index: TMenuItem;
    M_EditName1: TMenuItem;
    N28: TMenuItem;
    AddIndex1: TMenuItem;
    N29: TMenuItem;
    Delete2: TMenuItem;
    N31: TMenuItem;
    Property1: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    Redo1: TMenuItem;
    N9: TMenuItem;
    M_Cut: TMenuItem;
    M_Copy: TMenuItem;
    M_Paste: TMenuItem;
    M_Delete: TMenuItem;
    N19: TMenuItem;
    SelectAll1: TMenuItem;
    N10: TMenuItem;
    Find1: TMenuItem;
    View1: TMenuItem;
    M_Filelist: TMenuItem;
    N45: TMenuItem;
    M_language: TMenuItem;
    Options1: TMenuItem;
    ProPreference: TMenuItem;
    Help1: TMenuItem;
    Help2: TMenuItem;
    HelpIndex1: TMenuItem;
    N49: TMenuItem;
    Register1: TMenuItem;
    N18: TMenuItem;
    About1: TMenuItem;
    ImageListTree: TImageList;
    PopupMenu5: TPopupMenu;
    AddTopic1: TMenuItem;
    N8: TMenuItem;
    Import2: TMenuItem;
    N32: TMenuItem;
    TopicReN: TMenuItem;
    N33: TMenuItem;
    treedel: TMenuItem;
    N12: TMenuItem;
    M_property: TMenuItem;
    PopupMenu3: TPopupMenu;
    Tadd: TMenuItem;
    N25: TMenuItem;
    Trename: TMenuItem;
    N14: TMenuItem;
    Tdel: TMenuItem;
    N27: TMenuItem;
    TProperty: TMenuItem;
    OpenDialog2: TOpenDialog;
    Openhhpdialog1: TOpenDialog;
    SavehhpDialog1: TSaveDialog;
    Imagelist_Smbar: TImageList;
    ImageList_IE: TImageList;
    ImageList_Bar: TImageList;
    PopupMenu1: TPopupMenu;
    N110: TMenuItem;
    N210: TMenuItem;
    N211: TMenuItem;
    N36: TMenuItem;
    N41: TMenuItem;
    Newhhpdialog1: TSaveDialog;
    MwPopupMenu: TPopupMenu;
    MwCut: TMenuItem;
    MwCopy: TMenuItem;
    MwPaste: TMenuItem;
    N38: TMenuItem;
    MwSelectAll: TMenuItem;
    ActionList1: TActionList;
    EditUndo1: TEditUndo;
    EditRedo1: TEditUndo;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    Dhtml_PopMenu: TPopupMenu;
    Pop_Cut: TMenuItem;
    Pop_Copy: TMenuItem;
    Pop_Paste: TMenuItem;
    Pop_Delete: TMenuItem;
    N39: TMenuItem;
    Pop_SelectAll: TMenuItem;
    N40: TMenuItem;
    Pop_Absolute: TMenuItem;
    N42: TMenuItem;
    Pop_Link: TMenuItem;
    N43: TMenuItem;
    Pop_Image: TMenuItem;
    Pop_Table: TMenuItem;
    N44: TMenuItem;
    Pop_PageProperty: TMenuItem;
    ListBox1: TListBox;
    TreeView1: TTreeView;
    Memo1: TMemo;
    N56: TMenuItem;
    N57: TMenuItem;
    SearchFind1: TSearchFind;
    SearchFindNext1: TSearchFindNext;
    SearchReplace1: TSearchReplace;
    SearchFindFirst1: TSearchFindFirst;
    StatusBar1: TStatusBar;
    HideView1: TMenuItem;
    English1: TMenuItem;
    Batch: TMenuItem;
    procedure DeCompile1Click(Sender: TObject);
    procedure M_CompileClick(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure btnSave1Click(Sender: TObject);
    procedure btnUndoClick(Sender: TObject);
    procedure btnNew1Click(Sender: TObject);
    procedure SBupClick(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure SBdownClick(Sender: TObject);
    procedure SBleftClick(Sender: TObject);
    procedure SBrightClick(Sender: TObject);
    procedure SBaddfileClick(Sender: TObject);
    procedure SBicoClick(Sender: TObject);
    procedure SBdelClick(Sender: TObject);
    procedure BtnAddFolderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure M_ExpandClick(Sender: TObject);
    procedure M_CollapseClick(Sender: TObject);
    procedure SortAllItem1Click(Sender: TObject);
    procedure TaddClick(Sender: TObject);
    procedure TrenameClick(Sender: TObject);
    procedure TdelClick(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure addfileClick(Sender: TObject);
    procedure addzfileClick(Sender: TObject);
    procedure ProPreferenceClick(Sender: TObject);
    procedure M_FilelistClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure HideView1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure English1Click(Sender: TObject);
    procedure BatchClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    IndexHtml:integer;
    HistoryList: TStringList;
    indexList:TStringList;
    ReOpenList:TStringList;
    LanguageList:TStringList;
    Procedure CreateTopic;

    function TreeViewAddTVItem(Node: TTreeNode; Caption: String;HasChild:Boolean;AddImageIndex: Integer): TTreeNode;
    Function FindTVItem(Node: TTreeNode;aStr:String):TTreeNode;
    Function GetFileNameTopic(HtmFile:String):String;
    //得到网页文件的标题
    Procedure SaveProject(aStr:String);
    //保存工程文件
    Procedure NewProject(Str:String;Const aCHM:String='';Const aHHC:String='';Const aHHK:String='');
    //新建一个工程文件
    Procedure OpenFileProject(Str:String);
    //打开一个工程文件
    Procedure OpenHtml(Const html:String='';Const aPath:Boolean=false);
    //浏览网页文件 ,html:文件名,aPath:是否有路劲

    Procedure ReadHHCFile(Str:String);
    //读主题文件
    Procedure ReadHHKFile(Str:String);
    //读索引文件
    Procedure DeCompileWriteProjectFile(adir,achm:String);
    //生成反编译CHM文件得HHP(工程文件)

    Function GetPrvNode(aNode:TTreenode;Const isPrv:Boolean=true):TTreenode;
    //得到aNode同级上一个节点或者下一个节点

    Function SetMenuDisable:Boolean;

    Procedure ReadReOpenList;

    Procedure ShowLanguageMenu;
    Procedure AddFileList(aName:String);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  SearchList:TStringList;
  CHMProject,HHCProject,HHKProject:String;
implementation

uses decompile, CHMCONST, display, addML, FrmProgress, addTopic, addIndex,
  FrmProject, FileList, SearchFileThread, BatchEdit;

{$R *.dfm}
{
procedure TUrlNode.SetUrl(const S: string);
begin
  if not Deleting and (S <> FUrl) then
  begin
    FUrl := S;
  end;
end; }

Procedure TFrmMain.DeCompileWriteProjectFile(adir,achm:String);
var
  Lists:TStringlist;
  aHHP,aHHC,aHHK,aCHM1:String;
begin
  if trim(adir)='' then
    exit;
  Lists:=TStringlist.Create;
  Searchpath(adir,'*.hhc',Lists);
  if Lists.Count>0 then
    aHHC :=Lists[0];
  Searchpath(adir,'*.hhk',Lists);
  if Lists.Count>0 then
    aHHk :=Lists[0];
  Lists.Free;
  aHHC :=ExtractFileName(aHHC);
  aHHK :=ExtractFileName(aHHK);
  aCHM1:=ExtractFileName(achm);
  if adir[Length(adir)]<>'\' then
    adir:=adir+'\';
  aHHP :=adir+aCHM1;
  //aHHP :=ChangeFileExt(aHHP,'.hhp');
  //ShowMessage(aHHP);
  NewProject(aHHP,aCHM1,aHHc,aHHk);
end;

procedure TFrmMain.DeCompile1Click(Sender: TObject);
begin
  if Frmdecomp.ShowModal=mrok then
  begin
    Frmshow.Start(GetWindowsDir+'\hh -decompile '+Frmdecomp.Edit_Out.Text+' '+Frmdecomp.Edit_In.Text);
    DeCompileWriteProjectFile(Frmdecomp.Edit_Out.Text,Frmdecomp.Edit_In.Text);
  end;
end;

procedure TFrmMain.M_CompileClick(Sender: TObject);
begin
  if Trim(OpenProject)<>'' then
  Frmshow.Start(SoftPath+'\hhc '+OpenProject);
end;

procedure TFrmMain.OpenFileProject(Str:String);
var
  Lists:TIniFile;
begin
  if not Fileexists(Str) then
    exit;
  if OpenProject=Str then
    exit;
  OpenProject:=Str;

  TreeView1.Items.Clear;
  ListBox1.Items.Clear;
  IndexList.Clear;

  Lists:=TIniFile.Create(OpenProject);
  with Lists do
  begin
    CHMProject:=ReadString('OPTIONS','Compiled file','');
    HHCProject:=ReadString('OPTIONS','Contents file','');
    HHKProject:=ReadString('OPTIONS','Index file','');
  end;
  Lists.Free;
  if Trim(CHMProject)='' then
    CHMProject :=ChangeFileExt(ExtractFileName(OpenProject),'.chm');
  if Trim(HHCProject)='' then
    HHCProject :=ChangeFileExt(ExtractFileName(OpenProject),'.hhc');
  if Trim(HHKProject)='' then
    HHKProject :=ChangeFileExt(ExtractFileName(OpenProject),'.hhk');

  ShowProgress('正在读取主题和索引....');
  ReadHHCFile(ExtractFilePath(OpenProject)+HHCProject);
  ReadHHKFile(ExtractFilePath(OpenProject)+HHKProject);
  HideProgress;

  Close1.Caption:=CH_Language('Close')+'  '+ExtractFileName(OpenProject);
  if ReOpenList.IndexOf(OpenProject)<>-1 then
    ReOpenList.Delete(ReOpenList.IndexOf(OpenProject));
    
  if ReOpenList.Count>=5  then
    ReOpenList.Delete(ReOpenList.Count-1);
  ReOpenList.Insert(0,OpenProject);
  ReadReOpenList;
  btnSave1.Enabled :=false;
end;

Procedure TFrmMain.ReadHHKFile(Str:String);
var
  Lists:TStringlist;
  i,j:integer;
  temp,StrValue:String;
  Procedure FindIndex(s:string);
  var
    aStr,aStrValue,s1,s2,s3:String;
    l,m:Integer;
  begin
    aStr:=UpperCase(s);
    aStrValue:=s;
    j:=POS('<LI>',aStr);
    if j<1 then
      exit; //已经没有节点信息

    GetNextStr(aStr,aStrValue,'VALUE=');
    s1:=GetNextStr(aStr,aStrValue,'VALUE=');
    s2:=GetNextStr(aStr,aStrValue,'VALUE=');
    s3:=GetNextStr(aStr,aStrValue,'</OBJECT>');

    s1:=StringReplace(s1, 'PARAM NAME="Name"', '', [rfReplaceAll,rfIgnoreCase]);
    s2:=StringReplace(s2, 'PARAM NAME="LOCAL"', '', [rfReplaceAll,rfIgnoreCase]);
    s1:=StringReplace(s1, '<', '', [rfReplaceAll]);
    s2:=StringReplace(s2, '<', '', [rfReplaceAll]);
    s3:=StringReplace(s3, '<', '', [rfReplaceAll]);

    s1:=StringReplace(s1, '>', '', [rfReplaceAll]);
    s2:=StringReplace(s2, '>', '', [rfReplaceAll]);
    s3:=StringReplace(s3, '>', '', [rfReplaceAll]);
    s1:=StringReplace(s1, '"', '', [rfReplaceAll]);
    s2:=StringReplace(s2, '"', '', [rfReplaceAll]);
    s3:=StringReplace(s3, '"', '', [rfReplaceAll]);
    s1:=trim(s1);
    s2:=trim(s2);
    s3:=trim(s3);

    aStr:=trim(aStr);
    aStrValue :=trim(aStrValue);
    temp:=aStrValue;
    Listbox1.Items.Add(s1);
    IndexList.Add(s2+'='+s3);
    AddFileList(s3);
    l:=POS('<LI>',aStr);
    if l=1 then
       FindIndex(aStrValue);
    end;
begin
  if not Fileexists(Str) then
    exit;
  Lists:=TStringlist.Create;
  Lists.LoadFromFile(Str);
  StrValue:=Lists.Text;
  temp:=UpperCase(Lists.Text);
  i:=POS('<UL>',temp);
  temp:=trim(Copy(temp,i+4,Length(temp)));
  StrValue:=trim(Copy(StrValue,i+4,Length(StrValue)));
  j:=POS('<LI>',temp);
  if j=1 then
    FindIndex(StrValue);
  Lists.Clear;
  Lists.Free;
end;

Procedure TFrmMain.ReadHHCFile(Str:String);
var
  Lists:TStringlist;
  i,j,All:integer;
  temp,StrValue:String;
  Procedure FindLI(aNode,bNode:TTreeNode;s:string);
  var
    aStr,aStrValue,s1,s2,s3,ss:String;
    l,m,k:Integer;
    NewNode,OldNode,saveNode,xNode:TTreeNode;

    Item :  TListitem;
  begin
    inc(i);
    UpdateProgress(i*100 div All);
    aStr:=UpperCase(s);
    aStrValue:=s;
    j:=POS('<LI>',aStr);
    if j<1 then
      exit; //已经没有节点信息
    GetNextStr(aStr,aStrValue,'VALUE=');
    k :=POS('</OBJECT>',aStr);
    ss:=copy(aStr,1,k-1);
    k :=POS('VALUE=',ss);
    if k>0 then
    begin
      s1:=GetNextStr(aStr,aStrValue,'VALUE=');
      k :=POS('</OBJECT>',aStr);
      ss:=copy(aStr,1,k-1);
      k :=POS('VALUE=',ss);
      if k>0 then
      begin
       //有<param name="Name" value= 和<param name="Local" value="和
       //  param name="ImageNumber" value= 的情况
       s2:=GetNextStr(aStr,aStrValue,'VALUE=');
       s3:=GetNextStr(aStr,aStrValue,'</OBJECT>');
      end
      else begin
        //有<param name="Name" value= 和<param name="Local" value="的情况
        s2:=GetNextStr(aStr,aStrValue,'</OBJECT>');
        s3:='';
      end;
    end
    else begin
      //只有<param name="Name" value= 的情况
      s1:=GetNextStr(aStr,aStrValue,'</OBJECT>');
      s2:='';
      s3:='';
    end;
    
    s1:=StringReplace(s1, 'PARAM NAME="LOCAL"', '', [rfReplaceAll,rfIgnoreCase]);
    s2:=StringReplace(s2, 'PARAM NAME="IMAGENUMBER"', '', [rfReplaceAll,rfIgnoreCase]);
    s1:=StringReplace(s1, '<', '', [rfReplaceAll]);
    s2:=StringReplace(s2, '<', '', [rfReplaceAll]);
    s3:=StringReplace(s3, '<', '', [rfReplaceAll]);

    s1:=StringReplace(s1, '>', '', [rfReplaceAll]);
    s2:=StringReplace(s2, '>', '', [rfReplaceAll]);
    s3:=StringReplace(s3, '>', '', [rfReplaceAll]);
    s1:=StringReplace(s1, '"', '', [rfReplaceAll]);
    s2:=StringReplace(s2, '"', '', [rfReplaceAll]);
    s3:=StringReplace(s3, '"', '', [rfReplaceAll]);
    s1:=trim(s1);
    s2:=trim(s2);
    s3:=trim(s3);

    aStr:=trim(aStr);
    aStrValue :=trim(aStrValue);
    temp:=aStrValue;
    l:=POS('<UL>',aStr);
    m:=POS('</UL>',aStr);
   if l=1 then
      NewNode:= TreeViewAddTVItem(aNode,s1,true,StrToCount(s3))
    else
      NewNode:= TreeViewAddTVItem(aNode,s1,false,StrToCount(s3));
    NewNode.Url:=s2;
    if l=1 then
    begin
      OldNode:=aNode;
      FindLI(NewNode,OldNode,aStrValue);
      //NewNode有子节点
    end
    else begin
      if m=1 then
      begin
       l:=m;
       while m=1 do
       begin
         GetNextStr(aStr,aStrValue,'</UL>');
         try
         SaveNode   :=aNode.Parent;
         aNode      :=SaveNode;
         //aNode子节点已经没有了,返回aNode的父节点 继续找aNode的父节点的下一个子节点
         except
           SaveNode :=nil;
           aNode    :=nil;
         end;
         //xNode      :=nil;
         try
         if SaveNode.Parent<>nil then
           xNode    :=SaveNode.Parent
         else
           xNode    :=nil;
         except
           xNode    :=nil;
         end;
         aStr:=trim(aStr);
         aStrValue :=trim(aStrValue);
         m:=POS('</UL>',aStr);
       end;
       FindLI(SaveNode,xNode,aStrValue);
       // SaveNode:aNode的父节点,xNode:aNode的父节点的父节点
       //aNode子节点已经没有了,返回aNode的父节点 继续找aNode的父节点的下一个子节点
      end
      else begin
       l:=POS('<LI>',aStr);
       if l=1 then
         FindLI(aNode,bNode,aStrValue);
         //NewNode没有子节点,继续找aNode的下一个子节点
      end;
    end;
  end;
begin
  if not Fileexists(Str) then
    exit;
  Lists:=TStringlist.Create;
  Lists.LoadFromFile(Str);
  StrValue:=Lists.Text;
  All:=Lists.Count div 5;
  temp:=UpperCase(Lists.Text);
  i:=POS('<UL>',temp);
  temp:=trim(Copy(temp,i+4,Length(temp)));
  StrValue:=trim(Copy(StrValue,i+4,Length(StrValue)));
  j:=POS('<LI>',temp);
  if j=1 then
  begin
    i:=0;
    FindLI(nil,nil,StrValue); 
 end;
  Lists.Clear;
  Lists.Free;
end;

procedure TFrmMain.Open1Click(Sender: TObject);
begin
  if Openhhpdialog1.Execute then
    OpenFileProject(Openhhpdialog1.FileName);

end;

function TFrmMain.TreeViewAddTVItem(Node: TTreeNode; Caption: String;HasChild:Boolean;AddImageIndex: Integer): TTreeNode;
var
  AddNode: TTreeNode;
begin
  if Node=nil then
    AddNode :=TreeView1.Items.Add(Node,Caption)
  else
    AddNode :=TreeView1.Items.AddChild(Node, Caption);

  if AddImageIndex=0  then
     if HasChild then
        AddImageIndex:=1
     else
       AddImageIndex:=9;
       
  with AddNode do
  begin
    ImageIndex    := AddImageIndex;
    //if AddImageIndex=1 then
    //  StateIndex    := 2;
    StateIndex    := AddImageIndex;
    SelectedIndex := AddImageIndex;
    Selected      := False;
  end;

 // if HasChild then
 //   TreeView1.Items.AddChild(AddNode,'temp');
  Result := AddNode;
end;

Function TFrmMain.FindTVItem(Node: TTreeNode;aStr:String):TTreeNode;
var
  aNode,bNode: TTreeNode;
  i:integer;
begin
  Result:=nil;
  if Node=nil then
    aNode:=TreeView1.Items.GetFirstNode
  else
    aNode:=Node;

  if Node=nil then
  begin
    for i:=0 to TreeView1.Items.Count-1 do
      if TreeView1.Items[i].Parent=nil then
        if TreeView1.Items[i].Text=aStr then
        begin
          Result:=TreeView1.Items[i];
          exit;
        end;
    {if aNode<>nil then
    while aNode.Text<>aStr do
    begin
      aNode:=aNode.GetNext;

      if aNode=nil then
        exit;
    end; }
  end
  else
    for i:=0 to aNode.Count-1 do
      if  aNode.Item[i].Text=aStr then
      begin
        Result:=aNode.Item[i];
        exit;
      end;

  if aNode<>nil then
  if aNode.Text=aStr then
  begin
   // TreeView1.Selected:=Node;
    Result:=aNode;
  end;
end;

Function TFrmMain.GetFileNameTopic(HtmFile:String):String;
begin
  Result:=GethtmlTitle(HtmFile,frmML.CheckBox1.Checked);
end;

Procedure TFrmMain.CreateTopic;
var
  Str,Strname,temp,Topic,UrlName,SaveStr:String;
  i,j:integer;
  aNode,bNode,NewNode,SaveNode: TTreeNode;

begin
//  memo1.Lines:=SearchList;              
  Str:=ExtractFilePath(OpenProject);
  ShowProgress('正在建立主题....');
  for i:=0 to  SearchList.Count-1 do
  begin
    UpdateProgress(i*100 div SearchList.Count);
    Strname:=GetFileNameTopic(SearchList[i]);
    temp:=ExtractFilePath(SearchList[i]);
    UrlName:=Copy(temp,Length(Str)+1,Length(temp))+ExtractFileName(SearchList[i]);
    if Str=ExtractFilePath(SearchList[i]) then
      NewNode:= TreeViewAddTVItem(nil,Strname,false,9)
    else begin
      temp:=ExtractFilePath(SearchList[i]);
      temp:=Copy(temp,Length(Str)+1,Length(temp));
      j:=POS('\',temp);
      if SaveStr=temp then
      begin
        aNode:=saveNode;
      end
      else begin
        SaveStr:=temp;
        aNode:=nil;
        while j>0 do
        begin
          Topic:=Copy(temp,1,j-1);
          temp :=Copy(temp,j+1,Length(temp));
          bNode:=FindTVItem(aNode,Topic);
          if bNode=nil then
            aNode:=TreeViewAddTVItem(aNode,Topic,true,1)
          else
            aNode:=bNode;
          j:=POS('\',temp);
        end;
        aNode:=FindTVItem(aNode,Topic);
        saveNode:=aNode;
      end;
      NewNode:=TreeViewAddTVItem(aNode,Strname,false,9);
    end;
    ListBox1.Items.Add(Strname);
    NewNode.Url:=UrlName;
    indexList.Add(Strname+'='+UrlName);

    AddFileList(UrlName);
  end;
  HideProgress;
  btnSave1.Enabled :=true;

  SearchList.Clear;
end;

Procedure TFrmMain.AddFileList(aName:String);
var
  Item : TListitem;
begin
  if trim(aName)<>'' then
  begin
    Item:=FrmFileList.ListView1.Items.Add;
    Item.Caption:=aName;
  end;
end;
Procedure TFrmMain.SaveProject(aStr:String);
var
  i,index:Integer;
  SaveList:TStringlist;
  aNode:TTreeNode;
  SavePro,SaveName,S1,S_index:String;
  Procedure SaveChailNode(aNode:TTreeNode;Saves:TStringlist);
  var
    i:integer;
  begin
    if aNode.Count>0 then
    begin
      Saves.Add('<UL>');
      for i:=0 to aNode.Count-1 do
      begin
        inc(Index);
        Saves.Add('<LI> <OBJECT type="text/sitemap">');
        Saves.Add('<param name="Name" value="'+aNode.Item[i].Text+'">');
        Saves.Add('<param name="Local" value="'+aNode.Item[i].Url+'">');
        Saves.Add('<param name="ImageNumber" value="'+IntToStr(aNode.Item[i].ImageIndex)+'">');
        Saves.Add('</OBJECT>');
        SaveChailNode(aNode.Item[i],Saves);
      end;
      Saves.Add('</UL>');
    end;
  end;
begin
  SavePro:=aStr;
  if trim(SavePro)='' then
    exit;

  SaveList:=TStringlist.Create;
  SaveList.Clear;
  SaveList.Add('<HTML>');
  SaveList.Add('<HEAD></HEAD><BODY>');
  SaveList.Add('<OBJECT type="text/site properties">');
  SaveList.Add('	<param name="Window Styles" value="0x227">');
  SaveList.Add('</OBJECT>');
  SaveList.Add('<UL>');
  index:=-1;
  for i:=0 to TreeView1.Items.Count-1 do
  if TreeView1.Items[i].Parent=nil then
  begin
    inc(index);
    aNode:=TreeView1.Items[i];
    SaveList.Add('<LI> <OBJECT type="text/sitemap">');
    SaveList.Add('<param name="Name" value="'+aNode.Text+'">');
    SaveList.Add('<param name="Local" value="'+aNode.Url+'">');
    SaveList.Add('<param name="ImageNumber" value="'+IntToStr(aNode.ImageIndex)+'">');
    SaveList.Add('</OBJECT>');
    SaveChailNode(aNode,SaveList);
  end;
  
  SaveList.Add('</UL>');
  SaveList.Add('</BODY></HTML>');
  SaveName:=ExtractFilepath(SavePro)+HHCProject;
  SaveList.SaveToFile(SaveName);
  SaveList.Clear;

  SaveList.Add('<HTML>');
  SaveList.Add('<HEAD>');
  SaveList.Add('<meta name="GENERATOR" content="CHMWorkShop">');
  SaveList.Add('</HEAD><BODY>');
  SaveList.Add('<UL>');
  for i:=0 to ListBox1.Count-1 do
  begin
    SaveList.Add('<LI> <OBJECT type="text/sitemap">');
    SaveList.Add('	<param name="Name" value="'+ListBox1.Items[i]+'">');
    S1:=indexList[i];
    S_index:=GetNextStr2(S1,'=');
    SaveList.Add('	<param name="Name" value="'+S_index+'">');
    SaveList.Add('	<param name="Local" value="'+S1+'">');
    SaveList.Add('	</OBJECT> ');
  end;
  SaveList.Add('</UL>');
  SaveList.Add('</BODY></HTML>');
  SaveName:=ExtractFilepath(SavePro)+HHKProject;
  SaveList.SaveToFile(SaveName);
  SaveList.Clear;
  btnSave1.Enabled :=false;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  SearchList:=TStringList.Create;
  SearchList.Clear;

  indexList:=TStringList.Create;
  HistoryList:=TStringList.Create;
  ReOpenList:=TStringList.Create;
  LanguageList:=TStringList.Create;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  WriteReOpen(ReOpenList);

  SearchList.Free;
  indexList.Free;
  HistoryList.Free;
  LanguageList.Free;
  
  ReOpenList.Free;
end;

procedure TFrmMain.N57Click(Sender: TObject);
begin
   TreeView1.Items.Clear;
   Listbox1.Items.Clear;
   Indexlist.Clear;
   btnSave1.Enabled :=true;
   FrmFileList.ListView1.Items.Clear;
end;

procedure TFrmMain.btnSave1Click(Sender: TObject);
begin
  SaveProject(OpenProject);
end;

procedure TFrmMain.btnUndoClick(Sender: TObject);

var
  i:integer;
begin
  ShowMessage(inttostr(TreeView1.Items.Count));
  memo1.Lines.Clear;
  if TreeView1.Selected<>nil then
    for i:=0 to TreeView1.Selected.Count-1 do
      memo1.Lines.add(TreeView1.Selected.Item[i].Text);
end;

procedure TFrmMain.btnNew1Click(Sender: TObject);
var
 Str:String;
begin
  if Newhhpdialog1.Execute then
  begin
     Str:=Newhhpdialog1.FileName;
     Str:=ChangeFileExt(Str,'.hhp');
     NewProject(Str);
     OpenFileProject(Str);
  end;   
end;

Procedure TFrmMain.NewProject(Str:String;Const aCHM:String='';Const aHHC:String='';Const aHHK:String='');
var
  Lists:TIniFile;
  aProject,s1,s2,s3:String;
begin
  if trim(Str)<>'' then
   aProject:=Str;
  aProject:=ChangeFileExt(aProject,'.hhp');
  CHMProject :=ChangeFileExt(ExtractFileName(aProject),'.chm');
  HHCProject :=ChangeFileExt(ExtractFileName(aProject),'.hhc');
  HHKProject :=ChangeFileExt(ExtractFileName(aProject),'.hhk');
  s1:=aCHM;
  s2:=aHHc;
  s3:=aHHK;
  if trim(s1)='' then
    s1 :=CHMProject;
  if trim(s2)='' then
     s2:=HHCProject;
  if trim(s3)='' then
     s3:=HHKProject;

  Lists:=TIniFile.Create(aProject);
  with Lists do
  begin
    WriteString('OPTIONS','Compatibility','1.1 or later');
    WriteString('OPTIONS','Compiled file',s1);
    WriteString('OPTIONS','Contents file',s2);
    WriteString('OPTIONS','Index file',s3);
    WriteString('OPTIONS','Default topic','index.html');
    WriteString('OPTIONS','Display compile progress','Yes');
    WriteString('OPTIONS','Enhanced decompilation','Yes');
    WriteString('OPTIONS','Full-text search','Yes');
    WriteString('OPTIONS','Language','0x804 中文(中国)');
  end;
  Lists.Free;
end;


procedure TFrmMain.TreeView1DblClick(Sender: TObject);
begin
  if TreeView1.Selected=nil then
    exit;
  OpenHtml(TreeView1.Selected.Url,true);
end;

Procedure TFrmMain.OpenHtml(Const html:String='';Const aPath:Boolean=false);
var
  Flags: OLEVariant;
  UrlText:String;
begin
  if html='' then
    exit;
  UrlText:=html;
  if aPath then
    UrlText:=ExtractFilePath(OpenProject)+UrlText;
  Flags := 0;
  if HistoryList.IndexOf(UrlText)=-1 then
    HistoryList.Add(UrlText);
  Indexhtml:=HistoryList.IndexOf(UrlText);
  PagePnl.ActivePage:=TabSheet4;
  WebBrowser1.Navigate(WideString(UrlText), Flags, Flags, Flags, Flags);
end;

procedure TFrmMain.btnBackClick(Sender: TObject);
var
  i:integer;
begin
  if HistoryList.Count <1 then
    exit;
  i:=Indexhtml-1;
  if i<0 then
    i:=0;
  OpenHtml(HistoryList[i]);
end;

procedure TFrmMain.btnForwardClick(Sender: TObject);
var
  i:integer;
begin
  if HistoryList.Count<1 then
    exit;
  i:=Indexhtml+1;
  if i>HistoryList.Count-1 then
    i:=HistoryList.Count-1;
  OpenHtml(HistoryList[i]);

end;

procedure TFrmMain.BtnRefreshClick(Sender: TObject);
begin
  if (Indexhtml>-1) and (Indexhtml<HistoryList.Count-1) then
  OpenHtml(HistoryList[Indexhtml]);
end;

Function TFrmMain.GetPrvNode(aNode:TTreenode;Const isPrv:Boolean=true):TTreenode;
var
  i,j,ii:integer;
  bNode,temp:TTreenode;
begin
  Result:=nil;
  bNode :=Nil;
  bNode :=aNode.Parent;
  if bNode<>nil then
  begin
    for i:=0 to bNode.Count-1 do
    begin
      if bNode.Item[i]=aNode then
      begin
        if isPrv and (i<>0) then
          Result:=bNode.Item[i-1];
       if (not isPrv) and (i<bNode.Count-1) then
         Result:=bNode.Item[i+1];
      end;
    end;
  end
  else begin
    ii:=10000;
    for i:=0 to TreeView1.Items.Count-1 do
      if TreeView1.Items[i].Parent=nil then
      begin
        if TreeView1.Items[i]=aNode then
        begin
          ii:=i;
          if isPrv then
          begin
            if i=0 then
              exit;
            Result:=temp;
            exit;
          end
        end
        else begin
          temp:=TreeView1.Items[i];
          if not isPrv then
          begin
            if i>ii then
            begin
              Result:=temp;
              exit;
            end;
          end;
        end;
      end;
  end;
end;

procedure TFrmMain.SBupClick(Sender: TObject);
var
  aNode,PNode:TTreeNode;
begin
  if TreeView1.Selected=nil then
    exit;

  if TreeView1.Selected=TreeView1.Items.GetFirstNode then
    exit;

  aNode:=TreeView1.Selected;
  PNode:=GetPrvNode(aNode);
  if PNode<>nil then
     Treeview1.Selected.MoveTo(PNode,naInsert);
  //AddNode(PNode,aNode);

end;

procedure TFrmMain.SBdownClick(Sender: TObject);
var
  aNode,PNode:TTreeNode;
begin
  if TreeView1.Selected=nil then
    exit;
  aNode:=TreeView1.Selected;
  PNode:=GetPrvNode(aNode,false);
  //PNode:=GetPrvNode(aNode,false);
  if PNode<>nil then
  begin
    TreeView1.Selected:=PNode;
    SBup.Click;
    PNode:=GetPrvNode(TreeView1.Selected,false);
    if PNode<>nil then
       TreeView1.Selected:=PNode;
    //PNode:=GetPrvNode(aNode);
    //if PNode<>nil then
    //Treeview1.Selected.MoveTo(PNode,naInsert);
  end;
end;

procedure TFrmMain.SBleftClick(Sender: TObject);
var
  aNode,PNode:TTreeNode;
begin
  if TreeView1.Selected=nil then
    exit;
  aNode:=TreeView1.Selected;
  PNode:=nil;
  if aNode.Parent<>nil then
  begin
    PNode:=aNode.Parent;
    Treeview1.Selected.MoveTo(PNode,naInsert);
    SBdown.Click;
  end;  
end;

procedure TFrmMain.SBrightClick(Sender: TObject);
var
  aNode:TTreeNode;
begin
  if TreeView1.Selected=nil then
    exit;
  aNode:=GetPrvNode(TreeView1.Selected);
  if aNode<>nil then
    Treeview1.Selected.MoveTo(aNode,naAddChild);
end;

procedure TFrmMain.SBaddfileClick(Sender: TObject);
var
  aNode:TTreeNode;
begin
  if not SetMenuDisable then
    exit;
  FrmTopic.ComboBox1.ItemIndex:=9;
  FrmTopic.Edit1.Text:='';
  FrmTopic.Edit2.Text:='';
  if FrmTopic.ShowModal=mrok then
  begin
    aNode:=TreeView1.Selected;
    aNode:=TreeViewAddTVItem(aNode,FrmTopic.Edit1.Text,false,FrmTopic.ComboBox1.ItemIndex);
    aNode.Url :=FrmTopic.Edit2.Text;
    btnSave1.Enabled :=true;
  end;
end;

procedure TFrmMain.SBicoClick(Sender: TObject);
begin
  if not SetMenuDisable then
    exit;
    
  if TreeView1.Selected=nil then
    exit;
  FrmTopic.ComboBox1.ItemIndex:=TreeView1.Selected.ImageIndex;
  FrmTopic.Edit1.Text:=TreeView1.Selected.Text;
  FrmTopic.Edit2.Text:=TreeView1.Selected.Url;
  if FrmTopic.ShowModal=mrok then
  begin
    TreeView1.Selected.ImageIndex:=FrmTopic.ComboBox1.ItemIndex;
    TreeView1.Selected.StateIndex:=FrmTopic.ComboBox1.ItemIndex;
    TreeView1.Selected.SelectedIndex:=FrmTopic.ComboBox1.ItemIndex;
    TreeView1.Selected.Text      :=FrmTopic.Edit1.Text;
    TreeView1.Selected.Url       :=FrmTopic.Edit2.Text;
    btnSave1.Enabled :=true;
  end;
end;

procedure TFrmMain.SBdelClick(Sender: TObject);
begin
  if not SetMenuDisable then
    exit;
    
  if TreeView1.Selected<>nil then
    if Answerbox(CH_Language('Delete selected node?',true),CH_Language('Delete node',true))=mrok then
    begin
      TreeView1.Selected.Delete;
      btnSave1.Enabled :=true;
    end;  
end;

procedure TFrmMain.BtnAddFolderClick(Sender: TObject);
begin
  if SetMenuDisable then
  if frmML.ShowModal=mrok then
    if SearchList.Count>1 then
       CreateTopic;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  ChangLanguage(Self);
  SetMenuDisable;
  ReadReOpen(ReOpenList);
  ReadReOpenList;
  btnSave1.Enabled:=false;
  ShowLanguageMenu;
end;

procedure TFrmMain.M_ExpandClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to TreeView1.Items.Count-1 do
    TreeView1.Items[i].Expanded:=true;
end;

procedure TFrmMain.M_CollapseClick(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to TreeView1.Items.Count-1 do
    TreeView1.Items[i].Expanded:=false;

end;

procedure TFrmMain.SortAllItem1Click(Sender: TObject);
begin
  TreeView1.Items.BeginUpdate;
  TreeView1.SortType:=stText;
  TreeView1.Items.EndUpdate;
  TreeView1.SortType:=stNone;
end;

procedure TFrmMain.TaddClick(Sender: TObject);
begin
  if not SetMenuDisable then
    exit;
    
  FrmIndex.Edit1.Text:='';
  FrmIndex.Edit2.Text:='';
  FrmIndex.Edit3.Text:='';
  if FrmIndex.ShowModal=mrok then
  begin
    ListBox1.Items.Add(FrmIndex.Edit1.Text);
    IndexList.Add(FrmIndex.Edit2.Text+FrmIndex.Edit2.Text);
  end;
  
end;

procedure TFrmMain.TrenameClick(Sender: TObject);
var
  i:integer;
begin
  if not SetMenuDisable then
    exit;

    
  i:=ListBox1.ItemIndex;
  if i<0 then
    exit;
  FrmIndex.Edit1.Text:=ListBox1.Items[i];
  FrmIndex.Edit2.Text:=IndexList.Names[i];
  FrmIndex.Edit3.Text:=IndexList.Values[FrmIndex.Edit2.Text];
  if FrmIndex.ShowModal=mrok then
  begin
    ListBox1.Items[i]:=FrmIndex.Edit1.Text;
    IndexList[i]:=FrmIndex.Edit2.Text+'='+FrmIndex.Edit3.Text;
    btnSave1.Enabled :=true;
  end;
end;

procedure TFrmMain.TdelClick(Sender: TObject);
var
  i:integer;
begin
  if not SetMenuDisable then
    exit;

    
  i:=ListBox1.ItemIndex;
  if i<0 then
    exit;

 if Answerbox(CH_Language('Delete selected Index?',true),CH_Language('Delete Index',true))=mrok then
 begin
  ListBox1.Items.Delete(i);
  IndexList.Delete(i);
  btnSave1.Enabled :=true;
 end;  
end;

Procedure TFrmMain.ReadReOpenList;
var
  i,j:integer;
begin
  
  for i:=0 to  PopupMenu1.Items.Count-1 do
  begin
    PopupMenu1.Items[i].Visible :=false;
    if i<ReOpenList.Count then
      if PopupMenu1.Items[i].Tag=i+1 then
      begin
        PopupMenu1.Items[i].Caption:=IntToStr(i)+'  '+ReOpenList[i];
        PopupMenu1.Items[i].Visible:=true;
     end;
  end;

  for i:=0 to  M_ReOpen.Count-1 do
  begin
    M_ReOpen.Items[i].Visible :=false;
    if i<ReOpenList.Count then
     if M_ReOpen.Items[i].Tag=i+1 then
    begin
      M_ReOpen.Items[i].Caption:=IntToStr(i)+'  '+ReOpenList[i];
      M_ReOpen.Items[i].Visible:=true;
    end;
  end;
end;

Function TFrmMain.SetMenuDisable:Boolean;
begin
  if trim(OpenProject)='' then
    result:=false
  else
    result:=true;
 {
  begin
   // M_Topic.Enabled:=false;
    //M_Index.Enabled:=false;

  end
  else begin
    //M_Topic.Enabled:=true;
    //M_Index.Enabled:=true;
  end; }
end;
procedure TFrmMain.N110Click(Sender: TObject);
begin
  if (Sender is TMenuItem) then
    if (Sender as TMenuItem).Tag -1< ReOpenList.Count then
      OpenFileProject(ReOpenList[(Sender as TMenuItem).Tag -1]);
end;

procedure TFrmMain.Exit1Click(Sender: TObject);
begin
  
  Close;
end;

procedure TFrmMain.Close1Click(Sender: TObject);
begin
  OpenProject:='';
  TreeView1.Items.Clear;
  ListBox1.Items.Clear;
  IndexList.Clear;
  Close1.Caption:=CH_Language('Close');
end;

procedure TFrmMain.addfileClick(Sender: TObject);
begin
  if not SetMenuDisable then
    exit;
end;

procedure TFrmMain.addzfileClick(Sender: TObject);
begin
  if not SetMenuDisable then
    exit;
end;

procedure TFrmMain.ProPreferenceClick(Sender: TObject);
begin
  if not SetMenuDisable then
    exit;
  FrmPro.ShowModal;
end;

procedure TFrmMain.M_FilelistClick(Sender: TObject);
begin
  if not SetMenuDisable then
    exit;
  FrmFileList.ShowModal;
end;

procedure TFrmMain.Memo1Change(Sender: TObject);
begin
  btnTextSave.Enabled:= Memo1.Modified;
end;

procedure TFrmMain.HideView1Click(Sender: TObject);
begin
  Panel2.Visible :=not  Panel2.Visible;
end;

procedure TFrmMain.SaveAs1Click(Sender: TObject);
//var
//  SStr:String;
begin
  if SavehhpDialog1.Execute then
   SaveProject(SavehhpDialog1.FileName);
end;

procedure TFrmMain.About1Click(Sender: TObject);
begin
 ShowAbout(SoftName,SoftVer,'20040907');
end;

Procedure TFrmMain.ShowLanguageMenu;
var
  i:integer;
  Str:String;
  item:TMenuItem;
begin
  if ExtractFileName(LangFile)='' then
    English1.Checked:=true;
  Searchpath(SoftPath+'Language\','*.ini',LanguageList);
  for i:=0 to LanguageList.Count-1 do
  begin
    Str:=LanguageList[i];
    Str:=ReadLanguageIni(Str);
    item:=TMenuItem.Create(M_language);
    item.Caption:=Str;
    item.Tag    :=i+1;
    if ExtractFileName(LangFile)=Str then
      item.Checked:=true;
    item.AutoCheck :=true;
    item.OnClick  :=English1.OnClick;
   // item.RadioItem :=true;
    M_language.Insert(0,item);
  end;

end;

procedure TFrmMain.English1Click(Sender: TObject);
var
  iTag:Integer;
begin
  if (Sender is TMenuItem) then
  begin
    iTag:=(Sender as TMenuItem).tag;
    if iTag=0 then
      WriteSystemIni(IniFileName,'')
    else
      if iTag<=LanguageList.Count then
        WriteSystemIni(IniFileName,ExtractFileName(LanguageList[iTag-1]));
    InfoBox('请重新运行本系统!');    
  end;
end;

procedure TFrmMain.BatchClick(Sender: TObject);
var
  i:integer;
  aSou,aMd:String;
begin
  if not SetMenuDisable then
    exit;

  if FrmBatch.ShowModal=mrok then
  begin
    if FrmBatch.CheckBox2.Checked then
    begin
      if TreeView1.Selected <> nil then
      for i:=0 to TreeView1.Selected.Count-1 do
      begin
        aSou:=TreeView1.Selected.Item[i].Text;
        aMd :=FastReplace(aSou,FrmBatch.Edit1.Text,FrmBatch.Edit2.Text);
        TreeView1.Selected.Item[i].Text:=aMd;
      end;
    end
    else begin
      for i:=0 to TreeView1.Items.Count-1 do
      begin
        aSou:=TreeView1.Items[i].Text;
        aMd :=FastReplace(aSou,FrmBatch.Edit1.Text,FrmBatch.Edit2.Text);
        TreeView1.Items[i].Text:=aMd;
      end;
    end;
    
    if  FrmBatch.CheckBox1.Checked then
    for i:=0 to ListBox1.Items.Count-1 do
    begin
      aSou:=ListBox1.Items[i];
      aMd :=FastReplace(aSou,FrmBatch.Edit1.Text,FrmBatch.Edit2.Text);
      ListBox1.Items[i]:=aMd;
    end;

    btnSave1.Enabled:=true;
  end;
end;

procedure TFrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=false;
  if btnSave1.Enabled then
  begin
    if Answerbox(CH_Language('Not Save?',true),CH_Language('exit',true))=mrok then
      CanClose:=true;
 end
 else
   CanClose:=true;
end;

end.
