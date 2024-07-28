object dmConexao: TdmConexao
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver280.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver280.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      
        'Database=D:\Ronilson\Projetos_Git\Crud_Cadastro\exe\db\DATABASE.' +
        'FDB'
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
    BeforeConnect = SQLConnection1BeforeConnect
    Connected = True
    Left = 56
    Top = 32
  end
  object dsoListaProdutos: TDataSource
    DataSet = dtsListaProdutos
    Left = 264
    Top = 32
  end
  object dtsListaProdutos: TSimpleDataSet
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
    object dtsListaProdutosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object dtsListaProdutosNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Size = 50
    end
    object dtsListaProdutosQT_SALDO: TIntegerField
      FieldName = 'QT_SALDO'
    end
    object dtsListaProdutosVL_PRODUTO: TFMTBCDField
      FieldName = 'VL_PRODUTO'
      Precision = 18
      Size = 2
    end
    object dtsListaProdutosNM_CATEGORIA: TStringField
      FieldName = 'NM_CATEGORIA'
      Size = 50
    end
  end
  object QueryCadastroCategoria: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 72
    Top = 96
  end
  object QueryListaCategoria: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * '
      'FROM CATEGORIA'
      'ORDER BY NM_CATEGORIA')
    SQLConnection = SQLConnection1
    Left = 80
    Top = 176
    object QueryListaCategoriaID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Required = True
    end
    object QueryListaCategoriaNM_CATEGORIA: TStringField
      FieldName = 'NM_CATEGORIA'
    end
  end
  object QueryCadastroProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 224
    Top = 96
  end
  object dsoListaCategoria: TDataSource
    DataSet = QueryListaCategoria
    Left = 208
    Top = 176
  end
  object QueryExcluirProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 80
    Top = 248
  end
end
