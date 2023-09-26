unit DepartmentForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB;

type
  TDepartmentFrm = class(TForm)
    lblDepartmentstructure: TLabel;
    DBGridDepartmentList: TDBGrid;
    Panel1: TPanel;
    BtnNew: TButton;
    BtnCancel: TButton;
    DepartmentsQry: TADOQuery;
    DepartmentsSrc: TDataSource;
    BtnEdit: TButton;
    DepartmentsQrydep_id: TLargeintField;
    DepartmentsQrydepartment_name: TStringField;
    DepartmentsQryparent_id: TLargeintField;
    procedure FormCreate(Sender: TObject);
    procedure DepartmentsSrcDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DepartmentFrm: TDepartmentFrm;

implementation

uses
  DataModule;

{$R *.dfm}

procedure TDepartmentFrm.FormCreate(Sender: TObject);
begin
  //
end;

procedure TDepartmentFrm.DepartmentsSrcDataChange(Sender: TObject;
  Field: TField);
begin
//
end;

end.
