library Textos;

uses
  SysUtils,
  Classes;

{$R *.res}

procedure TrocaLetras(Texto: PAnsiChar; Letra1, Letra2:Char); //stdcall;
var
  i: Integer;
begin
  if Length(Texto) = 0 then
    Exit;
  for i := 0 to Length(Texto)-1 do
    if Texto[i] = Letra1 then
      Texto[i] := Letra2;
end;

exports
  TrocaLetras;

begin
end.
 