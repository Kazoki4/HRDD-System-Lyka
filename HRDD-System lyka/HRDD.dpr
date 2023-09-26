program HRDD;

uses
  Forms,
  MainForm in 'MainForm.pas' {MainFrm},
  DataModule in 'DataModule\DataModule.pas' {DModule: TDataModule},
  LoginForm in 'LoginForm.pas' {LoginFrm},
  DepartmentForm in 'Files\DepartmentForm.pas' {DepartmentFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  Application.Title := 'MORESCO 1';
  Application.CreateForm(TMainFrm, MainFrm);
  Application.Run;
end.
