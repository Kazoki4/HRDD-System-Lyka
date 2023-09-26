object DepartmentFrm: TDepartmentFrm
  Left = 614
  Top = 185
  Width = 1114
  Height = 662
  Caption = 'Department Form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDepartmentstructure: TLabel
    Left = 16
    Top = 16
    Width = 332
    Height = 36
    Align = alCustom
    Caption = 'DEPARTMENT STRUCTURE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Century Gothic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGridDepartmentList: TDBGrid
    Left = 16
    Top = 64
    Width = 1065
    Height = 481
    DataSource = DepartmentsSrc
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'dep_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'department_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parent_id'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 16
    Top = 552
    Width = 1065
    Height = 57
    Caption = 'Panel1'
    TabOrder = 1
    object BtnNew: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = 'NEW'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Century Gothic'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object BtnCancel: TButton
      Left = 976
      Top = 16
      Width = 75
      Height = 25
      Caption = 'CANCEL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Century Gothic'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object BtnEdit: TButton
      Left = 104
      Top = 16
      Width = 75
      Height = 25
      Caption = 'EDIT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Century Gothic'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object DepartmentsQry: TADOQuery
    Connection = DModule.DBConnect
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM departments')
    Left = 472
    Top = 16
    object DepartmentsQrydep_id: TLargeintField
      FieldName = 'dep_id'
      ReadOnly = True
    end
    object DepartmentsQrydepartment_name: TStringField
      FieldName = 'department_name'
      Size = 255
    end
    object DepartmentsQryparent_id: TLargeintField
      FieldName = 'parent_id'
    end
  end
  object DepartmentsSrc: TDataSource
    DataSet = DepartmentsQry
    OnDataChange = DepartmentsSrcDataChange
    Left = 576
    Top = 16
  end
end
