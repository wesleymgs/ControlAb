unit UTipoTabela.Factory.Model;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB, UDM, UITabelaFactory, UIConexao;

type
  TModelTabelaFactory = class(TInterfacedObject, IModelTabelaFactory)
  private
    FTipoTabela: TTipoFDQuery;

    function GetTabela: TFDQuery;
    function ConsultarFDQuery(AoQuery: TFDQuery): TFDQuery;
    function TratarTabelas: String;
  public
    constructor Create(AoQuery: TTipoFDQuery);
    destructor Destroy; override;
    class function New(AoQuery: TTipoFDQuery): IModelTabelaFactory;
  end;

implementation

{ TModelTabelaFactory }

function TModelTabelaFactory.ConsultarFDQuery(AoQuery: TFDQuery): TFDQuery;
begin
  AoQuery.Close;
  AoQuery.SQL.Clear;
  AoQuery.SQL.Add('SELECT * FROM ' + TratarTabelas);
  AoQuery.Open;
  AoQuery.FetchAll;

  Result := AoQuery;
end;

constructor TModelTabelaFactory.Create(AoQuery: TTipoFDQuery);
begin
  FTipoTabela := AoQuery;
end;

destructor TModelTabelaFactory.Destroy;
begin

  inherited;
end;

function TModelTabelaFactory.GetTabela: TFDQuery;
begin
  case (FTipoTabela) of
    tFDQAbastecimentos: Result := ConsultarFDQuery(DM.FDQAbastecimentos);
    tFDQTanques:        Result := ConsultarFDQuery(DM.FDQTanques);
    tFDQBombas:         Result := ConsultarFDQuery(DM.FDQBombas);
  end;
end;

class function TModelTabelaFactory.New(AoQuery: TTipoFDQuery): IModelTabelaFactory;
begin
  Result := Self.Create(AoQuery);
end;

function TModelTabelaFactory.TratarTabelas: String;
begin
  case (FTipoTabela) of
    tFDQAbastecimentos: Result := 'ABASTECIMENTOS ORDER BY DATA DESC';
    tFDQTanques:        Result := 'TANQUES';
    tFDQBombas:         Result := 'BOMBAS';
  end;
end;

end.
