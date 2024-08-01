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
    procedure LimpaCampos(Sender: TObject);
    procedure AtribuiCategoria(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtNomeProdutoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtSaldoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      ID_Categoria, ID_Produto_Edicao : Integer;
      SN_Edicao : String;
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses uDmConexao;

procedure TfrmCadProduto.cmbCategoriaChange(Sender: TObject);
begin

  AtribuiCategoria(frmCadproduto);

  if ((edtNomeProduto.text <> '') and (cmbCategoria.ItemIndex <> -1)) then
  begin
    btnGravar.Enabled := true;
  end
  else
  begin
    btnGravar.Enabled := false;
  end;
end;

procedure TfrmCadProduto.cmbCategoriaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    edtSaldo.Setfocus;
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

procedure TfrmCadProduto.edtNomeProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    cmbCategoria.Setfocus;
  end;
end;

procedure TfrmCadProduto.edtSaldoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    edtValor.Setfocus;
  end;
end;

procedure TfrmCadProduto.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9','.',#8,#13]) then
  begin
    key := #0;
  end;

  if (key = #13) then
  begin
    btnGravar.Setfocus;
  end;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmConexao.qryListaProdutos.Refresh;
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  LimpaCampos(frmCadProduto);
  CarregarLIstaCategoria(frmCadProduto);

  if (SN_Edicao = 'S') then
  begin
    edtNomeProduto.Text := dmConexao.qryListaProdutos.FieldByName('NM_Produto').AsString;
    cmbCategoria.Itemindex := cmbCategoria.Items.IndexOf(dmConexao.qryListaProdutos.FieldByName('NM_Categoria').AsString);
    edtSaldo.Text :=  dmConexao.qryListaProdutos.FieldByName('QT_Saldo').AsString;
    edtValor.Text := StringReplace(dmConexao.qryListaProdutos.FieldByName('VL_Produto').AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]);

    AtribuiCategoria(frmCadProduto);

    btnGravar.Enabled := True;
  end;
end;

procedure TfrmCadProduto.btnGravarClick(Sender: TObject);
begin
  if (SN_Edicao = 'S') then
  begin
    dmConexao.qryCadastroProduto.Close;
    dmConexao.qryCadastroProduto.SQL.Clear;
    dmConexao.qryCadastroProduto.SQL.Add('UPDATE PRODUTOS SET NM_PRODUTO = :NomeProduto, ID_Categoria = :ID_Categoria, QT_SALDO = :QT_Saldo, VL_Produto = :VL_Produto ');
    dmConexao.qryCadastroProduto.SQL.Add('WHERE ID_PRODUTO = :ID_Produto');
    dmConexao.qryCadastroProduto.ParamByName('NomeProduto').Value := edtNomeProduto.text;
    dmConexao.qryCadastroProduto.ParamByName('ID_Categoria').Value := ID_Categoria;
    dmConexao.qryCadastroProduto.ParamByName('QT_Saldo').Value    := edtSaldo.text;
    dmConexao.qryCadastroProduto.ParamByName('VL_Produto').Value  := edtValor.text;
    dmConexao.qryCadastroProduto.ParamByName('ID_Produto').Value  := ID_Produto_Edicao;
    dmConexao.qryCadastroProduto.ExecSQL;

    btnGravar.Enabled := False;

    Close;
  end
  else
  begin
    dmConexao.qryCadastroProduto.Close;
    dmConexao.qryCadastroProduto.SQL.Clear;
    dmConexao.qryCadastroProduto.SQL.Add('INSERT INTO PRODUTOS (NM_PRODUTO, ID_CATEGORIA, QT_SALDO, VL_PRODUTO) ');
    dmConexao.qryCadastroProduto.SQL.Add('VALUES(:NomeProduto, :ID_Categoria, :QT_Saldo, :VL_Produto)');
    dmConexao.qryCadastroProduto.ParamByName('NomeProduto').Value := edtNomeProduto.text;
    dmConexao.qryCadastroProduto.ParamByName('ID_Categoria').Value := ID_Categoria;
    dmConexao.qryCadastroProduto.ParamByName('QT_Saldo').Value    := edtSaldo.text;
    dmConexao.qryCadastroProduto.ParamByName('VL_Produto').Value  := edtValor.text;
    dmConexao.qryCadastroProduto.ExecSQL;

    edtNomeProduto.Text := '';
    cmbCategoria.ItemIndex := -1;
    edtSaldo.Text := '';
    edtValor.Text := '';



    edtNomeProduto.Setfocus;
  end;


end;

procedure TfrmCadProduto.CarregarListaCategoria(Sender: TObject);
begin
  cmbCategoria.Items.Clear;

  dmConexao.qryListaCategoria.Close;
  dmConexao.qryListaCategoria.SQL.Clear;
  dmConexao.qryListaCategoria.SQL.Add('SELECT * FROM CATEGORIA ORDER BY NM_CATEGORIA');
  dmConexao.qryListaCategoria.Open;

  while not dmConexao.qryListaCategoria.eof do
  begin
    cmbCategoria.Items.Add(dmConexao.qryListaCategoria.FieldByName('NM_CATEGORIA').AsString);
    dmConexao.qryListaCategoria.Next;
  end;
end;

procedure TfrmCadProduto.LimpaCampos(Sender: TObject);
begin
  edtNomeProduto.Text := '';
  edtSaldo.Text := '';
  edtValor.text := '';
end;

procedure TfrmCadProduto.AtribuiCategoria(Sender: TObject);
begin
  dmConexao.qryListaCategoria.Close;
  dmConexao.qryListaCategoria.SQL.Clear;
  dmConexao.qryListaCategoria.SQL.Add('SELECT * FROM CATEGORIA WHERE NM_Categoria = '+QuotedStr(cmbCategoria.text));
  dmConexao.qryListaCategoria.Open;

  ID_Categoria := dmConexao.qryListaCategoria.FieldByName('ID_CATEGORIA').AsInteger;
end;

end.
