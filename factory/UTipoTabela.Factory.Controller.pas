unit UTipoTabela.Factory.Controller;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB, UDM, UITabelaFactory, UIConexao, UTipoTabela.Factory.Model;

type
  TTabelaFactory = class(TInterfacedObject, ITabelaFactory)
  private
    FTipoTabela: TTipoFDQuery;

    function GetTabela(AoQuery: TTipoFDQuery): TFDQuery;
    function GetFDConnection: TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: ITabelaFactory;
  end;

implementation

{ TTabelaFactory }

constructor TTabelaFactory.Create;
begin

end;

destructor TTabelaFactory.Destroy;
begin

  inherited;
end;

function TTabelaFactory.GetFDConnection: TFDConnection;
begin
  Result := DM.FDCControlAb;
end;

function TTabelaFactory.GetTabela(AoQuery: TTipoFDQuery): TFDQuery;
begin
  Result := TModelTabelaFactory.New(AoQuery).GetTabela;
end;

class function TTabelaFactory.New: ITabelaFactory;
begin
  Result := Self.Create;
end;

end.
