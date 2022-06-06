object FrmFiltroRptAbastecimentos: TFrmFiltroRptAbastecimentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 201
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 337
    Height = 144
    Caption = ' Filtro '
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 115
      Top = 24
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label3: TLabel
      Left = 16
      Top = 80
      Width = 36
      Height = 13
      Caption = 'Tanque'
    end
    object Label4: TLabel
      Left = 173
      Top = 80
      Width = 32
      Height = 13
      Caption = 'Bomba'
    end
    object Label5: TLabel
      Left = 7
      Top = 123
      Width = 323
      Height = 13
      Caption = 
        'Pressione Ctrl + Del dentro dos campos acima para limpar a sele'#231 +
        #227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object MEDataInicial: TMaskEdit
      Left = 16
      Top = 40
      Width = 88
      Height = 21
      EditMask = '00/00/0000;1; '
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MEDataFinal: TMaskEdit
      Left = 115
      Top = 40
      Width = 88
      Height = 21
      EditMask = '00/00/0000;1; '
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object DBLkpTanque: TDBLookupComboBox
      Left = 16
      Top = 96
      Width = 145
      Height = 21
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = DSTanque
      NullValueKey = 16430
      TabOrder = 2
      OnExit = DBLkpTanqueExit
    end
    object DBLkpBomba: TDBLookupComboBox
      Left = 173
      Top = 96
      Width = 145
      Height = 21
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = DSBomba
      TabOrder = 3
    end
  end
  object BitBtn1: TBitBtn
    Left = 232
    Top = 160
    Width = 113
    Height = 33
    Caption = 'Gerar relat'#243'rio'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFC89561CA9865CA9765CA9765CA9765CA9764C99764C99764CA9865C894
      61FFFFFFFFFFFFFFFFFF6363635D5D5D585858C79561F9F7F6F9F1ECF9F1EBF8
      F0E9F7EDE6F4EAE1F2E8DEFAF8F6C794612424242323232323236A6A6AA7A7A7
      B5B5B5818181AFACAAC5C0BDC5C0BDC5C0BDC5C0BDC5C0BDC5C0BDADAAA82C2C
      2CB5B5B59B9B9B232323707070B5B5B5B5B5B59595958181818181817979796E
      6E6E6161615252524343434242426E6E6EB5B5B5B5B5B5252525757575BBBBBB
      BBBBBB8D8D8DD4D4D4B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9D3D3D38383
      83BBBBBBBBBBBB2A2A2A7A7A7AD7D7D7D7D7D7979797D8D8D8BFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFD7D7D78E8E8ED7D7D7D7D7D73F3F3F7E7E7EF9F9F9
      F9F9F9ABABABDFDFDFCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBDFDFDFA3A3
      A3F9F9F9F9F9F9616161818181FCFCFCFCFCFCCBCBCBF2F2F2F2F2F2F2F2F2F2
      F2F2F2F2F2F2F2F2F2F2F2F2F2F2C6C6C6FCFCFCFCFCFC707070818181D2D2D2
      E8E8E87D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D
      7DE8E8E8C4C4C45656568181819A9A9ACCCCCCC78B4EF9F4EDFEE8D8FEE8D7FD
      E5D3FCE4D1FAE0C7F9DDC3FAF4EDC7854AC3C3C3747474474747FFFFFF818181
      818181C5894CF9F4EFFEE7D7FDE7D5FCE6D2FBE1CCF8DCC2F6DABDFAF4EFC483
      48595959535353FFFFFFFFFFFFFFFFFF818181C5894BF9F4F0FCE6D3FDE7D3FB
      E3CDFAE0C8F5D6BBF3D4B5F8F4F0C38246606060FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC6894BF9F5F1FCE3CFFCE4CFFAE1CAF9DDC4F4E9DFF7F2ECF5EFE9C27E
      45FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6894CF9F5F1FCE3CDFBE3CDF9
      E0C8F8DCC2FDFBF8FCE6CDE2B684BF7942FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC48649F7F2ECF8F4EEF8F3EDF8F3EDF8F2ECF2E6D7E2B27DDA9163B46B
      3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC17D44C88B4DC88C4FC88C4FC8
      8D4FC98C4FC5894CC4763BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object DSTanque: TDataSource
    Left = 256
    Top = 24
  end
  object DSBomba: TDataSource
    Left = 304
    Top = 24
  end
end
