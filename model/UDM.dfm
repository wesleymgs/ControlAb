object DM: TDM
  OldCreateOrder = False
  Height = 278
  Width = 410
  object FDCControlAb: TFDConnection
    Params.Strings = (
      'Database=C:\FORTES\ControlAb\db\CONTROLAB.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Transaction = FDTControlAb
    Left = 40
    Top = 24
  end
  object FDTControlAb: TFDTransaction
    Connection = FDCControlAb
    Left = 88
    Top = 24
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 136
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 184
    Top = 24
  end
  object FDQAbastecimentos: TFDQuery
    OnCalcFields = FDQAbastecimentosCalcFields
    Connection = FDCControlAb
    SQL.Strings = (
      'select * from abastecimentos')
    Left = 40
    Top = 88
    object FDQAbastecimentosID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQAbastecimentosDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
      EditMask = '00/00/0000;1; '
    end
    object FDQAbastecimentosBOMBA_ID: TIntegerField
      DisplayLabel = 'Id Bomba'
      FieldName = 'BOMBA_ID'
      Origin = 'BOMBA_ID'
      Required = True
    end
    object FDQAbastecimentosLITROS: TFMTBCDField
      DisplayLabel = 'Litros'
      FieldName = 'LITROS'
      Origin = 'LITROS'
      Required = True
      DisplayFormat = '###,###,##0.00 L'
      EditFormat = '###,###,##0.00 L'
      Precision = 18
      Size = 2
    end
    object FDQAbastecimentosVALOR_ABASTECIDO: TFMTBCDField
      DisplayLabel = 'Vlr Abastecido'
      FieldName = 'VALOR_ABASTECIDO'
      Origin = 'VALOR_ABASTECIDO'
      Required = True
      DisplayFormat = 'R$ ###,###,##0.00'
      EditFormat = 'R$ ###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object FDQAbastecimentosVALOR_IMPOSTO: TFMTBCDField
      DisplayLabel = 'Vlr Imposto'
      FieldName = 'VALOR_IMPOSTO'
      Origin = 'VALOR_IMPOSTO'
      Required = True
      DisplayFormat = 'R$ ###,###,##0.00'
      EditFormat = 'R$ ###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object FDQAbastecimentosBOMBA: TStringField
      DisplayLabel = 'Bomba'
      FieldKind = fkCalculated
      FieldName = 'BOMBA'
      Size = 30
      Calculated = True
    end
  end
  object FDQTanques: TFDQuery
    Connection = FDCControlAb
    SQL.Strings = (
      'select * from tanques')
    Left = 88
    Top = 88
    object FDQTanquesID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDQTanquesDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
  end
  object FDQBombas: TFDQuery
    Connection = FDCControlAb
    SQL.Strings = (
      'select * from bombas')
    Left = 136
    Top = 88
    object FDQBombasID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDQBombasDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object FDQBombasTANQUE_ID: TIntegerField
      DisplayLabel = 'Id Tanque'
      FieldName = 'TANQUE_ID'
      Origin = 'TANQUE_ID'
      Required = True
    end
  end
end
