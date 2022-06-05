unit UHelperMaskEdit;

interface

uses
  Vcl.Mask, System.MaskUtils;

type
  TMaskEdit = class (Vcl.Mask.TMaskEdit)
    function GetMask: String;
    function Validate(const Value: String; var Pos: Integer): Boolean; Override;
end;

implementation

uses
  Winapi.Windows, Winapi.Messages, Vcl.Dialogs, System.SysUtils, Vcl.Forms;

function TMaskEdit.GetMask: String;
var
  MaskOffset: Integer;
  CType: TMaskCharType;
  FMaskBlank:Char;
  Mask:String;
begin
  FMaskBlank := MaskGetMaskBlank(Self.EditMask);
  for MaskOffset := 1 to Length(Editmask) do
    begin
      CType := MaskGetCharType(EditMask, MaskOffset);
      case CType of
        mcLiteral, mcIntlLiteral: Mask := Mask + EditMask[MaskOffset];
        mcMaskOpt, mcMask:        Mask := Mask + FMaskBlank;
      end;
    end;
  Result := Mask;
end;

function TMaskEdit.Validate(const Value: String; var Pos: Integer): Boolean;
var
  CType: TMaskCharType;
  Offset, MaskOffset: Integer;
  FMaskBlank: Char;
  Mask: String;
begin
  Result := True;
  Offset := 1;
  Mask   := GetMask;
  if (Value = Mask) then
    Exit;

  Offset := 1;
  for MaskOffset := 1 to Length(EditMask) do
    begin
      FMaskBlank := MaskGetMaskBlank(Self.EditMask);
      CType      := MaskGetCharType(EditMask, MaskOffset);

      if (CType in [mcLiteral, mcIntlLiteral, mcMaskOpt]) then
        Inc(Offset)
      else
      if (CType = mcMask) and (Value <> '') then
        begin
          if (Value [Offset] = FMaskBlank) or
            ((Value [Offset] = ' ') and (EditMask[MaskOffset] <> mMskAscii)) then
            begin
              Result := False;
              Pos    := Offset - 1;
              if (Mask = '   .   .   -  ') then
                Application.MessageBox('O formato do CPF informado é inválido.', 'Atenção', MB_ICONINFORMATION + MB_OK);
              if (Mask = '  /  /    ') then
                Application.MessageBox('O formato da data informada é inválida.', 'Atenção', MB_ICONINFORMATION + MB_OK);
              if (Mask = '  .   .   /    -  ') then
                Application.MessageBox('O formato do CNPJ informado é inválido.', 'Atenção', MB_ICONINFORMATION + MB_OK);
              Self.SetFocus;
              Abort;
            end;
          Inc(Offset);
        end;
    end;
end;
end.
