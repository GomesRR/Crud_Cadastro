object dmConexao: TdmConexao
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object dsoListaProdutos: TDataSource
    DataSet = qryListaProdutos
    Left = 144
    Top = 24
  end
  object ConexaoBanco: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=127.0.0.1'
      
        'Database=C:\Ronilson\Projetos_Git\Crud_Cadastro\exe\db\Database.' +
        'FDB')
    Connected = True
    LoginPrompt = False
    Left = 400
    Top = 176
  end
  object qryListaProdutos: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'SELECT PRODUTOS.ID_PRODUTO,'
      '              PRODUTOS.NM_PRODUTO,'
      '              CATEGORIA.NM_CATEGORIA,'
      '              PRODUTOS.QT_SALDO,'
      '              PRODUTOS.VL_PRODUTO'
      'FROM PRODUTOS'
      '            LEFT JOIN CATEGORIA'
      '            ON CATEGORIA.ID_CATEGORIA = PRODUTOS.ID_CATEGORIA'
      'ORDER BY PRODUTOS.NM_PRODUTO')
    Left = 72
    Top = 24
    object qryListaProdutosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryListaProdutosNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'NM_PRODUTO'
      Size = 50
    end
    object qryListaProdutosNM_CATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_CATEGORIA'
      Origin = 'NM_CATEGORIA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryListaProdutosQT_SALDO: TIntegerField
      FieldName = 'QT_SALDO'
      Origin = 'QT_SALDO'
    end
    object qryListaProdutosVL_PRODUTO: TBCDField
      FieldName = 'VL_PRODUTO'
      Origin = 'VL_PRODUTO'
      Precision = 18
      Size = 2
    end
  end
  object qryCadastroCategoria: TFDQuery
    Connection = ConexaoBanco
    Left = 72
    Top = 96
  end
  object qryCadastroProduto: TFDQuery
    Connection = ConexaoBanco
    Left = 144
    Top = 96
  end
  object qryListaCategoria: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'SELECT * '
      'FROM CATEGORIA'
      'ORDER BY NM_CATEGORIA')
    Left = 72
    Top = 168
  end
  object qryExcluirProduto: TFDQuery
    Connection = ConexaoBanco
    Left = 72
    Top = 240
  end
end
