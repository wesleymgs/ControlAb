program ControlAbTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Vcl.Forms,
  TestUFrmAbastecimento in 'TestUFrmAbastecimento.pas',
  UFrmAbastecimento in '..\..\view\UFrmAbastecimento.pas',
  DUnitTestRunner,
  uAutoFree in '..\..\helper\uAutoFree.pas',
  UHelperMaskEdit in '..\..\helper\UHelperMaskEdit.pas',
  UConexao.Controller in '..\..\controller\UConexao.Controller.pas',
  UDM in '..\..\model\UDM.pas' {DM: TDataModule},
  UTipoTabela.Factory.Controller in '..\..\factory\UTipoTabela.Factory.Controller.pas',
  UIConexao in '..\..\interface\UIConexao.pas',
  UITabelaFactory in '..\..\interface\UITabelaFactory.pas',
  UFrmBase in '..\..\view\UFrmBase.pas' {FrmBase};

{$R *.res}

begin
  Application.CreateForm(TDM, DM);
  DUnitTestRunner.RunRegisteredTests;
end.

