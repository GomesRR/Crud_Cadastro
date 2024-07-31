unit uTipoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmTipoCadastro = class(TForm)
    btnCadCategoria: TButton;
    btnCadProduto: TButton;
    procedure btnCadCategoriaClick(Sender: TObject);
    procedure btnCadProdutoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoCadastro: TfrmTipoCadastro;

implementation

{$R *.dfm}

uses uCadCategoria, uDmConexao, UPrincipal, uCadProduto;

procedure TfrmTipoCadastro.btnCadCategoriaClick(Sender: TObject);
begin
  frmCadCategoria.Showmodal;
end;

procedure TfrmTipoCadastro.btnCadProdutoClick(Sender: TObject);
begin
  frmCadProduto.Showmodal;
end;

procedure TfrmTipoCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmConexao.qryListaProdutos.Refresh;
end;

end.
