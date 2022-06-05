inherited FrmAbastecimento: TFrmAbastecimento
  Caption = 'Abastecimento'
  ClientHeight = 280
  ClientWidth = 497
  OnShow = FormShow
  ExplicitWidth = 503
  ExplicitHeight = 309
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBotoes: TPanel
    Top = 239
    Width = 497
    TabOrder = 2
    ExplicitWidth = 497
  end
  object GBoxDados: TGroupBox [1]
    Left = 8
    Top = 8
    Width = 481
    Height = 73
    Caption = ' Dados do Abastecimento '
    TabOrder = 0
    object Label1: TLabel
      Left = 99
      Top = 24
      Width = 32
      Height = 13
      Caption = 'Bomba'
    end
    object Label2: TLabel
      Left = 236
      Top = 24
      Width = 26
      Height = 13
      Caption = 'Litros'
    end
    object Label3: TLabel
      Left = 304
      Top = 24
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label4: TLabel
      Left = 15
      Top = 24
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label5: TLabel
      Left = 388
      Top = 24
      Width = 73
      Height = 13
      Caption = 'Imposto (13%)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBELitros: TDBEdit
      Left = 236
      Top = 38
      Width = 58
      Height = 21
      DataField = 'LITROS'
      DataSource = DSBase
      TabOrder = 2
    end
    object DBEValor: TDBEdit
      Left = 304
      Top = 38
      Width = 74
      Height = 21
      DataField = 'VALOR_ABASTECIDO'
      DataSource = DSBase
      TabOrder = 3
      OnExit = DBEValorExit
    end
    object DBEData: TDBEdit
      Left = 15
      Top = 38
      Width = 74
      Height = 21
      DataField = 'DATA'
      DataSource = DSBase
      TabOrder = 0
    end
    object DBEImposto: TDBEdit
      Left = 388
      Top = 38
      Width = 74
      Height = 21
      DataField = 'VALOR_IMPOSTO'
      DataSource = DSBase
      ReadOnly = True
      TabOrder = 4
    end
    object DBLkpBomba: TDBLookupComboBox
      Left = 99
      Top = 38
      Width = 128
      Height = 21
      DataField = 'BOMBA_ID'
      DataSource = DSBase
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = DSBomba
      TabOrder = 1
    end
  end
  object GBoxVisualizacao: TGroupBox [2]
    Tag = 1
    Left = 8
    Top = 84
    Width = 481
    Height = 148
    Caption = ' Visualiza'#231#227'o '
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 477
      Height = 131
      Align = alClient
      DataSource = DSBase
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'Id'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Caption = 'Data'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BOMBA'
          Title.Caption = 'Bomba'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LITROS'
          Title.Caption = 'Litros'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_ABASTECIDO'
          Title.Caption = 'Vlr Abastecido'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_IMPOSTO'
          Title.Caption = 'Vlr Imposto'
          Width = 90
          Visible = True
        end>
    end
  end
  inherited DSBase: TDataSource
    Left = 440
    Top = 120
  end
  object DSBomba: TDataSource
    Left = 368
    Top = 156
  end
end
