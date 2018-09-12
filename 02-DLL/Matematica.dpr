library Matematica;

uses
  SysUtils,
  Classes;

{$R *.res}

function Soma(X, Y: Real): Real; //stdcall;
begin
  Soma := X+Y;
end;

function Subtrai(X, Y: Real): Real; //stdcall;
begin
  Subtrai := X-Y;
end;

function Multiplica(X, Y: Real): Real; //stdcall;
begin
  Multiplica := X*Y;
end;

function Divide(X, Y: Real): Real; //stdcall;
begin
  Divide := X/Y;
end;

function Min(X, Y: Real): Real; //stdcall;
begin
  if X < Y then
    Min := X
  else
    Min := Y;
end;

function Max(X, Y: Real): Real; //stdcall;
begin
  if X > Y then
    Max := X
  else
    Max := Y;
end;

function Seno(X: Real): Real; //stdcall;
begin
  Seno := Sin(X);
end;

function Cosseno(X: Real): Real; //stdcall;
begin
  Cosseno := Cos(X);
end;

exports
  Soma,
  Subtrai,
  Multiplica,
  Divide,
  Min name 'Minimo',
  Max name 'Maximo',
  Seno,
  Cosseno;

begin
end.
