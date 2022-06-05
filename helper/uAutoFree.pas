unit uAutoFree;

interface

type
  IAutoFreeCreate = interface
    ['{3E88C11D-C3C7-47F3-84E8-35723D215DDE}']
    function GetInstance: Pointer;
    property Instance: Pointer read GetInstance;
  end;

  TAutoFreeCreate = class(TInterfacedObject, IAutoFreeCreate)
  private
    FInstance: TObject;
    function GetInstance: Pointer;
  public
    constructor Create(AInstance: TObject);
    destructor Destroy; override;
    class function New(AInstance: TObject): IAutoFreeCreate;
  end;

implementation
uses
  SysUtils;

constructor TAutoFreeCreate.Create(AInstance: TObject);
begin
  inherited Create;
  FInstance := AInstance;
end;

destructor TAutoFreeCreate.Destroy;
begin
  try
    SysUtils.FreeAndNil(FInstance);
  except
    On E: Exception do
      if (Pos('iola', E.Message) = 0) then
        raise;
  end;
  inherited;
end;

function TAutoFreeCreate.GetInstance: Pointer;
begin
  Result := FInstance;
end;

class function TAutoFreeCreate.New(AInstance: TObject): IAutoFreeCreate;
begin
  Result := TAutoFreeCreate.Create(AInstance);
end;

end.

