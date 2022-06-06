unit UFrmFiltroRptAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, UConexao.Controller, UIConexao,
  UHelperMaskEdit, URptAbastecimentos, Vcl.DBCtrls, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TFrmFiltroRptAbastecimentos = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    MEDataInicial: TMaskEdit;
    Label2: TLabel;
    MEDataFinal: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    DBLkpTanque: TDBLookupComboBox;
    DBLkpBomba: TDBLookupComboBox;
    DSTanque: TDataSource;
    DSBomba: TDataSource;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    function ValidarFiltrosForm: Boolean;
    function ConsultarDados: String;
    function PegarFiltros: String;
    procedure GerarRelatorio;
    procedure DBLkpTanqueExit(Sender: TObject);
  private
    { Private declarations }
    FControllerConexao: IConexaoController;

    procedure ExibirForm;
  public
    { Public declarations }
    class function New: TFrmFiltroRptAbastecimentos;
  end;

var
  FrmFiltroRptAbastecimentos: TFrmFiltroRptAbastecimentos;

implementation

{$R *.dfm}

{ TFrmFiltroRptAbastecimentos }

procedure TFrmFiltroRptAbastecimentos.BitBtn1Click(Sender: TObject);
begin
  if (ValidarFiltrosForm) then
    GerarRelatorio;
end;

function TFrmFiltroRptAbastecimentos.ConsultarDados: String;
begin
  Result := ' SELECT AB.DATA, AB.LITROS, AB.VALOR_ABASTECIDO, AB.VALOR_IMPOSTO, B.DESCRICAO BOMBA, T.DESCRICAO TANQUE ' +
  ' FROM ABASTECIMENTOS AB ' +
  ' INNER JOIN BOMBAS B ON B.ID = AB.BOMBA_ID ' +
  ' INNER JOIN TANQUES T ON T.ID = B.TANQUE_ID ' +
  PegarFiltros +
  ' GROUP BY AB.DATA, AB.LITROS, AB.VALOR_ABASTECIDO, AB.VALOR_IMPOSTO, B.DESCRICAO, T.DESCRICAO ' +
  ' ORDER BY DATA ';
end;

procedure TFrmFiltroRptAbastecimentos.DBLkpTanqueExit(Sender: TObject);
begin
  if (DBLkpTanque.KeyValue <> Null) then
    begin
      DBLkpBomba.KeyValue := Null;
      TFDQuery(DSBomba.DataSet).Close;
      TFDQuery(DSBomba.DataSet).SQL.Clear;
      TFDQuery(DSBomba.DataSet).SQL.Add('SELECT * FROM BOMBAS WHERE TANQUE_ID = ' + DSTanque.DataSet.FieldByName('ID').AsString);
      TFDQuery(DSBomba.DataSet).Open;
      TFDQuery(DSBomba.DataSet).FetchAll;
    end
  else
    begin
      TFDQuery(DSBomba.DataSet).Close;
      TFDQuery(DSBomba.DataSet).SQL.Clear;
      TFDQuery(DSBomba.DataSet).SQL.Add('SELECT * FROM BOMBAS');
      TFDQuery(DSBomba.DataSet).Open;
      TFDQuery(DSBomba.DataSet).FetchAll;
    end;
end;

procedure TFrmFiltroRptAbastecimentos.ExibirForm;
begin
  FControllerConexao := TControllerConexao.New;

  DSTanque.DataSet  := FControllerConexao
                         .SetFDQuery(tFDQTanques)
                         .GetTipoFDQuery;

  DSBomba.DataSet := FControllerConexao
                      .SetFDQuery(tFDQBombas)
                      .GetTipoFDQuery;

  Self.ShowModal;
end;

procedure TFrmFiltroRptAbastecimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFrmFiltroRptAbastecimentos.GerarRelatorio;
begin
  TRptAbastecimentos
    .New(ConsultarDados);
end;

class function TFrmFiltroRptAbastecimentos.New: TFrmFiltroRptAbastecimentos;
begin
  Result := Self.Create(FrmFiltroRptAbastecimentos);
  if (not Assigned(FrmFiltroRptAbastecimentos)) then
    Application.CreateForm(TFrmFiltroRptAbastecimentos, FrmFiltroRptAbastecimentos);
  FrmFiltroRptAbastecimentos.ExibirForm;

  if (Assigned(FrmFiltroRptAbastecimentos)) then
    FreeAndNil(FrmFiltroRptAbastecimentos);
end;

function TFrmFiltroRptAbastecimentos.PegarFiltros: String;
begin
  Result := ' WHERE 1 = 1 ';

  if (MEDataInicial.Text <> '  /  /    ') then
    Result := Result + ' AND DATA >= ''' + FormatDateTime('DD.MM.YYYY', StrToDate(MEDataInicial.Text)) + '''';

  if (MEDataFinal.Text <> '  /  /    ') then
    Result := Result + ' AND DATA <= ''' + FormatDateTime('DD.MM.YYYY', StrToDate(MEDataFinal.Text)) + '''';

  if (DBLkpTanque.KeyValue <> Null) then
    Result := Result + ' AND T.ID = ' + DSTanque.DataSet.FieldByName('ID').AsString;

  if (DBLkpBomba.KeyValue <> Null) then
    Result := Result + ' AND B.ID = ' + DSBomba.DataSet.FieldByName('ID').AsString;
end;

function TFrmFiltroRptAbastecimentos.ValidarFiltrosForm: Boolean;
begin
  Result := True;

  if (MEDataInicial.Text = '  /  /    ') and
     (MEDataFinal.Text <> '  /  /    ') then
    begin
      Application.MessageBox('Se a Data Final for informada, a Data Inicial também precisa ser informada.', 'Atenção', MB_ICONINFORMATION + MB_OK);
      Result := False;
    end;

  if ((MEDataInicial.Text <> '  /  /    ') and (MEDataFinal.Text <> '  /  /    ') and
      (StrToDate(MEDataInicial.Text) > StrToDate(MEDataFinal.Text))) then
    begin
      Application.MessageBox('A Data Final não pode ser menor que a Data Inicial.', 'Atenção', MB_ICONINFORMATION + MB_OK);
      Result := False;
    end;
end;

end.
