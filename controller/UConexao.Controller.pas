unit UConexao.Controller;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB, UIConexao, UTipoTabela.Factory.Controller;

type
  TControllerConexao = class(TInterfacedObject, IConexaoController)
  private
    FTipoQuery: TFDQuery;

    function SetFDQuery(AoQuery: TTipoFDQuery): IConexaoController;
    function GetTipoFDQuery: TFDQuery;
    function GetFDConnection: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IConexaoController;
  end;

implementation

{ TControllerConexao }

constructor TControllerConexao.Create;
begin

end;

destructor TControllerConexao.Destroy;
begin

  inherited;
end;

function TControllerConexao.GetFDConnection: TFDConnection;
begin
  Result := TTabelaFactory.New.GetFDConnection;
end;

function TControllerConexao.GetTipoFDQuery: TFDQuery;
begin
  Result := FTipoQuery;
end;

class function TControllerConexao.New: IConexaoController;
begin
  Result := Self.Create;
end;

function TControllerConexao.SetFDQuery(AoQuery: TTipoFDQuery): IConexaoController;
begin
  Result := Self;
  case (AoQuery) of
    tFDQAbastecimentos: FTipoQuery := TTabelaFactory.New.TabelaAbastecimentos.GetTabela;
    tFDQTanques:        FTipoQuery := TTabelaFactory.New.TabelaTanques.GetTabela;
    tFDQBombas:         FTipoQuery := TTabelaFactory.New.TabelaBombas.GetTabela;
  end;
end;

end.
