object DModule: TDModule
  OldCreateOrder = False
  Left = 227
  Top = 518
  Height = 305
  Width = 450
  object DBConnect: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=12345;Persist Security Info=True;Us' +
      'er ID=administrator(albert);Initial Catalog=HRIS_PAYROLL;Data So' +
      'urce=10.209.70.5;Use Procedure for Prepare=1;Auto Translate=True' +
      ';Packet Size=4096;Workstation ID=LAPTOP-2NE7I8VK;Use Encryption ' +
      'for Data=False;Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 48
  end
  object User: TADOQuery
    Connection = DBConnect
    Parameters = <
      item
        Name = 'username'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'password'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM users'
      
        'where username = :username and pwdcompare( :password , password ' +
        ') = 1')
    Left = 144
    Top = 48
    object Useruser_id: TLargeintField
      FieldName = 'user_id'
      ReadOnly = True
    end
    object Useremp_id: TLargeintField
      FieldName = 'emp_id'
    end
    object Userusername: TStringField
      FieldName = 'username'
      Size = 255
    end
    object Userrole: TStringField
      FieldName = 'role'
      Size = 255
    end
  end
end
