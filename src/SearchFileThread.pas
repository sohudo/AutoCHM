unit SearchFileThread;

interface

uses
  Classes,windows,SysUtils,Forms;

type

  TFindCallBack = procedure(const FileName: string; const Info: TSearchRec;
    var Abort: Boolean) of object;
{* 查找指定目录下文件的回调函数}

  TDirCallBack = procedure(const SubDir: string) of object;
{* 查找指定目录时进入子目录回调函数}


  TSearchFile = class(TThread)
  private
    { Private declarations }
    FBackList    :TStrings;
    FPath,FFext  :String;

   procedure Search;
   procedure OnFindFile(const FileName: string;
      const Info: TSearchRec; var Abort: Boolean);
  protected
    procedure Execute; override;
  Public
    constructor Create(aPath,aFext:String;BackList:TStrings);
    destructor Destroy; override;
  end;
  
Const
  MaxSearchThread=5;

var
  CurrentSearchThread  :Integer;
 // BornSearchThreadCount:Integer;
function FileMatchesExts(const FileName, FileExts: string): Boolean;
function FindFile(const Path: string; const FileName: string = '*.*';
  Proc: TFindCallBack = nil; DirProc: TDirCallBack = nil; bSub: Boolean = True;
  bMsg: Boolean = True): Boolean;
implementation


{ TFindThread }
// 目录尾加'\'修正
function AddDirSuffix(const Dir: string): string;
begin
  Result := Trim(Dir);
  if Result = '' then Exit;
  if Result[Length(Result)] <> '\' then Result := Result + '\';
end;

// 目录尾加'\'修正
function MakePath(const Dir: string): string;
begin
  Result := AddDirSuffix(Dir);
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

    Exts := StringReplace(FileExts, '.', '', [rfReplaceAll]);

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
var
FindAbort: Boolean;
// 查找指定目录下文件
function FindFile(const Path: string; const FileName: string = '*.*';
  Proc: TFindCallBack = nil; DirProc: TDirCallBack = nil; bSub: Boolean = True;
  bMsg: Boolean = True): Boolean;

  procedure DoFindFile(const Path, SubPath: string; const FileName: string;
    Proc: TFindCallBack; DirProc: TDirCallBack; bSub: Boolean;
    bMsg: Boolean);
  var
    APath: string;
    Info: TSearchRec;
    Succ: Integer;
  begin
    FindAbort := False;
    APath := MakePath(MakePath(Path) + SubPath);
    Succ := FindFirst(APath + FileName, faAnyFile - faVolumeID, Info);
    try
      while Succ = 0 do
      begin
        if (Info.Name <> '.') and (Info.Name <> '..') then
        begin
          if (Info.Attr and faDirectory) <> faDirectory then
          begin
            if Assigned(Proc) then
              Proc(APath + Info.FindData.cFileName, Info, FindAbort);
          end
        end;
        if bMsg then
          Application.ProcessMessages;
        if FindAbort then
          Exit;
        Succ := FindNext(Info);
      end;
    finally
      FindClose(Info);
    end;

    if bSub then
    begin
      Succ := FindFirst(APath + '*.*', faAnyFile - faVolumeID, Info);
      try
        while Succ = 0 do
        begin
          if (Info.Name <> '.') and (Info.Name <> '..') and
            (Info.Attr and faDirectory = faDirectory) then
          begin
            if Assigned(DirProc) then
              DirProc(MakePath(SubPath) + Info.Name);
            DoFindFile(Path, MakePath(SubPath) + Info.Name, FileName, Proc,
              DirProc, bSub, bMsg);
            if FindAbort then
              Exit;
          end;
          Succ := FindNext(Info);
        end;
      finally
        FindClose(Info);
      end;
    end;
  end;

begin
  DoFindFile(Path, '', FileName, Proc, DirProc, bSub, bMsg);
  Result := not FindAbort;
end;

constructor TSearchFile.Create(aPath,aFext:String;BackList:TStrings);
begin
  inherited Create(True);
  // 为False 自动执行线程 ，为True手动线程
  FreeOnTerminate := True; //自动释放线程
  FPath    :=aPath;
  FFext    :=aFext;
  FBackList:=BackList;

  self.Suspended:=False;
  //Suspended为false是执行线程，Suspended为true是挂起线程
  inc(CurrentSearchThread);
  {
  FPath    :=aPath;
  FFext    :=aFext;
  FBackList:=BackList;

  inc(CurrentSearchThread);
  FreeOnTerminate := True; //自动释放线程
  inherited Create(False); //执行线程    }
end;


destructor TSearchFile.Destroy;
begin
  dec(CurrentSearchThread);
  inherited Destroy;
end;

procedure TSearchFile.OnFindFile(const FileName: string;
  const Info: TSearchRec; var Abort: Boolean);
begin
  if FileMatchesExts(FileName, FFext) then
  begin
   FBackList.Add(FileName);
  // Abort := FAbort;
  end;
end;

procedure TSearchFile.Execute;
begin
  FindFile(FPath,'*.*', OnFindFile, nil, true);
end;


procedure TSearchFile.Search;
begin
  { Place thread code here }
  FindFile(FPath,'*.*', OnFindFile, nil, true);
end;



end.
