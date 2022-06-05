program ControlAb;

uses
  Vcl.Forms,
  UFrmPrincipal in '..\view\UFrmPrincipal.pas' {FrmPrincipal},
  UDM in '..\model\UDM.pas' {DM: TDataModule},
  UIConexao in '..\interface\UIConexao.pas',
  UConexao.Model in '..\model\UConexao.Model.pas',
  UFrmAbastecimento in '..\view\UFrmAbastecimento.pas' {FrmAbastecimento},
  UConexao.Controller in '..\controller\UConexao.Controller.pas',
  UTipoTabela.Factory.Controller in '..\factory\UTipoTabela.Factory.Controller.pas',
  UITabelaFactory in '..\interface\UITabelaFactory.pas',
  UFrmTanquesCombustiveis in '..\view\UFrmTanquesCombustiveis.pas' {FrmTanquesCombustiveis},
  UFrmBase in '..\view\UFrmBase.pas' {FrmBase},
  UFrmBombasCombustiveis in '..\view\UFrmBombasCombustiveis.pas' {FrmBombasCombustiveis},
  uAutoFree in '..\helper\uAutoFree.pas',
  UFrmFiltroRptAbastecimentos in '..\view\UFrmFiltroRptAbastecimentos.pas' {FrmFiltroRptAbastecimentos},
  UHelperMaskEdit in '..\helper\UHelperMaskEdit.pas',
  URptAbastecimentos in '..\report\URptAbastecimentos.pas' {RptAbastecimentos};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
