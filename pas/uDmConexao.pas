unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, SimpleDS;

type
  TdmConexao = class(TDataModule)
    SQLConnection1: TSQLConnection;
    DataSource1: TDataSource;
    SimpleDataSet1: TSimpleDataSet;
    SimpleDataSet1ID_PRODUTO: TIntegerField;
    SimpleDataSet1NM_PRODUTO: TStringField;
    SimpleDataSet1QT_SALDO: TIntegerField;
    SimpleDataSet1VL_PRODUTO: TFMTBCDField;
    SimpleDataSet1NM_CATEGORIA: TStringField;
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

end.
