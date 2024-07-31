unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, SimpleDS, IniFiles, Data.FMTBcd, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmConexao = class(TDataModule)
    dsoListaProdutos: TDataSource;
    ConexaoBanco: TFDConnection;
    qryListaProdutos: TFDQuery;
    qryListaProdutosID_PRODUTO: TIntegerField;
    qryListaProdutosNM_PRODUTO: TStringField;
    qryListaProdutosNM_CATEGORIA: TStringField;
    qryListaProdutosQT_SALDO: TIntegerField;
    qryListaProdutosVL_PRODUTO: TBCDField;
    qryCadastroCategoria: TFDQuery;
    qryCadastroProduto: TFDQuery;
    qryListaCategoria: TFDQuery;
    qryExcluirProduto: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
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
  ArquivoINI: TIniFile;
  Server, User, Password, Database, AuxError, Driver : string;
begin
  if (Conexaobanco.Connected) then
  begin
    Conexaobanco.Connected:= False;
  end;

  ArquivoINI:= TIniFile.Create(System.SysUtils.ExtractFilePath(ParamStr(0))+'\DBConnection.ini');
  Database:= arquivoINI.ReadString('SISTEMA','Database','');

  try
    Conexaobanco.Params.Values['User_Name'] := 'sysdba';
    Conexaobanco.Params.Values['Password']  := 'masterkey';
    Conexaobanco.Params.Values['Database']  := Database;
    Conexaobanco.Connected:= True;
  except
    on E : exception do
    begin
      Abort;
    end;
  end;

  qryListaProdutos.Open();

end;

end.
