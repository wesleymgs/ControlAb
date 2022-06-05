unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, Data.DB, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, uAutoFree;

type
  TDM = class(TDataModule)
    FDCControlAb: TFDConnection;
    FDTControlAb: TFDTransaction;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQAbastecimentos: TFDQuery;
    FDQAbastecimentosID: TIntegerField;
    FDQAbastecimentosDATA: TDateField;
    FDQAbastecimentosVALOR_ABASTECIDO: TFMTBCDField;
    FDQAbastecimentosVALOR_IMPOSTO: TFMTBCDField;
    FDQAbastecimentosLITROS: TFMTBCDField;
    FDQTanques: TFDQuery;
    FDQBombas: TFDQuery;
    FDQTanquesID: TIntegerField;
    FDQTanquesDESCRICAO: TStringField;
    FDQBombasID: TIntegerField;
    FDQBombasDESCRICAO: TStringField;
    FDQBombasTANQUE_ID: TIntegerField;
    FDQAbastecimentosBOMBA_ID: TIntegerField;
    FDQAbastecimentosBOMBA: TStringField;
    procedure FDQAbastecimentosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.FDQAbastecimentosCalcFields(DataSet: TDataSet);
var
  queryTemp: TFDQuery;
begin
  if (FDQAbastecimentosBOMBA_ID.AsString <> EmptyStr) then
    begin
      queryTemp            := TAutoFreeCreate.New(TFDQuery.Create(Nil)).GetInstance;
      queryTemp.Connection := FDCControlAb;

      queryTemp.Close;
      queryTemp.SQL.Clear;
      queryTemp.SQL.Add('SELECT DESCRICAO FROM BOMBAS WHERE ID = ' + FDQAbastecimentosBOMBA_ID.AsString);
      queryTemp.Open;

      if (queryTemp.RecordCount > 0) then
        FDQAbastecimentosBOMBA.AsString := queryTemp.FieldByName('DESCRICAO').AsString
      else FDQAbastecimentosBOMBA.AsString := EmptyStr;
    end;
end;

end.
