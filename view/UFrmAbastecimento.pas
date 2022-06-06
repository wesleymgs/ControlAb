unit UFrmAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, UConexao.Controller, UIConexao,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, UHelperMaskEdit,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, UFrmBase;

type
  TFrmAbastecimento = class(TFrmBase)
    GBoxDados: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBELitros: TDBEdit;
    Label3: TLabel;
    DBEValor: TDBEdit;
    Label4: TLabel;
    DBEData: TDBEdit;
    Label5: TLabel;
    DBEImposto: TDBEdit;
    GBoxVisualizacao: TGroupBox;
    DBGrid1: TDBGrid;
    DBLkpBomba: TDBLookupComboBox;
    DSBomba: TDataSource;
    procedure DBEValorExit(Sender: TObject);
    function CalcularValorImposto(AnVlrAbastecido: Double): Double;
    procedure SBNovoClick(Sender: TObject);
    procedure SBEditarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerConexao: IConexaoController;

    procedure ExibirForm;
  public
    { Public declarations }
    class function New: TFrmAbastecimento;
  end;

var
  FrmAbastecimento: TFrmAbastecimento;

implementation

{$R *.dfm}

function TFrmAbastecimento.CalcularValorImposto(AnVlrAbastecido: Double): Double;
begin
  if (FloatToStr(AnVlrAbastecido) <> EmptyStr) then
    Result := (AnVlrAbastecido * (13 / 100))
  else Result := 0;
end;

procedure TFrmAbastecimento.DBEValorExit(Sender: TObject);
begin
  TFDQuery(DSBase.DataSet).FieldByName('VALOR_IMPOSTO').Value := CalcularValorImposto(TFDQuery(DSBase.DataSet).FieldByName('VALOR_ABASTECIDO').Value);
end;

procedure TFrmAbastecimento.ExibirForm;
begin
  FControllerConexao := TControllerConexao.New;

  DSBase.DataSet  := FControllerConexao
                       .SetFDQuery(tFDQAbastecimentos)
                       .GetTipoFDQuery;

  DSBomba.DataSet := FControllerConexao
                      .SetFDQuery(tFDQBombas)
                      .GetTipoFDQuery;


  Self.ShowModal;
end;

class function TFrmAbastecimento.New: TFrmAbastecimento;
begin
  Result := Self.Create(FrmAbastecimento);
  if (not Assigned(FrmAbastecimento)) then
    Application.CreateForm(TFrmAbastecimento, FrmAbastecimento);
  FrmAbastecimento.ExibirForm;

  if (Assigned(FrmAbastecimento)) then
    FreeAndNil(FrmAbastecimento);
end;

procedure TFrmAbastecimento.SBEditarClick(Sender: TObject);
begin
  inherited;
  if (DSBase.DataSet.RecordCount > 0) then
    DBEData.SetFocus;
end;

procedure TFrmAbastecimento.SBNovoClick(Sender: TObject);
begin
  inherited;
  DBEData.SetFocus;
end;

end.
