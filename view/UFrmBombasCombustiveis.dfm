inherited FrmBombasCombustiveis: TFrmBombasCombustiveis
  Caption = 'Bombas de Combust'#237'veis'
  ClientHeight = 331
  ClientWidth = 497
  ExplicitWidth = 503
  ExplicitHeight = 360
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBotoes: TPanel
    Top = 290
    Width = 497
    ExplicitTop = 290
    ExplicitWidth = 497
  end
  object GBoxDados: TGroupBox [1]
    Left = 8
    Top = 8
    Width = 481
    Height = 73
    Caption = ' Dados da Bomba '
    TabOrder = 1
    object Label4: TLabel
      Left = 15
      Top = 24
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label1: TLabel
      Left = 315
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Tanque'
    end
    object DBLkpTanque: TDBLookupComboBox
      Left = 315
      Top = 38
      Width = 150
      Height = 21
      DataField = 'TANQUE_ID'
      DataSource = DSBase
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = DSTanque
      TabOrder = 1
    end
    object DBEDescricao: TDBEdit
      Left = 15
      Top = 38
      Width = 290
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = DSBase
      TabOrder = 0
    end
  end
  object GBoxVisualizacao: TGroupBox [2]
    Tag = 1
    Left = 8
    Top = 87
    Width = 481
    Height = 197
    Caption = ' Visualiza'#231#227'o '
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 477
      Height = 180
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 350
          Visible = True
        end>
    end
  end
  inherited DSBase: TDataSource
    Left = 368
    Top = 104
  end
  object DSTanque: TDataSource
    Left = 392
    Top = 167
  end
end
