unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDModule = class(TDataModule)
    DBConnect: TADOConnection;
    User: TADOQuery;
    Useruser_id: TLargeintField;
    Useremp_id: TLargeintField;
    Userusername: TStringField;
    Userrole: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    SystemName,mDatabase,mHost,DefaultDir : String;
  end;

var
  DModule: TDModule;

implementation

{$R *.dfm}

end.
