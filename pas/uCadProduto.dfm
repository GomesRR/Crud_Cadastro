object frmCadProduto: TfrmCadProduto
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro - Produto'
  ClientHeight = 201
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object lblNome: TLabel
    Left = 26
    Top = 24
    Width = 38
    Height = 15
    Caption = 'NOME:'
  end
  object lblCategoria: TLabel
    Left = 26
    Top = 57
    Width = 65
    Height = 15
    Caption = 'CATEGORIA:'
  end
  object lblSaldo: TLabel
    Left = 26
    Top = 88
    Width = 40
    Height = 15
    Caption = 'SALDO:'
  end
  object lbValor: TLabel
    Left = 26
    Top = 119
    Width = 39
    Height = 15
    Caption = 'VALOR:'
  end
  object edtNomeProduto: TEdit
    Left = 99
    Top = 21
    Width = 304
    Height = 23
    TabOrder = 0
    OnChange = edtNomeProdutoChange
  end
  object cmbCategoria: TComboBox
    Left = 99
    Top = 54
    Width = 304
    Height = 23
    TabOrder = 1
    Text = 'Selecione a Categoria...'
    OnChange = cmbCategoriaChange
  end
  object edtSaldo: TEdit
    Left = 99
    Top = 85
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 2
  end
  object edtValor: TEdit
    Left = 99
    Top = 116
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 3
  end
  object pnlContainer: TPanel
    Left = 0
    Top = 160
    Width = 428
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 4
    ExplicitLeft = 248
    ExplicitTop = 152
    ExplicitWidth = 185
    object btnGravar: TButton
      Left = 318
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Gravar'
      Enabled = False
      TabOrder = 0
      OnClick = btnGravarClick
    end
  end
end
