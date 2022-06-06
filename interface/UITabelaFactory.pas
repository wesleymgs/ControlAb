unit UITabelaFactory;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB, UIConexao;

type
  ITabelaFactory = interface
    ['{5D9EA984-E1E5-4AA8-842E-D3F6E4A36C99}']
    function GetTabela(AoQuery: TTipoFDQuery): TFDQuery;
    function GetFDConnection: TFDConnection;
  end;

  IModelTabelaFactory = interface
    ['{D2051DCD-A5FB-47AC-A113-6537AFAAC5E5}']
    function GetTabela: TFDQuery;
  end;

implementation

end.
