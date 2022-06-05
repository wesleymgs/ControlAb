unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Menus, Inifiles, UConexao.Model,
  UFrmAbastecimento, UFrmTanquesCombustiveis, UFrmBombasCombustiveis,
  UFrmFiltroRptAbastecimentos;

type
  TFrmPrincipal = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Abastecimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    Abastecimentos2: TMenuItem;
    anques1: TMenuItem;
    CadastrarBomba1: TMenuItem;
    CadastrarTanque1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Abastecimentos1Click(Sender: TObject);
    procedure CadastrarTanque1Click(Sender: TObject);
    procedure CadastrarBomba1Click(Sender: TObject);
    procedure Abastecimentos2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.Abastecimentos1Click(Sender: TObject);
begin
  TFrmAbastecimento
    .New;
end;

procedure TFrmPrincipal.Abastecimentos2Click(Sender: TObject);
begin
  TFrmFiltroRptAbastecimentos
    .New;
end;

procedure TFrmPrincipal.CadastrarBomba1Click(Sender: TObject);
begin
  TFrmBombasCombustiveis
    .New;
end;

procedure TFrmPrincipal.CadastrarTanque1Click(Sender: TObject);
begin
  TFrmTanquesCombustiveis
    .New;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TerminateProcess(GetCurrentProcess, 0);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  TModelConexao
    .New
    .Conectar;
end;

end.
