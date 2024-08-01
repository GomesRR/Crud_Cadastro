unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Data.SqlExpr, FireDAC.VCLUI.Wait;

type
  TfrmPrincipal = class(TForm)
    pnlAcao: TPanel;
    btnCadastrar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;


implementation

{$R *.dfm}

uses uDmConexao, uCadCategoria, uTipoCadastro, uCadProduto;

procedure TfrmPrincipal.btnCadastrarClick(Sender: TObject);
begin
  frmTipoCadastro.Showmodal;
end;

procedure TfrmPrincipal.btnEditarClick(Sender: TObject);
begin
  frmCadProduto.ID_Produto_Edicao := dmConexao.qryListaProdutos.FieldByName('ID_Produto').AsInteger;
  frmCadProduto.SN_Edicao         := 'S';
  frmCadProduto.Showmodal;

end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg ('Deseja mesmo excluir o registro? Esta a��o n�o pode ser desfeita!', mtConfirmation,
                 [mbYes, mbNo], 0) = mrYes then
  begin
    dmConexao.qryExcluirProduto.Close;
    dmConexao.qryExcluirProduto.SQL.Clear;
    dmConexao.qryExcluirProduto.SQL.Add('DELETE FROM PRODUTOS WHERE ID_Produto = :ID_Produto');
    dmConexao.qryExcluirProduto.ParamByName('ID_Produto').Value := dmConexao.qryListaProdutos.FieldByName('ID_Produto').AsInteger;
    dmConexao.qryExcluirProduto.ExecSQL;

    dmConexao.qryListaProdutos.Refresh;
  end;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.DBGrid1DblClick(Sender: TObject);
begin
  btnEditar.Click();
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  Caminho: String;
begin

end;

end.
