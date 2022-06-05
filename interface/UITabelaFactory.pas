unit UITabelaFactory;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB;

type
  ITabelaFactory = interface
    ['{5D9EA984-E1E5-4AA8-842E-D3F6E4A36C99}']
    function GetTabela: TFDQuery;
    function GetFDConnection: TFDConnection;
    function TabelaAbastecimentos: ITabelaFactory;
    function TabelaTanques: ITabelaFactory;
    function TabelaBombas: ITabelaFactory;
  end;

implementation

end.
