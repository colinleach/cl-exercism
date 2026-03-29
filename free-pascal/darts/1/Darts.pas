unit Darts;

{$mode ObjFPC}{$H+}

interface

function score(const x : single; const y : single) : uint8;

implementation

uses SysUtils;

var r_sq : real;

function score(const x : single; const y : single) : uint8;
begin

  r_sq := x*x + y*y;
  if r_sq <= 1 then Exit(10);
  if r_sq <= 25 then Exit(5);
  if r_sq <= 100 then Exit(1);
  result := 0;

end;

end.
