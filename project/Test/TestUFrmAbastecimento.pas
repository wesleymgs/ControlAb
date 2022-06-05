unit TestUFrmAbastecimento;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, Vcl.Buttons, FireDAC.DApt.Intf, UFrmAbastecimento,
  FireDAC.Stan.Param, System.Classes, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.DatS,
  Vcl.Grids, UFrmBase, Vcl.Graphics, FireDAC.Comp.Client, Vcl.DBCtrls, Winapi.Windows,
  System.Variants, Winapi.Messages, Vcl.Dialogs, FireDAC.DApt, Vcl.Forms,
  System.SysUtils, Data.DB, Vcl.Controls, Vcl.Mask,
  FireDAC.Comp.DataSet, Vcl.DBGrids;

type
  // Test methods for class TFrmAbastecimento

  TestTFrmAbastecimento = class(TTestCase)
  strict private
    FFrmAbastecimento: TFrmAbastecimento;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalcularValorImposto;
  end;

implementation

procedure TestTFrmAbastecimento.SetUp;
begin
  FFrmAbastecimento := TFrmAbastecimento.Create(Nil);
end;

procedure TestTFrmAbastecimento.TearDown;
begin
  FFrmAbastecimento.Free;
  FFrmAbastecimento := nil;
end;

procedure TestTFrmAbastecimento.TestCalcularValorImposto;
var
  ReturnValue: Double;
  AnVlrAbastecido: Double;
begin
  AnVlrAbastecido := 100;

  ReturnValue := FFrmAbastecimento.CalcularValorImposto(AnVlrAbastecido);

  CheckEquals(13, ReturnValue, 'Falha ao testar a fun��o CalcularValorImposto!');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTFrmAbastecimento.Suite);
end.
