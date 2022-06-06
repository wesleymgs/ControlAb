unit UFrmTanquesCombustiveis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons, UConexao.Controller, UIConexao,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, UFrmBase;

type
  TFrmTanquesCombustiveis = class(TFrmBase)
    GBoxDados: TGroupBox;
    Label4: TLabel;
    DBEDescricao: TDBEdit;
    GBoxVisualizacao: TGroupBox;
    DBGrid1: TDBGrid;
    procedure SBNovoClick(Sender: TObject);
    procedure SBEditarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExibirForm;
  public
    { Public declarations }
    class function New: TFrmTanquesCombustiveis;
  end;

var
  FrmTanquesCombustiveis: TFrmTanquesCombustiveis;

implementation

{$R *.dfm}

procedure TFrmTanquesCombustiveis.ExibirForm;
begin
  DSBase.DataSet := TControllerConexao
                             .New
                             .SetFDQuery(tFDQTanques)
                             .GetTipoFDQuery;

  Self.ShowModal;
end;

class function TFrmTanquesCombustiveis.New: TFrmTanquesCombustiveis;
begin
  Result := Self.Create(FrmTanquesCombustiveis);
  if (not Assigned(FrmTanquesCombustiveis)) then
    Application.CreateForm(TFrmTanquesCombustiveis, FrmTanquesCombustiveis);
  FrmTanquesCombustiveis.ExibirForm;

  if (Assigned(FrmTanquesCombustiveis)) then
    FreeAndNil(FrmTanquesCombustiveis);
end;

procedure TFrmTanquesCombustiveis.SBEditarClick(Sender: TObject);
begin
  inherited;
  if (DSBase.DataSet.RecordCount > 0) then
    DBEDescricao.SetFocus;
end;

procedure TFrmTanquesCombustiveis.SBNovoClick(Sender: TObject);
begin
  inherited;
  DBEDescricao.SetFocus;
end;

end.
