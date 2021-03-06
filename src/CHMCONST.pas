unit CHMCONST;

interface

uses
  Windows, Messages, SysUtils,Variants,StdCtrls, Classes,Registry, Menus,ComCtrls,Buttons,Graphics, Controls, Forms,
  Dialogs,ExtCtrls,IniFiles;

Const
   SoftName      ='Auto CHM';
   SoftVer       ='1.00';
   Lang_CN       =1;
   Lang_EN       =0;

   MIS_Str_Error ='错误';
   MIS_Str_Hint  ='提示';


var
  SoftPath,LangFile:String;
  IniFileName:String;
  OpenProject:String;
  CLanguage :Integer;
 // isLanguage:Boolean;

procedure ShowHelp(const Topic: string);
function GetTopicValue(Const Topic,Value: String;Const aValue:String=''): String;

Procedure WarningBox(Const msg:String ;Const title:String=MIS_Str_Hint);
Procedure infoBox(Const msg:String ;Const title:String=MIS_Str_Hint);
Function  AnswerBox(Const msg:String ;Const title:String=MIS_Str_Hint):integer;
Function  AnswerBoxEx(Const msg:String ;Const title:String=MIS_Str_Hint):integer;


function GetHzPy(const AHzStr: string): string;
Function FunDIV(a,b:Double):Double;
Function StrToCount(Str:String):Integer;

function GetNextStr(var NameStr,NameStr2:String;Const Sign:String):String;
function GetNextStr2(var NameStr:string;Const Sign:string):String;
function GetNOSubStr(Str: string; lBit: Integer): string;
function GetNOSubStrCount(Str: string): Integer;
Procedure SetFormFont(aForm:TForm);

Function GetWindowsDir: string;  //c:\winnt
procedure RunDosCommand(Command : string; Output : Tmemo);
function ExecAndWait(const Filename, Params: string; WindowState: word):Boolean;

procedure Searchpath(path,ext:string;ListFiles:TstringList);

function ChangLanguage(frmForm: TForm): Boolean;
function CH_Language(sValue: string;Const isDlg:Boolean=false): string;
Function ReadReOpen(Lists:TStringList):Boolean;
Function WriteReOpen(Lists:TStringList):Boolean;
Function GethtmlTitle(HtmFile:String;Const isTitle:Boolean=true):String;
Function ReadSystemIni(aName:String):String;
Function ReadLanguageIni(aName:String):String;
Function ReadIniValue(aName,bNode,cValue:String):String;
Function WriteIniValue(aName,bNode,cNode,dValue:String):Boolean;

Function WriteSystemIni(aName,dValue:String):Boolean;
implementation

Function ReadIniValue(aName,bNode,cValue:String):String;
var
  ini:TIniFile;
begin
  ini:=TIniFile.Create(aName);
  with ini do
  begin
    Result:=ReadString(bNode,cValue,'');
  end;
  ini.Free;
end;

Function WriteIniValue(aName,bNode,cNode,dValue:String):Boolean;
var
  ini:TIniFile;
begin
  Result:=false;
  ini:=TIniFile.Create(aName);
  with ini do
  begin
    WriteString(bNode,cNode,dValue);
  end;
  ini.Free;
  Result:=true;
end;

Function ReadLanguageIni(aName:String):String;
begin
  Result:=ReadIniValue(aName,'Language','info');
end;

Function WriteSystemIni(aName,dValue:String):Boolean;
begin
  Result:=WriteIniValue(aName,'AutoCHM','Language',dValue);
end;
Function ReadSystemIni(aName:String):String;
begin
  LangFile:=ReadIniValue(aName,'AutoCHM','Language');
end;

Function GethtmlTitle(HtmFile:String;Const isTitle:Boolean=true):String;
var
  Str:String;
  Filelist:TStringList;
  i,j:integer;
begin
  Result:=ExtractFileName(HtmFile);
  Result:=ChangeFileExt(Result,'');
  if not isTitle then
    exit;
  if not Fileexists(HtmFile) then
    exit;
  Filelist:=TStringList.Create;
  Filelist.LoadFromFile(HtmFile);

  Str:=LowerCase(Filelist.Text);
  i:=POS('<title>',Str);
  j:=POS('</title>',Str);
  if (i>0) and (j>0) then
    Result:=Copy(Str,i+7,j-i-7);
  Str:='';
  Filelist.Clear;
  Filelist.Free;
end;

function FileMatchesExts(const FileName, FileExts: string): Boolean;
var
  ExtList: TStrings;
  Exts: string;
  FExt: string;
  i: Integer;
begin
  ExtList := TStringList.Create;
  try
    Exts := StringReplace(FileExts, '*.', '', [rfReplaceAll]);

    Exts := StringReplace(Exts, ';', ',', [rfReplaceAll]);

    ExtList.CommaText := Exts;

    FExt := ExtractFileExt(FileName);

    Result := False;
    for i := 0 to ExtList.Count - 1 do
    begin
      if SameText('.' + ExtList[i], FExt) then
      begin
        Result := True;
        Exit;
      end;
    end;
  finally
    ExtList.Free;
  end;
end;

procedure Searchpath(path,ext:string;ListFiles:TstringList);
var
  searchrec:TSearchRec;
 // ext:string; //后缀
//  i:integer;
begin
  //在路径后面加上'\'
  if path[length(path)]<>'\' then
    path := path + '\';
  if FindFirst(path+'*.*', faAnyFile, SearchRec)<>0 then
    exit;

  //判断是否为目录，是目录则循环
  if (searchrec.Attr and faDirectory) <> 0 then
  begin
    if (searchrec.name<>'.') and (searchrec.name<>'..') then
      searchpath(path+searchrec.name,ext,ListFiles)
    else begin
      // 此处加上你自已的判断文件后缀的代码
      if FileMatchesExts(path+searchrec.name,ext) then
        ListFiles.add(path+searchrec.name);
     end;
   while findnext(searchrec)=0 do
   begin
     if (searchrec.Attr and faDirectory) <> 0 then
     begin
      if (searchrec.name<>'.') and (searchrec.name<>'..')
       then
         searchpath(path+searchrec.name,ext,ListFiles);
     end
     else
      begin
      // 此处加上你自已的判断文件后缀的代码
      if FileMatchesExts(path+searchrec.name,ext) then
        ListFiles.add(path+searchrec.name);
     end;
   end;
     findclose(searchrec);
end;
end;


function GetTopicValue(Const Topic,Value: String;Const aValue:String=''): String;
begin
  with TIniFile.Create(IniFileName) do
  try
    Result := ReadString(Topic, Value,aValue);
    if Result = '' then
      WriteString(Topic, Value,aValue);
  finally
    Free;
  end;
end;

// 取帮助主题链接
function GetTopicHelpUrl(const Topic: string): string;
begin
  Result:='Help.chm::'+GetTopicValue('Topic',Topic);
{  with TIniFile.Create(IniFileName) do
  try
    Result := ReadString('Topic', Topic, '');
    if Result = '' then
      WriteString('Topic', Topic, '');   // 创建该项内容供编辑
    Result := 'Help.chm::'+Result;
  finally
    Free;
  end;  }
end;
// 显示指定主题的帮助内容
procedure ShowHelp(const Topic: string);
var
  Url: string;
  si: TStartupInfo;
  pi: TProcessInformation;
begin
  if Trim(Topic)='' then
    exit;
  if not FileExists(SoftPath+'Help.chm') then
    exit;

  Url := GetTopicHelpUrl(Topic);
  if Url <> '' then
  begin
    Url := 'mk:@MSITStore:' + SoftPath + Url;
    ZeroMemory(@si, SizeOf(si));
    si.cb := SizeOf(si);
    ZeroMemory(@pi, SizeOf(pi));
    CreateProcess(nil, PChar('hh ' + Url),
      nil, nil, False, 0, nil, nil, si, pi);
    if pi.hProcess <> 0 then CloseHandle(pi.hProcess);
    if pi.hThread <> 0 then CloseHandle(pi.hThread);
  end;
end;



Procedure SetFormFont(aForm:TForm);
begin
  if CLanguage=Lang_CN then
  begin
    aForm.Font.Charset:=GB2312_CHARSET;
    aForm.Font.Name   :='宋体';
    aForm.Font.Size   :=9;
  end;
end;

function GetNextStr(var NameStr,NameStr2:string;Const Sign:string):String;
var
 Num:integer;
begin
 Result:='';
 Num:=Pos(Sign,NameStr);
 if Num>0 then
 begin
   Result:=Copy(NameStr2,1,Num-1);
   delete(NameStr,1,Num+Length(Sign)-1);
   delete(NameStr2,1,Num+Length(Sign)-1);
 end;
end;

function GetNextStr2(var NameStr:string;Const Sign:string):String;
var
 Num:integer;
begin
 Result:='';
 Num:=Pos(Sign,NameStr);
 if Num>0 then
 begin
   Result:=Copy(NameStr,1,Num-1);
   delete(NameStr,1,Num+Length(Sign)-1);
 end;
end;

function GetNOSubStr(Str: string; lBit: Integer): string;
var
  s1, s2: string;
  i: Integer;
begin
  Result := '';
  i := 0;
  if Trim(Str) = '' then
    Exit;
  s1 := Str + ',';
  while pos(',', s1) <> 0 do
  begin
    s2 := copy(s1, 0, pos(',', s1) - 1);
    s1 := copy(s1, pos(',', s1) + 1, Length(s1));
    Inc(i);
    if Trim(s2) <> '' then
    begin 
      if (lBit = i) and (lBit <> 0) then
      begin
        Result := s2;
        Exit;
      end;
    end;
  end;
end;

function GetNOSubStrCount(Str: string): Integer;
var
  s1, s2: string;
  i: Integer;
begin
  Result := 0;
  i := 0;
  if Trim(Str) = '' then
    Exit;
  s1 := Str + ',';
  while pos(',', s1) <> 0 do
  begin
    s2 := copy(s1, 0, pos(',', s1) - 1);
    s1 := copy(s1, pos(',', s1) + 1, Length(s1));
    if Trim(s2) <> '' then
      Inc(i);
  end;
  Result := i;
end;

Procedure WarningBox(Const msg:String ;Const title:String=MIS_Str_Hint);
begin
  Application.MessageBox(Pchar(msg),Pchar(Title),MB_ICONWARNING+MB_OK);
end;
Procedure infoBox(Const msg:String ;Const title:String=MIS_Str_Hint);
begin
  Application.MessageBox(Pchar(msg),Pchar(Title),MB_ICONINFORMATION+MB_OK);
end;

Function  AnswerBox(Const msg:String ;Const title:String=MIS_Str_Hint):integer;
begin
   Result:=Application.MessageBox(Pchar(msg),Pchar(Title),MB_ICONINFORMATION+MB_OKCANCEL);
end;

Function  AnswerBoxEx(Const msg:String ;Const title:String=MIS_Str_Hint):integer;
begin
   Result:=Application.MessageBox(Pchar(msg),Pchar(Title),MB_ICONINFORMATION+MB_YesNOCANCEL);
end;

Function GetWindowsDir: string;  //c:\winnt
var
  vBuffer: array [0..MAX_PATH] of Char;
begin
  GetWindowsDirectory(vBuffer,MAX_PATH);
  Result :=vBuffer;
end;

Function GetApplicationExeName: string;
begin
  Result := ParamStr(0);
end;

Function GetApplicationDir:String; //应用程序的路径 如D:/feng
begin
  Result:=ExtractFileDir(GetApplicationExeName);
end;


 //获取指定汉字的拼音索引字母，如：“汉”的索引字母是“H”
function GetPYIndexChar( hzchar:string):char;
begin
  case WORD(hzchar[1]) shl 8 + WORD(hzchar[2]) of
    $B0A1..$B0C4 : result := 'A';
    $B0C5..$B2C0 : result := 'B';
    $B2C1..$B4ED : result := 'C';
    $B4EE..$B6E9 : result := 'D';
    $B6EA..$B7A1 : result := 'E';
    $B7A2..$B8C0 : result := 'F';
    $B8C1..$B9FD : result := 'G';
    $B9FE..$BBF6 : result := 'H';
    $BBF7..$BFA5 : result := 'J';
    $BFA6..$C0AB : result := 'K';
    $C0AC..$C2E7 : result := 'L';
    $C2E8..$C4C2 : result := 'M';
    $C4C3..$C5B5 : result := 'N';
    $C5B6..$C5BD : result := 'O';
    $C5BE..$C6D9 : result := 'P';
    $C6DA..$C8BA : result := 'Q';
    $C8BB..$C8F5 : result := 'R';
    $C8F6..$CBF9 : result := 'S';
    $CBFA..$CDD9 : result := 'T';
    $CDDA..$CEF3 : result := 'W';
    $CEF4..$D188 : result := 'X';
    $D1B9..$D4D0 : result := 'Y';
    $D4D1..$D7F9 : result := 'Z';
  else
  result := char(32);
  end;
end;


function GetHzPy(const AHzStr: string): string;
var
  I: Integer;
  PY: string;
  s,hzchars: string;
begin
  hzchars:=AHzStr;
  s := '' ;
  I := 1;
  while I <= Length(hzchars) do
  begin
    PY := Copy(hzchars, I , 1);
    if PY >= Chr(128) then
    begin
      Inc(I);
      PY := PY + Copy(hzchars, I , 1);
      s := s + GetPYIndexChar(PY);
    end
    else
      s := s + PY;
    Inc(I);
  end;
  result := s;
end;



Function StrToCount(Str:String):Integer;
begin
  Result:=0;
  if Trim(Str)<>'' then
   try
    Result:=StrToInt(Str);
   except
     exit;
   end;
end;

Function FunDIV(a,b:Double):Double;
begin
  if (a=0) or (b=0) then
    Result:=0
  else
    Result:=a/b;
end;

function ExecAndWait(const Filename, Params: string; WindowState: word):
    boolean;
var
    SUInfo: TStartupInfo;
    ProcInfo: TProcessInformation;
    CmdLine: string;
begin
    CmdLine:=filename+' '+params;

    FillChar(SUInfo, SizeOf(SUInfo), #0);
    with SUInfo do
    begin
        cb := SizeOf(SUInfo);
        dwFlags := STARTF_USESHOWWINDOW;
        wShowWindow := WindowState;
    end;

    Result := CreateProcess(NIL, PChar(CmdLine), NIL, NIL, FALSE,
        CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, NIL,
        PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);
    if Result then
    begin
        //等待应用程序结束
        WaitForSingleObject(ProcInfo.hProcess, INFINITE);
        //删除句柄
        CloseHandle(ProcInfo.hProcess);
        CloseHandle(ProcInfo.hThread);
    end;
end;

procedure RunDosCommand(Command : string; Output : Tmemo);
var
  hReadPipe : THandle;
  hWritePipe : THandle;
  SI : TStartUpInfo;
  PI : TProcessInformation;
  SA : TSecurityAttributes;
//  SD : TSecurityDescriptor;
  BytesRead : DWORD;
  Dest : array[0..1023] of char;
  CmdLine : array[0..512] of char;
  TmpList : TStringList;
  Avail, ExitCode, wrResult : DWORD;
  osVer : TOSVERSIONINFO;
  tmpstr :AnsiString;

  nCol, nIndex: Integer;
begin
  osVer.dwOSVersionInfoSize := Sizeof(TOSVERSIONINFO);
  GetVersionEX(osVer);

  if osVer.dwPlatformId = VER_PLATFORM_WIN32_NT then
  begin
//    InitializeSecurityDescriptor(@SD, SECURITY_DESCRIPTOR_REVISION);
//    SetSecurityDescriptorDacl(@SD, True, nil, False);
    SA.nLength := SizeOf(SA);
    SA.lpSecurityDescriptor := nil;//@SD;
    SA.bInheritHandle := True;
    CreatePipe(hReadPipe, hWritePipe, @SA, 0);
  end
  else
    CreatePipe(hReadPipe, hWritePipe, nil, 1024);
  try
 //   Screen.Cursor := crHourglass;
    FillChar(SI, SizeOf(SI), 0);
    SI.cb := SizeOf(TStartUpInfo);
    SI.wShowWindow := SW_HIDE;
    SI.dwFlags := STARTF_USESHOWWINDOW;
    SI.dwFlags := SI.dwFlags or STARTF_USESTDHANDLES;
    SI.hStdOutput := hWritePipe;
    SI.hStdError := hWritePipe;
    StrPCopy(CmdLine, Command);
    if CreateProcess(nil, CmdLine, nil, nil, True, NORMAL_PRIORITY_CLASS, nil, nil, SI, PI) then
    begin
       ExitCode := 0;
       while ExitCode = 0 do
       begin
          Application.ProcessMessages;
          wrResult := WaitForSingleObject(PI.hProcess, 500);
//        if PeekNamedPipe(hReadPipe, nil, 0, nil, @Avail, nil) then
          if PeekNamedPipe(hReadPipe, @Dest[0], 1024,  @Avail, nil, nil) then
          begin
             if Avail > 0 then
             begin
               TmpList := TStringList.Create;
               try
                 FillChar(Dest, SizeOf(Dest), 0);
                 ReadFile(hReadPipe, Dest[0], Avail, BytesRead, nil);
                 TmpStr := Copy(Dest,0 , BytesRead-1);
                 TmpList.Text := TmpStr;
                 Output.Lines.AddStrings(TmpList);

                 nCol :=Length(Output.Lines[Output.Lines.count-1]);
                 nIndex := Output.Perform(EM_LINEINDEX, Output.Lines.count-1, 0);
                 Output.SelStart := nIndex;
                 Output.SelLength:= 0;
                // Output.SetFocus;
               finally
                 TmpList.Free;
               end;
             end;
          end;
            if wrResult <> WAIT_TIMEOUT then ExitCode := 1;
       end;
       GetExitCodeProcess(PI.hProcess, ExitCode);
       CloseHandle(PI.hProcess);
       CloseHandle(PI.hThread);
     end;
     finally
       CloseHandle(hReadPipe);
       CloseHandle(hWritePipe);
    //   Screen.Cursor := crDefault;
   end;
end;

Function ReadReOpen(Lists:TStringList):Boolean;
var
  IniFile:TiniFile;
  Str:String;
  i:integer;
begin
  IniFile:=TiniFile.Create(IniFileName);
  for i:=0 to 5 do
  begin
    Str:=trim(IniFile.ReadString('Files','File'+IntToStr(i),''));
    if Str<>'' then
    Lists.Add(Str);
  end;
  IniFile.Free;
end;

Function WriteReOpen(Lists:TStringList):Boolean;
var
  IniFile:TiniFile;
  Str:String;
  i:integer;
begin
  IniFile:=TiniFile.Create(IniFileName);
  for i:=0 to Lists.Count-1 do
  begin
    Str:=Lists[i];
    IniFile.WriteString('Files','File'+IntToStr(i),Str);
  end;
  IniFile.Free;
end;

function CH_Language(sValue: string;Const isDlg:Boolean=false): string;
var
  IniFile:TiniFile;
  i:Integer;
  Lists:TStringList;
  Str:String;
begin
   Result:=sValue;
    if (trim(LangFile)='') or (trim(sValue)='') then
      exit;

    IniFile:=TiniFile.Create(LangFile);
    if isDlg then
      Str:='Dialog'//Hint'
    else
      Str:='Caption';
    Result:=IniFile.ReadString(Str,sValue,'');
  //  IniFile.WriteString('ENString',sValue,Result);
    if Result='' then
       Result:=sValue;
    IniFile.Free;
end;

function ChangLanguage(frmForm: TForm): Boolean;
var
  i, j: Integer;
begin
 // if CLanguage = 1 then
    with frmForm do
    begin
       SetFormFont(frmForm);
       Caption:=CH_Language(Caption); 
      for i := 0 to ComponentCount - 1 do
      begin
        if (Components[i] is TControl) then
          TControl(Components[i]).Hint:=CH_Language(TControl(Components[i]).Hint);

        if (Components[i] is TLabel) then
          TLabel(Components[i]).Caption :=
            CH_Language(TLabel(Components[i]).Caption)
        else
          if (Components[i] is TButton) then
            TButton(Components[i]).Caption :=
              CH_Language(TButton(Components[i]).Caption)
          else
            if (Components[i] is TCheckBox) then
              TCheckBox(Components[i]).Caption :=
                CH_Language(TCheckBox(Components[i]).Caption)
            else
              if (Components[i] is TGroupBox) then
                TGroupBox(Components[i]).Caption :=
                  CH_Language(TGroupBox(Components[i]).Caption)
              else
                if (Components[i] is TRadioButton) then
                  TRadioButton(Components[i]).Caption :=
                    CH_Language(TRadioButton(Components[i]).Caption)
                else
                  if (Components[i] is TPanel) then
                    TPanel(Components[i]).Caption :=
                      CH_Language(TPanel(Components[i]).Caption)
                  else
                    if (Components[i] is TMenuItem) then
                      TMenuItem(Components[i]).Caption :=
                        CH_Language(TMenuItem(Components[i]).Caption)
                    else
                      if (Components[i] is TToolButton) then
                        TToolButton(Components[i]).Caption :=
                          CH_Language(TToolButton(Components[i]).Caption)
                      else
                        if (Components[i] is TTabSheet) then
                          TTabSheet(Components[i]).Caption :=
                            CH_Language(TTabSheet(Components[i]).Caption)
                        else
                          if (Components[i] is TSpeedButton) then
                            TSpeedButton(Components[i]).Caption :=
                              CH_Language(TSpeedButton(Components[i]).Caption)
                          else
                            if (Components[i] is TListView) then
                            begin
                              for j := 0 to TListView(Components[i]).Columns.Count - 1 do
                                TListView(Components[i]).Columns[j].Caption :=
                                  CH_Language(TListView(Components[i]).Columns[j].Caption);
                            end;
      end;
    end;
  Result := True;
end;

initialization
begin
  //isLanguage :=false;
  SoftPath   :=GetApplicationDir+'\';
  IniFileName:=SoftPath+'AutoCHM.INI';
  ReadSystemIni(IniFileName);
  //LangFile   :=SoftPath+'Chinesegb.ini';

  LangFile  :=SoftPath+'Language\'+LangFile;
  if not Fileexists(LangFile) then
     LangFile:='';
  if ExtractFileName(LangFile)='ChineseGB2312.ini' then
    CLanguage  :=Lang_CN;
end;

end.







