object dmConexao: TdmConexao
  Height = 480
  Width = 640
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=D:\Ronilson\Projetos_Git\Crud_Cadastro\db\DABATASE.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connected = True
    Left = 56
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = SimpleDataSet1
    Left = 264
    Top = 32
  end
  object SimpleDataSet1: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConnection1
    DataSet.CommandText = 
      'SELECT PRODUTOS.ID_PRODUTO,'#13#10'              PRODUTOS.NM_PRODUTO,'#13 +
      #10'              CATEGORIA.NM_CATEGORIA,'#13#10'              PRODUTOS.Q' +
      'T_SALDO,'#13#10'              PRODUTOS.VL_PRODUTO'#13#10'FROM PRODUTOS'#13#10'    ' +
      '        LEFT JOIN CATEGORIA'#13#10'            ON CATEGORIA.ID_CATEGOR' +
      'IA = PRODUTOS.ID_CATEGORIA'#13#10'ORDER BY PRODUTOS.NM_PRODUTO'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 160
    Top = 32
    object SimpleDataSet1ID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object SimpleDataSet1NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Size = 50
    end
    object SimpleDataSet1QT_SALDO: TIntegerField
      FieldName = 'QT_SALDO'
    end
    object SimpleDataSet1VL_PRODUTO: TFMTBCDField
      FieldName = 'VL_PRODUTO'
      Precision = 18
      Size = 2
    end
    object SimpleDataSet1NM_CATEGORIA: TStringField
      FieldName = 'NM_CATEGORIA'
      Size = 50
    end
  end
end
