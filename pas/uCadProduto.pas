unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmCadProduto = class(TForm)
    lblNome: TLabel;
    edtNomeProduto: TEdit;
    lblCategoria: TLabel;
    lblSaldo: TLabel;
    lbValor: TLabel;
    cmbCategoria: TComboBox;
    edtSaldo: TEdit;
    edtValor: TEdit;
    pnlContainer: TPanel;
    btnGravar: TButton;
    procedure cmbCategoriaChange(Sender: TObject);
    procedure CarregarListaCategoria(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtNomeProdutoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;
  ID_Categoria : Integer;

implementation

{$R *.dfm}

uses uDmConexao;

procedure TfrmCadProduto.cmbCategoriaChange(Sender: TObject);
begin
  dmConexao.QueryListaCategoria.Close;
  dmConexao.QueryListaCategoria.SQL.Clear;
  dmConexao.QueryListaCategoria.SQL.Add('SELECT * FROM CATEGORIA WHERE NM_Categoria = '+QuotedStr(cmbCategoria.text));
  dmConexao.QueryListaCategoria.Open;

  ID_Categoria := dmConexao.QueryListaCategoria.FieldByName('ID_CATEGORIA').AsInteger;

  if ((edtNomeProduto.text <> '') and (cmbCategoria.ItemIndex <> -1)) then
  begin
    btnGravar.Enabled := true;
  end
  else
  begin
    btnGravar.Enabled := false;
  end;
end;

procedure TfrmCadProduto.edtNomeProdutoChange(Sender: TObject);
begin
  if ((edtNomeProduto.text <> '') and (cmbCategoria.ItemIndex <> -1)) then
  begin
    btnGravar.Enabled := true;
  end
  else
  begin
    btnGravar.Enabled := false;
  end;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  CarregarLIstaCategoria(frmCadProduto);
end;

procedure TfrmCadProduto.btnGravarClick(Sender: TObject);
begin
  dmConexao.QueryCadastroProduto.Close;
  dmConexao.QueryCadastroProduto.SQL.Clear;
  dmConexao.QueryCadastroProduto.SQL.Add('INSERT INTO PRODUTOS (NM_PRODUTO, ID_CATEGORIA, QT_SALDO, VL_PRODUTO) ');
  dmConexao.QueryCadastroProduto.SQL.Add('VALUES(:NomeProduto, :ID_Categora, :QT_Saldo, :VL_Produto)');
  dmConexao.QueryCadastroProduto.ParamByName('NomeProduto').Value := edtNomeProduto.text;
  dmConexao.QueryCadastroProduto.ParamByName('ID_Categora').Value := ID_Categoria;
  dmConexao.QueryCadastroProduto.ParamByName('QT_Saldo').Value    := edtSaldo.text;
  dmConexao.QueryCadastroProduto.ParamByName('VL_Produto').Value  := edtValor.text;
  dmConexao.QueryCadastroProduto.ExecSQL;

  edtNomeProduto.Text := '';
  cmbCategoria.ItemIndex := -1;
  edtSaldo.Text := '';
  edtValor.Text := '';

  btnGravar.Enabled := False;

  edtNomeProduto.Setfocus;

end;

procedure TfrmCadProduto.CarregarListaCategoria(Sender: TObject);
begin
  cmbCategoria.Items.Clear;

  dmConexao.QueryListaCategoria.Close;
  dmConexao.QueryListaCategoria.SQL.Clear;
  dmConexao.QueryListaCategoria.SQL.Add('SELECT * FROM CATEGORIA ORDER BY NM_CATEGORIA');
  dmConexao.QueryListaCategoria.Open;

  while not dmConexao.QueryListaCategoria.eof do
  begin
    cmbCategoria.Items.Add(dmConexao.QueryListaCategoria.FieldByName('NM_CATEGORIA').AsString);
    dmConexao.QueryListaCategoria.Next;
  end;
end;

end.
