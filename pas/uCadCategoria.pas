unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCadCategoria = class(TForm)
    Label1: TLabel;
    edtNomeCategoria: TEdit;
    pnlContainer: TPanel;
    btnGravar: TButton;
    procedure btnGravarClick(Sender: TObject);
    procedure edtNomeCategoriaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

uses uDmConexao;

procedure TfrmCadCategoria.btnGravarClick(Sender: TObject);
begin
  dmConexao.qryCadastroCategoria.Close;
  dmConexao.qryCadastroCategoria.SQL.Clear;
  dmConexao.qryCadastroCategoria.SQL.Add('INSERT INTO CATEGORIA (NM_CATEGORIA) VALUES(:NomeCategoria)');
  dmConexao.qryCadastroCategoria.ParamByName('NomeCategoria').Value := edtNomeCategoria.text;
  dmConexao.qryCadastroCategoria.ExecSQL;

  edtNomeCategoria.Text := '';
  edtNomeCategoria.SetFocus;
end;

procedure TfrmCadCategoria.edtNomeCategoriaChange(Sender: TObject);
begin
  if edtNomeCategoria.text <> '' then
  begin
    btnGravar.Enabled := true;
  end
  else
  begin
    btnGravar.Enabled := false;
  end;
end;

end.
