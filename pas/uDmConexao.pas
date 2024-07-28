unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, SimpleDS, IniFiles, Data.FMTBcd;

type
  TdmConexao = class(TDataModule)
    SQLConnection1: TSQLConnection;
    dsoListaProdutos: TDataSource;
    dtsListaProdutos: TSimpleDataSet;
    dtsListaProdutosID_PRODUTO: TIntegerField;
    dtsListaProdutosNM_PRODUTO: TStringField;
    dtsListaProdutosQT_SALDO: TIntegerField;
    dtsListaProdutosVL_PRODUTO: TFMTBCDField;
    dtsListaProdutosNM_CATEGORIA: TStringField;
    QueryCadastroCategoria: TSQLQuery;
    QueryListaCategoria: TSQLQuery;
    QueryCadastroProduto: TSQLQuery;
    QueryListaCategoriaID_CATEGORIA: TIntegerField;
    QueryListaCategoriaNM_CATEGORIA: TStringField;
    dsoListaCategoria: TDataSource;
    QueryExcluirProduto: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure SQLConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.DataModuleCreate(Sender: TObject);
var
  Caminho : String;
begin
  SQLConnection1.Connected := true;
  dtsListaProdutos.Active := true;
end;

procedure TdmConexao.SQLConnection1BeforeConnect(Sender: TObject);
begin
  SQLConnection1.Params.Values['Database'] := ExtractFilePath(ParamStr(0))+ 'db\Database.fdb';
end;

end.
