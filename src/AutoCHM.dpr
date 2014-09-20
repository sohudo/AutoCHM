program AutoCHM;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  decompile in 'decompile.pas' {Frmdecomp},
  CHMCONST in 'CHMCONST.pas',
  display in 'display.pas' {Frmshow},
  addML in 'addML.pas' {frmML},
  SearchFileThread in 'SearchFileThread.pas',
  ComCtrls in 'ComCtrls.pas',
  FrmProgress in 'FrmProgress.pas' {FormPro},
  addTopic in 'addTopic.pas' {FrmTopic},
  addIndex in 'addIndex.pas' {FrmIndex},
  FileList in 'FileList.pas' {FrmFileList},
  FrmProject in 'FrmProject.pas' {FrmPro},
  BatchEdit in 'BatchEdit.pas' {FrmBatch};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmdecomp, Frmdecomp);
  Application.CreateForm(TFrmshow, Frmshow);
  Application.CreateForm(TfrmML, frmML);
  Application.CreateForm(TFrmTopic, FrmTopic);
  Application.CreateForm(TFrmIndex, FrmIndex);
  Application.CreateForm(TFrmFileList, FrmFileList);
  Application.CreateForm(TFrmPro, FrmPro);
  Application.CreateForm(TFrmBatch, FrmBatch);
  Application.Run;
end.
