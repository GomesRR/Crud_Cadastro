program Crud_Cadastro;

uses
  Vcl.Forms,
  UPrincipal in '..\pas\UPrincipal.pas' {frmPrincipal},
  uDmConexao in '..\pas\uDmConexao.pas' {dmConexao: TDataModule},
  uCadCategoria in '..\pas\uCadCategoria.pas' {frmCadCategoria},
  uTipoCadastro in '..\pas\uTipoCadastro.pas' {frmTipoCadastro},
  uCadProduto in '..\pas\uCadProduto.pas' {frmCadProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmCadCategoria, frmCadCategoria);
  Application.CreateForm(TfrmTipoCadastro, frmTipoCadastro);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.Run;
end.
