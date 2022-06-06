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

implementation

end.
