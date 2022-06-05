unit UTipoTabela.Factory.Controller;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Data.DB, UDM, UITabelaFactory;

type
  TTabelaFactory = class(TInterfacedObject, ITabelaFactory)
  private
    FDQTabela: TFDQuery;

    function GetTabela: TFDQuery;
    function GetFDConnection: TFDConnection;
    function TabelaAbastecimentos: ITabelaFactory;
    function TabelaTanques: ITabelaFactory;
    function TabelaBombas: ITabelaFactory;
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

function TTabelaFactory.GetTabela: TFDQuery;
begin
  Result := FDQTabela;
end;

class function TTabelaFactory.New: ITabelaFactory;
begin
  Result := Self.Create;
end;

function TTabelaFactory.TabelaAbastecimentos: ITabelaFactory;
begin
  Result := Self;
  FDQTabela := DM.FDQAbastecimentos;
end;

function TTabelaFactory.TabelaBombas: ITabelaFactory;
begin
  Result := Self;
  FDQTabela := DM.FDQBombas;
end;

function TTabelaFactory.TabelaTanques: ITabelaFactory;
begin
  Result := Self;
  FDQTabela := DM.FDQTanques;
end;

end.
