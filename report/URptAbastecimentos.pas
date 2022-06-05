unit URptAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UConexao.Controller;

type
  TRptAbastecimentos = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel22: TRLLabel;
    RLLDtHora: TRLLabel;
    RLSysData: TRLSystemInfo;
    RLSysHora: TRLSystemInfo;
    RLLabel39: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel38: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLLabel1: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText4: TRLDBText;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel6: TRLLabel;
    FDQRpt: TFDQuery;
    DSRpt: TDataSource;
    RLLabel9: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBResult3: TRLDBResult;
    RLLabel8: TRLLabel;
    RLLabel14: TRLLabel;
    RLLTotPerValor: TRLLabel;
    RLLTotPerImposto: TRLLabel;
    RLLabel15: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel16: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLLabel17: TRLLabel;
    RLLTotPerLitros: TRLLabel;
    RLLabel18: TRLLabel;
    procedure RLDBResult1Compute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
    procedure RLDBResult3Compute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDBResult2Compute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
  private
    { Private declarations }
    FTotPerValor, FTotPerImposto, FTotPerLitros: Double;

    procedure ExibirRelatorio(AcSQL: String);
  public
    { Public declarations }
    class function New(AcSQL: String): TRptAbastecimentos;
  end;

var
  RptAbastecimentos: TRptAbastecimentos;

implementation

{$R *.dfm}

{ TRptAbastecimentos }

procedure TRptAbastecimentos.ExibirRelatorio(AcSQL: String);
begin
  FDQRpt.Connection := TControllerConexao
                         .New
                         .GetFDConnection;
  FDQRpt.Close;
  FDQRpt.SQL.Clear;
  FDQRpt.SQL.Add(AcSQL);
  FDQRpt.Open;

  TFloatField(FDQRpt.Fields[1]).DisplayFormat := '0.00 L';
  TFloatField(FDQRpt.Fields[1]).EditFormat    := '0.00 L';
  TFloatField(FDQRpt.Fields[2]).DisplayFormat := 'R$ ,0.00';
  TFloatField(FDQRpt.Fields[2]).EditFormat    := 'R$ ,0.00';
  TFloatField(FDQRpt.Fields[3]).DisplayFormat := 'R$ ,0.00';
  TFloatField(FDQRpt.Fields[3]).EditFormat    := 'R$ ,0.00';

  FTotPerValor   := 0;
  FTotPerImposto := 0;
  FTotPerLitros  := 0;

  RLReport1.Preview();
end;

class function TRptAbastecimentos.New(AcSQL: String): TRptAbastecimentos;
begin
  Result := Self.Create(RptAbastecimentos);
  if (not Assigned(RptAbastecimentos)) then
    Application.CreateForm(TRptAbastecimentos, RptAbastecimentos);
  RptAbastecimentos.ExibirRelatorio(AcSQL);

  if Assigned(RptAbastecimentos) then
    FreeAndNil(RptAbastecimentos);
end;

procedure TRptAbastecimentos.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  FTotPerValor   := FTotPerValor   + FDQRpt.FieldByName('VALOR_ABASTECIDO').AsCurrency;
  FTotPerImposto := FTotPerImposto + FDQRpt.FieldByName('VALOR_IMPOSTO').AsCurrency;
  FTotPerLitros  := FTotPerLitros  + FDQRpt.FieldByName('LITROS').AsCurrency;
end;

procedure TRptAbastecimentos.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLTotPerValor.Caption   := FormatFloat('R$ ,0.00', FTotPerValor);
  RLLTotPerImposto.Caption := FormatFloat('R$ ,0.00', FTotPerImposto);
  RLLTotPerLitros.Caption  := FormatFloat('0.00 L',   FTotPerLitros);
end;

procedure TRptAbastecimentos.RLDBResult1Compute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
  Value := FDQRpt.FieldByName('VALOR_ABASTECIDO').AsCurrency;
end;

procedure TRptAbastecimentos.RLDBResult2Compute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
  Value := FDQRpt.FieldByName('LITROS').AsCurrency;
end;

procedure TRptAbastecimentos.RLDBResult3Compute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
  Value := FDQRpt.FieldByName('VALOR_IMPOSTO').AsCurrency;
end;

end.
