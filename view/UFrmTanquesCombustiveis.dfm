inherited FrmTanquesCombustiveis: TFrmTanquesCombustiveis
  Caption = 'Tanques de Combust'#237'veis'
  ClientHeight = 330
  ClientWidth = 498
  ExplicitWidth = 504
  ExplicitHeight = 359
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBotoes: TPanel
    Top = 289
    Width = 498
    ExplicitTop = 289
    ExplicitWidth = 498
  end
  object GBoxDados: TGroupBox [1]
    Left = 8
    Top = 8
    Width = 481
    Height = 73
    Caption = ' Dados do Tanque'
    TabOrder = 1
    object Label4: TLabel
      Left = 15
      Top = 24
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object DBEDescricao: TDBEdit
      Left = 15
      Top = 38
      Width = 450
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
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 400
          Visible = True
        end>
    end
  end
end
