unit UFrmBombasCombustiveis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmBase, Data.DB, Vcl.StdCtrls, UConexao.Controller, UIConexao,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TFrmBombasCombustiveis = class(TFrmBase)
    GBoxDados: TGroupBox;
    Label4: TLabel;
    GBoxVisualizacao: TGroupBox;
    Label1: TLabel;
    DBLkpTanque: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    DBEDescricao: TDBEdit;
    DSTanque: TDataSource;
    procedure SBNovoClick(Sender: TObject);
    procedure SBEditarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerConexao: IConexaoController;

    procedure ExibirForm;
  public
    { Public declarations }
    class function New: TFrmBombasCombustiveis;
  end;

var
  FrmBombasCombustiveis: TFrmBombasCombustiveis;

implementation

{$R *.dfm}

procedure TFrmBombasCombustiveis.ExibirForm;
begin
  FControllerConexao := TControllerConexao.New;

  DSBase.DataSet   := FControllerConexao
                      .SetFDQuery(tFDQBombas)
                      .GetTipoFDQuery;

  DSTanque.DataSet := FControllerConexao
                      .SetFDQuery(tFDQTanques)
                      .GetTipoFDQuery;


  Self.ShowModal;
end;

class function TFrmBombasCombustiveis.New: TFrmBombasCombustiveis;
begin
  Result := Self.Create(FrmBombasCombustiveis);
  if (not Assigned(FrmBombasCombustiveis)) then
    Application.CreateForm(TFrmBombasCombustiveis, FrmBombasCombustiveis);
  FrmBombasCombustiveis.ExibirForm;

  if (Assigned(FrmBombasCombustiveis)) then
    FreeAndNil(FrmBombasCombustiveis);
end;

procedure TFrmBombasCombustiveis.SBEditarClick(Sender: TObject);
begin
  inherited;
  if (DSBase.DataSet.RecordCount > 0) then
    DBEDescricao.SetFocus;
end;

procedure TFrmBombasCombustiveis.SBNovoClick(Sender: TObject);
begin
  inherited;
  DBEDescricao.SetFocus;
end;

end.
