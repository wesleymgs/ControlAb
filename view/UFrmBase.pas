unit UFrmBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, UConexao.Controller, UIConexao,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TFrmBase = class(TForm)
    PnlBotoes: TPanel;
    SBNovo: TBitBtn;
    SBSalvar: TBitBtn;
    SBEditar: TBitBtn;
    SBCancelar: TBitBtn;
    SBExcluir: TBitBtn;
    DSBase: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure HabilitarCampos;
    procedure DesabilitarCampos;
    procedure DSBaseStateChange(Sender: TObject);
    procedure SBNovoClick(Sender: TObject);
    procedure SBSalvarClick(Sender: TObject);
    procedure SBEditarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDConnection: TFDConnection;
  public
    { Public declarations }
  end;

var
  FrmBase: TFrmBase;

implementation

{$R *.dfm}

procedure TFrmBase.DesabilitarCampos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i] is TDBEdit) then
        begin
          if (TDBEdit(Components[i]).Tag = 0) then
            TDBEdit(Components[i]).Enabled := False;
        end;
      if (Components[i] is TEdit) then
        begin
          if (TEdit(Components[i]).Tag = 0) then
            TEdit(Components[i]).Enabled := False;
        end;
      if (Components[i] is TCombobox) then
        begin
          if (TCombobox(Components[i]).Tag = 0) then
            TCombobox(Components[i]).Enabled := False;
        end;
      if (Components[i] is  TGroupBox) then
        begin
          if (TGroupBox(Components[i]).Tag = 0) then
            TGroupBox(Components[i]).Enabled := False;
        end;
    end;
end;

procedure TFrmBase.DSBaseStateChange(Sender: TObject);
begin
  if (DSbase.State in [dsEdit, dsInsert])then
    begin
      SBNovo.Enabled     := False;
      SBExcluir.Enabled  := False;
      SBEditar.Enabled   := False;
      SBSalvar.Enabled   := True;
      SBCancelar.Enabled := True;
      HabilitarCampos;
    end
  else
    begin
      SBNovo.Enabled     := True;
      SBExcluir.Enabled  := True;
      SBEditar.Enabled   := True;
      SBSalvar.Enabled   := False;
      SBCancelar.Enabled := False;
      DesabilitarCampos;
    end;
end;

procedure TFrmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFrmBase.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (DSBase.State in [dsInsert, dsEdit]) then
    CanClose := Application.MessageBox('O formulário encontra-se em estado de Inserção/Edição.'#13'Deseja fechar a janela ?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES;
end;

procedure TFrmBase.FormCreate(Sender: TObject);
begin
  FDConnection   := TControllerConexao
                      .New
                      .GetFDConnection;
end;

procedure TFrmBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFrmBase.HabilitarCampos;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    begin
      if (Components[i] is TDBEdit) then
        TDBEdit(Components[i]).Enabled := True;
      if (Components[i] is TEdit) then
        TEdit(Components[i]).Enabled := True;
      if (Components[i] is TCombobox) then
        TCombobox(Components[i]).Enabled := True;
      if (Components[i] is  TGroupBox) then
        TGroupBox(Components[i]).Enabled := True;
    end;
end;

procedure TFrmBase.SBCancelarClick(Sender: TObject);
begin
  DSBase.DataSet.Cancel;
  FDConnection.Rollback;
end;

procedure TFrmBase.SBEditarClick(Sender: TObject);
begin
  if (DSBase.DataSet.RecordCount > 0) then
    begin
      FDConnection.StartTransaction;
      DSBase.DataSet.Edit;
    end
  else Application.MessageBox('Não existem registros para edição.', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
end;

procedure TFrmBase.SBExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Tem certeza que deseja excluir o registro?', 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_YES then
    begin
      if (DSBase.DataSet.RecordCount > 0) then
        begin
          FDConnection.StartTransaction;
          DSBase.DataSet.Delete;
          FDConnection.Commit;
        end
      else Application.MessageBox('Não existem registros para exclusão.', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
end;

procedure TFrmBase.SBNovoClick(Sender: TObject);
begin
  FDConnection.StartTransaction;
  DSBase.DataSet.Append;
end;

procedure TFrmBase.SBSalvarClick(Sender: TObject);
begin
  DSBase.DataSet.Post;
  FDConnection.Commit;
end;

end.
