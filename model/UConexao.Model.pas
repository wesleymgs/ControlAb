unit UConexao.Model;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, UIConexao, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, UDM,
  Inifiles;

type
  TModelConexao = class(TInterfacedObject, IConexao)
  private
    FDriverID,
    FDatabase,
    FUser_Name,
    FPassword,
    FServer,
    FPort: String;

    procedure CarregarINI(AcDiretorioIni: String);
    function Conectar: IConexao;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IConexao;
  end;

implementation

{ TModelConexao }

procedure TModelConexao.CarregarINI(AcDiretorioIni: String);
var
  arquivoINI: TIniFile;
begin
  try
    arquivoINI := TIniFile.Create(AcDiretorioIni);

    FDriverID  := arquivoINI.ReadString('Conexao', 'DriverID',  '');
    FDatabase  := arquivoINI.ReadString('Conexao', 'Database',  '');
    FUser_Name := arquivoINI.ReadString('Conexao', 'User_Name', '');
    FPassword  := arquivoINI.ReadString('Conexao', 'Password',  '');
    FServer    := arquivoINI.ReadString('Conexao', 'Server',    '');
    FPort      := arquivoINI.ReadString('Conexao', 'Port',      '');
  finally
    arquivoINI.Free;
  end;
end;

function TModelConexao.Conectar: IConexao;
begin
  try
    DM.FDCControlAb.Connected := False;
    DM.FDCControlAb.Params.Values['DriverID'] := FDriverID;
    DM.FDCControlAb.Params.Values['Database'] := FDatabase;
    DM.FDCControlAb.Params.Values['UserName'] := FUser_Name;
    DM.FDCControlAb.Params.Values['Password'] := FPassword;
    DM.FDCControlAb.Params.Values['Server']   := FServer;
    DM.FDCControlAb.Params.Values['Port']     := FPort;
    DM.FDCControlAb.Connected := True;
  except
  on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao conectar com o Banco de Dados.'
                                   + #13 + #13 + 'Poss�veis causas do erro:'
                                   + #13 + '1. Verifique se o caminho da base de dados est� correto no arquivo de configura��o de conex�o.'
                                   + #13 + '2. Verifique se o servidor est� ligado.'
                                   + #13 + '3. Verifique se este computador e o servidor est�o conectados na mesma rede.'
                                   + #13 + '4. Verifique se a pasta do sistema est� compartilhada e com permiss�o de controle total para Listagem, Leitura e Grava��o.'
                                   + #13 + #13 + 'Mensagem padr�o: ' + E.Message), 'Aten��o', MB_ICONERROR + MB_OK);
      TerminateProcess(GetCurrentProcess, 0);
    end;
  end;
end;

constructor TModelConexao.Create;
begin
  const ArquivoINI = GetCurrentDir + '\config.ini';

  if (not FileExists(ArquivoINI)) then
    begin
      Application.MessageBox('N�o foi poss�vel localizar o arquivo de configura��es.', 'Aten��o', MB_ICONWARNING + MB_OK);
      TerminateProcess(GetCurrentProcess, 0);
    end;

  CarregarINI(ArquivoINI);
end;

destructor TModelConexao.Destroy;
begin

  inherited;
end;

class function TModelConexao.New: IConexao;
begin
  Result := Self.Create;
end;

end.
