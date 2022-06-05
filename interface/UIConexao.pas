unit UIConexao;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB;

type
  TTipoFDQuery  = (tFDQAbastecimentos, tFDQTanques, tFDQBombas);

  IConexao = interface
    ['{BFF4D6BF-E976-436D-8A8E-F6B70AF8B6D9}']
    function Conectar: IConexao;
  end;

  IConexaoController = interface
    ['{B47CBB19-3AEE-48A1-952F-7ED9AC6E159F}']
    function SetFDQuery(AoQuery: TTipoFDQuery): IConexaoController;
    function GetTipoFDQuery: TFDQuery;
    function GetFDConnection: TFDConnection;
  end;

implementation

end.
