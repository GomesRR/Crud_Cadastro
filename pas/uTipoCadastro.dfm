object frmTipoCadastro: TfrmTipoCadastro
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Tipo de Cadastro'
  ClientHeight = 146
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
  object btnCadCategoria: TButton
    Left = 48
    Top = 24
    Width = 145
    Height = 41
    Caption = 'Categoria'
    TabOrder = 0
    OnClick = btnCadCategoriaClick
  end
  object btnCadProduto: TButton
    Left = 48
    Top = 71
    Width = 145
    Height = 41
    Caption = 'Produto'
    TabOrder = 1
    OnClick = btnCadProdutoClick
  end
end
