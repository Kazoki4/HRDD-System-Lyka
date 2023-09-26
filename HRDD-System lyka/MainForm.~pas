unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, RGGLib, ComCtrls;

type
  TMainFrm = class(TForm)
    MainMenu1: TMainMenu;
    Files1: TMenuItem;
    HRIS1: TMenuItem;
    Payroll1: TMenuItem;
    Help1: TMenuItem;
    LeaveCredits1: TMenuItem;
    Employees1: TMenuItem;
    Applicants1: TMenuItem;
    Exams1: TMenuItem;
    Departments1: TMenuItem;
    Hiring1: TMenuItem;
    PlantillaPosition1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Logout1: TMenuItem;
    EmployeeCredits1: TMenuItem;
    Payroll2: TMenuItem;
    LeaveApplication1: TMenuItem;
    OvertimeApplication1: TMenuItem;
    DailyTimeRecord1: TMenuItem;
    Holiday1: TMenuItem;
    Window2: TMenuItem;
    itel1: TMenuItem;
    Cascade1: TMenuItem;
    ArrangeAll1: TMenuItem;
    N3: TMenuItem;
    sb: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure ArrangeAll1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure itel1Click(Sender: TObject);
    procedure Window2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Departments1Click(Sender: TObject);
  private
    { Private declarations }      
    timeCount: integer;
    hasUpdate: boolean;
    ShowDashboard  : Boolean;
    hasError : Boolean;
  public
    { Public declarations }
  end;

var
  MainFrm: TMainFrm;

implementation

uses
  DataModule, LoginForm, IniFiles, DepartmentForm;

{$R *.dfm}

procedure TMainFrm.FormCreate(Sender: TObject);
begin
  DModule := TDModule.Create(Self);
  LoginFrm := TLoginFrm.Create(Application);
  LoginFrm.Show;
end;

procedure TMainFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (MessageDlg('Are you sure you want to quit?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Abort;

    Application.Terminate;
end;

procedure TMainFrm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainFrm.Logout1Click(Sender: TObject);
begin
  //
end;

procedure TMainFrm.ArrangeAll1Click(Sender: TObject);
begin
 ArrangeIcons;
end;

procedure TMainFrm.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TMainFrm.itel1Click(Sender: TObject);
begin
  Tile;
end;

procedure TMainFrm.Window2Click(Sender: TObject);
  var
  i: Integer;
  subMenu: TMenuItem;
begin
  for i := 0 to Window2.Count - 1 do
  begin
    if i > 3 then
      Window2.Items[4].Destroy;
  end;
  
  for i := 0 to MainFrm.MDIChildCount - 1 do
  begin
    subMenu := TMenuItem.Create(MainMenu1);
    subMenu.Name := MainFrm.MDIChildren[i].Name + '_' + IntToStr(i);
    subMenu.Caption := MainFrm.MDIChildren[i].Caption;
    if i = 0 then
    begin
      subMenu.Checked := true;
      subMenu.Enabled := false;
    end;
          
    subMenu.OnClick := N3.OnClick;
    Window2.Add(subMenu);
  end;
end;

procedure TMainFrm.N3Click(Sender: TObject);
var
  strA: string;
  SPStr: TSplitPart_ArryStr;
begin
  strA := (Sender as TMenuItem).Name;
  SPStr := Split_Part(strA, '_');

  MainFrm.MDIChildren[StrToInt(SPStr[1])].BringToFront;

end;

procedure TMainFrm.FormShow(Sender: TObject);

var
  f: TForm;
  MyIni: TMemIniFile;
  oversion, nversion: Integer;
begin
  MyIni := TMemIniFile.Create(DefaultDir + trim(trim(DModule.SystemName) + '.ini'));
  left := MyIni.ReadInteger(Name, 'Left', Left);
  Top := MyIni.ReadInteger(Name, 'Top', Top);
  Width := MyIni.ReadInteger(Name, 'Width', Width);
  Height := MyIni.ReadInteger(Name, 'Height', Height);
  MyIni.Free;

  f := TForm(FindComponent('LoginFrm'));

  if f <> nil then
    f.Release;
  timeCount := 0;
  hasUpdate := false;

  sb.Panels.Items[0].Text := 'User: ' + trim(UserName) + ' -->> ' + UserDept;
  sb.Panels.Items[0].Width := Canvas.TextWidth('User: ' + trim(UserName) + ' -->> ' + UserDept) + 10;

  sb.Panels.Items[1].Text := 'Host ' + trim(Host);
  sb.Panels.Items[1].Width := Canvas.TextWidth('Host -->> ' + trim(Host)) + 10;

  caption := Application.Title + ' - HRIS Module v' + GetFileVersion(Application.ExeName);

      {
  DModule.ADOQueryCheckVersion.Close;
  DModule.ADOQueryCheckVersion.Open;

  if UserName <> 'albert_gwapo' then
    UpdateVersion1.Visible := False;
    
   //  ShowMessage( + ' '+DModule.ADOQueryCheckVersion.FieldByName('newversion').AsString);
  oversion := StrToInt(StringReplace(GetFileVersion(Application.ExeName), '.', '', [rfReplaceAll, rfIgnoreCase]));
  nversion := StrToInt(StringReplace(DModule.ADOQueryCheckVersion.FieldByName('newversion').AsString, '.', '', [rfReplaceAll, rfIgnoreCase]));

  if oversion < nversion then
  begin
    RegistrySaveValue('Software' + '\MORESCO1-CMIS\' + trim('M1-CMIS'), 'isUpdateRead', 'unRead');

    if (MessageDlg('New Version Found. Click [Yes] to UPDATE', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    begin
      Application.Terminate;
      Abort;
    end;
    //create bat files
    GlobalComModule.CreateInstallUpdate('cmis');
    ShellExecute(application.handle, 'open', 'C:\CMIS\installupdate.bat', nil, nil, SW_HIDE );
    Application.Terminate;
  end
  else if ( oversion = nversion) then
    begin
      if RegistryGetValue('Software'+'\MORESCO1-CMIS\'+trim('M1-CMIS'),'isUpdateRead','') <> 'Read' then
        begin
          WhatsNew1Click(Application);
        end;
      HasUpdateTimer.Enabled := True;
      RegistrySaveValue('Software' + '\MORESCO1-CMIS\' + trim('M1-CMIS'), 'isUpdateRead', 'Read');
    end;
    
  if DModule.ADOQueryCheckVersion.FieldByName('status').AsInteger = 0 then //Disabled
  begin
    MessageDlg('This application is under maintenance.' + sLineBreak + ' Please contact programmer for more details. ' + sLineBreak + 'Thank you!', mtInformation, [mbOK], 0);
    Application.Terminate;
  end;

  }
end;




procedure TMainFrm.Departments1Click(Sender: TObject);
begin
  DepartmentFrm := TDepartmentFrm.Create(Application);
  DepartmentFrm.Show;
end;

end.
