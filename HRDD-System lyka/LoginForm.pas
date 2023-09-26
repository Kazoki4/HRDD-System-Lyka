unit LoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, RGGLib;

type
  TLoginFrm = class(TForm)
    Panel2: TPanel;
    EdtUsername: TEdit;
    Label1: TLabel;
    EdtPassword: TEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SettingsBtn: TSpeedButton;
    EdtBHost: TEdit;
    Label3: TLabel;
    EdtBDB: TEdit;
    Label4: TLabel;
    EdtLogin: TEdit;
    Label5: TLabel;
    EdtPW: TEdit;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SettingsBtnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdtPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginFrm: TLoginFrm;

implementation

uses DataModule, MainForm;

{$R *.dfm}

procedure TLoginFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
  if DModule.DBConnect.Connected then
  begin
//
//    AdoUser.Close;
//    AdoUser.Parameters[0].Value := UserName;
//    AdoUser.Open;
//
//    if AdoUser.RecordCount = 0 then
//    begin
//      ShowMessage('Please fill in your user profile after this message');
//      UserProfileFrm := TUserProfileFrm.Create(Application);
//      UserProfileFrm.Show;
//    end
//    else
//    begin
//      DModule.login_history.Close;
//      DModule.login_history.Open;
//
//      DModule.login_history.Append;
//      DModule.login_history.FieldByName('username').AsString := UserName;
//      DModule.login_history.Post;
//
//
//    end;

    Application.ShowMainForm := True;
    Application.MainForm.Enabled := True;
    MainFrm.Show;
    Application.ProcessMessages;
    MainFrm.Refresh;
  end
  else
    Application.Terminate;
end;

procedure TLoginFrm.FormActivate(Sender: TObject);
begin
  DModule.DBConnect.Connected := false;
  DModule.DBConnect.LoginPrompt := False;
  Screen.Cursor := crDefault;
end;

procedure TLoginFrm.SettingsBtnClick(Sender: TObject);
begin
  if SettingsBtn.Caption = 'Settings' then
  begin
    LoginFrm.Height := 450;
    SettingsBtn.Caption := 'Hide';
  end
  else
  begin 
    LoginFrm.Height := 215;
    SettingsBtn.Caption := 'Settings';
  end;
end;

procedure TLoginFrm.SpeedButton1Click(Sender: TObject);
begin
    DModule.SystemName := 'HRDD System';
    DModule.DefaultDir := ExtractFilePath(Application.ExeName);

  SetCurrentDir(DModule.DefaultDir);
  try
    Screen.Cursor := crHourGlass;
    DModule.DBConnect.Connected := False;
    DModule.DBConnect.ConnectionString := '';
    DModule.DBConnect.ConnectionString := 'PROVIDER=SQLOLEDB;Persist Security Info=False';
    DModule.DBConnect.ConnectionString := DModule.DBConnect.ConnectionString + ';Initial Catalog=' + EdtBDB.Text + ';Data Source=' + EdtBHost.Text;
    DModule.DBConnect.ConnectionString := DModule.DBConnect.ConnectionString + ';User ID=' + EdtLogin.Text;
    DModule.DBConnect.ConnectionString := DModule.DBConnect.ConnectionString + ';Password =' + EdtPW.Text;
    DModule.DBConnect.Connected := True;

    DModule.mHost := EdtBDB.Text + ' : ' + EdtBHost.Text;
    DModule.mDatabase := EdtBDB.Text;
    
    Screen.Cursor := crDefault;

    RegistrySaveValue('Software' + '\MORESCO1\' + trim(DModule.SystemName), 'LastUser', EdtLogin.Text);

    RegistrySaveValue('Software' + '\MORESCO1\' + trim(DModule.SystemName), 'Database', EdtBDB.Text);
    RegistrySaveValue('Software' + '\MORESCO1\' + trim(DModule.SystemName), 'Host', EdtBHost.Text);
    RegistrySaveValue('Software' + '\MORESCO1\' + trim(DModule.SystemName), 'Port','1433');

    UserPW := EdtPassword.Text;
    UserName := EdtUsername.Text;

    DModule.User.Close;
    DModule.User.Parameters[0].Value := UserName;   
    DModule.User.Parameters[1].Value := UserPW;
    DModule.User.Open;

    if DModule.User.RecordCount = 0 then
    begin
        if MessageDlg('Login Error! Invalid username or password.' + #13 + 'Retry?', mtError, [mbYes, mbNo], 0) = mrYes then
        begin
           EdtPassword.Clear;
           ActiveControl := EdtPassword;
        end
        else
          Application.Terminate;

    end
    else
      Close;



  except
    on e: exception do
    begin
         MessageDlg('Login Error! ' + e.Message + #13 + 'Retry?', mtError, [mbOK], 0);
         Application.Terminate;
//      Screen.Cursor := crDefault;
//      if MessageDlg('Login Error! ' + e.Message + #13 + 'Retry?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
//        Application.Terminate
//      else
//      begin
//        EdtPW.Clear;
//        ActiveControl := EdtPW;
//      end;
    end
  end;
end;

procedure TLoginFrm.EdtPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SelectNext(ActiveControl, True, true);
    SpeedButton1Click(Application);
  end;
end;

end.
