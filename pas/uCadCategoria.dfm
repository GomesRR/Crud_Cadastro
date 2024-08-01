object frmCadCategoria: TfrmCadCategoria
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro - Categoria'
  ClientHeight = 107
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object edtNomeCategoria: TEdit
    Left = 74
    Top = 21
    Width = 343
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 0
    OnChange = edtNomeCategoriaChange
  end
  object pnlContainer: TPanel
    Left = 0
    Top = 66
    Width = 458
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object btnGravar: TButton
      Left = 342
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
